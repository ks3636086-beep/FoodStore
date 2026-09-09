using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shop : System.Web.UI.Page
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
            ViewState["CategoryId"] = "all";

            string search = Request.QueryString["search"];

            if (!string.IsNullOrEmpty(search))
            {
                SearchProducts(search);
            }
            else
            {
                BindData1();
                BindProducts();
            }
        }

    }

    private void SearchProducts(string search)
    {
        string query = @"SELECT *
                     FROM ecommerce_product a
                     LEFT JOIN ecommerce_product_price b
                         ON a.product_id = b.product_id
                     LEFT JOIN ecommerce_product_photos c
                         ON a.product_id = c.product_id
                     WHERE a.product_full_name LIKE '%" + search + @"%'
                        OR a.product_description LIKE '%" + search + @"%'";

        rptProducts.DataSource = mst.GetData(query);
        rptProducts.DataBind();
    }
    private void BindData1()
    {
        rptProducts.DataSource = mst.GetData("select *, b.id AS price_id from ecommerce_product a left join ecommerce_product_price as b on a.product_id = b.product_id left join ecommerce_product_photos as c on a.product_id = c.product_id");
        rptProducts.DataBind();
    }

    protected void Category_Command(object sender, CommandEventArgs e)
    {
        string categoryId = e.CommandArgument.ToString();
        ViewState["CategoryId"] = categoryId;
        BindProducts(categoryId);

        string query;

        if (categoryId == "all")
        {
            query =
                "SELECT * FROM ecommerce_product a " +
                "LEFT JOIN ecommerce_product_price b ON a.product_id = b.product_id " +
                "LEFT JOIN ecommerce_product_photos c ON a.product_id = c.product_id";
        }
        else
        {
            query =
                "SELECT * FROM ecommerce_product a " +
                "LEFT JOIN ecommerce_product_price b ON a.product_id = b.product_id " +
                "LEFT JOIN ecommerce_product_photos c ON a.product_id = c.product_id " +
                "WHERE a.product_parent_category_id = '" + categoryId + "'";
        }

        rptProducts.DataSource = mst.GetData(query);
        rptProducts.DataBind();
    }

    protected void btnFilterPrice_Click(object sender, EventArgs e)
    {
        string categoryId = ViewState["CategoryId"] != null
        ? ViewState["CategoryId"].ToString()
        : "all";

        BindProducts(categoryId);
    }
    private void BindProducts(string categoryId)
    {
        string query =
            "SELECT * FROM ecommerce_product a " +
            "LEFT JOIN ecommerce_product_price b ON a.product_id = b.product_id " +
            "LEFT JOIN ecommerce_product_photos c ON a.product_id = c.product_id " +
            "WHERE 1=1 ";

        if (categoryId != "all")
        {
            query += " AND a.product_parent_category_id = '" + categoryId + "'";
        }

        if (!string.IsNullOrWhiteSpace(txtMinPrice.Text))
        {
            decimal minPrice;

            if (decimal.TryParse(txtMinPrice.Text.Trim(), out minPrice))
            {
                query += " AND b.product_final_sell_price >= " + minPrice;
            }
        }

        if (!string.IsNullOrWhiteSpace(txtMaxPrice.Text))
        {
            decimal maxPrice;

            if (decimal.TryParse(txtMaxPrice.Text.Trim(), out maxPrice))
            {
                query += " AND b.product_final_sell_price <= " + maxPrice;
            }
        }

        rptProducts.DataSource = mst.GetData(query);
        rptProducts.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string search = txtSearch.Text.Trim();

        if (!string.IsNullOrEmpty(search))
        {
            SearchProducts(search);
        }
        else
        {
            BindData1();
        }
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

        return averageRating.ToString("0.0") +
               " <i class='fas fa-star' style='font-size:0.58rem;color:#03a685;'></i>" +
               " <span class='text-muted border-start ps-1' style='font-size:0.64rem;'>| " +
               totalReviews + "</span>";
    }

    private void BindProducts()
    {
        string orderBy = "a.id ASC";

        switch (ddlSort.SelectedValue)
        {
            case "price_low":
                orderBy = "b.product_final_sell_price ASC";
                break;

            case "price_high":
                orderBy = "b.product_final_sell_price DESC";
                break;

            case "best_selling":
                orderBy = "ISNULL((SELECT COUNT(*) FROM ecommerce_order o WHERE o.product_id = a.product_id), 0) DESC";
                break;

            case "newest":
                orderBy = "a.id DESC";
                break;
        }

        string query = @"SELECT *,
        b.id AS price_id,
        (SELECT TOP 1 product_stock
         FROM ecommerce_product_price
         WHERE product_id = a.product_id) AS product_stock,
        (SELECT TOP 1 photo_path
         FROM ecommerce_product_photos
         WHERE product_id = a.product_id) AS photo_path
        FROM ecommerce_product a
        LEFT JOIN ecommerce_product_price b
            ON a.product_id = b.product_id
        ORDER BY " + orderBy;

        rptProducts.DataSource = mst.GetData(query);
        rptProducts.DataBind();
    }

    protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindProducts();
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

    protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.Equals("btncart"))
        {
            if (Session["customer_id"] == null)
            {
                Response.Redirect("ecommerce_customer.aspx");
                return;
            }

            string customerId = Session["customer_id"].ToString();

            cart_no = getcart_no();
            sub_order_id = getsub_order_id();
            sub_order_id_temp = getsub_order_id_temp();

            Label productId = (Label)e.Item.FindControl("lbldeletecategoryid");
            Label productPriceId = (Label)e.Item.FindControl("product_price_id");
            Label productName = (Label)e.Item.FindControl("lblname");
            Label sellPrice = (Label)e.Item.FindControl("lbl_sell_price");
            Label unit = (Label)e.Item.FindControl("lbl_unit");
            Label unitValue = (Label)e.Item.FindControl("lbl_unit_value");

            mst.con.Open();

            string checkData = @"SELECT a.*, b.product_sell_price
                             FROM ecommerce_cart a
                             LEFT JOIN ecommerce_order b
                             ON b.customer_id = a.customer_id
                             AND b.product_id = a.product_id
                             AND a.product_price_id = b.product_price_id
                             WHERE a.product_id = @product_id
                             AND a.product_price_id = @price_id
                             AND a.customer_id = @customer_id";

            SqlCommand cmdCheck = new SqlCommand(checkData, mst.con);
            cmdCheck.Parameters.AddWithValue("@product_id", productId.Text);
            cmdCheck.Parameters.AddWithValue("@price_id", productPriceId.Text);
            cmdCheck.Parameters.AddWithValue("@customer_id", customerId);

            SqlDataReader dr = cmdCheck.ExecuteReader();

            if (dr.Read())
            {
                int qty = (dr["cart_qty"] == DBNull.Value ? 0 : Convert.ToInt32(dr["cart_qty"])) + 1;
                double price = dr["product_sell_price"] == DBNull.Value ? 0 : Convert.ToDouble(dr["product_sell_price"]);
                double total = qty * price;

                dr.Close();
                mst.con.Close();

                // Update Cart
                mst.con.Open();

                SqlCommand cmdCart = new SqlCommand(
                    @"UPDATE ecommerce_cart
                  SET cart_qty = @qty
                  WHERE product_id = @product_id
                  AND product_price_id = @price_id
                  AND customer_id = @customer_id", mst.con);

                cmdCart.Parameters.AddWithValue("@qty", qty);
                cmdCart.Parameters.AddWithValue("@product_id", productId.Text);
                cmdCart.Parameters.AddWithValue("@price_id", productPriceId.Text);
                cmdCart.Parameters.AddWithValue("@customer_id", customerId);
                cmdCart.ExecuteNonQuery();

                mst.con.Close();

                // Update Order
                mst.con.Open();

                SqlCommand cmdOrder = new SqlCommand(
                    @"UPDATE ecommerce_order
                  SET product_qty = @qty,
                      total_amount_of_product = @total
                  WHERE product_id = @product_id
                  AND product_price_id = @price_id
                  AND customer_id = @customer_id", mst.con);

                cmdOrder.Parameters.AddWithValue("@qty", qty);
                cmdOrder.Parameters.AddWithValue("@total", total);
                cmdOrder.Parameters.AddWithValue("@product_id", productId.Text);
                cmdOrder.Parameters.AddWithValue("@price_id", productPriceId.Text);
                cmdOrder.Parameters.AddWithValue("@customer_id", customerId);
                cmdOrder.ExecuteNonQuery();

                mst.con.Close();
            }
            else
            {
                dr.Close();
                mst.con.Close();

                // Insert Cart
                mst.con.Open();

                SqlCommand cmdCart = new SqlCommand(
                    @"INSERT INTO ecommerce_cart
                (cart_no, cart_date, cart_qty, product_id, product_price_id, customer_id)
                VALUES
                (@cart_no, @cart_date, 1, @product_id, @price_id, @customer_id)", mst.con);

                cmdCart.Parameters.AddWithValue("@cart_no", cart_no);
                cmdCart.Parameters.AddWithValue("@cart_date", DateTime.Now.ToString("yyyy-MM-dd"));
                cmdCart.Parameters.AddWithValue("@product_id", productId.Text);
                cmdCart.Parameters.AddWithValue("@price_id", productPriceId.Text);
                cmdCart.Parameters.AddWithValue("@customer_id", customerId);

                cmdCart.ExecuteNonQuery();
                mst.con.Close();

                // Insert Order
                mst.con.Open();

                SqlCommand cmdOrder = new SqlCommand(
                    @"INSERT INTO ecommerce_order
                (sub_order_id_temp, sub_order_id, product_qty, product_id,
                 product_price_id, customer_id, product_name, product_unit,
                 product_unit_value, product_sell_price,
                 total_amount_of_product, cart_no)
                VALUES
                (@temp_id, @sub_id, 1, @product_id, @price_id, @customer_id,
                 @product_name, @unit, @unit_value, @sell_price,
                 @total, @cart_no)", mst.con);

                cmdOrder.Parameters.AddWithValue("@temp_id", Convert.ToInt32(sub_order_id_temp));
                cmdOrder.Parameters.AddWithValue("@sub_id", sub_order_id);
                cmdOrder.Parameters.AddWithValue("@product_id", productId.Text);
                cmdOrder.Parameters.AddWithValue("@price_id", productPriceId.Text);
                cmdOrder.Parameters.AddWithValue("@customer_id", customerId);
                cmdOrder.Parameters.AddWithValue("@product_name", productName.Text);
                cmdOrder.Parameters.AddWithValue("@unit", unit.Text);
                cmdOrder.Parameters.AddWithValue("@unit_value", unitValue.Text);
                cmdOrder.Parameters.AddWithValue("@sell_price", sellPrice.Text);
                cmdOrder.Parameters.AddWithValue("@total", sellPrice.Text);
                cmdOrder.Parameters.AddWithValue("@cart_no", cart_no);

                cmdOrder.ExecuteNonQuery();
                mst.con.Close();
            }

            cart_no = string.Empty;
            sub_order_id = string.Empty;
            sub_order_id_temp = string.Empty;

            Response.Write("<script>alert('Add to cart..');window.location='index.aspx';</script>");
        }
    }
}