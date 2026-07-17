using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class my_order : System.Web.UI.Page
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
            Binddata();

        }
        else
        {
            Response.Redirect("ecommerce_customer.aspx");
        }
    }
    private void Binddata()
    {
        rptbindproduct.DataSource = mst.GetData("select max(a.order_id)order_id,max(a.customer_name)customer_name,max(a.customer_mobileno)customer_mobileno,max(a.total_order_amount)total_order_amount,max(a.order_date)order_date,max(a.order_status)order_status from ecommerce_order a where a.customer_id='" + Session["customer_id"].ToString() + "' and order_id is not null group by a.order_id");
        rptbindproduct.DataBind();
    }

    protected void rptbindproduct_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
}