using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ecommerce_customer : System.Web.UI.Page
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

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text.Trim();
        string password = txtPassword.Text.Trim();

        string query = "select * from ecommerce_customer where customer_email=@email and customer_password=@pass";

        SqlCommand cmd = new SqlCommand(query, mst.con);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@pass", password);

        mst.con.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            string cid = dr["customer_id"].ToString();

            Session["customer_id"] = cid;
            Response.Write("Session set = " + Session["customer_id"]);
            Response.Redirect("index.aspx"); // login success
        }
        else
        {
            Response.Write("<script>alert('Invalid Email or Password')</script>");
        }

        dr.Close();
        mst.con.Close();
    }
}