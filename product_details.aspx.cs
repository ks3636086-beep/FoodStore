using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class product_details : System.Web.UI.Page
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
        BindData1();

        if (!IsPostBack)
        {
            BindReviews();
            CheckReviewOption();
            BindReviewSummary();
        }
        SqlDataReader dr_product_data = mst.Select_Operation("select * from ecommerce_product a left join ecommerce_product_price as b on a.product_id = b.product_id left join ecommerce_product_photos as c on a.product_id = c.product_id where a.product_id='" + Request.QueryString["ref"] + "'");
        if (dr_product_data.Read())
        {
            prductid.Src = "auth/" + dr_product_data["photo_path"].ToString();
            heading.InnerText = dr_product_data["product_full_name"].ToString();
            para.InnerHtml = dr_product_data["product_description"].ToString();
            heading1.InnerText = dr_product_data["product_final_sell_price"].ToString();
        }

        dr_product_data.Close();
    }

    private void BindData1()
    {
        rptProducts.DataSource = mst.GetData("select * from ecommerce_product a left join ecommerce_product_price as b on a.product_id = b.product_id left join ecommerce_product_photos as c on a.product_id = c.product_id");
        rptProducts.DataBind();
    }

    protected void btnWishlist_Click(object sender, EventArgs e)
    {
        if (Session["customer_id"] == null)
        {
            Response.Redirect("ecommerce_customer.aspx");
            return;
        }

        string customerId = Session["customer_id"].ToString();
        string productId = Request.QueryString["ref"];

        mst.con.Open();

        // CHECK DUPLICATE
        SqlCommand checkCmd = new SqlCommand(
            "SELECT COUNT(*) FROM ecommerce_wishlist WHERE customer_id=@cid AND product_id=@pid",
            mst.con);

        checkCmd.Parameters.AddWithValue("@cid", customerId);
        checkCmd.Parameters.AddWithValue("@pid", productId);

        int count = Convert.ToInt32(checkCmd.ExecuteScalar());

        if (count == 0)
        {
            // INSERT
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

    protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

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

    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        if (Session["customer_id"] == null)
        {
            Response.Redirect("ecommerce_customer.aspx");
            return;
        }

        string productId = Request.QueryString["ref"];

        if (string.IsNullOrEmpty(productId))
        {
            return;
        }

        cart_no = getcart_no();
        sub_order_id = getsub_order_id();
        sub_order_id_temp = getsub_order_id_temp();

        mst.con.Open();

        // Product details
        string productQuery = @"SELECT 
                            a.product_id,
                            a.product_full_name,
                            b.id AS product_price_id,
                            b.product_final_sell_price,
                            b.product_unit,
                            b.product_unit_value
                        FROM ecommerce_product a
                        LEFT JOIN ecommerce_product_price b
                            ON a.product_id = b.product_id
                        WHERE a.product_id = @product_id";

        SqlCommand productCmd = new SqlCommand(productQuery, mst.con);
        productCmd.Parameters.AddWithValue("@product_id", productId);

        SqlDataReader drProduct = productCmd.ExecuteReader();

        if (!drProduct.Read())
        {
            drProduct.Close();
            mst.con.Close();
            return;
        }

        string productPriceId = drProduct["product_price_id"].ToString();
        string productName = drProduct["product_full_name"].ToString();
        string sellPrice = drProduct["product_final_sell_price"].ToString();
        string unit = drProduct["product_unit"].ToString();
        string unitValue = drProduct["product_unit_value"].ToString();

        drProduct.Close();

        // CHECK CART
        string checkData = @"SELECT a.*, b.product_sell_price
                         FROM ecommerce_cart a
                         LEFT JOIN ecommerce_order b
                         ON b.customer_id = a.customer_id
                         AND b.product_id = a.product_id
                         AND a.product_price_id = b.product_price_id
                         WHERE a.product_id = @product_id
                         AND a.product_price_id = @product_price_id
                         AND a.customer_id = @customer_id";

        SqlCommand checkCmd = new SqlCommand(checkData, mst.con);

        checkCmd.Parameters.AddWithValue("@product_id", productId);
        checkCmd.Parameters.AddWithValue("@product_price_id", productPriceId);
        checkCmd.Parameters.AddWithValue("@customer_id", Session["customer_id"].ToString());

        SqlDataReader drCheck = checkCmd.ExecuteReader();

        if (drCheck.Read())
        {
            string qty = drCheck["cart_qty"].ToString();
            string price = drCheck["product_sell_price"].ToString();

            int q = Convert.ToInt32(qty) + 1;
            double pr = Convert.ToDouble(price) * q;

            drCheck.Close();

            // UPDATE CART
            string updateCart = @"UPDATE ecommerce_cart
                              SET cart_qty = @qty
                              WHERE product_id = @product_id
                              AND product_price_id = @product_price_id
                              AND customer_id = @customer_id";

            SqlCommand cartCmd = new SqlCommand(updateCart, mst.con);

            cartCmd.Parameters.AddWithValue("@qty", q);
            cartCmd.Parameters.AddWithValue("@product_id", productId);
            cartCmd.Parameters.AddWithValue("@product_price_id", productPriceId);
            cartCmd.Parameters.AddWithValue("@customer_id", Session["customer_id"].ToString());

            cartCmd.ExecuteNonQuery();

            // UPDATE ORDER
            string updateOrder = @"UPDATE ecommerce_order
                               SET product_qty = @qty,
                                   total_amount_of_product = @total
                               WHERE product_id = @product_id
                               AND product_price_id = @product_price_id
                               AND customer_id = @customer_id";

            SqlCommand orderCmd = new SqlCommand(updateOrder, mst.con);

            orderCmd.Parameters.AddWithValue("@qty", q);
            orderCmd.Parameters.AddWithValue("@total", pr);
            orderCmd.Parameters.AddWithValue("@product_id", productId);
            orderCmd.Parameters.AddWithValue("@product_price_id", productPriceId);
            orderCmd.Parameters.AddWithValue("@customer_id", Session["customer_id"].ToString());

            orderCmd.ExecuteNonQuery();
        }
        else
        {
            drCheck.Close();

            // INSERT CART
            string insertCart = @"INSERT INTO ecommerce_cart
                              (cart_no, cart_date, cart_qty, product_id,
                               product_price_id, customer_id)
                              VALUES
                              (@cart_no, @cart_date, @cart_qty, @product_id,
                               @product_price_id, @customer_id)";

            SqlCommand cartCmd = new SqlCommand(insertCart, mst.con);

            cartCmd.Parameters.AddWithValue("@cart_no", cart_no);
            cartCmd.Parameters.AddWithValue("@cart_date", DateTime.Now.ToString("yyyy-MM-dd"));
            cartCmd.Parameters.AddWithValue("@cart_qty", 1);
            cartCmd.Parameters.AddWithValue("@product_id", productId);
            cartCmd.Parameters.AddWithValue("@product_price_id", productPriceId);
            cartCmd.Parameters.AddWithValue("@customer_id", Session["customer_id"].ToString());

            cartCmd.ExecuteNonQuery();

            // INSERT ORDER
            string insertOrder = @"INSERT INTO ecommerce_order
                               (sub_order_id_temp, sub_order_id, product_qty,
                                product_id, product_price_id, customer_id,
                                product_name, product_unit, product_unit_value,
                                product_sell_price, total_amount_of_product, cart_no)
                               VALUES
                               (@sub_order_id_temp, @sub_order_id, @product_qty,
                                @product_id, @product_price_id, @customer_id,
                                @product_name, @product_unit, @product_unit_value,
                                @product_sell_price, @total_amount, @cart_no)";

            SqlCommand orderCmd = new SqlCommand(insertOrder, mst.con);

            orderCmd.Parameters.AddWithValue("@sub_order_id_temp", Convert.ToInt32(sub_order_id_temp));
            orderCmd.Parameters.AddWithValue("@sub_order_id", sub_order_id);
            orderCmd.Parameters.AddWithValue("@product_qty", 1);
            orderCmd.Parameters.AddWithValue("@product_id", productId);
            orderCmd.Parameters.AddWithValue("@product_price_id", productPriceId);
            orderCmd.Parameters.AddWithValue("@customer_id", Session["customer_id"].ToString());
            orderCmd.Parameters.AddWithValue("@product_name", productName);
            orderCmd.Parameters.AddWithValue("@product_unit", unit);
            orderCmd.Parameters.AddWithValue("@product_unit_value", unitValue);
            orderCmd.Parameters.AddWithValue("@product_sell_price", sellPrice);
            orderCmd.Parameters.AddWithValue("@total_amount", sellPrice);
            orderCmd.Parameters.AddWithValue("@cart_no", cart_no);

            orderCmd.ExecuteNonQuery();
        }

        mst.con.Close();

        cart_no = string.Empty;
        sub_order_id = string.Empty;
        sub_order_id_temp = string.Empty;

        Response.Write("<script>alert('Add to cart..');window.location = 'index.aspx';</script>");
    }

    private void BindReviews()
    {
        string productId = Request.QueryString["ref"];

        if (string.IsNullOrEmpty(productId))
            return;

        string query = @"SELECT reviwer_name, reviewer_message, review_star, review_date
                     FROM product_rating_review
                     WHERE product_id = @product_id
                     AND review_status = 'Active'
                     ORDER BY id DESC";

        using (SqlCommand cmd = new SqlCommand(query, mst.con))
        {
            cmd.Parameters.AddWithValue("@product_id", productId);

            mst.con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            rptReviews.DataSource = dr;
            rptReviews.DataBind();

            dr.Close();
            mst.con.Close();
        }
    }

    protected void btnBuyNow_Click(object sender, EventArgs e)
    {
        //Response.Redirect("checkout.aspx?ref=" + GrandTotal.Text + "");
    }

    protected void btnSubmitReview_ServerClick(object sender, EventArgs e)
    {
        // 1. Customer login check
        if (Session["customer_id"] == null)
        {
            Response.Redirect("ecommerce_customer.aspx");
            return;
        }

        string customerId = Session["customer_id"].ToString();
        string productId = Request.QueryString["ref"];
        string reviewMessage = txtReviewMessage.Text.Trim();

        // 2. Product ID check
        if (string.IsNullOrEmpty(productId))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "msg",
                "Swal.fire('Product not found');", true);
            return;
        }

        // 3. Review message check
        if (string.IsNullOrEmpty(reviewMessage))
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "msg",
                "Swal.fire('Please enter your review');", true);
            return;
        }

        // 4. Rating validation
        int reviewStar;

        if (!int.TryParse(hdnReviewStar.Value, out reviewStar) ||
            reviewStar < 1 || reviewStar > 5)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "msg",
                "Swal.fire('Please select a rating between 1 and 5');", true);
            return;
        }

        mst.con.Open();


        // 5. Customer must have ordered this product
        SqlCommand orderCmd = new SqlCommand(@"
SELECT COUNT(*)
FROM ecommerce_order
WHERE customer_id = @customer_id
AND product_id = @product_id", mst.con);

        orderCmd.Parameters.AddWithValue("@customer_id", customerId);
        orderCmd.Parameters.AddWithValue("@product_id", productId);

        int orderCount = Convert.ToInt32(orderCmd.ExecuteScalar());

        if (orderCount == 0)
        {
            mst.con.Close();

            ScriptManager.RegisterStartupScript(this, GetType(), "msg",
                "Swal.fire('You can review only a product you have ordered');", true);
            return;
        }

        // 6. Review is NOT allowed only for Confirm + Pending

        SqlCommand pendingCheckCmd = new SqlCommand(@"
SELECT COUNT(*)
FROM ecommerce_order
WHERE customer_id = @customer_id
AND product_id = @product_id
AND order_status = 'Confirm'
AND delivery_status = 'Pending'
AND NOT EXISTS
(
    SELECT 1
    FROM ecommerce_order
    WHERE customer_id = @customer_id
    AND product_id = @product_id
    AND NOT (order_status = 'Confirm' AND delivery_status = 'Pending')
)", mst.con);

        pendingCheckCmd.Parameters.AddWithValue("@customer_id", customerId);
        pendingCheckCmd.Parameters.AddWithValue("@product_id", productId);

        int pendingCount = Convert.ToInt32(pendingCheckCmd.ExecuteScalar());

        if (pendingCount > 0)
        {
            mst.con.Close();

            ScriptManager.RegisterStartupScript(this, GetType(), "msg",
                "Swal.fire('You cannot review this product while the order is pending');", true);
            return;
        }

        // 7. Check duplicate review
        SqlCommand duplicateCmd = new SqlCommand(@"
        SELECT COUNT(*)
        FROM product_rating_review
        WHERE product_id = @product_id
        AND reviwer_id = @reviwer_id", mst.con);

        duplicateCmd.Parameters.AddWithValue("@product_id", productId);
        duplicateCmd.Parameters.AddWithValue("@reviwer_id", customerId);

        int reviewCount = Convert.ToInt32(duplicateCmd.ExecuteScalar());

        if (reviewCount > 0)
        {
            mst.con.Close();
             
            ScriptManager.RegisterStartupScript(this, GetType(), "msg",
                "Swal.fire('You have already reviewed this product');", true);
            return;
        }

        // 8. Get customer name
        SqlCommand customerCmd = new SqlCommand(
            "SELECT customer_name FROM ecommerce_customer WHERE customer_id=@customer_id",
            mst.con);

        customerCmd.Parameters.AddWithValue("@customer_id", customerId);

        string reviewerName = Convert.ToString(customerCmd.ExecuteScalar());

        // 9. Insert review
        SqlCommand cmd = new SqlCommand("INSERT INTO product_rating_review (product_id, reviwer_id, seller_id, reviwer_name, reviewer_message, review_star, review_date, review_status) VALUES (@product_id, @reviwer_id, NULL, @reviwer_name, @reviewer_message, @review_star, @review_date, @review_status)", mst.con);

        cmd.Parameters.AddWithValue("@product_id", productId);
        cmd.Parameters.AddWithValue("@reviwer_id", customerId);
        cmd.Parameters.AddWithValue("@reviwer_name", reviewerName);
        cmd.Parameters.AddWithValue("@reviewer_message", reviewMessage);
        cmd.Parameters.AddWithValue("@review_star", reviewStar);
        cmd.Parameters.AddWithValue("@review_date", DateTime.Now);
        cmd.Parameters.AddWithValue("@review_status", "Active");

        cmd.ExecuteNonQuery();

        mst.con.Close();

        // 10. Clear review box
        txtReviewMessage.Text = "";

        ScriptManager.RegisterStartupScript(this, GetType(), "msg",
            "Swal.fire('Review submitted successfully ❤️');", true);
    }

    protected string GetStars(object rating)
    {
        int stars = Convert.ToInt32(rating);
        return new string('★', stars) + new string('☆', 5 - stars);
    }

    private void CheckReviewOption()
    {
        string customerId = "";

        if (Session["customer_id"] != null)
        {
            customerId = Session["customer_id"].ToString();
        }

        string productId = Request.QueryString["ref"];

        // Login nahi hai → review form hide
        if (string.IsNullOrEmpty(customerId) || string.IsNullOrEmpty(productId))
        {
            pnlReviewForm.Visible = false;
            return;
        }

        mst.con.Open();

        SqlCommand cmd = new SqlCommand(@"
        SELECT COUNT(*)
        FROM product_rating_review
        WHERE product_id = @product_id
        AND reviwer_id = @customer_id
        AND review_status = 'Active'", mst.con);

        cmd.Parameters.AddWithValue("@product_id", productId);
        cmd.Parameters.AddWithValue("@customer_id", customerId);

        int reviewCount = Convert.ToInt32(cmd.ExecuteScalar());

        mst.con.Close();

        // Review already submitted → form hide
        if (reviewCount > 0)
        {
            pnlLeaveReview.Visible = false;
        }
        else
        {
            pnlLeaveReview.Visible = true;
        }
    }


    private void BindReviewSummary()
    {
        string productId = Request.QueryString["ref"];

        if (string.IsNullOrEmpty(productId))
            return;

        SqlCommand cmd = new SqlCommand(@"
        SELECT 
            ISNULL(AVG(CAST(review_star AS DECIMAL(10,1))), 0) AS AverageRating,
            COUNT(*) AS TotalReviews
        FROM product_rating_review
        WHERE product_id = @product_id
        AND review_status = 'Active'", mst.con);

        cmd.Parameters.AddWithValue("@product_id", productId);

        mst.con.Open();

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            double average = Convert.ToDouble(dr["AverageRating"]);
            int total = Convert.ToInt32(dr["TotalReviews"]);

            lblAverageRating.Text = average.ToString("0.0");
            lblTotalReviews.Text = total.ToString();

            lblProductAverageRating.Text = average.ToString("0.0");
            lblProductTotalReviews.Text = total.ToString();

            int fullStars = (int)Math.Floor(average);
            bool halfStar = (average - fullStars) >= 0.5;

            string stars = "";

            for (int i = 1; i <= 5; i++)
            {
                if (i <= fullStars)
                    stars += "<i class='fas fa-star'></i>";
                else if (i == fullStars + 1 && halfStar)
                    stars += "<i class='fas fa-star-half-alt'></i>";
                else
                    stars += "<i class='far fa-star'></i>";
            }

            litAverageStars.Text = stars;
            litProductStars.Text = stars;
        }

        dr.Close();
        mst.con.Close();
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
}