using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class auth_all_orders : System.Web.UI.Page
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

    protected void btnsearch_ServerClick(object sender, EventArgs e)
    {
        if (txt_date_from.Text.Length > 0)
        {
            BindOrder_Date();
        }
    }

    private void BindOrder_Date()
    {
        this.rptbindorderdata.DataSource = GetData("SELECT Max(a.id) as id, Max(a.order_id) as order_id,Max(a.order_delivery_time) as order_delivery_time,Max(a.order_date) as order_date,Max(b.customer_name) as customer_name,Max(a.payment_mode) as payment_mode,Max(a.total_order_amount) as total_order_amount,Max(b.customer_mobileno) as customer_mobileno,Max(a.delivery_status) as delivery_status FROM ecommerce_order a left join ecommerce_customer as b on a.customer_id=b.customer_id where a.order_section='Grocery'  and a.order_date='" + txt_date_from.Text+ "' and order_status!='Cancelled' Group by order_id order by id desc");
        this.rptbindorderdata.DataBind();
    }

    private void BindOrder()
    {
        this.rptbindorderdata.DataSource = GetData("SELECT Max(a.id) as id, Max(a.order_id) as order_id,Max(a.order_delivery_time) as order_delivery_time,Max(a.order_date) as order_date,Max(b.customer_name) as customer_name,Max(a.payment_mode) as payment_mode,Max(a.total_order_amount) as total_order_amount,Max(b.customer_mobileno) as customer_mobileno,Max(a.delivery_status) as delivery_status FROM ecommerce_order a left join ecommerce_customer as b on a.customer_id=b.customer_id where a.order_section='Grocery' Group by order_id order by id desc");
        this.rptbindorderdata.DataBind();
    }

    private void BindOrderByStatus()
    {
        this.rptbindorderdata.DataSource = GetData("SELECT Max(a.id) as id, Max(a.order_id) as order_id,Max(a.order_delivery_time) as order_delivery_time,Max(a.order_date) as order_date,Max(b.customer_name) as customer_name,Max(a.payment_mode) as payment_mode,Max(a.total_order_amount) as total_order_amount,Max(b.customer_mobileno) as customer_mobileno,Max(a.delivery_status) as delivery_status FROM ecommerce_order a left join ecommerce_customer as b on a.customer_id=b.customer_id where a.order_section='Grocery'  and a.order_status='"+ dblorderstatus.SelectedValue +"' Group by order_id order by id desc");
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

    protected void rptbindorderdata_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
       
        if (e.CommandName.Equals("btndelete"))
        {
            Label lblroworderid = (Label)rptbindorderdata.Items[e.Item.ItemIndex].FindControl("lblroworderid");

            con.Open();

            string query_delete_order = "delete from ecommerce_order where order_id='" + lblroworderid.Text + "'";
            SqlCommand cmd_delete_order = new SqlCommand(query_delete_order, con);
            SqlDataReader dr_delete_order = cmd_delete_order.ExecuteReader();
            dr_delete_order.Close();

            con.Close();
            ShowMessage("Delete operation success.", MessageType.Success);
            BindOrder();
        }
    }

    protected void rptbindorderdata_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            Label lblorderid = (Label)e.Item.FindControl("lblorderid");
            Label lblnoofitems = (Label)e.Item.FindControl("lblnoofitems");

            if(dblorderstatus.SelectedItem.Text== "Cancelled")
            {
                lblnoofitems.Text = odr.GetNoOfItemsOrder_cancel(lblorderid.Text);

            }
            else
            {
                lblnoofitems.Text = odr.GetNoOfItemsOrder(lblorderid.Text);

            }

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
}