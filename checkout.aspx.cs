using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
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
    string order_id_temp = string.Empty;
    string order_id = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Binddata();
            lblgrandtotal.Text = mst.Get_Total(Session["customer_id"].ToString());
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

    protected void btnorder_Click(object sender, EventArgs e)
    {
        order_id_temp = getorder_id_temp();
        order_id = getorder_id();

        foreach (RepeaterItem item in rptProductList.Items)
        {
            if (firstname.Text.Length > 0 && email.Text.Length > 0 && mob.Text.Length > 0 && add1.Text.Length > 0 && add2.Text.Length > 0 && city.Text.Length > 0 && state.Text.Length > 0 && pincode.Text.Length > 0)
            {
                string product_GST_type = string.Empty;
                string product_tax_type = string.Empty;
                string product_GST_percentage = string.Empty;
                string product_GST_rate = string.Empty;
                string product_CGST_percentage = string.Empty;
                string product_CGST_rate = string.Empty;
                string product_SGST_percentage = string.Empty;
                string product_SGST_rate = string.Empty;
                string product_IGST_percentage = string.Empty;
                string product_IGST_rate = string.Empty;
                string product_market_price = string.Empty;
                string product_sell_price = string.Empty;
                string product_discount_percentage = string.Empty;
                string product_discount_price = string.Empty;
                string product_with_gst_Price = string.Empty;
                string product_final_sell_price = string.Empty;
                string total_market_price = string.Empty;
                string product_photo = string.Empty;
                string total_amount_of_product = string.Empty;

                //con.Open();

                Label lblproduct_id = (Label)item.FindControl("lblproduct_id");
                Label lblproductprice_id = (Label)item.FindControl("lblproductprice_id");
                Label lblname = (Label)item.FindControl("lblname");
                Label lbltotal = (Label)item.FindControl("lbltotal");
                Label lblprc = (Label)item.FindControl("lblprc");
                Label qty = (Label)item.FindControl("qty");
                mst.con.Close();
                mst.con.Open();
                string price_id = "select a.*,b.photo_path from ecommerce_product_price a left join ecommerce_product_photos as b on a.product_id=b.product_id where a.id=@id";
                SqlCommand cmd_price_id = new SqlCommand(price_id, mst.con);

                cmd_price_id.Parameters.AddWithValue("@id", lblproductprice_id.Text);
                SqlDataReader rdr = cmd_price_id.ExecuteReader();
                if (rdr.Read())
                {
                    product_GST_type = rdr["product_GST_type"].ToString();
                    product_tax_type = rdr["product_tax_type"].ToString();
                    product_GST_percentage = rdr["product_GST_percentage"].ToString();
                    product_GST_rate = rdr["product_GST_rate"].ToString();
                    product_CGST_percentage = rdr["product_CGST_percentage"].ToString();
                    product_CGST_rate = rdr["product_CGST_rate"].ToString();
                    product_SGST_percentage = rdr["product_SGST_percentage"].ToString();
                    product_SGST_rate = rdr["product_SGST_rate"].ToString();
                    product_IGST_percentage = rdr["product_IGST_percentage"].ToString();
                    product_IGST_rate = rdr["product_IGST_rate"].ToString();
                    product_market_price = rdr["product_market_price"].ToString();
                    product_sell_price = rdr["product_sell_price"].ToString();
                    product_discount_percentage = rdr["product_discount_percentage"].ToString();
                    product_discount_price = rdr["product_discount_price"].ToString();
                    product_with_gst_Price = rdr["product_with_gst_Price"].ToString();
                    product_final_sell_price = rdr["product_final_sell_price"].ToString();
                    total_market_price = rdr["product_market_price"].ToString();
                    product_photo = rdr["photo_path"].ToString();

                }
                rdr.Close();
                mst.con.Close();

                mst.con.Open();
                string insert_category = "update ecommerce_order set product_GST_type=@product_GST_type,product_tax_type=@product_tax_type, product_GST_percentage=@product_GST_percentage, product_GST_rate=@product_GST_rate, product_CGST_percentage = @product_CGST_percentage,product_CGST_rate =@product_CGST_rate, product_SGST_percentage =@product_SGST_percentage ,product_SGST_rate =@product_SGST_rate ,product_IGST_percentage =@product_IGST_percentage ,product_IGST_rate =@product_IGST_rate, product_market_price =@product_market_price ,product_sell_price =@product_sell_price ,product_discount_percentage =@product_discount_percentage ,product_discount_price =@product_discount_price ,product_with_gst_Price =@product_with_gst_Price ,product_final_sell_price =@product_final_sell_price ,total_market_price =@total_market_price, product_shipping_charge =@product_shipping_charge, total_amount_of_product =@total_amount_of_product, total_order_amount =@total_order_amount, product_photo =@product_photo, product_qty =@product_qty, payment_mode =@payment_mode, order_status =@order_status, delivery_status =@delivery_status,billing_landmark=@billing_landmark,billing_pincode=@billing_pincode,billing_state_name=@billing_state_name,billing_city_name=@billing_city_name,billing_address_line2=@billing_address_line2,billing_address_line1=@billing_address_line1,customer_email=@customer_email,customer_mobileno=@customer_mobileno,customer_name=@customer_name,order_time=@order_time,order_date=@order_date,order_id=@order_id,order_id_temp=@order_id_temp  where customer_id=@customer_id and product_id=@product_id and product_price_id=@product_price_id and order_id is null";
                SqlCommand cmd_category = new SqlCommand(insert_category, mst.con);

                cmd_category.Parameters.AddWithValue("@product_id", lblproduct_id.Text);
                cmd_category.Parameters.AddWithValue("@customer_id", Session["customer_id"].ToString());
                cmd_category.Parameters.AddWithValue("@product_price_id", lblproductprice_id.Text);
                cmd_category.Parameters.AddWithValue("@order_id_temp", Convert.ToInt32(order_id_temp));
                cmd_category.Parameters.AddWithValue("@order_id", order_id);
                cmd_category.Parameters.AddWithValue("@order_date", DateTime.Now.ToString("yyyy-MM-dd"));
                cmd_category.Parameters.AddWithValue("@order_time", DateTime.Now.ToString("HH:mm:ss"));
                cmd_category.Parameters.AddWithValue("@customer_name", firstname.Text);
                cmd_category.Parameters.AddWithValue("@customer_mobileno", mob.Text);
                cmd_category.Parameters.AddWithValue("@customer_email", email.Text);
                cmd_category.Parameters.AddWithValue("@billing_address_line1", add1.Text);
                cmd_category.Parameters.AddWithValue("@billing_address_line2", add2.Text);
                cmd_category.Parameters.AddWithValue("@billing_city_name", city.Text);
                cmd_category.Parameters.AddWithValue("@billing_state_name", state.Text);
                cmd_category.Parameters.AddWithValue("@billing_pincode", pincode.Text);
                cmd_category.Parameters.AddWithValue("@billing_landmark", dblcountry.SelectedValue);
                cmd_category.Parameters.AddWithValue("@product_GST_type", product_GST_type);
                cmd_category.Parameters.AddWithValue("@product_tax_type", product_tax_type);

                if (product_GST_percentage == null || product_GST_percentage == "")
                {
                    cmd_category.Parameters.AddWithValue("@product_GST_percentage", Convert.ToDouble(0));
                }
                else
                {
                    cmd_category.Parameters.AddWithValue("@product_GST_percentage", Convert.ToDouble(product_GST_percentage));
                }

                if (product_GST_rate == null || product_GST_rate == "")
                {
                    cmd_category.Parameters.AddWithValue("@product_GST_rate", Convert.ToDouble(0));
                }
                else
                {
                    cmd_category.Parameters.AddWithValue("@product_GST_rate", Convert.ToDouble(product_GST_rate));
                }

                if (product_CGST_percentage == null || product_CGST_percentage == "")
                {
                    cmd_category.Parameters.AddWithValue("@product_CGST_percentage", Convert.ToDouble(0));
                }
                else
                {
                    cmd_category.Parameters.AddWithValue("@product_CGST_percentage", Convert.ToDouble(product_CGST_percentage));
                }


                if (product_CGST_rate == null || product_CGST_rate == "")
                {
                    cmd_category.Parameters.AddWithValue("@product_CGST_rate", Convert.ToDouble(0));
                }
                else
                {
                    cmd_category.Parameters.AddWithValue("@product_CGST_rate", Convert.ToDouble(product_CGST_rate));
                }

                if (product_SGST_percentage == null || product_SGST_percentage == "")
                {
                    cmd_category.Parameters.AddWithValue("@product_SGST_percentage", Convert.ToDouble(0));
                }
                else
                {
                    cmd_category.Parameters.AddWithValue("@product_SGST_percentage", Convert.ToDouble(product_SGST_percentage));
                }

                if (product_SGST_rate == null || product_SGST_rate == "")
                {
                    cmd_category.Parameters.AddWithValue("@product_SGST_rate", Convert.ToDouble(0));
                }
                else
                {
                    cmd_category.Parameters.AddWithValue("@product_SGST_rate", Convert.ToDouble(product_SGST_rate));
                }

                if (product_IGST_percentage == null || product_IGST_percentage == "")
                {
                    cmd_category.Parameters.AddWithValue("@product_IGST_percentage", Convert.ToDouble(0));
                }
                else
                {
                    cmd_category.Parameters.AddWithValue("@product_IGST_percentage", Convert.ToDouble(product_IGST_percentage));
                }

                if (product_IGST_rate == null || product_IGST_rate == "")
                {
                    cmd_category.Parameters.AddWithValue("@product_IGST_rate", Convert.ToDouble(0));
                }
                else
                {
                    cmd_category.Parameters.AddWithValue("@product_IGST_rate", Convert.ToDouble(product_IGST_percentage));
                }
                cmd_category.Parameters.AddWithValue("@product_market_price", Convert.ToDouble(product_market_price));
                cmd_category.Parameters.AddWithValue("@product_sell_price", Convert.ToDouble(product_sell_price));
                cmd_category.Parameters.AddWithValue("@product_discount_percentage", Convert.ToDouble(product_discount_percentage));
                cmd_category.Parameters.AddWithValue("@product_discount_price", Convert.ToDouble(product_discount_price));
                cmd_category.Parameters.AddWithValue("@product_with_gst_Price", Convert.ToDouble(product_with_gst_Price));
                cmd_category.Parameters.AddWithValue("@product_final_sell_price", Convert.ToDouble(product_final_sell_price));
                cmd_category.Parameters.AddWithValue("@total_market_price", Convert.ToDouble(total_market_price));
                cmd_category.Parameters.AddWithValue("@product_shipping_charge", 0.00);

                int q = Convert.ToInt32(qty.Text);
                double price = Convert.ToDouble(product_final_sell_price);
                double total = Convert.ToDouble(q) * price;

                cmd_category.Parameters.AddWithValue("@total_amount_of_product", Convert.ToDouble(total.ToString()));
                cmd_category.Parameters.AddWithValue("@total_order_amount", Convert.ToDouble(lblgrandtotal.Text));
                cmd_category.Parameters.AddWithValue("@product_photo", product_photo);
                cmd_category.Parameters.AddWithValue("@product_qty", Convert.ToInt32(qty.Text));
                cmd_category.Parameters.AddWithValue("@payment_mode", dblmode.SelectedValue);
                cmd_category.Parameters.AddWithValue("@order_status", "Confirm");
                cmd_category.Parameters.AddWithValue("@delivery_status", "Pending");


                int success = cmd_category.ExecuteNonQuery();
                Response.Write("Updated Rows = " + success);
                // Response.End();
                if (success > 0)
                {
                    ShowMessage("Data has been saved.", MessageType.Success);
                    mst.con.Close();
                    // DeleteCart(lblproduct_id.Text, lblproductprice_id.Text);
                }
                else
                {
                    ShowMessage("Something went wrong.", MessageType.Warning);
                }

            }

        }
        // CartCount();
        Response.Redirect("page-orderdetails.aspx?ref='" + order_id + "'");

    }

    private string getorder_id()
    {
        string ctno = string.Empty;
        mst.con.Open();
        string query_delete_photo = "select isnull(count(order_id),1) as num from ecommerce_order";
        SqlCommand cmd_delete_photo = new SqlCommand(query_delete_photo, mst.con);
        SqlDataReader dr_delete_photo = cmd_delete_photo.ExecuteReader();

        if (dr_delete_photo.Read())
        {
            ctno = dr_delete_photo["num"].ToString();
            if (ctno == "0")
            {
                ctno = "ODR-1";
            }
            else
            {
                ctno = "ODR-" + ctno;
            }
        }
        dr_delete_photo.Close();
        mst.con.Close();
        return ctno;
    }

    private string getorder_id_temp()
    {
        string ctno = string.Empty;
        mst.con.Open();
        string query_delete_photo = "select isnull(count(order_id_temp),1) as num from ecommerce_order";
        SqlCommand cmd_delete_photo = new SqlCommand(query_delete_photo, mst.con);
        SqlDataReader dr_delete_photo = cmd_delete_photo.ExecuteReader();

        if (dr_delete_photo.Read())
        {
            ctno = dr_delete_photo["num"].ToString();
            if (ctno == "0")
            {
                ctno = "1";
            }
            else
            {
                ctno = ctno;
            }

        }
        dr_delete_photo.Close();
        mst.con.Close();
        return ctno;
    }

}