using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class auth_assign_orders : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LocalDB"].ConnectionString);
    public enum MessageType { Success, Error, Info, Warning };

    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    Order odr = new Order();
    Master mst = new Master();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindOrder();
            BindDeliveryBoy();
        }
    }

    private void BindDeliveryBoy()
    {
        dblorderstatus.Items.Clear();
        dblorderstatus.Items.Add(new ListItem("Please Select", "0"));
        dblorderstatus.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["LocalDB"].ConnectionString;
        String strQuery = "SELECT delivery_boy_id, delivery_boy_name FROM ecommerce_delivery_boy where delivery_boy_status='Active'";
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;

        try
        {
            con.Open();

            dblorderstatus.DataSource = cmd.ExecuteReader();
            dblorderstatus.DataTextField = "delivery_boy_name";
            dblorderstatus.DataValueField = "delivery_boy_id";
            dblorderstatus.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }

    private void BindOrder()
    {
        this.rptbindorderdata.DataSource = GetData("SELECT Max(id) as id, Max(order_id) as order_id,Max(order_delivery_time) as order_delivery_time,Max(order_date) as order_date,Max(customer_name) as customer_name,Max(payment_mode) as payment_mode,Max(total_order_amount) as total_order_amount,Max(customer_mobileno) as customer_mobileno FROM ecommerce_order where order_section='Grocery' and order_status!='Cancelled' and assigned_delivery_boy_id is null Group by order_id order by id desc");
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

        }
    }
        
    protected void btnsearch_ServerClick(object sender, EventArgs e)
    {

        if (dblorderstatus.SelectedItem.Text != "Please Select")
        {
            int i = 0;

            foreach (RepeaterItem row in rptbindorderdata.Items)
            {
                if ((row.FindControl("chk_delete") as CheckBox).Checked)
                {
                    con.Open();

                    string update_status = "update ecommerce_order set assigned_date=@assigned_date,delivery_boy_name=@delivery_boy_name,delivery_boy_id=@delivery_boy_id,assigned_delivery_boy_id=@assigned_delivery_boy_id where order_id=@order_id";
                    SqlCommand cmd_status = new SqlCommand(update_status, con);

                    cmd_status.Parameters.AddWithValue("@assigned_delivery_boy_id", dblorderstatus.SelectedValue);
                    cmd_status.Parameters.AddWithValue("@delivery_boy_id", dblorderstatus.SelectedValue);
                    cmd_status.Parameters.AddWithValue("@delivery_boy_name", dblorderstatus.SelectedItem.ToString());
                    cmd_status.Parameters.AddWithValue("@order_id", (row.FindControl("lblorderid") as Label).Text);
                    cmd_status.Parameters.AddWithValue("@assigned_date", DateTime.Now.ToString("yyyy-MM-dd"));

                    int success = cmd_status.ExecuteNonQuery();

                    if (success > 0)
                    {
                        ShowMessage("Assign order.", MessageType.Success);
                    }

                    con.Close();

                    i++;
                }
            }

            BindOrder();

        }
        else
        {
            ShowMessage("Select delivery boy.", MessageType.Error);
        }
        
    }

}