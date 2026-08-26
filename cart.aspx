<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Minimal Custom Styling Overriding/Extending Bootstrap 5 */
        .cart-img-box {
            width: 80px;
            height: 80px;
            object-fit: contain;
        }

        .qty-btn {
            width: 32px;
            height: 32px;
            padding: 0;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-decoration: none !important;
        }

        .btn-remove-item {
            width: 32px;
            height: 32px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-decoration: none !important;
            transition: all 0.2s ease;
        }

            .btn-remove-item:hover {
                background-color: #dc3545 !important;
                color: #ffffff !important;
            }

        /* Mobile Table Responsiveness without Horizontal Scroll */
        @media (max-width: 767.98px) {
            .cart-table th.d-mobile-none {
                display: none;
            }

            .cart-img-box {
                width: 65px;
                height: 65px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Main Bootstrap Container -->
    <div class="container-xl py-4 px-3 px-md-4">

        <!-- 1. Page Header & Breadcrumb -->
        <div class="border-bottom pb-3 mb-4"
            data-aos="fade-down"
            data-aos-duration="800"
            data-aos-once="true">
            <h1 class="h3 fw-bold text-dark mb-1">Shopping Cart</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 small">
                    <li class="breadcrumb-item"><a href="shop.aspx" class="text-decoration-none text-success">Shop</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Cart</li>
                </ol>
            </nav>
        </div>

        <div class="row g-4">
            <!-- Left Main Column (Cart Items, Related Products, Accordions) -->
            <div class="col-lg-8">

                <!-- 2. CART PRODUCT LIST / TABLE (Exact Repeater Structure Kept) -->
                <div class="card border rounded-3 shadow-sm mb-4"
                    data-aos="fade-up"
                    data-aos-duration="800"
                    data-aos-once="true">
                    <div class="card-header bg-white py-3 border-bottom">
                        <h2 class="h6 fw-bold text-dark mb-0"><i class="fas fa-shopping-cart me-2 text-success"></i>Your Cart Products</h2>
                    </div>
                    <div class="table-responsive">
                        <table class="table align-middle mb-0 cart-table">
                            <thead class="bg-light text-muted small text-uppercase">
                                <tr>
                                    <th style="min-width: 180px;">Product</th>
                                    <th class="d-mobile-none">Price</th>
                                    <th class="text-center">Quantity</th>
                                    <th class="text-end">Total</th>
                                    <th class="text-end" style="width: 48px;"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Preserved Repeater ID="rptCart" & OnItemCommand="rptCart_ItemCommand" -->
                                <asp:Repeater ID="rptCart" runat="server" OnItemCommand="rptCart_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <!-- Product Image & Name -->
                                            <td>
                                                <div class="d-flex align-items-center gap-3">
                                                    <a href='<%# "product_details.aspx?ref=" + Eval("product_id") %>'>
                                                        <img src='auth/<%# Eval("photo_path") %>'
                                                            alt='<%# Eval("product_name") %>'
                                                            class="cart-img-box border rounded bg-light p-1 flex-shrink-0" />
                                                    </a>
                                                    <div>
                                                        <h6 class="fw-semibold text-dark mb-1 fs-6">
                                                            <!-- Preserved lblname -->
                                                            <asp:Label runat="server" ID="lblname" Text='<%# Eval("product_name") %>'></asp:Label>
                                                        </h6>
                                                        <div class="d-md-none text-muted small">
                                                            Price:
                                                            <!-- Preserved lblprice (Mobile fallback) -->
                                                            <asp:Label runat="server" ID="lblprice" Text='<%# Eval("product_sell_price") %>'></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>

                                            <!-- Desktop Price -->
                                            <td class="d-mobile-none fw-medium text-secondary">
                                                <%# Eval("product_sell_price") %>
                                            </td>

                                            <!-- Quantity Control -->
                                            <td class="text-center">
                                                <div class="border rounded-pill d-inline-flex align-items-center p-1 bg-light shadow-sm">
                                                    <!-- Preserved btnminus -->
                                                    <asp:LinkButton runat="server" ID="btnminus" CommandName="btnminus" CssClass="btn btn-sm btn-light rounded-circle qty-btn"><i class="fas fa-minus text-secondary small"></i></asp:LinkButton>

                                                    <!-- Preserved qty labels -->
                                                    <asp:Label runat="server" ID="qty" Text='<%# Eval("cart_qty") %>' CssClass="fw-bold px-2 text-dark small"></asp:Label>
                                                    <asp:Label runat="server" hidden="hidden" ID="qty1" Text='<%# Eval("cart_qty") %>'></asp:Label>

                                                    <!-- Preserved btnplus -->
                                                    <asp:LinkButton runat="server" ID="btnplus" CommandName="btnplus" CssClass="btn btn-sm btn-light rounded-circle qty-btn"><i class="fas fa-plus text-secondary small"></i></asp:LinkButton>
                                                </div>
                                            </td>

                                            <!-- Total Price -->
                                            <td class="text-end fw-bold text-success">
                                                <!-- Preserved lbltotal -->
                                                <asp:Label ID="lbltotal" runat="server" Text='<%# Eval("total_amount_of_product") %>'></asp:Label>
                                                <!-- Preserved Hidden labels -->
                                                <asp:Label ID="lblprc" hidden="hidden" runat="server" Text='<%# Eval("product_sell_price") %>'></asp:Label>
                                                <asp:Label ID="lblproduct_id" hidden="hidden" runat="server" Text='<%# Eval("product_id") %>'></asp:Label>
                                            </td>

                                            <!-- Remove (X / Delete Icon) -->
                                            <td class="text-end">
                                                <!-- Preserved btndel -->
                                                <asp:LinkButton runat="server" ID="btndel" CommandName="btndel" CssClass="btn btn-sm btn-light text-danger rounded-circle btn-remove-item" title="Remove Product">
                                                    <i class="fas fa-times"></i>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- 3. Continue Shopping Link -->
                <div class="mb-4"
                    data-aos="fade-left"
                    data-aos-duration="700"
                    data-aos-once="true">
                    <a href="shop.aspx" class="btn btn-outline-secondary rounded-pill px-4 btn-sm fw-semibold">
                        <i class="fas fa-arrow-left me-2"></i>Continue Shopping
                    </a>
                </div>

                <!-- 4. You May Also Like Section (Compact Grid) -->
                <div class="mb-4"
                    data-aos="fade-up"
                    data-aos-duration="800"
                    data-aos-once="true">
                    <h3 class="h6 fw-bold text-dark mb-3"><i class="fas fa-thumbs-up me-2 text-success"></i>You May Also Like</h3>
                    <div class="row g-2 g-md-3">
                        <div class="col-6 col-md-3">
                            <div class="card h-100 border rounded-3 p-2 text-center shadow-sm"
                                data-aos="fade-up"
                                data-aos-duration="800"
                                data-aos-once="true">
                                <img src="images/big-img-01.jpg" alt="Related" class="img-fluid rounded mb-2" style="height: 110px; object-fit: contain;" />
                                <h6 class="small fw-semibold text-truncate mb-1" title="Organic Apple">Organic Fresh Apples</h6>
                                <div class="text-success fw-bold small mb-2">₹120</div>
                                <a href="shop.aspx" class="btn btn-outline-success btn-sm rounded-pill w-100 py-1" style="font-size: 0.75rem;">View</a>
                            </div>
                        </div>
                        <div class="col-6 col-md-3">
                            <div class="card h-100 border rounded-3 p-2 text-center shadow-sm"
                                data-aos="fade-up"
                                data-aos-duration="800"
                                data-aos-once="true">
                                <img src="images/big-img-02.jpg" alt="Related" class="img-fluid rounded mb-2" style="height: 110px; object-fit: contain;" />
                                <h6 class="small fw-semibold text-truncate mb-1" title="Cow Milk">Pure Cow Milk Pack</h6>
                                <div class="text-success fw-bold small mb-2">₹65</div>
                                <a href="shop.aspx" class="btn btn-outline-success btn-sm rounded-pill w-100 py-1" style="font-size: 0.75rem;">View</a>
                            </div>
                        </div>
                        <div class="col-6 col-md-3">
                            <div class="card h-100 border rounded-3 p-2 text-center shadow-sm"
                                data-aos="fade-up"
                                data-aos-duration="800"
                                data-aos-once="true">
                                <img src="images/big-img-03.jpg" alt="Related" class="img-fluid rounded mb-2" style="height: 110px; object-fit: contain;" />
                                <h6 class="small fw-semibold text-truncate mb-1" title="Farm Carrots">Fresh Farm Carrots</h6>
                                <div class="text-success fw-bold small mb-2">₹45</div>
                                <a href="shop.aspx" class="btn btn-outline-success btn-sm rounded-pill w-100 py-1" style="font-size: 0.75rem;">View</a>
                            </div>
                        </div>
                        <div class="col-6 col-md-3">
                            <div class="card h-100 border rounded-3 p-2 text-center shadow-sm"
                                data-aos="fade-up"
                                data-aos-duration="800"
                                data-aos-once="true">
                                <img src="images/big-img-01.jpg" alt="Related" class="img-fluid rounded mb-2" style="height: 110px; object-fit: contain;" />
                                <h6 class="small fw-semibold text-truncate mb-1" title="Leaf Veggies">Green Leaf Vegetables</h6>
                                <div class="text-success fw-bold small mb-2">₹30</div>
                                <a href="shop.aspx" class="btn btn-outline-success btn-sm rounded-pill w-100 py-1" style="font-size: 0.75rem;">View</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 5. Collapsible Accordions (Gift, Coupon, Bank Offers) -->
                <div class="accordion mb-4" id="cartAccordions">

                    <!-- Gift Accordion -->
                    <div class="accordion-item border rounded-3 overflow-hidden mb-2"
                        data-aos="fade-up"
                        data-aos-duration="800"
                        data-aos-once="true">
                        <h2 class="accordion-header" id="headingGift">
                            <button class="accordion-button collapsed py-2 px-3 fw-semibold small text-dark" type="button" data-bs-toggle="collapse" data-bs-target="#collapseGift" aria-expanded="false" aria-controls="collapseGift">
                                🎁 Gift / Special Offers
                           
                            </button>
                        </h2>
                        <div id="collapseGift" class="accordion-collapse collapse" aria-labelledby="headingGift" data-bs-parent="#cartAccordions">
                            <div class="accordion-body p-3 bg-light text-muted small">
                                Check applicable gifts and special offers for your order during payment step.
                           
                            </div>
                        </div>
                    </div>

                    <!-- Coupon Accordion -->
                    <div class="accordion-item border rounded-3 overflow-hidden mb-2"
                        data-aos="fade-up"
                        data-aos-duration="800"
                        data-aos-once="true">
                        <h2 class="accordion-header" id="headingCoupon">
                            <button class="accordion-button collapsed py-2 px-3 fw-semibold small text-dark" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCoupon" aria-expanded="false" aria-controls="collapseCoupon">
                                🏷 Apply Coupon Code
                           
                            </button>
                        </h2>
                        <div id="collapseCoupon" class="accordion-collapse collapse" aria-labelledby="headingCoupon" data-bs-parent="#cartAccordions">
                            <div class="accordion-body p-3 bg-light"
                                data-aos="fade-up"
                                data-aos-duration="800"
                                data-aos-once="true">
                                <label class="form-label small fw-bold text-secondary mb-1">Have a promo code?</label>
                                <div class="input-group input-group-sm" style="max-width: 360px;">
                                    <input type="text" class="form-control" placeholder="Enter coupon code" />
                                    <button class="btn btn-dark fw-semibold px-3" type="button">Apply</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Bank Offers Accordion -->
                    <div class="accordion-item border rounded-3 overflow-hidden"
                        data-aos="fade-right"
                        data-aos-duration="800"
                        data-aos-once="true">
                        <h2 class="accordion-header" id="headingBank">
                            <button class="accordion-button collapsed py-2 px-3 fw-semibold small text-dark"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapseBank"
                                aria-expanded="false"
                                aria-controls="collapseBank">
                                🏦 Bank & Payment Offers
                            </button>
                        </h2>

                        <div id="collapseBank" class="accordion-collapse collapse"
                            aria-labelledby="headingBank"
                            data-bs-parent="#cartAccordions">
                            <div class="accordion-body p-3 bg-light text-muted small">
                                • Bank discounts and payment offers are automatically calculated at checkout.
                            </div>
                        </div>
                    </div>

                </div>

            </div>

            <!-- Right Column (Price Details / Summary) -->
            <div class="col-lg-4">
                <div class="card border rounded-3 shadow-sm sticky-lg-top"
                    style="top: 90px; z-index: 10;"
                    data-aos="fade-left"
                    data-aos-duration="900"
                    data-aos-once="true">
                    <div class="card-header bg-white py-3 border-bottom">
                        <h2 class="h6 fw-bold text-dark mb-0"><i class="fas fa-receipt me-2 text-success"></i>Price Details</h2>
                    </div>
                    <div class="card-body p-3">
                        <div class="d-flex justify-content-between align-items-center mb-2 small text-secondary">
                            <span>Subtotal</span>
                            <span class="fw-bold text-dark">
                                <!-- Preserved SubTotal -->
                                <asp:Label runat="server" ID="SubTotal"></asp:Label>
                            </span>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mb-2 small text-secondary">
                            <span>Shipping</span>
                            <span class="fw-bold text-dark">
                                <!-- Preserved lblshipping -->
                                <asp:Label runat="server" ID="lblshipping"></asp:Label>
                            </span>
                        </div>
                        <hr class="my-3 text-muted opacity-25" />
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <span class="fw-bold text-dark">Grand Total</span>
                            <span class="fw-bold text-success fs-5">
                                <!-- Preserved GrandTotal -->
                                <asp:Label runat="server" ID="GrandTotal"></asp:Label>
                            </span>
                        </div>

                        <!-- Preserved checkoutbtn & OnClick -->
                        <asp:Button ID="checkoutbtn" runat="server" Text="Proceed To Checkout" CssClass="btn btn-success w-100 rounded-pill fw-bold shadow-sm py-2 fs-6" OnClick="checkoutbtn_Click" />
                    </div>
                </div>

                <!-- Trust Strip -->
                <div class="card border-0 bg-light rounded-3 mt-3 p-3 text-center">
                    <div class="row g-2 text-muted small fw-semibold">
                        <div class="col-6"><i class="fas fa-lock text-success me-1"></i>Secure Checkout</div>
                        <div class="col-6"><i class="fas fa-shield-alt text-success me-1"></i>Safe Payment</div>
                        <div class="col-6"><i class="fas fa-truck text-success me-1"></i>Fast Delivery</div>
                        <div class="col-6"><i class="fas fa-undo text-success me-1"></i>Easy Returns</div>
                    </div>
                </div>
            </div>

        </div>
    </div>



</asp:Content>

