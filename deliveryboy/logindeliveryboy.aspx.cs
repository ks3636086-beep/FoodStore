using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class deliveryboy_logindeliveryboy : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LocalDB"].ConnectionString);

    public enum MessageType { Success, Error, Info, Warning };
     Encrypt ob = new Encrypt();
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    string Name, UserID, Password, Contactno, email, pincode, user_type;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["delivery_boy_name"] == null)
            {
                if (Request.Cookies["deliveryboy"] != null && Request.Cookies["deliveryboy"] != null)
                {
                   // Login();
                }
            }
        }
    }

    //private void Login()
    //{
    //    con.Open();
    //    string get_query = "Select * from ecommerce_delivery_boy where delivery_boy_email='" + txtemail.Text + "'";
    //    SqlCommand get_cmd = new SqlCommand(get_query, con);
    //    SqlDataReader get_data = get_cmd.ExecuteReader();
    //    if (get_data.Read())
    //    {
    //        UserID = get_data["id"].ToString();

    //        Name = get_data["delivery_boy_name"].ToString();
    //        Contactno = get_data["delivery_boy_mobileno"].ToString();
    //        email = get_data["delivery_boy_email"].ToString();
    //       // user_type = get_data["backend_role"].ToString();
    //        string sessionId = HttpContext.Current.Session.SessionID;
    //        Password = get_data["delivery_boy_password"].ToString();

    //        //string pass = ob.Decrypted(Password);
    //        string pass = Password;
    //        if (email == txtemail.Text && pass == txtpassword.Text)
    //        {
    //            Session["id"] = UserID;

    //            Session["delivery_boy_name"] = Name;
    //            Session["delivery_boy_mobileno"] = Contactno;
    //            Session["delivery_boy_email"] = email;
    //            //Session["backend_role"] = user_type;

    //            Response.Redirect("dashboard.aspx");
    //        }
    //        else
    //        {
    //            ShowMessage("Invalid User Name or Password! Please try again!", MessageType.Error);
    //        }

    //    }
    //    else
    //    {
    //        ShowMessage("Invalid User Name or Password! Please try again!", MessageType.Error);
    //    }
    //}

    protected void btnlogin_ServerClick(object sender, EventArgs e)
    {
        if (txtemail.Text.Length > 0 && txtpassword.Text.Length > 0)
        {
            con.Open();

            string get_query = "Select * from ecommerce_delivery_boy where delivery_boy_email='" + txtemail.Text + "'";
            SqlCommand get_cmd = new SqlCommand(get_query, con);
            SqlDataReader get_data = get_cmd.ExecuteReader();
            if (get_data.Read())
            {
                UserID = get_data["id"].ToString();

                Name = get_data["delivery_boy_name"].ToString();
                Contactno = get_data["delivery_boy_mobileno"].ToString();
                email = get_data["delivery_boy_email"].ToString();
                //user_type = get_data["backend_role"].ToString();
                string sessionId = HttpContext.Current.Session.SessionID;
                Password = get_data["delivery_boy_password"].ToString();
                //pincode = get_data["vendor_pincode"].ToString();

                //string pass = ob.Decrypted(Password);

                string pass = ob.Decrypted(Password);

                if (email == txtemail.Text && pass == txtpassword.Text)
                {
                    Session["id"] = UserID;
                    Session["delivery_boy_id"] = UserID;

                    Session["delivery_boy_name"] = Name;
                    Session["delivery_boy_mobileno"] = Contactno;
                    Session["delivery_boy_email"] = email;
                    //Session["backend_role"] = user_type;
                    //Session["vendor_pincode"] = pincode;
                    con.Close();
                    Response.Redirect("dashboard.aspx");
                }
                else
                {
                    con.Close();
                    ShowMessage("Invalid User Name or Password! Please try again!", MessageType.Error);
                }

            }
            else
            {
                ShowMessage("Invalid User Name or Password! Please try again!", MessageType.Error);
            }
        }
        else
        {
            ShowMessage("Please enter Email and Password.", MessageType.Error);
        }

    }
}
