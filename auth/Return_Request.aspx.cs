using System;
using System.Activities.Expressions;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class auth_add_about : Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }


    Master mst = new Master();
    Order odr = new Order();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindReturnRequests();
        }
    }

    private void BindReturnRequests(string search = "")
    {
        string query = @"SELECT MAX(id) AS id,
                            order_id,
                            MAX(order_date) AS order_date,
                            MAX(customer_name) AS customer_name,
                            MAX(order_return_reason) AS order_return_reason,
                            MAX(order_return_comment) AS order_return_comment,
                            MAX(order_status) AS order_status
                     FROM ecommerce_order
                     WHERE order_status = 'Return Request'";

        if (!string.IsNullOrEmpty(search))
        {
            query += " AND (customer_name LIKE '%" + search + "%' OR order_id LIKE '%" + search + "%')";
        }

        query += " GROUP BY order_id ORDER BY MAX(id) DESC";

        rptbindorderdata.DataSource = mst.GetData(query);
        rptbindorderdata.DataBind();
    }

    protected void rptbindorderdata_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
    {

        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            Label lblorderid = (Label)e.Item.FindControl("lblorderid");
            Label lblnoofitems = (Label)e.Item.FindControl("lblnoofitems");

            lblnoofitems.Text = odr.GetNoOfItemsOrder(lblorderid.Text);
        }
    }
}
