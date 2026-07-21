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

            SqlDataReader getData = mst.Select_Operation("Select * from ecommerce_order Where order_id='" + Request.QueryString[0] + "' ");
            if (getData.Read())
            {
                lblcname.Text = getData["customer_name"].ToString();
                lblcmob.Text = getData["customer_mobileno"].ToString();
                lblcmail.Text = getData["customer_email"].ToString();
                lblcadd.Text = getData["billing_address_line1"].ToString() + ", " + getData["billing_address_line2"].ToString() + ", " + getData["billing_city_name"].ToString() + ", " + getData["billing_state_name"].ToString() + ", " + getData["billing_landmark"].ToString() + "-" + getData["billing_pincode"].ToString();
            }
            getData.Close();

        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }
    private void Binddata()
    {
        rptbindproduct.DataSource = mst.GetData("select * from ecommerce_order a where a.order_id='" + Request.QueryString[0] + "'");
        rptbindproduct.DataBind();
    }
    protected void btncancel_ServerClick(object sender, EventArgs e)
    {
        mst.con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = mst.con;
        cmd.CommandText = "update ecommerce_order set order_status='Cancel' where order_id=@order_id";
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@order_id", Request.QueryString[0]);
        SqlDataReader reader = cmd.ExecuteReader();
        reader.Close();
        mst.con.Close();

        Response.Redirect("my-order.aspx");
    }
}