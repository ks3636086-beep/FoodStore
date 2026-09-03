using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cart : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    Master mst = new Master();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["customer_id"] != null)
        {
            BindCoupons();
            BindCart();
            SubTotal.Text = mst.Get_Total(Session["customer_id"].ToString());
            GrandTotal.Text = mst.Get_Total(Session["customer_id"].ToString());
        }
        else
        {
            Response.Redirect("ecommerce_customer.aspx");
        }
    }
    private void BindCart()
    {
        rptCart.DataSource = mst.GetData("select * from ecommerce_cart a left join ecommerce_order as b on b.customer_id=a.customer_id and b.product_id=a.product_id left join ecommerce_product_photos as c on c.product_id=a.product_id where a.customer_id='" + Session["customer_id"].ToString() + "' and order_id is null");
        rptCart.DataBind();
    }

    protected void rptCart_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Label lblprc = (Label)rptCart.Items[e.Item.ItemIndex].FindControl("lblprc");
        Label lbltotal = (Label)rptCart.Items[e.Item.ItemIndex].FindControl("lbltotal");
        Label lblproduct_id = (Label)rptCart.Items[e.Item.ItemIndex].FindControl("lblproduct_id");
        Label qty = (Label)rptCart.Items[e.Item.ItemIndex].FindControl("qty");
        Label qty1 = (Label)rptCart.Items[e.Item.ItemIndex].FindControl("qty1");

        if (e.CommandName.Equals("btnminus"))
        {
            if (Convert.ToInt32(qty1.Text) < 1)
            {
                qty.Text = "1";
                lbltotal.Text = lblprc.Text;
            }
            else
            {
                int q = Convert.ToInt32(qty.Text);
                q--;
                qty.Text = q.ToString();
                double prc = Convert.ToDouble(lblprc.Text);
                double total = q * prc;
                lbltotal.Text = total.ToString();
            }
            BindCart();
        }

        if (e.CommandName.Equals("btnplus"))
        {
            int q = Convert.ToInt32(qty1.Text);
            q++;
            qty.Text = q.ToString();
            double prc = Convert.ToDouble(lblprc.Text.Trim());
            double total = q * prc;
            lbltotal.Text = total.ToString();

            SubTotal.Text = mst.Get_Total(Session["customer_id"].ToString());
            GrandTotal.Text = mst.Get_Total(Session["customer_id"].ToString());
            BindCart();
        }

        if (e.CommandName.Equals("btndel"))
        {
            mst.con.Open();

            string query_delete_photo = "delete from ecommerce_cart where product_id='" + lblproduct_id.Text + "' and customer_id='" + Session["customer_id"].ToString() + "'";
            SqlCommand cmd_delete_photo = new SqlCommand(query_delete_photo, mst.con);
            SqlDataReader dr_delete_photo = cmd_delete_photo.ExecuteReader();
            dr_delete_photo.Close();

            string order_del = "delete from ecommerce_order where product_id='" + lblproduct_id.Text + "' and customer_id='" + Session["customer_id"].ToString() + "' and order_id is null";
            SqlCommand cmd_order = new SqlCommand(order_del, mst.con);
            SqlDataReader dr_order = cmd_order.ExecuteReader();
            dr_order.Close();
            mst.con.Close();

            BindCart();
            SubTotal.Text = mst.Get_Total(Session["customer_id"].ToString());
            GrandTotal.Text = mst.Get_Total(Session["customer_id"].ToString());

        }
    }

    protected void checkoutbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("checkout.aspx?ref=" + GrandTotal.Text + "");

    }
    private string AppliedCouponCode
    {
        get { return ViewState["AppliedCouponCode"] as string ?? ""; }
        set { ViewState["AppliedCouponCode"] = value; }
    }

    private decimal AppliedCouponDiscount
    {
        get
        {
            return ViewState["AppliedCouponDiscount"] != null
                ? Convert.ToDecimal(ViewState["AppliedCouponDiscount"])
                : 0;
        }
        set
        {
            ViewState["AppliedCouponDiscount"] = value;
        }
    }
    private void BindCoupons()
    {
        string customerId = Session["customer_id"].ToString();

        string query = @"SELECT id, coupon_code, coupon_detail, discount_percentage, to_date, apply_customer FROM ecommerce_coupon WHERE coupon_status = 'Active' AND (apply_customer = 'All' OR (apply_customer = 'Specific' AND id IN (SELECT coupon_id FROM ecommerce_coupon_customer WHERE customer_id = '" + customerId + @"'))) ORDER BY id DESC";
        SqlDataReader getData = mst.Select_Operation(query);
        rptCoupons.DataSource = getData;
        rptCoupons.DataBind();
        getData.Close();
    }

    protected void btnSelectCoupon_Command(object sender, CommandEventArgs e)
    {
        string couponCode = e.CommandArgument.ToString();

        txtCouponCode.Text = couponCode;

        btnApplyCoupon_Click1(sender, e);
    }

    protected void btnApplyCoupon_Click(object sender, EventArgs e)
    {
        string couponCode = txtCouponCode.Text.Trim();

        if (string.IsNullOrEmpty(couponCode))
        {
            ShowMessage("Please enter coupon code.", MessageType.Error);
            return;
        }

        SqlDataReader getCoupon = mst.Select_Operation(
            "SELECT id, coupon_code, discount_percentage, from_date, to_date, apply_customer " +
            "FROM ecommerce_coupon WHERE coupon_code = '" + couponCode + "' AND coupon_status = 'Active'"
        );

        if (getCoupon.Read())
        {
            int couponId = Convert.ToInt32(getCoupon["id"]);
            string applyCustomer = getCoupon["apply_customer"].ToString();

            DateTime fromDate = Convert.ToDateTime(getCoupon["from_date"]);
            DateTime toDate = Convert.ToDateTime(getCoupon["to_date"]);

            if (DateTime.Today < fromDate.Date || DateTime.Today > toDate.Date)
            {
                getCoupon.Close();
                ShowMessage("This coupon has expired or is not active yet.", MessageType.Error);
                return;
            }

            // Specific Customer Check
            if (applyCustomer == "Specific")
            {
                string customerId = Session["customer_id"].ToString();

                SqlDataReader checkCustomer = mst.Select_Operation(
                    "SELECT id FROM ecommerce_coupon_customer WHERE coupon_id = "
                    + couponId + " AND customer_id = '" + customerId + "'"
                );

                if (!checkCustomer.Read())
                {
                    checkCustomer.Close();
                    getCoupon.Close();

                    ShowMessage("This coupon is not applicable for your account.", MessageType.Error);
                    return;
                }

                checkCustomer.Close();
            }

            // Calculate Discount
            decimal subTotal = Convert.ToDecimal(mst.Get_Total(Session["customer_id"].ToString()));
            decimal discountPercentage = Convert.ToDecimal(getCoupon["discount_percentage"]);

            decimal discountAmount = (subTotal * discountPercentage) / 100;

            decimal shipping = 0;

            if (!string.IsNullOrEmpty(lblshipping.Text))
            {
                decimal.TryParse(lblshipping.Text, out shipping);
            }

            decimal grandTotal = subTotal - discountAmount + shipping;

            if (grandTotal < 0)
            {
                grandTotal = 0;
            }

            // Remember Applied Coupon
            AppliedCouponCode = getCoupon["coupon_code"].ToString();
            AppliedCouponDiscount = discountAmount;

            // Display
            lblCouponDiscount.Text = discountAmount.ToString("0.00");
            GrandTotal.Text = grandTotal.ToString("0.00");

            getCoupon.Close();

            ShowMessage("Coupon applied successfully.", MessageType.Success);
        }
        else
        {
            getCoupon.Close();
            ShowMessage("Invalid or inactive coupon code.", MessageType.Error);
        }
    }

    protected void btnApplyCoupon_Click1(object sender, EventArgs e)
    {
        string couponCode = txtCouponCode.Text.Trim();

        if (string.IsNullOrEmpty(couponCode))
        {
            ShowMessage("Please enter coupon code.", MessageType.Error);
            return;
        }

        SqlDataReader getCoupon = mst.Select_Operation(
            "SELECT id, coupon_code, coupon_detail, discount_percentage, from_date, to_date, apply_customer " +
            "FROM ecommerce_coupon " +
            "WHERE coupon_code = '" + couponCode + "' AND coupon_status = 'Active'"
        );

        if (getCoupon.Read())
        {
            string applyCustomer = getCoupon["apply_customer"].ToString();

            // Date Check
            DateTime fromDate = Convert.ToDateTime(getCoupon["from_date"]);
            DateTime toDate = Convert.ToDateTime(getCoupon["to_date"]);
            DateTime today = DateTime.Today;

            if (today < fromDate.Date || today > toDate.Date)
            {
                getCoupon.Close();
                ShowMessage("This coupon has expired or is not active yet.", MessageType.Error);
                return;
            }

            // Specific Customer Check
            if (applyCustomer == "Specific")
            {
                string customerId = Session["customer_id"].ToString();

                SqlDataReader checkCustomer = mst.Select_Operation(
                    "SELECT id FROM ecommerce_coupon_customer " +
                    "WHERE coupon_id = " + getCoupon["id"].ToString() +
                    " AND customer_id = '" + customerId + "'"
                );

                if (!checkCustomer.Read())
                {
                    checkCustomer.Close();
                    getCoupon.Close();

                    ShowMessage("This coupon is not applicable for your account.", MessageType.Error);
                    return;
                }

                checkCustomer.Close();
            }

            // Coupon valid and customer eligible
            ShowMessage("Coupon applied successfully.", MessageType.Success);
        }
        else
        {
            ShowMessage("Invalid or inactive coupon code.", MessageType.Error);
        }

        getCoupon.Close();
    }
}