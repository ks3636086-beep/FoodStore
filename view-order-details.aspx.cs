using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_order_details : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    Master mst = new Master();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["customer_id"] != null)
        {
            Binddata();

            string customerId = Session["customer_id"].ToString();

            SqlDataReader getData = mst.Select_Operation(
                "SELECT * FROM ecommerce_customer WHERE customer_id='" + customerId + "'"
            );

            if (getData.Read())
            {
                lblcname.Text = getData["customer_name"].ToString();
                lblcmob.Text = getData["customer_mobileno"].ToString();
                lblcmail.Text = getData["customer_email"].ToString();
            }

            getData.Close();
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }

    private void CheckOrderButton(SqlDataReader getData)
    {
        string status = getData["order_status"].ToString().Trim();

        if (status.Equals("Confirm", StringComparison.OrdinalIgnoreCase))
        {
            btncancel.Visible = true;
            btnreturn.Visible = false;
        }
        else if (status.Equals("Delivered", StringComparison.OrdinalIgnoreCase))
        {
            btncancel.Visible = false;
            btnreturn.Visible = true;
        }
        else if (status.Equals("Rejected", StringComparison.OrdinalIgnoreCase))
        {
            btncancel.Visible = false;
            btnreturn.Visible = false;
        }
        else
        {
            btncancel.Visible = false;
            btnreturn.Visible = false;
        }
    }
    private void Binddata()
    {
        string orderId = Request.QueryString[0];

        rptbindproduct.DataSource = mst.GetData(
            "select * from ecommerce_order where order_id='" + orderId + "'"
        );
        rptbindproduct.DataBind();

        SqlDataReader getData = mst.Select_Operation(
            "select order_status from ecommerce_order where order_id='" + orderId + "'"
        );

        if (getData.Read())
        {
            CheckOrderButton(getData);
        }

        getData.Close();
    }
    protected void btncancel_ServerClick(object sender, EventArgs e)
    {
        mst.con.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = mst.con;
        cmd.CommandText = @"UPDATE ecommerce_order 
                        SET order_status = 'Cancel',
                            delivery_status = 'Cancel'
                        WHERE order_id = @order_id";

        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@order_id", Request.QueryString[0]);

        SqlDataReader reader = cmd.ExecuteReader();
        reader.Close();
        mst.con.Close();

        Response.Redirect("my-order.aspx");
    }

    protected void btnreturn_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("return-order.aspx?id=" + Request.QueryString[0]);

    }
}