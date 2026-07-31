using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class deliveryboy_profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindProfile();
    }
    private void BindProfile()
    {
        DataTable dt = GetData("SELECT * FROM ecommerce_delivery_boy WHERE delivery_boy_id='" + Session["id"] + "'");

        if (dt.Rows.Count > 0)
        {
            txt_name.Text = dt.Rows[0]["delivery_boy_name"].ToString();
            txt_mobile.Text = dt.Rows[0]["delivery_boy_mobileno"].ToString();
            txt_email.Text = dt.Rows[0]["delivery_boy_email"].ToString();
            txt_gender.Text = dt.Rows[0]["delivery_boy_gender"].ToString();
            txt_state.Text = dt.Rows[0]["delivery_boy_state_name"].ToString();
            txt_city.Text = dt.Rows[0]["delivery_boy_city_name"].ToString();
            txt_pincode.Text = dt.Rows[0]["delivery_boy_pincode"].ToString();
            txt_status.Text = dt.Rows[0]["delivery_boy_status"].ToString();
            txt_date.Text = dt.Rows[0]["delivery_boy_date"].ToString();
            txt_address.Text = dt.Rows[0]["delivery_boy_address_line_1"].ToString();

            img_profile.ImageUrl = ResolveUrl("~/auth/" + dt.Rows[0]["delivery_boy_photo"].ToString());

        }
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