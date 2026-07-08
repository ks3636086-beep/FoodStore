using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class checkout : System.Web.UI.Page
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
            Binddata();
            FGrandTotal.Text = mst.Get_Total(Session["customer_id"].ToString());
        }
    }

    private void Binddata()
    {
        rptProductList.DataSource = mst.GetData("select * from ecommerce_cart a left join ecommerce_order as b on b.customer_id=a.customer_id and b.product_id=a.product_id left join ecommerce_product_photos as c on c.product_id=a.product_id where a.customer_id='" + Session["customer_id"].ToString() + "' and order_id is null");
        rptProductList.DataBind();
    }


    protected void rptProductList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
}