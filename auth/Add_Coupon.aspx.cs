using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class auth_Add_Coupon : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LocalDB"].ConnectionString);
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
            BindCustomer();
        }
    }

    private void BindCustomer()
    {
        ddl_specific_customer.Items.Clear();

        SqlDataReader getCustomer = mst.Select_Operation(@"SELECT customer_id, customer_name, customer_mobileno FROM ecommerce_customer WHERE customer_status = 'Active' AND customer_id IN (SELECT customer_id FROM ecommerce_order WHERE order_status = 'Delivered' AND delivery_status = 'Delivered' GROUP BY customer_id HAVING COUNT(DISTINCT order_id) >= 2 OR MAX(total_order_amount) >= 300) ORDER BY customer_name");
        ddl_specific_customer.DataSource = getCustomer;
        ddl_specific_customer.DataTextField = "customer_name";
        ddl_specific_customer.DataValueField = "customer_id";
        ddl_specific_customer.DataBind();

        getCustomer.Close();
    }

    protected void btnsave_ServerClick(object sender, EventArgs e)
    {
        try
        {
            if (txt_coupon_name.Text.Length > 0 && txt_coupon_code.Text.Length > 0 && txt_discount_percentage.Text.Length > 0 && txt_from_date.Text.Length > 0 && txt_to_date.Text.Length > 0)
            {
                decimal discount = Convert.ToDecimal(txt_discount_percentage.Text);

                if (discount <= 0 || discount > 100)
                {
                    ShowMessage("Discount percentage must be between 1 and 100.", MessageType.Error);
                    return;
                }

                DateTime fromDate = Convert.ToDateTime(txt_from_date.Text);
                DateTime toDate = Convert.ToDateTime(txt_to_date.Text);

                string fromDateValue = fromDate.ToString("MMM  d yyyy hh:mmtt");
                string toDateValue = toDate.ToString("MMM  d yyyy hh:mmtt");

                if (toDate < fromDate)
                {
                    ShowMessage("To Date cannot be earlier than From Date.", MessageType.Error);
                    return;
                }

                int coupon_exist = bnc.Check_Coupon_Code(txt_coupon_code.Text);

                if (coupon_exist > 0)
                {
                    ShowMessage("Coupon code already exist.", MessageType.Error);
                    return;
                }

                if (ddl_apply_customer.SelectedValue == "Specific" &&
     ddl_specific_customer.GetSelectedIndices().Length == 0)
                {
                    ShowMessage("Please select at least one customer.", MessageType.Error);
                    return;
                }

                int success = bnc.Add_Coupon(txt_coupon_name.Text, ddl_apply_customer.SelectedValue, fromDateValue, toDateValue, discount, txt_coupon_detail.Text, txt_coupon_code.Text, ddl_coupon_status.SelectedValue);


                if (success > 0 && ddl_apply_customer.SelectedValue == "Specific")
                {
                    foreach (ListItem item in ddl_specific_customer.Items)
                    {
                        if (item.Selected)
                        {
                            bnc.Add_Coupon_Customer(success, item.Value);
                        }
                    }
                }

                if (success > 0)
                {
                    ShowMessage("New Coupon data has been saved.", MessageType.Success);
                    Response.Redirect("Coupon_List.aspx");
                }
            }

            else
            {
                ShowMessage("All * field are required.", MessageType.Error);
            }
        }
        catch (SqlException ex)
        {
            //ShowMessage(ex.Message, MessageType.Warning);
            ShowMessage(ex.Message, MessageType.Error);
        }
    }

    protected void ddl_apply_customer_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_apply_customer.SelectedValue == "Specific")
        {
            specific_customer_container.Style["display"] = "block";
        }
        else
        {
            specific_customer_container.Style["display"] = "none";
        }

        ScriptManager.RegisterStartupScript(
            this,
            this.GetType(),
            "refreshPicker",
            "$('.selectpicker').selectpicker('refresh');",
            true
        );
    }
}