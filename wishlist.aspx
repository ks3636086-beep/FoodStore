<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="wishlist.aspx.cs" Inherits="wishlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- 4. ENHANCED COMPONENT STYLES -->
    <style>
        /* Responsive Wishlist Product Thumbnails */
        .wishlist-img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            transition: transform 0.2s ease-in-out;
        }

            .wishlist-img:hover {
                transform: scale(1.05);
            }

        /* Product Title Styling */
        .wishlist-title {
            transition: color 0.15s ease-in-out;
            font-size: 0.95rem;
            line-height: 1.4;
        }

            .wishlist-title:hover {
                color: #198754 !important; /* Bootstrap Success Accent */
            }

        /* Compact Buttons */
        .action-btn {
            height: 38px;
            max-width: 140px;
            font-size: 0.85rem;
        }

        .remove-btn {
            width: 36px;
            height: 36px;
            font-size: 0.85rem;
            transition: all 0.2s ease-in-out;
        }

            .remove-btn:hover {
                background-color: #dc3545;
                color: #ffffff !important;
            }

        /* Font Size Utility */
        .fs-xs {
            font-size: 0.75rem;
        }

        /* Tablet & Mobile Layout Adjustments */
        @media (max-width: 767.98px) {
            .wishlist-img {
                width: 65px;
                height: 65px;
            }

            .action-btn {
                height: 36px;
                font-size: 0.8rem;
                padding-left: 0.5rem !important;
                padding-right: 0.5rem !important;
            }

            .table-responsive {
                border-radius: 0.5rem;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- 1. BREADCRUMB & HEADER SECTION -->
    <div class="bg-light border-bottom py-3 mb-4">

        <div class="container-xl px-3 px-md-4">

            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb"
                data-aos="fade-right"
                data-aos-duration="700">
                <ol class="breadcrumb mb-1 small">
                    <li class="breadcrumb-item">
                        <a href="shop.aspx" class="text-decoration-none text-success">Shop</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Wishlist
                    </li>
                </ol>
            </nav>

            <div class="d-flex flex-column flex-sm-row justify-content-between align-items-sm-center gap-2">

                <!-- Wishlist Heading -->
                <div class="mb-3"
                    data-aos="fade-left"
                    data-aos-duration="800"
                    data-aos-delay="150">

                    <h2 class="h6 fw-semibold text-dark mb-1">❤️ My Wishlist
                    </h2>

                    <p class="text-muted mb-0 small">
                        Save your favorite products and shop them whenever you're ready.
                    </p>

                </div>

            </div>
        </div>
    </div>

    <!-- 2. MAIN WISHLIST CONTENT -->
    <div class="container-xl px-3 px-md-4 pb-5">
        <div class="card border-0 shadow-sm rounded-3 overflow-hidden"
            data-aos="fade-up"
            data-aos-duration="800"
            data-aos-once="true">
            <div class="card-body p-0"
                data-aos="fade-up"
                data-aos-duration="800"
                data-aos-once="true">
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="bg-light border-bottom">
                            <tr>
                                <th scope="col" class="py-3 px-4 text-secondary small fw-bold text-uppercase" style="width: 100px;">Image</th>
                                <th scope="col" class="py-3 px-3 text-secondary small fw-bold text-uppercase">Product Name</th>
                                <th scope="col" class="py-3 px-3 text-secondary small fw-bold text-uppercase" style="width: 140px;">Unit Price</th>
                                <th scope="col" class="py-3 px-3 text-secondary small fw-bold text-uppercase" style="width: 130px;">Stock</th>
                                <th scope="col" class="py-3 px-3 text-secondary small fw-bold text-uppercase text-center" style="width: 160px;">Add Item</th>
                                <th scope="col" class="py-3 px-4 text-secondary small fw-bold text-uppercase text-center" style="width: 90px;">Remove</th>
                            </tr>
                        </thead>
                        <tbody class="border-top-0">
                            <!-- PRESERVED REPEATER CONTROL -->
                            <asp:Repeater ID="rptWishlist" runat="server" OnItemCommand="rptWishlist_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <!-- Product Image -->
                                        <td class="py-3 px-4">
                                            <a href='<%# "product_details.aspx?ref=" + Eval("product_id") %>'
                                                class="d-block text-decoration-none">
                                                <img src='auth/<%# Eval("photo_path") %>'
                                                    alt='<%# Eval("product_full_name") %>'
                                                    class="rounded border bg-light wishlist-img" />
                                            </a>
                                        </td>

                                        <!-- Product Name -->
                                        <td class="py-3 px-3">
                                            <a href="#" class="fw-semibold text-dark text-decoration-none wishlist-title d-inline-block">
                                                <%# Eval("product_full_name") %>
                                        </a>
                                        </td>

                                        <!-- Price -->
                                        <td class="py-3 px-3">
                                            <span class="fw-bold text-dark fs-6">₹<%# Eval("product_final_sell_price") %></span>
                                        </td>

                                        <!-- Stock Status -->
                                        <td class="py-3 px-3">
                                            <span class="badge bg-success-subtle text-success fw-semibold px-2 py-1 rounded-pill small">
                                                <i class="fas fa-check me-1 fs-xs"></i>In Stock
                                        </span>
                                        </td>

                                        <!-- Add to Cart Action -->
                                        <td class="py-3 px-3 text-center">
                                            <asp:LinkButton runat="server" ID="btnAddToCart" CommandArgument='<%# Eval("product_id") %>' CommandName="btnAddToCart" class="btn btn-success btn-sm fw-semibold rounded-2 px-3 py-2 w-100 d-inline-flex align-items-center justify-content-center gap-1 shadow-sm action-btn">
                                                <i class="fas fa-shopping-cart small"></i>
                                                <span>Add to Cart</span>
                                            </asp:LinkButton>
                                        </td>

                                        <!-- PRESERVED LinkButton Delete Control -->
                                        <td class="py-3 px-4 text-center">
                                            <asp:LinkButton ID="btnDelete" runat="server"
                                                CssClass="btn btn-outline-danger btn-sm rounded-circle p-0 d-inline-flex align-items-center justify-content-center remove-btn"
                                                CommandArgument='<%# Eval("id") %>'
                                                OnCommand="btnDelete_Command"
                                                OnClientClick="return confirm('Are you sure you want to remove this item?');"
                                                title="Remove from Wishlist"
                                                data-bs-toggle="tooltip"> 
                                            <i class="fas fa-trash-alt"></i>
                                        </asp:LinkButton>
                                        </td>

                                        <asp:Label ID="lbldeletecategoryid" runat="server"
                                            Text='<%# Eval("product_id") %>' Visible="false" />

                                        <asp:Label ID="product_price_id" runat="server"
                                            Text='<%# Eval("product_price_id") %>' Visible="false" />

                                        <asp:Label ID="lblname" runat="server"
                                            Text='<%# Eval("product_full_name") %>' Visible="false" />

                                        <asp:Label ID="lbl_sell_price" runat="server"
                                            Text='<%# Eval("product_final_sell_price") %>' Visible="false" />

                                        <asp:Label ID="lbl_unit" runat="server"
                                            Text='<%# Eval("product_unit") %>' Visible="false" />

                                        <asp:Label ID="lbl_unit_value" runat="server"
                                            Text='<%# Eval("product_unit_value") %>' Visible="false" />
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- 3. ACTION BAR / CONTINUE SHOPPING -->
        <div class="d-flex justify-content-between align-items-center mt-4"
            data-aos="fade-up"
            data-aos-duration="800"
            data-aos-once="true">
            <a href="shop.aspx" class="btn btn-outline-secondary rounded-pill px-4 py-2 fw-semibold small d-inline-flex align-items-center gap-2">
                <i class="fas fa-arrow-left"></i>
                <span>Continue Shopping</span>
            </a>
        </div>
    </div>




</asp:Content>

