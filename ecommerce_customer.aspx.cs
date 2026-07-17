using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
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
        mst.con.Open();
        string check_data = "select * from ecommerce_customer where customer_mobileno=@customer_mobileno";
        SqlCommand cmd_check = new SqlCommand(check_data, mst.con);
        cmd_check.Parameters.AddWithValue("@customer_mobileno", txtmobileno.Text);

        SqlDataReader reader1 = cmd_check.ExecuteReader();
        if (!reader1.Read())
        {
            reader1.Close();
            mst.con.Close();
            GenerateTempId();
            GenerateId();
            try
            {
                if (txtname.Text.Length > 0 && txtemail.Text.Length > 0 && txtmobileno.Text.Length > 0)
                {
                    mst.con.Open();

                    string insert_category = "insert into ecommerce_customer(customer_temp_id,customer_id,customer_name,customer_email,customer_mobileno,customer_date,customer_time,customer_status) values (@customer_temp_id,@customer_id,@customer_name,@customer_email,@customer_mobileno,@customer_date,@customer_time,@customer_status)";
                    SqlCommand cmd_category = new SqlCommand(insert_category, mst.con);

                    cmd_category.Parameters.AddWithValue("@customer_temp_id", lbltempid.Text);
                    cmd_category.Parameters.AddWithValue("@customer_id", lblid.Text);
                    cmd_category.Parameters.AddWithValue("@customer_name", txtname.Text);
                    cmd_category.Parameters.AddWithValue("@customer_email", txtemail.Text);
                    cmd_category.Parameters.AddWithValue("@customer_mobileno", txtmobileno.Text);
                    cmd_category.Parameters.AddWithValue("@customer_date", DateTime.Now.ToString("yyyy-MM-dd"));
                    cmd_category.Parameters.AddWithValue("@customer_time", DateTime.Now.ToString("yyyy-MM-dd"));
                    cmd_category.Parameters.AddWithValue("@customer_status", "Active");


                    SqlDataReader reader = cmd_category.ExecuteReader();
                    string sessionId = HttpContext.Current.Session.SessionID;
                    Session["customer_id"] = lblid.Text;
                    Session["customer_name"] = txtname.Text;
                    Session["customer_email"] = txtemail.Text;
                    Session["customer_mobileno"] = txtmobileno.Text;

                    ShowMessage("Sign Up Completed.", MessageType.Success);
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
        else
        {
            reader1.Close();
            mst.con.Close();
            try
            {
                if (txtname.Text.Length > 0 && txtemail.Text.Length > 0 && txtmobileno.Text.Length > 0)
                {
                    mst.con.Open();

                    string insert_category = "select * from ecommerce_customer where customer_mobileno=@customer_mobileno";
                    SqlCommand cmd_category = new SqlCommand(insert_category, mst.con);

                    cmd_category.Parameters.AddWithValue("@customer_mobileno", txtmobileno.Text);

                    SqlDataReader reader = cmd_category.ExecuteReader();
                    //int success = cmd_category.ExecuteNonQuery();
                    if (reader.Read())
                    {
                        string sessionId = HttpContext.Current.Session.SessionID;
                        Session["customer_id"] = reader["customer_id"].ToString();
                        Session["customer_name"] = reader["customer_name"].ToString();
                        Session["customer_email"] = reader["customer_email"].ToString();
                        Session["customer_mobileno"] = reader["customer_mobileno"].ToString();
                        Session["customer_dob"] = reader["customer_dob"].ToString();
                        Session["customer_gender"] = reader["customer_gender"].ToString();

                        ShowMessage("Login Completed.", MessageType.Success);
                        Response.Redirect("index.aspx");

                    }
                    else
                    {
                        ShowMessage("Something went wrong.", MessageType.Warning);
                    }
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

    private void GenerateId()
    {
        mst.con.Close();
        mst.con.Open();
        string queryreadid = "SELECT customer_temp_id FROM ecommerce_customer ORDER BY customer_temp_id DESC";
        SqlCommand cmdreadid = new SqlCommand(queryreadid, mst.con);
        SqlDataReader readiddr = cmdreadid.ExecuteReader();
        if (readiddr.Read())
        {
            if (readiddr["customer_temp_id"] == DBNull.Value)
            {
                lblid.Text = "1";
                lblid.Text = DateTime.Now.Year + "0" + DateTime.Now.Month + Convert.ToString(lblid.Text);
            }
            else
            {
                lblid.Text = readiddr["customer_temp_id"].ToString();
                lblid.Text = Convert.ToString(Convert.ToInt32(lblid.Text) + 1);
                lblid.Text = DateTime.Now.Year + "0" + DateTime.Now.Month + Convert.ToString(lblid.Text);
            }
        }
        else
        {
            lblid.Text = "1";
            lblid.Text = DateTime.Now.Year + "0" + DateTime.Now.Month + Convert.ToString(lblid.Text);
        }
        mst.con.Close();
    }

    private void GenerateTempId()
    {
        mst.con.Close();
        mst.con.Open();
        string queryreadid = "SELECT customer_temp_id FROM ecommerce_customer ORDER BY customer_temp_id DESC";
        SqlCommand cmdreadid = new SqlCommand(queryreadid, mst.con);
        SqlDataReader readiddr = cmdreadid.ExecuteReader();
        if (readiddr.Read())
        {
            if (readiddr["customer_temp_id"] == DBNull.Value)
            {
                lbltempid.Text = "1";

            }
            else
            {
                lbltempid.Text = readiddr["customer_temp_id"].ToString();
                lbltempid.Text = Convert.ToString(Convert.ToInt32(lbltempid.Text) + 1);

            }
        }
        else
        {
            lbltempid.Text = "1";

        }
        mst.con.Close();
    }

}