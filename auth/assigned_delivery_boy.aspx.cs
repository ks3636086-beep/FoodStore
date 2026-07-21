using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class auth_assigned_delivery_boy : System.Web.UI.Page
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
        BindassignedOrder();
    }

    private void BindassignedOrder()
    {
        this.rptbindorderdata.DataSource = GetData("SELECT MAX(order_id) AS order_id, MAX(order_date) AS order_date, MAX(delivery_boy_name) AS delivery_boy_name, MAX(assigned_delivery_boy_id) AS assigned_delivery_boy_id, MAX(assigned_date) AS assigned_date, MAX(delivery_status) AS delivery_status, MAX(total_order_amount) AS total_order_amount FROM ecommerce_order WHERE assigned_delivery_boy_id IS NOT NULL GROUP BY order_id;");
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
}