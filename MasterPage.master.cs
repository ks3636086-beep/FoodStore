using System;
using System.Collections.Generic;
using System.Data;
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
            CartCount();
        }
    }

    public void CartCount()
    {
        string query = "";

        if (Session["customer_id"] != null)
        {
            query = "select count(*) from ecommerce_cart where customer_id='"
                    + Session["customer_id"].ToString() + "'";

            DataTable dt = mst.GetData(query);

            cart_count1.InnerText = dt.Rows[0][0].ToString();
        }
        else
        {
            cart_count1.InnerText = "0";
        }
    }
}
