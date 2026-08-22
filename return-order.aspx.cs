using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class return_order : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    Master mst = new Master();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnReturnSubmit_ServerClick(object sender, EventArgs e)
    {
        try
        {
            string orderId = Request.QueryString[0];
            string reason = ddlReturnReason.SelectedValue;
            string comment = txtReturnComment.Text.Trim();

            if (string.IsNullOrEmpty(orderId))
            {
                ShowMessage("Order ID not found.", MessageType.Error);
                return;
            }

            if (reason == "Please Select")
            {
                ShowMessage("Please select return reason.", MessageType.Warning);
                return;
            }

            string query = @"
            UPDATE ecommerce_order
            SET
                order_return_reason = @reason,
                order_return_comment = @comment,
                order_return_date = @return_date,
                order_return_time = @return_time,
                order_status = 'Returned',
                delivery_status = 'Returned'
            WHERE order_id = @order_id";

            SqlCommand cmd = new SqlCommand(query, mst.con);

            cmd.Parameters.AddWithValue("@reason", reason);
            cmd.Parameters.AddWithValue("@comment", comment);
            cmd.Parameters.AddWithValue("@return_date", DateTime.Now.ToString("yyyy-MM-dd"));
            cmd.Parameters.AddWithValue("@return_time", DateTime.Now.ToString("HH:mm:ss"));
            cmd.Parameters.AddWithValue("@order_id", orderId);

            mst.con.Open();

            int result = cmd.ExecuteNonQuery();

            mst.con.Close();

            if (result > 0)
            {

                ShowMessage("Return request submitted successfully.", MessageType.Success);
                Response.Redirect("my-order.aspx");

            }
            else
            {
                ShowMessage("Order not found. Return update failed.", MessageType.Error);
            }
        }
        catch (Exception ex)
        {

            ShowMessage(ex.Message, MessageType.Error);
        }
    }
}