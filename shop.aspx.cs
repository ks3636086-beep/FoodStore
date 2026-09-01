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
        if (!IsPostBack)
        {
            ViewState["CategoryId"] = "all";

            string search = Request.QueryString["search"];

            if (!string.IsNullOrEmpty(search))
            {
                SearchProducts(search);
            }
            else
            {
                BindData1();
            }
        }

    }

    private void SearchProducts(string search)
    {
        string query = @"SELECT *
                     FROM ecommerce_product a
                     LEFT JOIN ecommerce_product_price b
                         ON a.product_id = b.product_id
                     LEFT JOIN ecommerce_product_photos c
                         ON a.product_id = c.product_id
                     WHERE a.product_full_name LIKE '%" + search + @"%'
                        OR a.product_description LIKE '%" + search + @"%'";

        rptProducts.DataSource = mst.GetData(query);
        rptProducts.DataBind();
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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string search = txtSearch.Text.Trim();

        if (!string.IsNullOrEmpty(search))
        {
            SearchProducts(search);
        }
        else
        {
            BindData1();
        }
    }

    protected string GetProductRating(object productId)
    {
        decimal averageRating = 0;
        int totalReviews = 0;

        string query = @"
        SELECT 
            ISNULL(AVG(CAST(review_star AS DECIMAL(10,1))), 0) AS average_rating,
            COUNT(*) AS total_reviews
        FROM product_rating_review
        WHERE product_id = @product_id
        AND review_status = 'Active'";

        using (SqlCommand cmd = new SqlCommand(query, mst.con))
        {
            cmd.Parameters.AddWithValue("@product_id", productId);

            mst.con.Open();

            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                if (dr.Read())
                {
                    averageRating = Convert.ToDecimal(dr["average_rating"]);
                    totalReviews = Convert.ToInt32(dr["total_reviews"]);
                }
            }

            mst.con.Close();
        }

        int fullStars = (int)Math.Floor(averageRating);
        bool halfStar = (averageRating - fullStars) >= 0.5m;

        string stars = "";

        for (int i = 1; i <= 5; i++)
        {
            if (i <= fullStars)
                stars += "<i class='fas fa-star text-warning'></i>";
            else if (i == fullStars + 1 && halfStar)
                stars += "<i class='fas fa-star-half-alt text-warning'></i>";
            else
                stars += "<i class='far fa-star text-muted'></i>";
        }

        return stars + " <span class='text-muted' style='font-size:11px;'>(" + totalReviews + ")</span>";
    }
}