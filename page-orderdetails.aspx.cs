using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page_orderdetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        oredr_id.Text = Request.QueryString[0];
    }

    protected void btnhome_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
}