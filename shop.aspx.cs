using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shop : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    Master mst = new Master();
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData1();
        ViewState["CategoryId"] = "all";

    }
    private void BindData1()
    {
        rptProducts.DataSource = mst.GetData("select * from ecommerce_product a left join ecommerce_product_price as b on a.product_id = b.product_id left join ecommerce_product_photos as c on a.product_id = c.product_id");
        rptProducts.DataBind();
    }

    protected void Category_Command(object sender, CommandEventArgs e)
    {
        string categoryId = e.CommandArgument.ToString();
        ViewState["CategoryId"] = categoryId;
        BindProducts(categoryId);

        string query;

        if (categoryId == "all")
        {
            query =
                "SELECT * FROM ecommerce_product a " +
                "LEFT JOIN ecommerce_product_price b ON a.product_id = b.product_id " +
                "LEFT JOIN ecommerce_product_photos c ON a.product_id = c.product_id";
        }
        else
        {
            query =
                "SELECT * FROM ecommerce_product a " +
                "LEFT JOIN ecommerce_product_price b ON a.product_id = b.product_id " +
                "LEFT JOIN ecommerce_product_photos c ON a.product_id = c.product_id " +
                "WHERE a.product_parent_category_id = '" + categoryId + "'";
        }

        rptProducts.DataSource = mst.GetData(query);
        rptProducts.DataBind();
    }



    protected void btnFilterPrice_Click(object sender, EventArgs e)
    {
        string categoryId = ViewState["CategoryId"] != null
        ? ViewState["CategoryId"].ToString()
        : "all";

        BindProducts(categoryId);
    }
    private void BindProducts(string categoryId)
    {
        string query =
            "SELECT * FROM ecommerce_product a " +
            "LEFT JOIN ecommerce_product_price b ON a.product_id = b.product_id " +
            "LEFT JOIN ecommerce_product_photos c ON a.product_id = c.product_id " +
            "WHERE 1=1 ";

        if (categoryId != "all")
        {
            query += " AND a.product_parent_category_id = '" + categoryId + "'";
        }

        if (!string.IsNullOrWhiteSpace(txtMinPrice.Text))
        {
            decimal minPrice;

            if (decimal.TryParse(txtMinPrice.Text.Trim(), out minPrice))
            {
                query += " AND b.product_final_sell_price >= " + minPrice;
            }
        }

        if (!string.IsNullOrWhiteSpace(txtMaxPrice.Text))
        {
            decimal maxPrice;

            if (decimal.TryParse(txtMaxPrice.Text.Trim(), out maxPrice))
            {
                query += " AND b.product_final_sell_price <= " + maxPrice;
            }
        }

        rptProducts.DataSource = mst.GetData(query);
        rptProducts.DataBind();
    }
}