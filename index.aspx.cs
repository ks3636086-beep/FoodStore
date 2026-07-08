using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    Master mst = new Master();
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();
        BindData1();
    }
    private void BindData()
    {
        rptCategory.DataSource = mst.GetData("SELECT * FROM ecommerce_category ORDER BY ID DESC");
        rptCategory.DataBind();
    }

    private void BindData1()
    {
        rptProducts.DataSource = mst.GetData("select * from ecommerce_product a left join ecommerce_product_price as b on a.product_id = b.product_id left join ecommerce_product_photos as c on a.product_id = c.product_id ORDER BY a.product_id DESC");
        rptProducts.DataBind();
    }


    protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "cartbtn")
        {
            if (Session["customer_id"] == null)
            {
                Response.Redirect("ecommerce_customer.aspx");
                return;
            }

            string cid = Session["customer_id"].ToString();

            Label lblproductid = (Label)e.Item.FindControl("lblproduct_id");
            Label lblname = (Label)e.Item.FindControl("lblname");
            Label lbl_sell_price = (Label)e.Item.FindControl("lbl_sell_price");
            Label lbl_unit = (Label)e.Item.FindControl("lbl_unit");
            Label lbl_unit_value = (Label)e.Item.FindControl("lbl_unit_value");

            mst.con.Open();

            SqlCommand check = new SqlCommand("SELECT COUNT(*) FROM ecommerce_cart WHERE customer_id=@cid AND product_id=@pid", mst.con);
            check.Parameters.AddWithValue("@cid", cid);
            check.Parameters.AddWithValue("@pid", lblproductid.Text);

            if (Convert.ToInt32(check.ExecuteScalar()) == 0)
            {
                SqlCommand cart = new SqlCommand("INSERT INTO ecommerce_cart(cart_date,cart_qty,customer_id,product_id) VALUES(GETDATE(),1,@cid,@pid)", mst.con);
                cart.Parameters.AddWithValue("@cid", cid);
                cart.Parameters.AddWithValue("@pid", lblproductid.Text);
                cart.ExecuteNonQuery();

                MasterPage mp = (MasterPage)this.Master;
                mp.CartCount();

                SqlCommand order = new SqlCommand(@"INSERT INTO ecommerce_order
            (customer_id,product_id,product_name,product_qty,product_sell_price,total_amount_of_product,product_unit,product_unit_value)
            VALUES(@cid,@pid,@name,1,@price,@price,@unit,@value)", mst.con);

                order.Parameters.AddWithValue("@cid", cid);
                order.Parameters.AddWithValue("@pid", lblproductid.Text);
                order.Parameters.AddWithValue("@name", lblname.Text);
                order.Parameters.AddWithValue("@price", lbl_sell_price.Text);
                order.Parameters.AddWithValue("@unit", lbl_unit.Text);
                order.Parameters.AddWithValue("@value", lbl_unit_value.Text);

                order.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, GetType(), "msg", "Swal.fire('Added to Cart 🛒','','success');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "msg", "Swal.fire('Already in Cart','','info');", true);
            }

            mst.con.Close();
        }
    }
}