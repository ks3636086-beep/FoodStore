<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Start Top Search -->
    <div class="top-search">
        <div class="container">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input type="text" class="form-control" placeholder="Search">
                <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
            </div>
        </div>
    </div>
    <!-- End Top Search -->


    <section class="py-0 w-100 overflow-hidden">
        <!-- container-fluid px-0 se image/banner pure desktop screen ki width me fail jayega -->
        <div class="container-fluid px-0">

            <!-- TOP HERO BANNER (Modern Blended Design) -->
            <div class="card border-0 rounded-4 overflow-hidden shadow-sm my-3 mx-lg-4 position-relative"
                data-aos="fade-right"
                data-aos-duration="1000"
                data-aos-delay="100"
                style="min-height: 340px; background: url('https://images.unsplash.com/photo-1610832958506-aa56368176cf?auto=format&fit=crop&w=1400&q=80') center right / cover no-repeat;">
                <!-- Dark Green Overlay Gradient (Text Readability & Smooth Image Blend) -->
                <div class="position-absolute top-0 start-0 w-100 h-100"
                    style="background: linear-gradient(90deg, #133e1b 0%, rgba(19, 62, 27, 0.95) 45%, rgba(19, 62, 27, 0.2) 100%);">
                </div>

                <!-- Content Area -->
                <div class="row align-items-center h-100 g-0 position-relative z-1 py-4 py-md-5">
                    <div class="col-lg-7 col-md-9 p-4 p-md-5 ms-md-3">

                        <!-- Badge -->
                        <span class="badge bg-warning text-dark fw-bold mb-3 px-3 py-2 rounded-pill shadow-sm" style="letter-spacing: 0.5px;">
                            <i class="fas fa-leaf me-1"></i>FARM FRESH
                        </span>

                        <!-- White Bold Title (Fixes Dark Text Issue) -->
                        <h1 class="fw-extrabold display-5 text-white mb-3" style="font-weight: 800; text-shadow: 0 2px 4px rgba(0,0,0,0.2);">Stock up on Fresh Produce
                        </h1>

                        <!-- Subtitle -->
                        <p class="fs-6 text-white mb-4 opacity-90" style="max-width: 520px; line-height: 1.6;">
                            Get farm-fresh organic fruits, green vegetables & daily essential items delivered directly to your doorstep in 30 mins!
                        </p>

                        <!-- Action Button -->
                        <a href="shop.aspx?cat=fruits-veggies" class="btn btn-light btn-lg fw-bold text-success rounded-pill px-4 py-2 shadow border-0" style="transition: all 0.3s ease;">Shop Fresh Now <i class="fas fa-arrow-right ms-2"></i>
                        </a>

                    </div>
                </div>
            </div>



            <!-- 2. BOTTOM 3 PROMO CARDS -->
            <div class="px-3 px-lg-4 py-3 bg-light"
                data-aos="fade-up"
                data-aos-duration="1000">
                <div class="row flex-nowrap flex-md-wrap promo-scroll-row gx-3">

                    <!-- Card 1: Fresh Vegetables & Fruits -->
                    <div class="col-md-4 promo-card-col">
                        <div class="card promo-card border-0 rounded-4 overflow-hidden shadow-sm h-100 p-3 position-relative"
                            style="background: linear-gradient(135deg, #eef9f1 0%, #d8f3dc 100%); transition: all 0.3s ease;">

                            <span class="badge bg-success text-white position-absolute top-0 start-0 m-3 px-2 py-1 rounded-pill small fw-bold">UP TO 30% OFF</span>

                            <div class="row align-items-center g-0 h-100 pt-3">
                                <div class="col-7 pe-2">
                                    <h5 class="fw-bold text-dark mb-1 fs-5">Organic Veggies</h5>
                                    <p class="small text-secondary mb-3" style="font-size: 0.825rem; line-height: 1.3;">
                                        Fresh greens & seasonal fruits at best rates.
                                    </p>
                                    <a href="shop.aspx?cat=vegetables" class="btn btn-success btn-sm rounded-pill px-3 py-1 fw-bold shadow-sm">Explore <i class="fas fa-arrow-right ms-1 small"></i></a>
                                </div>
                                <div class="col-5 text-end position-relative">
                                    <img src="https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=300&q=80"
                                        alt="Vegetables" class="img-fluid rounded-4 shadow-sm"
                                        style="height: 110px; width: 100%; object-fit: cover;">
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card 2: Crispy Snacks -->
                    <div class="col-md-4 promo-card-col">
                        <div class="card promo-card border-0 rounded-4 overflow-hidden shadow-sm h-100 p-3 position-relative"
                            style="background: linear-gradient(135deg, #fff8e6 0%, #fef0c7 100%); transition: all 0.3s ease;">

                            <span class="badge bg-warning text-dark position-absolute top-0 start-0 m-3 px-2 py-1 rounded-pill small fw-bold">MIN. 20% OFF</span>

                            <div class="row align-items-center g-0 h-100 pt-3">
                                <div class="col-7 pe-2">
                                    <h5 class="fw-bold text-dark mb-1 fs-5">Tasty Snacks</h5>
                                    <p class="small text-secondary mb-3" style="font-size: 0.825rem; line-height: 1.3;">
                                        Chips, namkeen, nuts & evening munchies.
                                    </p>
                                    <a href="shop.aspx?cat=snacks" class="btn btn-warning btn-sm text-dark rounded-pill px-3 py-1 fw-bold shadow-sm">Order Now <i class="fas fa-arrow-right ms-1 small"></i></a>
                                </div>
                                <div class="col-5 text-end">
                                    <img src="https://images.unsplash.com/photo-1621939514649-280e2ee25f60?auto=format&fit=crop&w=300&q=80"
                                        alt="Snacks" class="img-fluid rounded-4 shadow-sm"
                                        style="height: 110px; width: 100%; object-fit: cover;">
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card 3: Cookies & Bakery -->
                    <div class="col-md-4 promo-card-col">
                        <div class="card promo-card border-0 rounded-4 overflow-hidden shadow-sm h-100 p-3 position-relative"
                            style="background: linear-gradient(135deg, #fdf2f4 0%, #fce7f3 100%); transition: all 0.3s ease;">

                            <span class="badge bg-danger text-white position-absolute top-0 start-0 m-3 px-2 py-1 rounded-pill small fw-bold">FLAT 15% OFF</span>

                            <div class="row align-items-center g-0 h-100 pt-3">
                                <div class="col-7 pe-2">
                                    <h5 class="fw-bold text-dark mb-1 fs-5">Cookies & Bakery</h5>
                                    <p class="small text-secondary mb-3" style="font-size: 0.825rem; line-height: 1.3;">
                                        Freshly baked cookies, biscuits & treats.
                                    </p>
                                    <a href="shop.aspx?cat=cookies" class="btn btn-danger btn-sm rounded-pill px-3 py-1 fw-bold shadow-sm">Shop Bakery <i class="fas fa-arrow-right ms-1 small"></i></a>
                                </div>
                                <div class="col-5 text-end">
                                    <img src="https://images.unsplash.com/photo-1558961363-fa8fdf82db35?auto=format&fit=crop&w=300&q=80"
                                        alt="Cookies" class="img-fluid rounded-4 shadow-sm"
                                        style="height: 110px; width: 100%; object-fit: cover;">
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </section>



    <!-- FULL BACKGROUND IMAGE BANNER (RESPONSIVE & MOBILE-OPTIMIZED) -->
    <asp:Panel ID="pnlExclusiveCoupon" runat="server" Visible="true">

        <style>
            .exclusive-coupon-banner {
                min-height: 340px;
                position: relative;
                overflow: hidden;
                border-radius: 24px;
                background: linear-gradient(90deg, rgba(255,255,255,0.98) 0%, rgba(255,255,255,0.94) 48%, rgba(255,255,255,0.25) 100%), url('https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&w=1400&q=85') center / cover no-repeat;
            }

            .coupon-title {
                color: #111827;
                font-weight: 900;
                line-height: 1.1;
                letter-spacing: -1px;
            }

            .coupon-highlight {
                color: #dc2626;
            }

            .coupon-box {
                max-width: 420px;
                background: #fff;
                border: 2px dashed #f59e0b;
                border-radius: 14px;
                padding: 14px 18px;
                box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            }

            .coupon-code {
                font-size: 1.25rem;
                font-weight: 900;
                letter-spacing: 2px;
            }

            .timer-box {
                display: flex;
                gap: 8px;
            }

            .timer-item {
                min-width: 55px;
                padding: 7px 8px;
                text-align: center;
                background: #111827;
                color: white;
                border-radius: 10px;
            }

            .timer-number {
                display: block;
                font-size: 1rem;
                font-weight: 900;
            }

            .timer-label {
                font-size: 0.55rem;
                text-transform: uppercase;
                opacity: 0.75;
            }

            @media (max-width: 767px) {
                .exclusive-coupon-banner {
                    min-height: auto;
                    background: linear-gradient(rgba(255,255,255,0.94), rgba(255,255,255,0.94)), url('https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&w=900&q=80') center / cover no-repeat;
                }

                .coupon-title {
                    font-size: 1.7rem;
                }

                .coupon-box {
                    max-width: 100%;
                }

                .coupon-code {
                    font-size: 1rem;
                }

                .timer-item {
                    min-width: 48px;
                }
            }
        </style>


        <div class="container-fluid px-2 px-md-4 py-4">

            <div class="exclusive-coupon-banner shadow">

                <div class="row align-items-center h-100 g-0">

                    <!-- CONTENT -->
                    <div class="col-12 col-lg-7 p-4 p-md-5">

                        <span class="badge bg-danger rounded-pill px-3 py-2 mb-3">
                            <i class="fas fa-gift me-1"></i>
                            EXCLUSIVE OFFER FOR YOU
                        </span>

                        <h2 class="coupon-title display-5 mb-2">Your Special
                        <span class="coupon-highlight">
                            <asp:Label ID="lblCouponDiscountPercentage"
                                runat="server">30</asp:Label>% OFF
                        </span>
                            Is Waiting!
                        </h2>

                        <p class="text-secondary fw-semibold mb-4">
                            Enjoy an exclusive discount on your next order.
                        This special offer is available only for your account.
                        </p>


                        <!-- COUPON -->
                        <div class="coupon-box mb-3">

                            <small class="text-muted fw-bold d-block mb-1">YOUR EXCLUSIVE COUPON
                            </small>

                            <div class="d-flex align-items-center justify-content-between gap-2">

                                <span class="coupon-code font-monospace">
                                    <asp:Label ID="lblExclusiveCouponCode"
                                        runat="server">MAGGIE30</asp:Label>
                                </span>

                                <button type="button"
                                    class="btn btn-warning btn-sm fw-bold rounded-pill px-3"
                                    onclick="navigator.clipboard.writeText(document.getElementById('<%= lblExclusiveCouponCode.ClientID %>').innerText);">
                                    <i class="fas fa-copy me-1"></i>
                                    COPY
                                </button>

                            </div>

                        </div>


                        <!-- COUNTDOWN -->
                        <div class="mb-4">

                            <div class="small text-secondary fw-bold mb-2">
                                <i class="fas fa-clock text-danger me-1"></i>
                                OFFER ENDS IN
                            </div>

                            <div class="timer-box">

                                <div class="timer-item">
                                    <asp:Label ID="lblCouponHours"
                                        runat="server"
                                        CssClass="timer-number">02</asp:Label>
                                    <span class="timer-label">Hours</span>
                                </div>

                                <div class="timer-item">
                                    <asp:Label ID="lblCouponMinutes"
                                        runat="server"
                                        CssClass="timer-number">15</asp:Label>
                                    <span class="timer-label">Mins</span>
                                </div>

                                <div class="timer-item">
                                    <asp:Label ID="lblCouponSeconds"
                                        runat="server"
                                        CssClass="timer-number">45</asp:Label>
                                    <span class="timer-label">Secs</span>
                                </div>

                            </div>

                        </div>


                        <!-- BUTTON -->
                        <asp:Button ID="btnUseExclusiveCoupon"
                            runat="server"
                            Text="Claim & Order Now →"
                            CssClass="btn btn-danger fw-bold rounded-pill px-4 py-2 shadow-sm border-0" />

                    </div>

                </div>

            </div>

        </div>


        <!-- EXPIRY DATE -->
        <asp:HiddenField ID="hfCouponExpiryDate"
            runat="server" />

    </asp:Panel>



    <!-- Start Categories -->
    <div class="categories-shop py-5">
        <div class="container">

            <div class="text-center mb-4">
                <h2 class="fw-bold text-dark">Explore Categories</h2>
                <p class="text-muted small mb-0">
                    Pick your daily needs from our wide range of categories
                </p>
            </div>

            <div class="row flex-nowrap flex-lg-wrap justify-content-start justify-content-lg-center category-scroll-container">

                <asp:Repeater ID="rptCategory" runat="server">
                    <itemtemplate>

                        <div class="col-auto col-md-3 col-lg-2 text-center mb-3 category-item"
                            data-aos="zoom-in"
                            data-aos-delay="<%# Container.ItemIndex * 120 %>"
                            data-aos-duration="700">

                            <a href='category-products.aspx?catid=<%# Eval("category_id") %>'
                                class="text-decoration-none">

                                <img src='auth/<%# Eval("category_photo") %>'
                                    alt='<%# Eval("category_title") %>'
                                    class="category-round-img rounded-circle">

                                <div class="mt-2">
                                    <span class="btn btn-outline-success btn-sm rounded-pill fw-semibold px-3 py-1">
                                        <%# Eval("category_title") %>
                                    </span>
                                </div>

                            </a>

                        </div>

                    </itemtemplate>
                </asp:Repeater>

            </div>
        </div>
    </div>
    <style>
        .category-round-img {
            width: 105px;
            height: 105px;
            object-fit: cover;
            display: block;
            margin: 0 auto;
            transition: transform .2s ease;
        }

            .category-round-img:hover {
                transform: scale(1.05);
            }

        /* Mobile specific category and promo styles for horizontal scroll */
        @media (max-width: 767.98px) {
            .promo-scroll-row {
                overflow-x: auto;
                -webkit-overflow-scrolling: touch;
                padding-bottom: 15px;
            }

                .promo-scroll-row::-webkit-scrollbar {
                    display: none;
                }

            .promo-card-col {
                width: 85%; /* Make card take 85% width so next card peaks out */
                flex: 0 0 auto;
            }
        }

        @media (max-width: 991.98px) {
            .category-scroll-container {
                overflow-x: auto;
                -webkit-overflow-scrolling: touch;
                padding-bottom: 10px;
                gap: 15px; /* Add some space between items */
                margin-left: 0;
                margin-right: 0;
            }

                .category-scroll-container::-webkit-scrollbar {
                    display: none; /* Hide scrollbar for a cleaner look */
                }

            .category-item {
                width: 90px;
                padding: 0;
            }

            .category-round-img {
                width: 75px;
                height: 75px;
            }

            .categories-shop .btn {
                font-size: 11px;
                padding: 4px 8px !important;
                white-space: normal;
                line-height: 1.2;
                display: inline-block;
                width: 100%;
            }
        }
    </style>
    <!-- End Categories -->




    <div class="container px-0">
        <div class="row mx-1">
            <div class="col-lg-12">
                <div class="title-all text-center"
                    data-aos="fade-up"
                    data-aos-duration="800">
                    <h1>Fruits & Vegetables</h1>
                    <p>Fresh and healthy products for your daily needs.</p>
                </div>
            </div>
        </div>

        <div class="row mx-1">
            <div class="col-lg-12">
                <div class="special-menu text-center"
                    data-aos="fade-up"
                    data-aos-duration="800"
                    data-aos-delay="200">
                    <div class="button-group filter-button-group">
                        <button class="active" data-filter="*">All</button>
                        <button runat="server" id="Latestbtn" onserverclick="Latestbtn_ServerClick" data-filter=".top-featured">Latest featured</button>
                        <button runat="server" id="Bestsellbtn" onserverclick="Bestsellbtn_ServerClick" data-filter=".best-seller">Best seller</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Start Products  -->

    <%--<div class="container-fluid pt-5 pb-3">
        <div class="row special-list">
            <asp:Repeater ID="rptProducts" OnItemCommand="rptProducts_ItemCommand" runat="server">
                <ItemTemplate>
                    <div class="col-lg-2 col-md-4 col-sm-6 col-6 special-grid best-seller product-item">
                        <div class="products-single fix">
                            <div class="box-img-hover">

                                <img class="img-fluid"
                                    src='auth/<%# Eval("photo_path") %>' />

                                <div class="mask-icon">
                                    <ul>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                        <li>
                                            <asp:LinkButton runat="server" ID="btnwishlist" CommandArgument='<%# Eval("product_id") %>' CommandName="btnwishlist" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></asp:LinkButton>
                                        </li>
                                    </ul>
                                    <asp:LinkButton runat="server" ID="lnkdelete" CommandName="btncart" CssClass="cart" Text="Add to Cart"></asp:LinkButton>
                                </div>
                            </div>
                            <asp:Label ID="lbldeletecategoryid" hidden runat="server" Text='<%# Eval("product_id") %>'></asp:Label>
                            <asp:Label ID="lblname" runat="server" Text='<%# Eval("product_full_name") %>' Visible="false" />

                            <asp:Label ID="lbl_sell_price" runat="server" Text='<%# Eval("product_sell_price") %>' Visible="false" />
                            <asp:Label ID="lbl_market_price" runat="server" Text='<%# Eval("product_market_price") %>' Visible="false" />

                            <asp:Label ID="Label1" hidden runat="server" Text='<%# Eval("product_id") %>'></asp:Label>
                            <asp:Label ID="product_price_id" hidden runat="server" Text='<%# Eval("price_id") %>'></asp:Label>
                            <asp:Label ID="lbl_unit" hidden runat="server" Text='<%# Eval("product_unit") %>'></asp:Label>
                            <asp:Label ID="lbl_unit_value" hidden runat="server" Text='<%# Eval("product_unit_value") %>'></asp:Label>
                            <div class="why-text">
                                <a
                                    href='product_details.aspx?ref=<%# Eval("product_id") %>'>

                                    <h4><%# Eval("product_full_name") %></h4>
                                </a>
                                <h5>Rs. <%# Eval("product_final_sell_price") %></h5>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>--%>


    <!-- PRODUCT GRID SECTION -->
    <div class="container-fluid py-4">

        <!-- 6-COLUMN GRID MATCHING THE IMAGE -->
        <div class="row g-2 g-md-3 mx-1" id="product-container">
            <asp:Repeater ID="rptProducts" OnItemCommand="rptProducts_ItemCommand" runat="server">
                <itemtemplate>
                    <div class="col-6 col-md-4 col-lg-3 col-xl-2 product-item">
                        <div class="card h-100 bg-white rounded-3 shadow-sm border overflow-hidden product-card"
                            data-aos="fade-up"
                            data-aos-duration="700"
                            data-aos-delay="<%# Container.ItemIndex * 150 %>"
                            data-aos-once="true">
                            <!-- PRODUCT IMAGE & TOP-RIGHT ACTION BUTTONS -->
                            <div class="product-img-wrapper position-relative bg-light">


                                <a href='<%# "product_details.aspx?ref=" + Eval("product_id") %>'>
                                    <img src='<%# "auth/" + Eval("photo_path") %>'
                                        alt='<%# Eval("product_full_name") %>'
                                        class="card-img-top product-thumb-img"
                                        onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1542838132-92c53300491e?q=80&w=400&auto=format&fit=crop';" />
                                </a>

                                <!-- TOP-RIGHT CIRCULAR FLOATING ICONS -->
                                <div class="position-absolute top-0 end-0 p-2 d-flex flex-column gap-2" style="z-index: 2;">
                                    <!-- View Details Link -->
                                    <a href='<%# "product_details.aspx?ref=" + Eval("product_id") %>'
                                        class="btn btn-white rounded-circle shadow-sm p-0 flex-center action-circle-btn"
                                        title="View Details">
                                        <i class="fas fa-eye text-dark extra-small"></i>
                                    </a>

                                    <!-- PRESERVED: Wishlist LinkButton -->
                                    <asp:LinkButton runat="server" ID="btnwishlist"
                                        CommandArgument='<%# Eval("product_id") %>'
                                        CommandName="btnwishlist"
                                        CssClass="btn btn-white rounded-circle shadow-sm p-0 flex-center action-circle-btn"
                                        title="Add to Wishlist">
                                        <i class="far fa-heart text-dark extra-small"></i>
                                    </asp:LinkButton>
                                </div>
                            </div>

                            <!-- PRESERVED HIDDEN LABELS FOR BACKEND CODE-BEHIND -->
                            <asp:Label ID="lbldeletecategoryid" hidden runat="server" Text='<%# Eval("product_id") %>'></asp:Label>
                            <asp:Label ID="lblname" runat="server" Text='<%# Eval("product_full_name") %>' Visible="false" />
                            <asp:Label ID="lbl_sell_price" runat="server" Text='<%# Eval("product_sell_price") %>' Visible="false" />
                            <asp:Label ID="lbl_market_price" runat="server" Text='<%# Eval("product_market_price") %>' Visible="false" />
                            <asp:Label ID="Label1" hidden runat="server" Text='<%# Eval("product_id") %>'></asp:Label>
                            <asp:Label ID="product_price_id" hidden runat="server" Text='<%# Eval("price_id") %>'></asp:Label>
                            <asp:Label ID="lbl_unit" hidden runat="server" Text='<%# Eval("product_unit") %>'></asp:Label>
                            <asp:Label ID="lbl_unit_value" hidden runat="server" Text='<%# Eval("product_unit_value") %>'></asp:Label>

                            <asp:Label ID="Label2" hidden runat="server"
                                Text='<%# Eval("price_id") %>'></asp:Label>

                            <!-- PRODUCT DETAILS & ADD TO CART -->
                            <div class="card-body p-2 p-md- d-flex flex-column justify-content-between">
                                <div>
                                    <h6 class="card-title fw-bold text-dark mb-1 product-title" title='<%# Eval("product_full_name") %>'>
                                        <%# Eval("product_full_name") %>
                                    </h6>

                                    <div class="d-flex align-items-center gap-1 mb-1">
                                        <span style="font-size: 12px;">
                                            <%# GetProductRating(Eval("product_id")) %>
                                        </span>
                                    </div>

                                    <div class="mb-1">
                                        <div class="d-flex align-items-baseline flex-wrap gap-1">
                                            <span class="fw-bold text-success fs-6">₹<%# Eval("product_final_sell_price") %></span>
                                            <span class="text-muted text-decoration-line-through small" style="font-size: 0.75rem;">₹<%# Eval("product_market_price") %></span>
                                        </div>
                                        <%# GetDiscount(Eval("product_discount_percentage")) %>
                                    </div>

                                </div>

                                <!-- PRESERVED: Add to Cart LinkButton -->
                                <asp:LinkButton runat="server" ID="lnkdelete" CommandName="btncart"
                                    CssClass="btn btn-outline-success btn-sm w-100 rounded-pill fw-bold py-1 mt-1 d-inline-flex align-items-center justify-content-center gap-1 cart-btn" Style="border-width: 2px;">
                                    <span>ADD</span>
                                </asp:LinkButton>
                            </div>

                        </div>
                    </div>
                </itemtemplate>
            </asp:Repeater>
        </div>

        <!-- LOAD MORE BUTTON SECTION -->
    </div>
    <style>
        /* Image Container - Height ko 180px se bada karke 215px kar diya h */
        .product-img-wrapper {
            height: 215px;
            width: 100%;
            overflow: hidden;
        }

        .product-thumb-img {
            height: 100%;
            width: 100%;
            object-fit: cover; /* Photo stretch hue bina card fit rahegi */
            transition: transform 0.3s ease;
        }

        .product-card:hover .product-thumb-img {
            transform: scale(1.05);
        }

        .product-title {
            font-size: 0.85rem;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            white-space: normal;
            height: 2.5em; /* Ensure title has space even if 1 line */
            line-height: 1.25;
        }

        /* Floating Circle Action Buttons (Eye & Wishlist) */
        .btn-white {
            background-color: #ffffff;
            border: 1px solid #e9ecef;
        }

        .action-circle-btn {
            width: 30px;
            height: 30px;
            transition: all 0.2s ease-in-out;
        }

            .action-circle-btn:hover {
                background-color: #198754 !important;
                border-color: #198754 !important;
            }

                .action-circle-btn:hover i {
                    color: #ffffff !important;
                }


        .flex-center {
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .extra-small {
            font-size: 0.75rem;
        }

        /* Mobile screens ke liye compact height and styles */
        @media (max-width: 575.98px) {
            .product-img-wrapper {
                height: 140px;
            }

            .product-title {
                font-size: 0.8rem;
                height: 2.4em;
            }

            .cart-btn {
                padding: 4px !important;
                font-size: 0.85rem;
            }

            .discount-badge {
                font-size: 10px;
            }
        }

        .discount-badge {
            color: #ff3f6c;
            font-size: 11px;
            font-weight: 700;
        }
    </style>

    <!-- Load More Button -->
    <div class="text-center mt-4 mb-4"
        data-aos="fade-up"
        data-aos-duration="700"
        data-aos-delay="200">
        <button type="button" id="loadMoreBtn" class="btn hvr-hover text-white">
            Load More
        </button>
    </div>

    <!-- End Products  -->



    <!-- UNIQUE & MODERN GROCERY VISUAL FEATURES SECTION -->
    <div class="py-5 position-relative overflow-hidden"
        style="background: #fafbfc;"
        data-aos="fade-left"
        data-aos-duration="1000"
        data-aos-once="true">

        <div class="container position-relative" style="z-index: 2;">

            <!-- SECTION TITLE HEADER -->
            <div class="row justify-content-center mb-4 text-center mx-1">
                <div class="col-lg-6">
                    <span class="badge bg-success-subtle text-success fw-bold px-3 py-1.5 rounded-pill mb-2 border border-success border-opacity-20 extra-small">
                        <i class="fas fa-leaf me-1"></i>WHY CHOOSE FOODSTORE
                    </span>
                    <h4 class="fw-bold text-dark mb-1 fs-4">Freshness & Quality You Can Trust</h4>
                    <p class="text-muted extra-small mb-0">From local organic farms straight to your kitchen table in minutes.</p>
                </div>
            </div>

            <!-- 3-COLUMN UNIQUE IMAGE FEATURE CARDS -->
            <div class="row g-4 mx-2 mx-md-0">

                <!-- Feature 1: Organic Farm Fresh -->
                <div class="col-lg-4 col-md-6">
                    <div class="feature-visual-card card border-0 rounded-4 overflow-hidden shadow-sm h-100 bg-white">

                        <!-- Image Area with Micro Overlay -->
                        <!-- FIXED IMAGE AREA WITH EXPLICIT HEIGHT & FLEX BADGE -->
                        <div class="position-relative overflow-hidden w-100" style="height: 190px; min-height: 190px;">
                            <img src="https://images.unsplash.com/photo-1540420773420-3366772f4999?q=80&w=800&auto=format&fit=crop"
                                alt="Naturally Grown Fresh Produce"
                                class="w-100 h-100 feature-card-img"
                                style="object-fit: cover; object-position: center; display: block;" />

                            <!-- Floating Glass Badge Fix -->
                            <div class="position-absolute top-0 start-0 p-3" style="z-index: 2;">
                                <span class="badge bg-white text-success fw-bold px-3 py-2 rounded-pill shadow-sm extra-small d-inline-flex align-items-center gap-1 border border-white" style="white-space: nowrap;">
                                    <i class="fas fa-certificate text-success"></i>100% ORGANIC
                                </span>
                            </div>
                        </div>

                        <!-- Content Body -->
                        <div class="card-body p-3.5 d-flex flex-column justify-content-between">
                            <div>
                                <div class="d-flex align-items-center gap-2 mb-1">
                                    <span class="feature-icon-circle bg-success-subtle text-success rounded-circle">
                                        <i class="fas fa-seedling"></i>
                                    </span>
                                    <h6 class="fw-bold text-dark mb-0 fs-6">Naturally Grown</h6>
                                </div>
                                <p class="text-muted extra-small mb-0 mt-2 leading-relaxed">
                                    Zero harmful chemicals or pesticides. Direct farm-fresh organic produce sourced daily from trusted local growers.
                                </p>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Feature 2: Quality Inspection -->
                <div class="col-lg-4 col-md-6">
                    <div class="feature-visual-card card border-0 rounded-4 overflow-hidden shadow-sm h-100 bg-white">

                        <!-- Image Area with Micro Overlay -->
                        <div class="position-relative overflow-hidden" style="height: 180px;">
                            <img src="https://images.unsplash.com/photo-1610832958506-aa56368176cf?q=80&w=800&auto=format&fit=crop"
                                alt="Quality Assured Grocery Inspection"
                                class="w-100 h-100 object-fit-cover feature-card-img" />

                            <!-- Floating Glass Badge -->
                            <span class="position-absolute top-0 start-0 m-3 badge bg-white bg-opacity-90 text-warning-emphasis fw-bold px-2.5 py-1.5 rounded-pill shadow-sm backdrop-blur extra-small d-flex align-items-center gap-1 border border-white">
                                <i class="fas fa-shield-check text-warning"></i>3-STEP CHECK
                            </span>
                        </div>

                        <!-- Content Body -->
                        <div class="card-body p-3.5 d-flex flex-column justify-content-between">
                            <div>
                                <div class="d-flex align-items-center gap-2 mb-1">
                                    <span class="feature-icon-circle bg-warning-subtle text-warning-emphasis rounded-circle">
                                        <i class="fas fa-check-double"></i>
                                    </span>
                                    <h6 class="fw-bold text-dark mb-0 fs-6">Quality Assured</h6>
                                </div>
                                <p class="text-muted extra-small mb-0 mt-2 leading-relaxed">
                                    Every single item is hand-picked and double-checked for weight, freshness, and safety before final dispatch.
                                </p>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Feature 3: Express Delivery -->
                <div class="col-lg-4 col-md-12">
                    <div class="feature-visual-card card border-0 rounded-4 overflow-hidden shadow-sm h-100 bg-white">

                        <!-- Image Area with Micro Overlay -->
                        <div class="position-relative overflow-hidden" style="height: 180px;">
                            <img src="https://images.unsplash.com/photo-1526367790999-0150786686a2?q=80&w=800&auto=format&fit=crop"
                                alt="Instant Grocery Delivery"
                                class="w-100 h-100 object-fit-cover feature-card-img" />

                            <!-- Floating Glass Badge -->
                            <span class="position-absolute top-0 start-0 m-3 badge bg-white bg-opacity-90 text-primary fw-bold px-2.5 py-1.5 rounded-pill shadow-sm backdrop-blur extra-small d-flex align-items-center gap-1 border border-white">
                                <i class="fas fa-bolt text-primary"></i>EXPRESS DELIVERY
                            </span>
                        </div>

                        <!-- Content Body -->
                        <div class="card-body p-3.5 d-flex flex-column justify-content-between">
                            <div>
                                <div class="d-flex align-items-center gap-2 mb-1">
                                    <span class="feature-icon-circle bg-primary-subtle text-primary rounded-circle">
                                        <i class="fas fa-truck-fast"></i>
                                    </span>
                                    <h6 class="fw-bold text-dark mb-0 fs-6">Instant Doorstep Delivery</h6>
                                </div>
                                <p class="text-muted extra-small mb-0 mt-2 leading-relaxed">
                                    Temperature-controlled smart packaging to ensure your veggies and fruits reach your door perfectly fresh in minutes.
                                </p>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- STYLING FOR MODERN MICRO-INTERACTIONS -->
    <style>
        /* Custom Typography & Layout Utilities */
        .extra-small {
            font-size: 0.8125rem;
        }

        .leading-relaxed {
            line-height: 1.5;
        }

        .backdrop-blur {
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
        }

        /* Small Icon Badge Inside Title */
        .feature-icon-circle {
            width: 30px;
            height: 30px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 0.85rem;
        }

        /* Modern Card Hover Effects */
        .feature-visual-card {
            transition: transform 0.3s cubic-bezier(0.165, 0.84, 0.44, 1), box-shadow 0.3s ease;
            border: 1px solid rgba(0, 0, 0, 0.06) !important;
        }

        .feature-card-img {
            transition: transform 0.5s ease;
        }

        .feature-visual-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.08) !important;
        }

            .feature-visual-card:hover .feature-card-img {
                transform: scale(1.06);
            }
    </style>

    <!-- STATIC ADDITION 4: Customer Testimonial Carousel Banner -->
    <div class="container my-5 overflow-hidden"
        data-aos="fade-right"
        data-aos-duration="1000">
        <!-- Header -->
        <div class="text-center mb-4">
            <span class="badge bg-success-subtle text-success fw-bold px-3 py-2 rounded-pill border border-success border-opacity-25">
                <i class="fas fa-heart me-1"></i>HAPPY CUSTOMERS
            </span>
            <h3 class="fw-bold text-dark mt-2">What Our Buyers Say</h3>
        </div>

        <!-- Bootstrap 5 Auto Carousel -->
        <div id="reviewSlider" class="carousel slide text-center bg-white p-4 p-sm-5 rounded-4 border shadow-sm" data-bs-ride="carousel" data-bs-interval="3500">
            <div class="carousel-inner">

                <!-- Review 1 -->
                <div class="carousel-item active">
                    <div class="text-warning mb-2">
                        <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                    </div>
                    <p class="fs-6 fs-md-5 text-dark fst-italic mx-auto mb-3" style="max-width: 650px;">
                        "Freshshop's veggies are always fresh, crisp, and delivered right on time. My go-to store!"
                    </p>
                    <div class="fw-bold text-success">— Anita Sharma <span class="badge bg-light text-muted border ms-1">Verified Buyer</span></div>
                </div>

                <!-- Review 2 -->
                <div class="carousel-item">
                    <div class="text-warning mb-2">
                        <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                    </div>
                    <p class="fs-6 fs-md-5 text-dark fst-italic mx-auto mb-3" style="max-width: 650px;">
                        "Superfast 10-minute delivery is a lifesaver when cooking. Fruits & dairy items are top quality."
                    </p>
                    <div class="fw-bold text-success">— Rahul Verma <span class="badge bg-light text-muted border ms-1">Verified Buyer</span></div>
                </div>

                <!-- Review 3 -->
                <div class="carousel-item">
                    <div class="text-warning mb-2">
                        <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>
                    </div>
                    <p class="fs-6 fs-md-5 text-dark fst-italic mx-auto mb-3" style="max-width: 650px;">
                        "Packaging is neat, prices are reasonable, and everything arrives fresh. Highly recommended!"
                    </p>
                    <div class="fw-bold text-success">— Priya Patel <span class="badge bg-light text-muted border ms-1">Verified Buyer</span></div>
                </div>

            </div>

            <!-- Dots Navigation -->
            <div class="carousel-indicators position-relative mt-3 mb-0">
                <button type="button" data-bs-target="#reviewSlider" data-bs-slide-to="0" class="active bg-success rounded-circle" style="width: 8px; height: 8px;"></button>
                <button type="button" data-bs-target="#reviewSlider" data-bs-slide-to="1" class="bg-success rounded-circle" style="width: 8px; height: 8px;"></button>
                <button type="button" data-bs-target="#reviewSlider" data-bs-slide-to="2" class="bg-success rounded-circle" style="width: 8px; height: 8px;"></button>
            </div>
        </div>
    </div>


    <div class="container my-5"
        data-aos="zoom-in"
        data-aos-duration="1000"
        data-aos-easing="ease-out-back">
        <!-- Header -->
        <div class="text-center mb-4">
            <span class="badge bg-success-subtle text-success fw-bold px-3 py-2 rounded-pill border border-success border-opacity-25">
                <i class="fas fa-question-circle me-1"></i>GOT QUESTIONS?
            </span>
            <h3 class="fw-bold text-dark mt-2">Frequently Asked Questions</h3>
        </div>

        <!-- Accordion Wrapper -->
        <div class="accordion custom-faq mx-auto" id="faqAccordion" style="max-width: 800px;">

            <!-- FAQ 1 -->
            <div class="accordion-item border-0 shadow-sm rounded-4 mb-3 overflow-hidden bg-white">
                <h2 class="accordion-header">
                    <button class="accordion-button fw-bold text-dark bg-white shadow-none py-3 px-4" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
                        <i class="fas fa-shipping-fast text-success me-3"></i>How fast is the order delivery?
                    </button>
                </h2>
                <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                    <div class="accordion-body text-muted pt-0 px-4 pb-4">
                        We offer instant express delivery within 10–30 minutes for local grocery orders, depending on your location.
                    </div>
                </div>
            </div>

            <!-- FAQ 2 -->
            <div class="accordion-item border-0 shadow-sm rounded-4 mb-3 overflow-hidden bg-white">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed fw-bold text-dark bg-white shadow-none py-3 px-4" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                        <i class="fas fa-leaf text-success me-3"></i>How do you ensure product freshness?
                    </button>
                </h2>
                <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body text-muted pt-0 px-4 pb-4">
                        Our fruits and vegetables are farm-sourced daily and undergo a 3-step quality check before being packed for delivery.
                    </div>
                </div>
            </div>

            <!-- FAQ 3 -->
            <div class="accordion-item border-0 shadow-sm rounded-4 mb-3 overflow-hidden bg-white">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed fw-bold text-dark bg-white shadow-none py-3 px-4" type="button" data-bs-toggle="collapse" data-bs-target="#faq3">
                        <i class="fas fa-undo-alt text-success me-3"></i>What is the return or refund policy?
                    </button>
                </h2>
                <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body text-muted pt-0 px-4 pb-4">
                        If you receive a damaged or unsatisfactory item, you can request an instant replacement or refund directly from the My Orders section within 2 hours of delivery.
                    </div>
                </div>
            </div>

            <!-- FAQ 4 -->
            <div class="accordion-item border-0 shadow-sm rounded-4 mb-3 overflow-hidden bg-white">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed fw-bold text-dark bg-white shadow-none py-3 px-4" type="button" data-bs-toggle="collapse" data-bs-target="#faq4">
                        <i class="fas fa-wallet text-success me-3"></i>What payment methods are accepted?
                    </button>
                </h2>
                <div id="faq4" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body text-muted pt-0 px-4 pb-4">
                        We accept UPI (Google Pay, PhonePe, Paytm), Credit/Debit Cards, Net Banking, and Cash on Delivery (COD).
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- Subtle Hover & Animation Style -->
    <style>
        .custom-faq .accordion-button {
            transition: all 0.3s ease;
        }

            .custom-faq .accordion-button:not(.collapsed) {
                color: #198754 !important;
                background-color: #ffffff !important;
            }

        .custom-faq .accordion-item {
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

            .custom-faq .accordion-item:hover {
                transform: translateY(-2px);
                box-shadow: 0 .5rem 1rem rgba(0,0,0,.08) !important;
            }
    </style>


    <script>
        document.addEventListener("DOMContentLoaded", function () {

            var itemsToShow = 12;
            var increment = 12;

            var products = document.querySelectorAll(".product-item");
            var loadMoreBtn = document.getElementById("loadMoreBtn");

            function updateProducts() {
                for (var i = 0; i < products.length; i++) {
                    if (i < itemsToShow) {
                        products[i].classList.remove("d-none");
                        products[i].style.setProperty("display", "", "important");
                    } else {
                        products[i].classList.add("d-none");
                        products[i].style.setProperty("display", "", "important");
                    }
                }

                if (loadMoreBtn && itemsToShow >= products.length) {
                    loadMoreBtn.style.setProperty("display", "none", "important");
                }
            }

            // Initial setup
            updateProducts();

            if (loadMoreBtn) {
                if (products.length <= itemsToShow) {
                    loadMoreBtn.style.setProperty("display", "none", "important");
                }

                loadMoreBtn.addEventListener("click", function (e) {
                    e.preventDefault();
                    itemsToShow += increment;
                    updateProducts();
                });
            }

        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>

