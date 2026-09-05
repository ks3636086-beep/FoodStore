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
        if (!IsPostBack)
        {
            BindData();
            BindData1();
            BindExclusiveCoupon();
            BindReviewProduct();

            string search = Request.QueryString["search"];

            if (!string.IsNullOrEmpty(search))
            {
                SearchProducts(search);
            }
        }
    }

    private void SearchProducts(string search)
    {
        string query = @"SELECT *,
                            b.id as price_id,
                            (select top 1 product_stock
                             from ecommerce_product_price
                             where product_id=a.product_id) as product_stock,
                            (select top 1 photo_path
                             from ecommerce_product_photos
                             where product_id=a.product_id) as photo_path
                     FROM ecommerce_product a
                     LEFT JOIN ecommerce_product_price as b
                         ON a.product_id=b.product_id
                     WHERE a.product_full_name LIKE '%" + search + @"%'
                        OR a.product_description LIKE '%" + search + @"%'
                     ORDER BY a.id ASC";

        rptProducts.DataSource = mst.GetData(query);
        rptProducts.DataBind();
    }

    private void BindData()
    {
        rptCategory.DataSource = mst.GetData("SELECT * FROM ecommerce_category ORDER BY ID DESC");
        rptCategory.DataBind();
    }

    private void BindData1()
    {
        rptProducts.DataSource = mst.GetData("SELECT *,b.id as price_id,b.product_discount_percentage,(select top 1 product_stock from ecommerce_product_price where product_id=a.product_id) as product_stock,(select top 1 photo_path from ecommerce_product_photos where product_id=a.product_id) as photo_path FROM ecommerce_product a left join ecommerce_product_price as b on a.product_id=b.product_id order by a.id asc"); rptProducts.DataBind();
    }

    protected string GetDiscount(object discount)
    {
        if (discount == null || discount == DBNull.Value)
            return "";

        decimal value = Convert.ToDecimal(discount);

        if (value <= 0)
            return "";

        return "<span class='discount-badge ms-1'>" +
               value.ToString("0.#") +
               "% OFF</span>";
    }

    private string getsub_order_id()
    {
        string ctno = string.Empty;

        mst.con.Open();

        string query_delete_photo =
            "SELECT ISNULL(MAX(sub_order_id_temp), 0) + 1 AS num FROM ecommerce_order";

        SqlCommand cmd_delete_photo = new SqlCommand(query_delete_photo, mst.con);
        SqlDataReader dr_delete_photo = cmd_delete_photo.ExecuteReader();

        if (dr_delete_photo.Read())
        {
            ctno = dr_delete_photo["num"].ToString();
        }

        dr_delete_photo.Close();
        mst.con.Close();

        return ctno;
    }

    private string getsub_order_id_temp()
    {
        string ctno = string.Empty;

        mst.con.Open();

        string query_delete_photo =
            "SELECT ISNULL(MAX(sub_order_id_temp), 0) + 1 AS num FROM ecommerce_order";

        SqlCommand cmd_delete_photo = new SqlCommand(query_delete_photo, mst.con);
        SqlDataReader dr_delete_photo = cmd_delete_photo.ExecuteReader();

        if (dr_delete_photo.Read())
        {
            ctno = dr_delete_photo["num"].ToString();
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
                Response.Redirect("ecommerce_customer.aspx");
            }
        }

        if (e.CommandName.Equals("btnwishlist"))
        {
            if (Session["customer_id"] == null)
            {
                Response.Redirect("ecommerce_customer.aspx");
                return;
            }

            string customerId = Session["customer_id"].ToString();
            string productId = e.CommandArgument.ToString();

            mst.con.Open();

            SqlCommand checkCmd = new SqlCommand(
                "SELECT COUNT(*) FROM ecommerce_wishlist WHERE customer_id=@cid AND product_id=@pid",
                mst.con);

            checkCmd.Parameters.AddWithValue("@cid", customerId);
            checkCmd.Parameters.AddWithValue("@pid", productId);

            int count = Convert.ToInt32(checkCmd.ExecuteScalar());

            if (count == 0)
            {
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO ecommerce_wishlist (wishlist_date, customer_id, product_id) VALUES (@date,@cid,@pid)",
                    mst.con);

                cmd.Parameters.AddWithValue("@date", DateTime.Now);
                cmd.Parameters.AddWithValue("@cid", customerId);
                cmd.Parameters.AddWithValue("@pid", productId);

                cmd.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, GetType(), "msg",
                    "Swal.fire('Added in wishlist ❤️')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "msg",
                    "Swal.fire('Already in wishlist 🤍')", true);
            }

            mst.con.Close();

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

    protected void Latestbtn_ServerClick(object sender, EventArgs e)
    {
        rptProducts.DataSource = mst.GetData("SELECT *,b.id as price_id,(select top 1 product_stock from ecommerce_product_price where product_id=a.product_id) as product_stock,(select top 1 photo_path from ecommerce_product_photos where product_id=a.product_id) as photo_path FROM ecommerce_product a left join ecommerce_product_price as b on a.product_id=b.product_id order by a.id desc");
        rptProducts.DataBind();
    }

    protected void Bestsellbtn_ServerClick(object sender, EventArgs e)
    {
        rptProducts.DataSource = mst.GetData("SELECT TOP 10 *,b.id as price_id,(select top 1 product_stock from ecommerce_product_price where product_id=a.product_id) as product_stock,(select top 1 photo_path from ecommerce_product_photos where product_id=a.product_id) as photo_path,(select count(product_id) from ecommerce_order where product_id=a.product_id and order_status!='Cancelled') as total_sale FROM ecommerce_product a left join ecommerce_product_price as b on a.product_id=b.product_id ORDER BY total_sale DESC");
        rptProducts.DataBind();
    }


    protected string GetProductRating(object productId)
    {
        decimal averageRating = 0;
        int totalReviews = 0;

        string query = @"
        SELECT 
            ISNULL(AVG(CAST(review_star AS DECIMAL(10,1))), 0) AS average_rating,
            COUNT(*) AS total_reviews
        FROM product_rating_review
        WHERE product_id = @product_id
        AND review_status = 'Active'";

        using (SqlCommand cmd = new SqlCommand(query, mst.con))
        {
            cmd.Parameters.AddWithValue("@product_id", productId);

            mst.con.Open();

            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                if (dr.Read())
                {
                    averageRating = Convert.ToDecimal(dr["average_rating"]);
                    totalReviews = Convert.ToInt32(dr["total_reviews"]);
                }
            }

            mst.con.Close();
        }

        int fullStars = (int)Math.Floor(averageRating);
        bool halfStar = (averageRating - fullStars) >= 0.5m;

        string stars = "";

        for (int i = 1; i <= 5; i++)
        {
            if (i <= fullStars)
                stars += "<i class='fas fa-star text-warning'></i>";
            else if (i == fullStars + 1 && halfStar)
                stars += "<i class='fas fa-star-half-alt text-warning'></i>";
            else
                stars += "<i class='far fa-star text-muted'></i>";
        }

        return stars + " <span class='text-muted' style='font-size:11px;'>(" + totalReviews + ")</span>";
    }

    private void BindExclusiveCoupon()
    {
        pnlExclusiveCoupon.Visible = false;

        if (Session["customer_id"] == null)
            return;

        string customerId = Session["customer_id"].ToString().Trim();

        if (customerId == "")
            return;

        string query = "SELECT id,coupon_code,discount_percentage,coupon_detail,    from_date,to_date,coupon_status FROM ecommerce_coupon WHERE id IN (SELECT coupon_id FROM ecommerce_coupon_customer WHERE customer_id = '" + customerId + "')";

        SqlDataReader getCoupon = mst.Select_Operation(query);

        if (getCoupon == null)
            return;

        if (getCoupon.Read())
        {
            lblCouponDetail.Text = getCoupon["coupon_detail"].ToString().Trim();
            string couponCode = getCoupon["coupon_code"].ToString().Trim();
            string status = getCoupon["coupon_status"].ToString().Trim();

            decimal discount;
            DateTime fromDate;
            DateTime toDate;

            bool validDiscount = decimal.TryParse(getCoupon["discount_percentage"].ToString(), out discount);
            bool validFromDate = DateTime.TryParse(getCoupon["from_date"].ToString(), out fromDate);
            bool validToDate = DateTime.TryParse(getCoupon["to_date"].ToString(), out toDate);

            if (couponCode == "" || status != "Active" || !validDiscount || discount <= 0 ||
                !validFromDate || !validToDate)
            {
                getCoupon.Close();
                return;
            }

            if (DateTime.Now < fromDate || DateTime.Now > toDate)
            {
                getCoupon.Close();
                return;
            }

            TimeSpan remainingTime = toDate - DateTime.Now;


            lblCouponDays.Text = remainingTime.Days.ToString("00");
            lblCouponHours.Text = ((int)remainingTime.TotalHours).ToString("00");
            lblCouponMinutes.Text = remainingTime.Minutes.ToString("00");
            lblCouponSeconds.Text = remainingTime.Seconds.ToString("00");

            lblCouponDiscountPercentage.Text = discount.ToString("0.##");
            lblExclusiveCouponCode.Text = couponCode;
            hfCouponExpiryDate.Value = toDate.ToString("yyyy-MM-ddTHH:mm:ss");

            pnlExclusiveCoupon.Visible = true;
        }

        getCoupon.Close();
    }

    private void BindReviewProduct()
    {
        if (Session["customer_id"] == null) return;

        string q = @"SELECT TOP 1 product_id, product_name, product_photo, order_delivery_date
                 FROM ecommerce_order o
                 WHERE customer_id=@customer_id AND delivery_status='Delivered'
                 AND NOT EXISTS (SELECT 1 FROM product_rating_review r WHERE r.product_id=o.product_id AND r.reviwer_id=@customer_id)
                 ORDER BY o.id DESC";

        using (SqlCommand cmd = new SqlCommand(q, mst.con))
        {
            cmd.Parameters.AddWithValue("@customer_id", Session["customer_id"]);
            mst.con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {

                imgRecentProduct.ImageUrl = "auth/" + dr["product_photo"];
                lnkRecentProduct.HRef = "product_details.aspx?ref=" + dr["product_id"];
                lblDeliveryDate.Text = Convert.ToDateTime(dr["order_delivery_date"]).ToString("d MMM, yyyy");
                pnlRecentOrderReview.Visible = true;
            }
            else pnlRecentOrderReview.Visible = false;

            dr.Close();
            mst.con.Close();
        }
    }

    protected void btnDismissReview_Click(object sender, EventArgs e)
    {
        if (Session["customer_id"] == null)
            return;

        string customerId = Session["customer_id"].ToString();

        // Current/latest review product ka order row
        string q = @"SELECT TOP 1 id, product_id
                 FROM ecommerce_order
                 WHERE customer_id = @customer_id
                 AND delivery_status = 'Delivered'
                 ORDER BY id DESC";

        using (SqlCommand cmd = new SqlCommand(q, mst.con))
        {
            cmd.Parameters.AddWithValue("@customer_id", customerId);

            mst.con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                string orderRowId = dr["id"].ToString().Trim();
                string productId = dr["product_id"].ToString().Trim();

                dr.Close();

                string insert = @"INSERT INTO product_rating_review
        (product_id, reviwer_id, order_row_id, review_status)
        VALUES (@product_id, @customer_id, @order_row_id, 'Dismissed')";

                using (SqlCommand cmd2 = new SqlCommand(insert, mst.con))
                {
                    cmd2.Parameters.AddWithValue("@product_id", productId);
                    cmd2.Parameters.AddWithValue("@customer_id", customerId);
                    cmd2.Parameters.AddWithValue("@order_row_id", orderRowId);
                    cmd2.ExecuteNonQuery();
                }
            }
            else
            {
                dr.Close();
            }

            mst.con.Close();
        }

        pnlRecentOrderReview.Visible = false;
    }
}