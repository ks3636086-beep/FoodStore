using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class deliveryboy_deliveryboy : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        if (!IsPostBack)
        {
            if (Session["delivery_boy_email"] != null)
            {

            }
            else
            {
                Response.Redirect("logindeliveryboy.aspx");
            }


        }
    }
}
