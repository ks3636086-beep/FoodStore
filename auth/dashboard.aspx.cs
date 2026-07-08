using System;
using System.Web.UI.WebControls;

public partial class Dashboard : System.Web.UI.Page
{
    Master mst = new Master();
    Order odr = new Order();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Total_Counter();
            BindOrder();

            lbl_total_order.Text = Convert.ToString(mst.Count_data("Select Count(DISTINCT order_id) from ecommerce_order"));
            lbltodayorder.Text = Convert.ToString(mst.Count_data("SELECT  Count(DISTINCT order_id) FROM ecommerce_order where order_date='" + DateTime.Now.ToString("yyyy-MM-dd") + "'"));
            lbltodaycancelrequest.Text = Convert.ToString(mst.Count_data("SELECT COUNT(id) FROM ecommerce_order where order_cancel_date='" + DateTime.Now.ToString("yyyy-MM-dd") + "'"));
           // lbl_total_deliverd.Text = Convert.ToString(mst.Count_data("SELECT ISNULL(Sum(total_amount_of_product),0) FROM ecommerce_order where order_status='Delivered'"));

            
        }
    }

    public void Total_Counter()
    {
        lbltotalproduct.Text = Convert.ToString(mst.Count_data("SELECT COUNT(*) FROM ecommerce_product"));
        lbltotalcustomer.Text = Convert.ToString(mst.Count_data("SELECT COUNT(*) FROM ecommerce_customer"));

      //  lbl_total_delivery_boy.Text = "0";
        lbl_total_delivery_boy.Text = Convert.ToString(mst.Count_data("SELECT COUNT(*) FROM ecommerce_delivery_boy"));
    }

    private void BindOrder()
    {
        rptbindorderdata.DataSource = mst.GetData("SELECT Top 5 Max(a.id) as id, Max(a.order_id) as order_id,Max(a.order_delivery_time) as order_delivery_time,Max(a.order_date) as order_date,Max(b.customer_name) as customer_name,Max(a.payment_mode) as payment_mode,Max(a.total_order_amount) as total_order_amount,Max(b.customer_mobileno) as customer_mobileno,Max(a.delivery_status) as delivery_status FROM ecommerce_order a left join ecommerce_customer as b on a.customer_id=b.customer_id where a.order_status!='Cancelled'  Group by order_id order by id desc");
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