using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cart : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    Master mst = new Master();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["customer_id"] != null)
        {
            BindCart();
            SubTotal.Text = mst.Get_Total(Session["customer_id"].ToString());
            GrandTotal.Text = mst.Get_Total(Session["customer_id"].ToString());
        }
        else
        {
            Response.Redirect("ecommerce_customer.aspx");
        }
    }
    private void BindCart()
    {
        rptCart.DataSource = mst.GetData("select * from ecommerce_cart a left join ecommerce_order as b on b.customer_id=a.customer_id and b.product_id=a.product_id left join ecommerce_product_photos as c on c.product_id=a.product_id where a.customer_id='" + Session["customer_id"].ToString() + "' and order_id is null");
        rptCart.DataBind();
    }

    protected void rptCart_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Label lblprc = (Label)rptCart.Items[e.Item.ItemIndex].FindControl("lblprc");
        Label lbltotal = (Label)rptCart.Items[e.Item.ItemIndex].FindControl("lbltotal");
        Label lblproduct_id = (Label)rptCart.Items[e.Item.ItemIndex].FindControl("lblproduct_id");
        Label qty = (Label)rptCart.Items[e.Item.ItemIndex].FindControl("qty");
        Label qty1 = (Label)rptCart.Items[e.Item.ItemIndex].FindControl("qty1");

        if (e.CommandName.Equals("btnminus"))
        {
            if (Convert.ToInt32(qty1.Text) < 1)
            {
                qty.Text = "1";
                lbltotal.Text = lblprc.Text;
            }
            else
            {
                int q = Convert.ToInt32(qty.Text);
                q--;
                qty.Text = q.ToString();
                double prc = Convert.ToDouble(lblprc.Text);
                double total = q * prc;
                lbltotal.Text = total.ToString();
            }
            BindCart();
        }

        if (e.CommandName.Equals("btnplus"))
        {
            int q = Convert.ToInt32(qty1.Text);
            q++;
            qty.Text = q.ToString();
            double prc = Convert.ToDouble(lblprc.Text.Trim());
            double total = q * prc;
            lbltotal.Text = total.ToString();

            SubTotal.Text = mst.Get_Total(Session["customer_id"].ToString());
            GrandTotal.Text = mst.Get_Total(Session["customer_id"].ToString());
            BindCart();
        }

        if (e.CommandName.Equals("btndel"))
        {
            mst.con.Open();

            string query_delete_photo = "delete from ecommerce_cart where product_id='" + lblproduct_id.Text + "' and customer_id='" + Session["customer_id"].ToString() + "'";
            SqlCommand cmd_delete_photo = new SqlCommand(query_delete_photo, mst.con);
            SqlDataReader dr_delete_photo = cmd_delete_photo.ExecuteReader();
            dr_delete_photo.Close();

            string order_del = "delete from ecommerce_order where product_id='" + lblproduct_id.Text + "' and customer_id='" + Session["customer_id"].ToString() + "' and order_id is null";
            SqlCommand cmd_order = new SqlCommand(order_del, mst.con);
            SqlDataReader dr_order = cmd_order.ExecuteReader();
            dr_order.Close();
            mst.con.Close();

            BindCart();
            SubTotal.Text = mst.Get_Total(Session["customer_id"].ToString());
            GrandTotal.Text = mst.Get_Total(Session["customer_id"].ToString());

        }
    }

    protected void checkoutbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("checkout.aspx?ref=" + GrandTotal.Text + "");

    }
}