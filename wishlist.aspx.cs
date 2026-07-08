using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wishlist : System.Web.UI.Page
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
            BindWishlist();
        }
    }

    private void BindWishlist()
    {
        if (Session["customer_id"] == null)
        {
            Response.Redirect("ecommerce_customer.aspx");
            return;
        }

        string cid = Session["customer_id"].ToString();

        string query = @"select * from ecommerce_wishlist a
                     left join ecommerce_product b on a.product_id=b.product_id
                     left join ecommerce_product_price c on b.product_id=c.product_id
                     left join ecommerce_product_photos d on b.product_id=d.product_id
                     where a.customer_id='" + cid + "'order by a.id desc";

        rptWishlist.DataSource = mst.GetData(query);
        rptWishlist.DataBind();
    }

    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();

        string query = "delete from ecommerce_wishlist where id='" + id + "'";

        mst.con.Open();
        SqlCommand cmd = new SqlCommand(query, mst.con);
        cmd.ExecuteNonQuery();
        mst.con.Close();

        Response.Redirect("wishlist.aspx");
    }
}