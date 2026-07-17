using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    public enum MessageType { Success, Error, Info, Warning };
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    Master mst = new Master();
    string cart_no = string.Empty;
    string sub_order_id_temp = string.Empty;
    string sub_order_id = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();
        BindData1();
    }
    private void BindData()
    {
        rptCategory.DataSource = mst.GetData("SELECT * FROM ecommerce_category ORDER BY ID DESC");
        rptCategory.DataBind();
    }

    private void BindData1()
    {
        rptProducts.DataSource = mst.GetData("SELECT *,b.id as price_id,(select top 1 product_stock from ecommerce_product_price where product_id=a.product_id) as product_stock,(select top 1 photo_path from ecommerce_product_photos where product_id=a.product_id) as photo_path FROM ecommerce_product a left join ecommerce_product_price as b on a.product_id=b.product_id order by a.id asc");
        rptProducts.DataBind();
    }
    private string getsub_order_id()
    {
        string ctno = string.Empty;
        mst.con.Open();
        string query_delete_photo = "select isnull(count(*),1) as num from ecommerce_order";
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

    private string getsub_order_id_temp()
    {
        string ctno = string.Empty;
        mst.con.Open();
        string query_delete_photo = "select isnull(count(*),1) as num from ecommerce_order";
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

    protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.Equals("btncart"))
        {
            if (Session["customer_id"] != null)
            {

                cart_no = getcart_no();
                sub_order_id = getsub_order_id();
                sub_order_id_temp = getsub_order_id_temp();
                mst.con.Open();
                Label lbldeletecategoryid = (Label)rptProducts.Items[e.Item.ItemIndex].FindControl("lbldeletecategoryid");
                Label product_price_id = (Label)rptProducts.Items[e.Item.ItemIndex].FindControl("product_price_id");
                Label lblname = (Label)rptProducts.Items[e.Item.ItemIndex].FindControl("lblname");
                Label lbl_sell_price = (Label)rptProducts.Items[e.Item.ItemIndex].FindControl("lbl_sell_price");
                Label lbl_market_price = (Label)rptProducts.Items[e.Item.ItemIndex].FindControl("lbl_market_price");
                Label lbl_unit = (Label)rptProducts.Items[e.Item.ItemIndex].FindControl("lbl_unit");
                Label lbl_unit_value = (Label)rptProducts.Items[e.Item.ItemIndex].FindControl("lbl_unit_value");

                string check_data = "select a.*,b.product_sell_price from ecommerce_cart a left join ecommerce_order as b on b.customer_id=a.customer_id and b.product_id=a.product_id and a.product_price_id=b.product_price_id where a.product_id='" + lbldeletecategoryid.Text + "' and a.product_price_id='" + product_price_id.Text + "' and a.customer_id='" + Session["customer_id"].ToString() + "'";
                SqlCommand cmd_check_cart = new SqlCommand(check_data, mst.con);
                SqlDataReader dr_check_cart = cmd_check_cart.ExecuteReader();
                if (dr_check_cart.Read())
                {
                    string qty = dr_check_cart["cart_qty"].ToString();
                    string price = dr_check_cart["product_sell_price"].ToString();
                    int q = Convert.ToInt32(qty) + 1;
                    double pr = Convert.ToDouble(price);
                    pr = q * pr;

                    dr_check_cart.Close();
                    mst.con.Close();

                    mst.con.Open();
                    string insert_cart = "update ecommerce_cart set cart_qty='" + q.ToString() + "'  where  product_id='" + lbldeletecategoryid.Text + "' and product_price_id='" + product_price_id.Text + "' and customer_id='" + Session["customer_id"].ToString() + "'";
                    SqlCommand cmd_insert_cart = new SqlCommand(insert_cart, mst.con);
                    SqlDataReader dr_insert_cart = cmd_insert_cart.ExecuteReader();
                    dr_insert_cart.Close();
                    mst.con.Close();

                    mst.con.Open();
                    string insert_order = "update ecommerce_order set product_qty='" + q.ToString() + "',total_amount_of_product='" + pr.ToString() + "'  where  product_id='" + lbldeletecategoryid.Text + "' and product_price_id='" + product_price_id.Text + "' and customer_id='" + Session["customer_id"].ToString() + "'";
                    SqlCommand cmd_order_data = new SqlCommand(insert_order, mst.con);
                    SqlDataReader rdr_order_data = cmd_order_data.ExecuteReader();
                    rdr_order_data.Close();
                    mst.con.Close();

                }
                else
                {
                    dr_check_cart.Close();
                    mst.con.Close();

                    mst.con.Open();
                    string insert_cart = "insert into ecommerce_cart (cart_no,cart_date,cart_qty,product_id,product_price_id,customer_id) values ('" + cart_no + "','" + DateTime.Now.ToString("yyyy-MM-dd") + "','1','" + lbldeletecategoryid.Text + "','" + product_price_id.Text + "','" + Session["customer_id"].ToString() + "')";
                    SqlCommand cmd_insert_cart = new SqlCommand(insert_cart, mst.con);
                    SqlDataReader dr_insert_cart = cmd_insert_cart.ExecuteReader();
                    dr_insert_cart.Close();
                    mst.con.Close();

                    mst.con.Open();
                    string insert_order = "insert into ecommerce_order (sub_order_id_temp,sub_order_id,product_qty,product_id,product_price_id,customer_id,product_name,product_unit,product_unit_value,product_sell_price,total_amount_of_product,cart_no) values ('" + Convert.ToInt32(sub_order_id_temp) + "','" + sub_order_id + "','1','" + lbldeletecategoryid.Text + "','" + product_price_id.Text + "','" + Session["customer_id"].ToString() + "','" + lblname.Text + "','" + lbl_unit.Text + "','" + lbl_unit_value.Text + "','" + lbl_sell_price.Text + "','" + lbl_sell_price.Text + "','" + cart_no + "')";
                    SqlCommand cmd_order_data = new SqlCommand(insert_order, mst.con);
                    SqlDataReader rdr_order_data = cmd_order_data.ExecuteReader();
                    rdr_order_data.Close();
                    mst.con.Close();

                }

                cart_no = string.Empty;
                sub_order_id = string.Empty;
                sub_order_id_temp = string.Empty;
                Response.Write("<script>alert('Add to cart..');window.location = 'index.aspx';</script>"); //works great
                //Response.Redirect("index.aspx");
            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }
    }
    private string getcart_no()
    {
        string ctno = string.Empty;
        mst.con.Open();
        string query_delete_photo = "select isnull(count(*),1) as num from ecommerce_cart";
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