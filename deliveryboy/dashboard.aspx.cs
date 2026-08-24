using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class deliveryboy_dashboard : System.Web.UI.Page
{
    Master mst = new Master();
    Order odr = new Order();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Total_Counter();
            BindOrder();

        }
    }

    public void Total_Counter()
    {
        lbltodayorder.Text = Convert.ToString(mst.Count_data(
"SELECT COUNT(DISTINCT order_id) FROM ecommerce_order WHERE assigned_delivery_boy_id='" + Session["id"] + "' AND order_date='" + DateTime.Now.ToString("yyyy-MM-dd") + "'"
));
        lbltodayPending.Text = Convert.ToString(mst.Count_data(
        "SELECT COUNT(DISTINCT order_id) FROM ecommerce_order WHERE assigned_delivery_boy_id='" + Session["id"] + "' AND delivery_status='Pending'"
        ));

        lbl_Delivered_order.Text = Convert.ToString(mst.Count_data(
        "SELECT COUNT(DISTINCT order_id) FROM ecommerce_order WHERE assigned_delivery_boy_id='" + Session["id"] + "' AND delivery_status='Delivered'"
        ));

        lbltotalOrder.Text = Convert.ToString(mst.Count_data(
       "SELECT COUNT(DISTINCT order_id) FROM ecommerce_order WHERE assigned_delivery_boy_id='" + Session["id"] + "'"
));


    }
    private void BindOrder()
    {
        rptbindorderdata.DataSource = mst.GetData("SELECT Top 5 Max(a.id) as id, Max(a.order_id) as order_id, Max(a.order_delivery_time) as order_delivery_time, Max(a.order_date) as order_date, Max(b.customer_name) as customer_name, Max(a.payment_mode) as payment_mode, Max(a.total_order_amount) as total_order_amount, Max(b.customer_mobileno) as customer_mobileno, Max(a.delivery_status) as delivery_status FROM ecommerce_order a LEFT JOIN ecommerce_customer b ON a.customer_id=b.customer_id WHERE a.assigned_delivery_boy_id='" + Session["id"] + "' AND a.order_status='Order Assigned' GROUP BY order_id ORDER BY id DESC");
        rptbindorderdata.DataBind();
    }

    protected void rptbindorderdata_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            Label lblorderid = (Label)e.Item.FindControl("lblorderid");
            Label lblnoofitems = (Label)e.Item.FindControl("lblnoofitems");

            lblnoofitems.Text = odr.GetNoOfItemsOrder(lblorderid.Text);
        }
    }
}