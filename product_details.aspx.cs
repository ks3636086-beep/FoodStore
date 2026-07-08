using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class product_details : System.Web.UI.Page
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

        SqlDataReader dr_product_data = mst.Select_Operation("select * from ecommerce_product a left join ecommerce_product_price as b on a.product_id = b.product_id left join ecommerce_product_photos as c on a.product_id = c.product_id where a.product_id='" + Request.QueryString[0] + "' ");
        if (dr_product_data.Read())
        {
            prductid.Src = "auth/" + dr_product_data["photo_path"].ToString();
            heading.InnerText = dr_product_data["product_full_name"].ToString();
            para.InnerHtml = dr_product_data["product_description"].ToString();
            heading1.InnerText = dr_product_data["product_final_sell_price"].ToString();
        }

        dr_product_data.Close();
    }

    private void BindData1()
    {
        rptProducts.DataSource = mst.GetData("select * from ecommerce_product a left join ecommerce_product_price as b on a.product_id = b.product_id left join ecommerce_product_photos as c on a.product_id = c.product_id");
        rptProducts.DataBind();
    }

    protected void btnWishlist_Click(object sender, EventArgs e)
    {
        if (Session["customer_id"] == null)
        {
            Response.Redirect("ecommerce_customer.aspx");
            return;
        }

        string customerId = Session["customer_id"].ToString();
        string productId = Request.QueryString["ref"];

        mst.con.Open();

        // CHECK DUPLICATE
        SqlCommand checkCmd = new SqlCommand(
            "SELECT COUNT(*) FROM ecommerce_wishlist WHERE customer_id=@cid AND product_id=@pid",
            mst.con);

        checkCmd.Parameters.AddWithValue("@cid", customerId);
        checkCmd.Parameters.AddWithValue("@pid", productId);

        int count = Convert.ToInt32(checkCmd.ExecuteScalar());

        if (count == 0)
        {
            // INSERT
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO ecommerce_wishlist (wishlist_date, customer_id, product_id) VALUES (@date,@cid,@pid)",
                mst.con);

            cmd.Parameters.AddWithValue("@date", DateTime.Now);
            cmd.Parameters.AddWithValue("@cid", customerId);
            cmd.Parameters.AddWithValue("@pid", productId);

            cmd.ExecuteNonQuery();

            ScriptManager.RegisterStartupScript(this, GetType(), "msg",
            "Swal.fire('Added in wishlist ❤️')", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "msg",
            "Swal.fire('Already in wishlist 🤍')", true);
        }

        mst.con.Close();
    }

    //protected void btncart_Click(object sender, EventArgs e)
    //{
    //    if (Session["customer_id"] == null)
    //    {
    //        Response.Redirect("ecommerce_customer.aspx");
    //        return;
    //    }

    //    string cid = Session["customer_id"].ToString();
    //    string pid = Request.QueryString["ref"];

    //    mst.con.Open();

    //    // CHECK
    //    SqlCommand check = new SqlCommand(
    //    "SELECT COUNT(*) FROM ecommerce_cart WHERE customer_id=@cid AND product_id=@pid",
    //    mst.con);

    //    check.Parameters.AddWithValue("@cid", cid);
    //    check.Parameters.AddWithValue("@pid", pid);

    //    int count = Convert.ToInt32(check.ExecuteScalar());

    //    if (count == 0)
    //    {
    //        // INSERT
    //        SqlCommand cmd = new SqlCommand(
    //        "INSERT INTO ecommerce_cart (cart_date, cart_qty, customer_id, product_id) VALUES (@date,@qty,@cid,@pid)",
    //        mst.con);

    //        cmd.Parameters.AddWithValue("@date", DateTime.Now);
    //        cmd.Parameters.AddWithValue("@qty", 1);
    //        cmd.Parameters.AddWithValue("@cid", cid);
    //        cmd.Parameters.AddWithValue("@pid", pid);

    //        cmd.ExecuteNonQuery();

    //        ScriptManager.RegisterStartupScript(this, GetType(), "popup",
    //        "Swal.fire('Added to Cart 🛒')", true);
    //    }
    //    else
    //    {
    //        ScriptManager.RegisterStartupScript(this, GetType(), "popup",
    //        "Swal.fire('Already in Cart 🤍')", true);
    //    }

    //    mst.con.Close();
    //}

    protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
      
    }
}