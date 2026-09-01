<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="product_details.aspx.cs" Inherits="product_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Modern Grocery Theme Custom Styles */
        .product-detail-card {
            background: #ffffff;
            border-radius: 16px;
            border: 1px solid #eef2f5;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
        }

        .product-main-img-box {
            background-color: #f8f9fa;
            border-radius: 16px;
            overflow: hidden;
            border: 1px solid #eef2f5;
            position: relative;
            padding-top: 85%; /* Optimal Aspect Ratio */
        }

            .product-main-img-box img {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                object-fit: contain;
                padding: 24px;
                transition: transform 0.3s ease;
            }

            .product-main-img-box:hover img {
                transform: scale(1.03);
            }

        .badge-stock {
            background-color: #e8f5e9;
            color: #2e7d32;
            font-weight: 600;
            font-size: 0.85rem;
            padding: 6px 14px;
            border-radius: 50px;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .delivery-feature-box {
            background-color: #f8faf9;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 16px;
        }

        .related-card {
            transition: transform 0.25s ease, box-shadow 0.25s ease;
            border: 1px solid #f0f0f0;
            border-radius: 12px;
        }

            .related-card:hover {
                transform: translateY(-4px);
                box-shadow: 0 10px 20px rgba(0,0,0,0.06) !important;
                border-color: #28a745;
            }

        .related-img-wrapper {
            position: relative;
            overflow: hidden;
            background-color: #f9f9f9;
            padding-top: 100%;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }

            .related-img-wrapper img {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: transform 0.3s ease;
            }

        .related-card:hover .related-img-wrapper img {
            transform: scale(1.05);
        }

        .nav-tabs .nav-link {
            border: none;
            color: #6c757d;
            font-weight: 600;
            padding: 12px 24px;
            border-bottom: 3px solid transparent;
        }

            .nav-tabs .nav-link.active {
                color: #198754;
                border-bottom-color: #198754;
                background: transparent;
            }

        .qty-input {
            max-width: 60px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- 1. Header / Breadcrumb (Full Width) -->
    <div class="bg-light py-4 border-bottom w-100">
        <div class="container-fluid px-4 px-lg-5 text-center text-md-start">
            <h2 class="fw-bold text-dark mb-1">Product Detail</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 justify-content-center justify-content-md-start">
                    <li class="breadcrumb-item"><a href="default.aspx" class="text-success text-decoration-none">Home</a></li>
                    <li class="breadcrumb-item"><a href="shop.aspx" class="text-success text-decoration-none">Shop</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Product Detail</li>
                </ol>
            </nav>
        </div>
    </div>

    <!-- 2. Main Single Product Area -->
    <div class="container-fluid px-3 px-md-4 px-lg-5 py-4 py-md-5">
        <div class="product-detail-card p-3 p-md-4 p-lg-5 mb-5">
            <div class="row g-4 g-lg-5 align-items-start">

                <!-- Left Column (Product Image ~45% Desktop Width) -->
                <div class="col-lg-5 col-md-6">
                    <div class="product-main-img-box shadow-sm">
                        <img runat="server" id="prductid" class="img-fluid" src="images/big-img-01.jpg" alt="Product Image" />
                    </div>
                </div>

                <!-- Right Column (Product Information ~55% Desktop Width) -->
                <div class="col-lg-7 col-md-6">
                    <div class="ps-lg-2">

                        <!-- Product Name (Preserved ID="heading") -->
                        <h1 runat="server" id="heading" class="fw-bold text-dark mb-2 fs-2">Fresh Organic Grocery Item
                        </h1>

                        <!-- Star Rating UI -->
                        <!-- Dynamic Star Rating UI -->
                        <div class="d-flex align-items-center mb-3">
                            <div class="text-warning me-2 fs-6">
                                <asp:Literal ID="litProductStars" runat="server"></asp:Literal>
                            </div>

                            <span class="fw-bold text-dark small me-2">
                                <asp:Label ID="lblProductAverageRating" runat="server" Text="0.0"></asp:Label>
                            </span>

                            <span class="text-muted small border-start ps-2">(<asp:Label ID="lblProductTotalReviews" runat="server" Text="0"></asp:Label>
                                Customer Reviews)
                            </span>
                        </div>

                        <!-- Price Section (Preserved ID="heading1") -->
                        <div class="p-3 bg-light rounded-3 d-inline-block w-100 mb-3 border">
                            <div class="d-flex align-items-baseline gap-3">
                                <span class="text-muted small fw-semibold">Price:</span>
                                <h3 runat="server" id="heading1" class="text-success fw-bold mb-0 fs-2">
                                    <del class="text-muted fs-5 me-2">$ 60.00</del> $40.79
                                </h3>
                            </div>
                        </div>

                        <!-- Stock Status Badge -->
                        <div class="mb-3">
                            <span class="badge-stock">
                                <i class="fas fa-check-circle"></i>✓ In Stock
                            </span>
                        </div>

                        <!-- Short Description (Preserved ID="para") -->
                        <div class="mb-4">
                            <h6 class="fw-bold text-dark mb-1">Short Description:</h6>
                            <div runat="server" id="para" class="text-muted leading-relaxed small">
                                Premium quality product sourced directly to guarantee maximum freshness, taste, and everyday healthy choices.
                           
                            </div>
                        </div>

                        <!-- Quantity Selector -->
                        <div class="mb-4">
                            <label class="form-label fw-bold text-dark small mb-1">Quantity</label>
                            <div class="d-flex align-items-center">
                                <div class="input-group" style="width: 140px;">
                                    <button class="btn btn-outline-secondary border-end-0" type="button" onclick="var qty=document.getElementById('txtQty'); if(qty.value>1) qty.value--;">-</button>
                                    <input type="number" id="txtQty" class="form-control qty-input border-start-0 border-end-0 shadow-none fw-bold" value="1" min="1" max="20" />
                                    <button class="btn btn-outline-secondary border-start-0" type="button" onclick="var qty=document.getElementById('txtQty'); qty.value++;">+</button>
                                </div>
                            </div>
                        </div>

                        <!-- Action Buttons (Add To Cart & Buy Now) -->
                        <div class="d-flex flex-row gap-2 gap-sm-3 mb-3">
                            <!-- Add To Cart Button -->
                            <asp:LinkButton runat="server" ID="btnAddToCart" OnClick="btnAddToCart_Click" class="btn btn-success btn-sm btn-md-md px-3 px-md-4 py-2 py-md-2.5 rounded-pill fw-semibold fs-7 fs-md-6 shadow-sm flex-fill text-center d-inline-flex align-items-center justify-content-center">
                                <i class="fas fa-shopping-basket me-1 me-sm-2"></i>Add To Cart
                            </asp:LinkButton>

                            <!-- Buy Now Button -->
                            <asp:LinkButton runat="server" ID="btnBuyNow" OnClick="btnBuyNow_Click" class="btn btn-dark btn-sm btn-md-md px-3 px-md-4 py-2 py-md-2.5 rounded-pill fw-semibold fs-7 fs-md-6 shadow-sm flex-fill text-center d-inline-flex align-items-center justify-content-center">
                                <i class="fas fa-bolt me-1 me-sm-2"></i>Buy Now
                            </asp:LinkButton>
                        </div>

                        <!-- Wishlist Button (Preserved ID="btnWishlist" & OnClick="btnWishlist_Click") -->
                        <div class="mb-4">
                            <asp:LinkButton runat="server" ID="btnWishlist" OnClick="btnWishlist_Click" CssClass="btn btn-link text-danger text-decoration-none fw-semibold p-0">
                                <i class="far fa-heart me-1"></i>Add to Wishlist
                           
                            </asp:LinkButton>
                        </div>

                        <!-- 8. Delivery / Service Features Row -->
                        <div class="delivery-feature-box mt-4">
                            <div class="row g-3 text-center text-sm-start">
                                <div class="col-6 col-sm-3">
                                    <div class="d-flex align-items-center justify-content-center justify-content-sm-start gap-2">
                                        <i class="fas fa-shipping-fast text-success fs-5"></i>
                                        <span class="small fw-semibold text-dark">Fast Delivery</span>
                                    </div>
                                </div>
                                <div class="col-6 col-sm-3">
                                    <div class="d-flex align-items-center justify-content-center justify-content-sm-start gap-2">
                                        <i class="fas fa-shield-alt text-success fs-5"></i>
                                        <span class="small fw-semibold text-dark">Secure Shopping</span>
                                    </div>
                                </div>
                                <div class="col-6 col-sm-3">
                                    <div class="d-flex align-items-center justify-content-center justify-content-sm-start gap-2">
                                        <i class="fas fa-undo text-success fs-5"></i>
                                        <span class="small fw-semibold text-dark">Easy Returns</span>
                                    </div>
                                </div>
                                <div class="col-6 col-sm-3">
                                    <div class="d-flex align-items-center justify-content-center justify-content-sm-start gap-2">
                                        <i class="fas fa-money-bill-wave text-success fs-5"></i>
                                        <span class="small fw-semibold text-dark">Cash on Delivery</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>

        <!-- 9 & 10. Description, Specifications & Reviews Tabs -->
        <div class="product-detail-card p-3 p-md-4 mb-5">
            <ul class="nav nav-tabs mb-4 border-bottom" id="productTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="desc-tab" data-bs-toggle="tab" data-bs-target="#desc-pane" type="button" role="tab">Description</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="specs-tab" data-bs-toggle="tab" data-bs-target="#specs-pane" type="button" role="tab">Specifications</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link"
                        id="reviews-tab"
                        data-bs-toggle="tab"
                        data-bs-target="#reviews-pane"
                        type="button"
                        role="tab">
                        Reviews
                    </button>
                </li>
            </ul>

            <div class="tab-content p-2" id="productTabContent">

                <!-- Full Description Pane -->
                <div class="tab-pane fade show active" id="desc-pane" role="tabpanel">
                    <h5 class="fw-bold text-dark mb-3">Product Overview</h5>
                    <p class="text-muted leading-relaxed mb-0">
                        Our fresh groceries are carefully selected and packed to ensure you receive the highest nutrition and natural flavors. Perfectly suited for daily kitchen preparation, healthy cooking, and meal plans. Store in a cool, dry place for optimal shelf-life and taste.
                   
                    </p>
                </div>

                <!-- Specifications Pane -->
                <div class="tab-pane fade" id="specs-pane" role="tabpanel">
                    <h5 class="fw-bold text-dark mb-3">Product Details</h5>
                    <div class="row col-lg-8">
                        <table class="table table-striped table-borderless small mb-0">
                            <tbody>
                                <tr>
                                    <th class="w-25 text-dark">Brand</th>
                                    <td class="text-muted">FoodStore Fresh</td>
                                </tr>
                                <tr>
                                    <th class="text-dark">Category</th>
                                    <td class="text-muted">Grocery & Kitchen Essentials</td>
                                </tr>
                                <tr>
                                    <th class="text-dark">Country of Origin</th>
                                    <td class="text-muted">India</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Product Reviews Pane -->
                <div class="tab-pane fade" id="reviews-pane" role="tabpanel">

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h5 class="fw-bold text-dark mb-1">Customer Reviews</h5>

                            <div class="text-warning small">
                                <asp:Literal ID="litAverageStars" runat="server"></asp:Literal>

                                <span class="text-dark fw-bold ms-1">
                                    <asp:Label ID="lblAverageRating" runat="server" Text="0.0"></asp:Label>
                                    / 5
                                </span>

                                <span class="text-muted ms-1">(<asp:Label ID="lblTotalReviews" runat="server" Text="0"></asp:Label>
                                    reviews)
                                </span>
                            </div>
                        </div>


                        <asp:Panel ID="pnlLeaveReview" runat="server">
                            <a href="#leave-review"
                                class="btn btn-outline-success btn-sm rounded-pill px-3 fw-semibold">Leave a Review
                            </a>
                        </asp:Panel>

                    </div>

                    <asp:Panel ID="pnlReviewForm" runat="server">
                        <div id="leave-review" class="border rounded-3 p-4 mb-4">

                            <h6 class="fw-bold text-dark mb-3">Write Your Review</h6>

                            <label class="form-label fw-semibold">Your Rating</label>

                            <!-- Dynamic Star Rating UI -->
                            <div class="star-rating-container mb-3" style="cursor: pointer; font-size: 1.8rem;">
                                <i class="fas fa-star rating-star text-warning" data-value="1"></i>
                                <i class="fas fa-star rating-star text-warning" data-value="2"></i>
                                <i class="fas fa-star rating-star text-warning" data-value="3"></i>
                                <i class="fas fa-star rating-star text-warning" data-value="4"></i>
                                <i class="fas fa-star rating-star text-warning" data-value="5"></i>
                            </div>
                            <!-- Hidden field to store selected rating for backend -->
                            <asp:HiddenField ID="hdnReviewStar" runat="server" Value="5" />

                            <script>
                                document.addEventListener('DOMContentLoaded', function () {
                                    const stars = document.querySelectorAll('.rating-star');
                                    const hdnField = document.getElementById('<%= hdnReviewStar.ClientID %>');

                                    // Optional hover effect
                                    stars.forEach(star => {
                                        star.addEventListener('mouseover', function () {
                                            const hoverValue = this.getAttribute('data-value');
                                            stars.forEach(s => {
                                                if (parseInt(s.getAttribute('data-value')) <= parseInt(hoverValue)) {
                                                    s.classList.add('text-warning');
                                                    s.classList.remove('text-muted');
                                                } else {
                                                    s.classList.remove('text-warning');
                                                    s.classList.add('text-muted');
                                                }
                                            });
                                        });

                                        star.addEventListener('mouseout', function () {
                                            const selectedValue = hdnField.value;
                                            stars.forEach(s => {
                                                if (parseInt(s.getAttribute('data-value')) <= parseInt(selectedValue)) {
                                                    s.classList.add('text-warning');
                                                    s.classList.remove('text-muted');
                                                } else {
                                                    s.classList.remove('text-warning');
                                                    s.classList.add('text-muted');
                                                }
                                            });
                                        });

                                        star.addEventListener('click', function () {
                                            hdnField.value = this.getAttribute('data-value');
                                        });
                                    });
                                });
                            </script>

                            <label class="form-label fw-semibold">Your Review</label>

                            <asp:TextBox ID="txtReviewMessage" runat="server"
                                TextMode="MultiLine"
                                Rows="4"
                                CssClass="form-control mb-3"
                                placeholder="Write your review...">
                            </asp:TextBox>

                            <button type="button"
                                runat="server"
                                id="btnSubmitReview"
                                onserverclick="btnSubmitReview_ServerClick"
                                class="btn btn-success rounded-pill px-4">
                                Submit Review
                            </button>

                        </div>
                    </asp:Panel>

                    <!-- YAHAN Review Card 1 & 2 DELETE KARO -->

                    <asp:Repeater ID="rptReviews" runat="server">

                        <ItemTemplate>

                            <div class="d-flex align-items-start border-bottom pb-3 mb-3">

                                <div class="bg-success text-white rounded-circle d-flex align-items-center justify-content-center fw-bold me-3"
                                    style="width: 40px; height: 40px; min-width: 40px; border-radius: 50%; flex-shrink: 0;">
                                    <%# Eval("reviwer_name").ToString().Substring(0, 1).ToUpper() %>
                                </div>

                                <div>

                                    <div class="d-flex align-items-center gap-2 mb-1">

                                        <h6 class="fw-bold text-dark mb-0">
                                            <%# Eval("reviwer_name") %>
                                        </h6>

                                        <span class="text-muted small">• <%# Eval("review_date") %>
                                        </span>

                                    </div>

                                    <div class="text-warning small mb-1">
                                        <%# GetStars(Eval("review_star")) %>
                                    </div>

                                    <p class="text-muted small mb-0">
                                        <%# Eval("reviewer_message") %>
                                    </p>

                                </div>

                            </div>

                        </ItemTemplate>

                    </asp:Repeater>

                </div>

            </div>
        </div>

        <!-- 11. Related Products Section ("You May Also Like") -->
        <div class="mb-4">

            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="fw-bold text-dark mb-0">You May Also Like</h3>
                <a href="shop.aspx" class="text-success text-decoration-none fw-semibold small">View All <i class="fas fa-arrow-right ms-1"></i></a>
            </div>

            <!-- Preserved Repeater ID="rptProducts" & OnItemCommand="rptProducts_ItemCommand" -->
            <div class="row g-3">
                <asp:Repeater ID="rptProducts" OnItemCommand="rptProducts_ItemCommand" runat="server">
                    <ItemTemplate>
                        <div class="col-xl-2 col-lg-3 col-md-4 col-6">
                            <div class="card h-100 bg-white shadow-sm related-card">

                                <div class="related-img-wrapper">
                                    <a href='<%# "product_details.aspx?ref=" + Eval("product_id") %>'>
                                        <img src='<%# "auth/" + Eval("photo_path") %>'
                                            alt='<%# Eval("product_full_name") %>' />
                                </div>

                                <div class="card-body p-3 d-flex flex-column justify-content-between">
                                    <div>
                                        <!-- Preserved URL parameter ref=... -->
                                        <a href='<%# "product_details.aspx?ref=" + Eval("product_id") %>' class="text-decoration-none">
                                            <h6 class="card-title text-dark fw-bold mb-1 text-truncate" title='<%# Eval("product_full_name") %>'>
                                                <%# Eval("product_full_name") %>
                                            </h6>
                                        </a>

                                        <div class="d-flex align-items-center gap-1 mb-2">
                                            <span style="font-size: 12px;">
                                                <%# GetProductRating(Eval("product_id")) %>
                                            </span>
                                        </div>

                                        <div class="text-success fw-bold fs-6 mb-2">
                                            Rs. <%# Eval("product_final_sell_price") %>
                                        </div>
                                    </div>

                                    <%-- <asp:LinkButton runat="server" ID="btncart" CommandName="AddToCart" CommandArgument='<%# Eval("product_id") %>' CssClass="btn btn-outline-success btn-sm w-100 rounded-2 mt-2 fw-semibold">
                                        <i class="fas fa-shopping-basket me-1"></i>Add To Cart
                                   
                                    </asp:LinkButton>--%>
                                </div>

                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

    </div>

    <!-- SweetAlert Script -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>


