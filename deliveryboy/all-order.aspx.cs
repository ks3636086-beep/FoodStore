using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class deliveryboy_all_order : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LocalDB"].ConnectionString);
    public enum MessageType { Success, Error, Info, Warning };

    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    Order odr = new Order();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindOrder();
        }
    }
    private void BindOrder()
    {
        // Fetch all orders
        this.rptbindorderdata.DataSource = GetData("SELECT Max(a.id) as id, Max(a.order_id) as order_id, Max(a.order_delivery_time) as order_delivery_time, Max(a.order_date) as order_date, Max(b.customer_name) as customer_name, Max(a.payment_mode) as payment_mode, Max(a.total_order_amount) as total_order_amount, Max(b.customer_mobileno) as customer_mobileno, Max(a.delivery_status) as delivery_status FROM ecommerce_order a left join ecommerce_customer as b on a.customer_id=b.customer_id WHERE a.assigned_delivery_boy_id='" + Session["id"] + "' GROUP BY order_id ORDER BY id DESC"); this.rptbindorderdata.DataBind();
    }
    private void BindOrder_Date()
    {
        // Fetch orders according to selected date
        this.rptbindorderdata.DataSource = GetData("SELECT Max(a.id) as id, Max(a.order_id) as order_id, Max(a.order_delivery_time) as order_delivery_time, Max(a.order_date) as order_date, Max(b.customer_name) as customer_name, Max(a.payment_mode) as payment_mode, Max(a.total_order_amount) as total_order_amount, Max(b.customer_mobileno) as customer_mobileno, Max(a.delivery_status) as delivery_status FROM ecommerce_order a left join ecommerce_customer as b on a.customer_id=b.customer_id WHERE a.order_date='" + txt_date_from.Text + "' AND a.order_status!='Cancelled' AND a.assigned_delivery_boy_id='" + Session["id"] + "' GROUP BY order_id ORDER BY id DESC");
        this.rptbindorderdata.DataBind();
    }
    private void BindOrderByStatus()
    {
        if (dblorderstatus.SelectedValue == "Assigned")
        {
            // Assigned → query
            this.rptbindorderdata.DataSource = GetData("SELECT Max(a.id) as id, Max(a.order_id) as order_id, Max(a.order_delivery_time) as order_delivery_time, Max(a.order_date) as order_date, Max(b.customer_name) as customer_name, Max(a.payment_mode) as payment_mode, Max(a.total_order_amount) as total_order_amount, Max(b.customer_mobileno) as customer_mobileno, Max(a.delivery_status) as delivery_status FROM ecommerce_order a left join ecommerce_customer as b on a.customer_id=b.customer_id WHERE a.assigned_delivery_boy_id='" + Session["id"] + "' AND a.delivery_status='Pending' GROUP BY order_id ORDER BY id DESC");
        }
        else
        {
            //Confirm / Cancel / Delivered →   query
            this.rptbindorderdata.DataSource = GetData("SELECT Max(a.id) as id, Max(a.order_id) as order_id, Max(a.order_delivery_time) as order_delivery_time, Max(a.order_date) as order_date, Max(b.customer_name) as customer_name, Max(a.payment_mode) as payment_mode, Max(a.total_order_amount) as total_order_amount, Max(b.customer_mobileno) as customer_mobileno, Max(a.delivery_status) as delivery_status FROM ecommerce_order a left join ecommerce_customer as b on a.customer_id=b.customer_id WHERE a.delivery_status='Delivered' AND a.assigned_delivery_boy_id='" + Session["id"] + "' GROUP BY order_id ORDER BY id DESC");
        }

        this.rptbindorderdata.DataBind();
    }
    private DataTable GetData(string query)
    {
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["LocalDB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    sda.Fill(dt);
                }
            }
            return dt;
        }
    }
    protected void dblorderstatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (dblorderstatus.SelectedValue == "All")
        {
            BindOrder();
        }
        else
        {
            BindOrderByStatus();
        }
    }

    protected void btnsearch_ServerClick(object sender, EventArgs e)
    {
        if (txt_date_from.Text.Length > 0)
        {
            BindOrder_Date();
        }
    }
}