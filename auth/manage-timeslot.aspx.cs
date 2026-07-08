using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class auth_manage_timeslot : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

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
            BindData();
        }
    }

    private void BindData()
    {
        rpt_data.DataSource = mst.GetData("SELECT id,start_time,end_time FROM timeslot order by id asc");
        rpt_data.DataBind();
    }

    protected void rpt_data_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        
        if (e.CommandName.Equals("btndelete"))
        {
            Label lblrowdeleteid = (Label)rpt_data.Items[e.Item.ItemIndex].FindControl("lblrowdeleteid");

            con.Open();
            
           
            string query_delete_service = "delete from timeslot where id='" + lblrowdeleteid.Text + "'";
            SqlCommand cmd_delete_service = new SqlCommand(query_delete_service, con);
            SqlDataReader dr_delete_service = cmd_delete_service.ExecuteReader();

            dr_delete_service.Close();

            con.Close();
            ShowMessage("Delete operation success.", MessageType.Success);

            BindData();
        }
    }


    
}