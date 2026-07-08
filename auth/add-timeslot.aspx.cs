using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class auth_add_timeslot : System.Web.UI.Page
{
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
            
        }
    }

    protected void btnsave_ServerClick(object sender, EventArgs e)
    {
        try
        {
            if (txtstart.Text.Length > 0 && txtend.Text.Length > 0)
            {
                int check = mst.Count_data("Select Count(id) from timeslot Where start_time='" + txtstart.Text + "' ");

                if (check > 0)
                {
                    ShowMessage("Data already in database.", MessageType.Error);

                    txtstart.Focus();
                }
                else
                {
                    int success = bnc.Add_TimeSlot(txtstart.Text, txtend.Text);

                    if (success > 0)
                    {
                        ShowMessage("Data has been saved.", MessageType.Success);

                        txtend.Text = string.Empty;
                        txtstart.Text = string.Empty;
                        txtstart.Focus();

                    }
                }
            }
            else
            {
                ShowMessage("All * field are required.", MessageType.Error);
            }
        }
        catch (SqlException ex)
        {
            ShowMessage(ex.Message, MessageType.Error);
        }
    }

}