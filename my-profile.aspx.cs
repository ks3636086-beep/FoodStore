using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class my_profile : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    Master mst = new Master();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Session["customer_id"] != null)
            {

                name.Text = Session["customer_name"].ToString();
                email.Text = Session["customer_email"].ToString();
                mobileno.Text = Session["customer_mobileno"].ToString();
                gender.Text = Session["customer_gender"].ToString();
                dob.Text = Session["customer_dob"].ToString();
            }
            else
            {
                Response.Redirect("ecommerce_customer.aspx");
            }

        }
    }

    protected void btnsubmit_ServerClick(object sender, EventArgs e)
    {
        try
        {
            if (name.Text.Length > 0 && email.Text.Length > 0 && mobileno.Text.Length > 0)
            {
                mst.con.Open();

                string insert_category = "update ecommerce_customer set customer_name=@customer_name,customer_email=@customer_email,customer_mobileno=@customer_mobileno,customer_gender=@customer_gender,customer_dob=@customer_dob where customer_id=@customer_id";
                SqlCommand cmd_category = new SqlCommand(insert_category, mst.con);

                cmd_category.Parameters.AddWithValue("@customer_name", name.Text);
                cmd_category.Parameters.AddWithValue("@customer_email", email.Text);
                cmd_category.Parameters.AddWithValue("@customer_mobileno", mobileno.Text);
                cmd_category.Parameters.AddWithValue("@customer_gender", gender.Text);
                cmd_category.Parameters.AddWithValue("@customer_dob", dob.Text);
                cmd_category.Parameters.AddWithValue("@customer_id", Session["customer_id"].ToString());

                SqlDataReader reader = cmd_category.ExecuteReader();
                string sessionId = HttpContext.Current.Session.SessionID;
                Session["customer_id"] = Session["customer_id"].ToString();
                Session["customer_name"] = name.Text;
                Session["customer_email"] = email.Text;
                Session["customer_mobileno"] = mobileno.Text;
                Session["customer_gender"] = gender.Text;
                Session["customer_dob"] = dob.Text;

                ShowMessage("Data Updated.", MessageType.Success);
                Response.Redirect("index.aspx");
            }
            else
            {
                ShowMessage("All field are required.", MessageType.Error);
            }
        }
        catch (SqlException ex)
        {
            ShowMessage(ex.Message, MessageType.Error);
        }
    }
}

