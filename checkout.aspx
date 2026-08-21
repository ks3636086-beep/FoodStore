<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Minimal Custom Enhancements Extending Bootstrap 5 */
        .step-indicator {
            font-size: 0.85rem;
            font-weight: 600;
        }

        .step-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: #6c757d;
        }

            .step-item.active {
                color: #198754; /* Theme Primary / Success Color */
            }

        .step-number {
            width: 24px;
            height: 24px;
            border-radius: 50%;
            background-color: #e9ecef;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 0.75rem;
        }

        .step-item.active .step-number {
            background-color: #198754;
            color: #ffffff;
        }

        .checkout-card {
            border: 1px solid #e3e8ee;
            border-radius: 0.5rem;
            background-color: #ffffff;
        }

        .product-img-box {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 0.375rem;
        }

        .btn-checkout {
            height: 46px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 1rem;
        }

        @media (max-width: 767.98px) {
            .step-indicator {
                font-size: 0.75rem;
            }

            .step-number {
                width: 20px;
                height: 20px;
                font-size: 0.7rem;
            }

            .product-img-box {
                width: 55px;
                height: 55px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- 1. CHECKOUT HEADER & BREADCRUMB -->
    <div class="bg-light border-bottom py-3 mb-4"
        data-aos="fade-down"
        data-aos-duration="800"
        data-aos-once="true">
        <div class="container-xl px-3 px-md-4">
            <div class="d-flex flex-column flex-md-row align-items-md-center justify-content-between gap-2">
                <h1 class="h4 fw-bold text-dark mb-0">Checkout</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 small">
                        <li class="breadcrumb-item"><a href="shop.aspx" class="text-decoration-none text-success">Shop</a></li>
                        <li class="breadcrumb-item"><a href="cart.aspx" class="text-decoration-none text-success">Cart</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>

    <!-- MAIN CONTAINER -->
    <div class="container-xl px-3 px-md-4 pb-5">

        <!-- 2. CHECKOUT STEP INDICATOR -->
        <div class="checkout-card p-3 mb-4 shadow-sm"
            data-aos="fade-up"
            data-aos-duration="800"
            data-aos-once="true">
            <div class="d-flex align-items-center justify-content-center gap-2 gap-md-4 step-indicator">
                <div class="step-item text-muted">
                    <span class="step-number">01</span>
                    <span>Cart</span>
                </div>
                <i class="fas fa-chevron-right text-muted small"></i>
                <div class="step-item active">
                    <span class="step-number">02</span>
                    <span>Checkout</span>
                </div>
                <i class="fas fa-chevron-right text-muted small"></i>
                <div class="step-item text-muted">
                    <span class="step-number">03</span>
                    <span>Confirmation</span>
                </div>
            </div>
        </div>

        <!-- 3. MAIN CHECKOUT LAYOUT -->
        <div class="row g-4">

            <!-- LEFT COLUMN: Customer Details + Delivery + Payment (~65% Desktop) -->
            <div class="col-lg-8">

                <div class="needs-validation">

                    <!-- 4. CONTACT INFORMATION CARD -->
                    <div class="checkout-card shadow-sm p-3 p-md-4 mb-4"
                        data-aos="fade-up"
                        data-aos-duration="800"
                        data-aos-once="true">
                        <div class="border-bottom pb-2 mb-3">
                            <h2 class="h6 fw-bold text-dark mb-0 d-flex align-items-center gap-2">
                                <i class="fas fa-user-circle text-success"></i>Contact Information
                            </h2>
                        </div>

                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="firstName" class="form-label small fw-semibold text-secondary">First Name <span class="text-danger">*</span></label>
                                <!-- Preserved ID="firstname" -->
                                <asp:TextBox runat="server" ID="firstname" CssClass="form-control form-control-sm py-2" placeholder="First Name" required="required"></asp:TextBox>
                                <div class="invalid-feedback">Valid first name is required.</div>
                            </div>
                            <div class="col-md-6">
                                <label for="lastName" class="form-label small fw-semibold text-secondary">Last Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control form-control-sm py-2" id="lastName" placeholder="Last Name" required="required" />
                                <div class="invalid-feedback">Valid last name is required.</div>
                            </div>
                            <div class="col-md-6">
                                <label for="email" class="form-label small fw-semibold text-secondary">Email Address <span class="text-danger">*</span></label>
                                <!-- Preserved ID="email" -->
                                <asp:TextBox runat="server" type="email" ID="email" CssClass="form-control form-control-sm py-2" placeholder="name@example.com" required="required"></asp:TextBox>
                                <div class="invalid-feedback">Please enter a valid email address.</div>
                            </div>
                            <div class="col-md-6">
                                <label for="mob" class="form-label small fw-semibold text-secondary">Mobile Number <span class="text-danger">*</span></label>
                                <!-- Preserved ID="mob" -->
                                <asp:TextBox runat="server" type="tel" ID="mob" CssClass="form-control form-control-sm py-2" placeholder="10-digit mobile number"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <!-- 5. DELIVERY ADDRESS CARD -->
                    <div class="checkout-card shadow-sm p-3 p-md-4 mb-4"
                        data-aos="fade-right"
                        data-aos-duration="800"
                        data-aos-once="true">
                        <div class="border-bottom pb-2 mb-3">
                            <h2 class="h6 fw-bold text-dark mb-0 d-flex align-items-center gap-2">
                                <i class="fas fa-map-marker-alt text-success"></i>Delivery Address
                            </h2>
                        </div>

                        <div class="row g-3">
                            <div class="col-12">
                                <label for="add1" class="form-label small fw-semibold text-secondary">Address Line 1 <span class="text-danger">*</span></label>
                                <!-- Preserved ID="add1" -->
                                <asp:TextBox runat="server" ID="add1" CssClass="form-control form-control-sm py-2" placeholder="House/Flat No., Street, Area" required="required"></asp:TextBox>
                                <div class="invalid-feedback">Please enter your shipping address.</div>
                            </div>

                            <div class="col-12">
                                <label for="add2" class="form-label small fw-semibold text-secondary">Address Line 2 <span class="text-danger">*</span></label>
                                <!-- Preserved ID="add2" -->
                                <asp:TextBox runat="server" ID="add2" CssClass="form-control form-control-sm py-2" placeholder="Landmark, Apartment, Suite, etc." required="required"></asp:TextBox>
                            </div>

                            <div class="col-md-5">
                                <label for="city" class="form-label small fw-semibold text-secondary">City <span class="text-danger">*</span></label>
                                <!-- Preserved ID="city" -->
                                <asp:TextBox runat="server" ID="city" CssClass="form-control form-control-sm py-2" placeholder="City"></asp:TextBox>
                            </div>

                            <div class="col-md-7">
                                <div class="row g-2">
                                    <div class="col-md-5">
                                        <label for="dblcountry" class="form-label small fw-semibold text-secondary">Country <span class="text-danger">*</span></label>
                                        <!-- Preserved ID="dblcountry" -->
                                        <asp:DropDownList runat="server" CssClass="form-select form-select-sm py-2" ID="dblcountry">
                                            <asp:ListItem Value="">Choose...</asp:ListItem>
                                            <asp:ListItem Value="India">India</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="state" class="form-label small fw-semibold text-secondary">State <span class="text-danger">*</span></label>
                                        <!-- Preserved ID="state" -->
                                        <asp:DropDownList ID="state" runat="server" CssClass="form-select form-select-sm py-2">
                                            <asp:ListItem Text="Choose..." Value="" />
                                            <asp:ListItem Text="Uttar Pradesh" Value="UttarPradesh" />
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="pincode" class="form-label small fw-semibold text-secondary">PIN Code <span class="text-danger">*</span></label>
                                        <!-- Preserved ID="pincode" -->
                                        <asp:TextBox ID="pincode" runat="server" CssClass="form-control form-control-sm py-2" placeholder="6 Digits"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 6. DELIVERY INFORMATION STRIP -->
                        <div class="bg-light border border-info-subtle rounded-3 p-2 mt-3 d-flex align-items-center gap-2">
                            <span class="fs-6">🚚</span>
                            <span class="small text-secondary">Please verify your delivery address and mobile number carefully before placing the order.</span>
                        </div>
                    </div>

                    <!-- 7. PAYMENT METHOD CARD -->
                    <div class="checkout-card shadow-sm p-3 p-md-4 mb-4"
                        data-aos="fade-up"
                        data-aos-duration="800"
                        data-aos-once="true">
                        <div class="border-bottom pb-2 mb-3">
                            <h2 class="h6 fw-bold text-dark mb-0 d-flex align-items-center gap-2">
                                <i class="fas fa-credit-card text-success"></i>Payment Method
                            </h2>
                        </div>

                        <div class="mb-3">
                            <label for="dblmode" class="form-label small fw-semibold text-secondary">Select Payment Option <span class="text-danger">*</span></label>
                            <!-- Preserved ID="dblmode" -->
                            <asp:DropDownList ID="dblmode" runat="server" CssClass="form-select form-select-sm py-2">
                                <asp:ListItem Text="Select Payment Method" Value="" />
                                <asp:ListItem Text="Online" Value="Credit card" />
                                <asp:ListItem Text="UPI" Value="Debit card" />
                                <asp:ListItem Text="Cash" Value="Paypal" />
                            </asp:DropDownList>
                        </div>

                        <div class="d-flex align-items-center gap-2 text-muted small">
                            <i class="fas fa-lock text-success"></i>
                            <span>Your payment details are handled through encrypted and secure gateways.</span>
                        </div>
                    </div>

                </div>

            </div>

            <!-- RIGHT COLUMN: Order Summary & Place Order (~35% Desktop) -->
            <div class="col-lg-4">
                <div class="sticky-lg-top" style="top: 90px; z-index: 10;">
                    <!-- 8. ORDER SUMMARY CARD -->
                    <div class="checkout-card shadow-sm mb-3"
                        data-aos="fade-left"
                        data-aos-duration="800"
                        data-aos-once="true">
                        <div class="bg-light p-3 border-bottom rounded-top">
                            <h2 class="h6 fw-bold text-dark mb-0 d-flex align-items-center justify-content-between">
                                <span><i class="fas fa-shopping-bag text-success me-2"></i>Your Order</span>
                            </h2>
                        </div>

                        <div class="p-3">
                            <div class="mb-3" style="max-height: 280px; overflow-y: auto;">
                                <!-- Preserved Repeater ID="rptProductList" & OnItemCommand -->
                                <asp:Repeater runat="server" OnItemCommand="rptProductList_ItemCommand" ID="rptProductList">
                                    <ItemTemplate>
                                        <div class="d-flex gap-3 pb-2 mb-2 border-bottom align-items-center">
                                            <img src='auth/<%# Eval("photo_path") %>' alt='<%# Eval("product_name") %>' class="product-img-box border bg-light flex-shrink-0" />

                                            <div class="flex-grow-1 min-w-0">
                                                <h6 class="small fw-semibold text-dark text-truncate mb-1" title='<%# Eval("product_name") %>'>
                                                    <%# Eval("product_name") %>
                                                </h6>
                                                <div class="d-flex justify-content-between align-items-center small text-muted">
                                                    <span>₹<%# Eval("product_sell_price") %> × <%# Eval("cart_qty") %></span>
                                                    <span class="fw-bold text-dark">₹<%# Eval("total_amount_of_product") %></span>
                                                </div>

                                                <!-- Hidden ASP Labels Preserved -->
                                                <asp:Label ID="qty" hidden runat="server" Text='<%# Eval("cart_qty") %>'></asp:Label>
                                                <asp:Label ID="lblprc" hidden runat="server" Text='<%# Eval("product_sell_price") %>'></asp:Label>
                                                <asp:Label ID="lblproduct_id" hidden runat="server" Text='<%# Eval("product_id") %>'></asp:Label>
                                                <asp:Label ID="lblproductprice_id" hidden runat="server" Text='<%# Eval("product_price_id") %>'></asp:Label>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>

                            <!-- 9. PRICE DETAILS -->
                            <div class="border-top pt-2 mb-3">
                                <div class="d-flex justify-content-between align-items-center mb-2 small text-secondary">
                                    <span>Shipping Cost</span>
                                    <span class="fw-semibold text-success">Free</span>
                                </div>
                                <hr class="my-2 opacity-25" />
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="fw-bold text-dark">Grand Total</span>
                                    <div class="text-end">
                                        <!-- Preserved ID="lblgrandtotal" -->
                                        <asp:Label runat="server" ID="lblgrandtotal" CssClass="h5 fw-bold text-success mb-0 d-block"></asp:Label>
                                    </div>
                                </div>
                            </div>

                            <!-- 10. PLACE ORDER BUTTON -->
                            <div>
                                <!-- Preserved ID="btnorder" & OnClick="btnorder_Click" -->
                                <asp:LinkButton ID="btnorder" runat="server" OnClick="btnorder_Click" CssClass="btn btn-success w-100 rounded-pill fw-bold shadow-sm btn-checkout">
                                    <i class="fas fa-lock me-2"></i>Place Order
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>

                    <!-- 11. TRUST & SECURITY STRIP -->
                    <div class="checkout-card p-3 mb-3 text-center bg-light"
                        data-aos="fade-up"
                        data-aos-duration="800"
                        data-aos-once="true">
                        <div class="row g-2 text-muted small fw-semibold">
                            <div class="col-6 col-md-6"><i class="fas fa-shield-alt text-success me-1"></i>Secure Checkout</div>
                            <div class="col-6 col-md-6"><i class="fas fa-credit-card text-success me-1"></i>Safe Payment</div>
                            <div class="col-6 col-md-6"><i class="fas fa-truck text-success me-1"></i>Reliable Delivery</div>
                            <div class="col-6 col-md-6"><i class="fas fa-headset text-success me-1"></i>Easy Support</div>
                        </div>
                    </div>

                    <!-- 12. HELP & SUPPORT -->
                    <div class="checkout-card p-3 text-center"
                        data-aos="fade-up"
                        data-aos-duration="800"
                        data-aos-delay="200"
                        data-aos-once="true">
                        <h6 class="small fw-bold text-dark mb-1">Need Help With Your Order?</h6>
                        <p class="small text-muted mb-2" style="font-size: 0.8rem;">Our customer support team is here to assist you.</p>
                        <div class="d-flex justify-content-center gap-3 small fw-semibold">
                            <a href="tel:1800123456" class="text-decoration-none text-success"><i class="fas fa-phone-alt me-1"></i>Call Support</a>
                            <span class="text-muted">|</span>
                            <a href="contact.aspx" class="text-decoration-none text-success"><i class="fas fa-envelope me-1"></i>Contact Us</a>
                        </div>
                    </div>

                </div>
            </div>

        </div>

    </div>


</asp:Content>

