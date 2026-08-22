using System;
using System.Activities.Expressions;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
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
                     WHERE order_status = 'Returned'";

        if (!string.IsNullOrEmpty(search))
        {
            query += " AND (customer_name LIKE '%" + search + "%' OR order_id LIKE '%" + search + "%')";
        }

        query += " GROUP BY order_id ORDER BY MAX(id) DESC";

        rptbindorderdata.DataSource = mst.GetData(query);
        rptbindorderdata.DataBind();
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
                    mst.con.Open();

                    string update_status = @"
                UPDATE ecommerce_order 
                SET 
                    assigned_date = @assigned_date,
                    delivery_boy_name = @delivery_boy_name,
                    delivery_boy_id = @delivery_boy_id,
                    assigned_delivery_boy_id = @assigned_delivery_boy_id,
                    order_status = 'Return Assigned',
                    delivery_status = 'Return Assigned'
                WHERE order_id = @order_id";

                    SqlCommand cmd_status = new SqlCommand(update_status, mst.con);

                    cmd_status.Parameters.AddWithValue("@assigned_delivery_boy_id", dblorderstatus.SelectedValue);
                    cmd_status.Parameters.AddWithValue("@delivery_boy_id", dblorderstatus.SelectedValue);
                    cmd_status.Parameters.AddWithValue("@delivery_boy_name", dblorderstatus.SelectedItem.ToString());
                    cmd_status.Parameters.AddWithValue("@order_id", (row.FindControl("lblorderid") as Label).Text);
                    cmd_status.Parameters.AddWithValue("@assigned_date", DateTime.Now.ToString("yyyy-MM-dd"));

                    int success = cmd_status.ExecuteNonQuery();

                    if (success > 0)
                    {
                        ShowMessage("Return order assigned.", MessageType.Success);
                    }

                    mst.con.Close();

                    i++;
                }
            }
        }
        else
        {
            ShowMessage("Select delivery boy.", MessageType.Error);
        }

    }

    protected void rptbindorderdata_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Reject")
        {
            string orderId = e.CommandArgument.ToString();

            string query = @"
            UPDATE ecommerce_order
            SET 
                order_status = 'Rejected',
                delivery_status = 'Rejected'
            WHERE order_id = @order_id";

            SqlCommand cmd = new SqlCommand(query, mst.con);
            cmd.Parameters.AddWithValue("@order_id", orderId);

            mst.con.Open();
            int result = cmd.ExecuteNonQuery();
            mst.con.Close();

            if (result > 0)
            {
                ShowMessage("Return request rejected.", MessageType.Success);
                BindReturnRequests();
            }
            else
            {
                ShowMessage("Order not found.", MessageType.Error);
            }
        }
    }
}

