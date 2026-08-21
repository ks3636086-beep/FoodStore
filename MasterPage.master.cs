using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
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
            if (Session["customer_id"] != null)
            {
                loginbtn.Visible = false;
                profilebtn.Visible = true;
                orderbtn.Visible = true;
                logoutbtn.Visible = true;

                SqlDataReader get_data = mst.Select_Operation("Select count(*) as count from ecommerce_cart where  customer_id='" + Session["customer_id"].ToString() + "'");
                if (get_data.Read())
                {
                    cart_count1.InnerText = get_data["count"].ToString();
                    //cart_count.InnerText = get_data["count"].ToString();
                }

                get_data.Close();
                cart_total.InnerText = mst.Get_Total(Session["customer_id"].ToString());
                BindWishlistCount();
            }
            else
            {
                loginbtn.Visible = true;
                profilebtn.Visible = false;
                logoutbtn.Visible = false;
                orderbtn.Visible = false;
            }

        }
    }

    private void BindWishlistCount()
    {
        if (Session["customer_id"] != null)
        {
            SqlDataReader wishlistData = mst.Select_Operation(
                "Select count(*) as count from ecommerce_wishlist where customer_id='"
                + Session["customer_id"].ToString() + "'"
            );

            if (wishlistData.Read())
            {
                wishlist_count.InnerText = wishlistData["count"].ToString();
            }

            wishlistData.Close();
        }
    }
}
