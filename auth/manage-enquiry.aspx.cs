using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class auth_manage_enquiry : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    Master mst = new Master();
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();
    }

    private void BindData()
    {
        rptbinddata.DataSource = mst.GetData("SELECT * FROM ecommerce_enquiry order by id asc");
        rptbinddata.DataBind();
    }

    protected void rptbinddata_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }

    protected void rptbinddata_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.Equals("btndelete"))
        {
            Label lbldeletesellerid = (Label)rptbinddata.Items[e.Item.ItemIndex].FindControl("lbldeletesellerid");

            SqlDataReader dr_delete_seller = mst.Delete_Operation("delete from ecommerce_enquiry where id='" + lbldeletesellerid.Text + "'");
            dr_delete_seller.Close();

            ShowMessage("Delete operation success.", MessageType.Success);

            BindData();
        }
    }
}