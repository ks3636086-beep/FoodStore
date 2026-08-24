using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class auth_Refund_Requests : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    Master mst = new Master();
    Backend bnc = new Backend();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindRefundRequests();
        }
    }

    private void BindRefundRequests(string search = "")
    {
        string query = @"
    SELECT 
        MAX(id) AS id,
        order_id,
        MAX(customer_name) AS customer_name,
        MAX(order_return_date) AS order_return_date,
        MAX(order_return_time) AS order_return_time,
        MAX(order_status) AS order_status,
        MAX(total_order_amount) AS total_order_amount
    FROM ecommerce_order
    WHERE order_status IN ('Return Completed', 'Refunded')";

        if (!string.IsNullOrEmpty(search))
        {
            query += " AND (customer_name LIKE '%" + search + "%' OR order_id LIKE '%" + search + "%')";
        }

        query += " GROUP BY order_id ORDER BY MAX(id) DESC";

        rptbindorderdata.DataSource = mst.GetData(query);
        rptbindorderdata.DataBind();
    }


    protected void rptbindorderdata_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Refund")
        {
            string orderId = e.CommandArgument.ToString();

            string query = @"
        UPDATE ecommerce_order
        SET 
            order_status = 'Refunded',
            delivery_status = 'Refunded'
        WHERE order_id = @order_id";

            SqlCommand cmd = new SqlCommand(query, mst.con);
            cmd.Parameters.AddWithValue("@order_id", orderId);

            mst.con.Open();

            int result = cmd.ExecuteNonQuery();

            mst.con.Close();

            if (result > 0)
            {
                ShowMessage("Refund processed successfully.", MessageType.Success);
                BindRefundRequests();
            }
            else
            {
                ShowMessage("Refund failed.", MessageType.Error);
            }
        }
    }
}