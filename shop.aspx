<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="shop.aspx.cs" Inherits="shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Modern Grocery Theme Custom Styles */
        .product-card {
            transition: transform 0.25s ease, box-shadow 0.25s ease;
            border: 1px solid #f0f0f0;
        }

            .product-card:hover {
                transform: translateY(-4px);
                box-shadow: 0 10px 20px rgba(0,0,0,0.06) !important;
                border-color: #28a745;
            }

        .product-img-wrapper {
            position: relative;
            overflow: hidden;
            background-color: #f9f9f9;
            padding-top: 100%; /* 1:1 Aspect Ratio */
        }

            .product-img-wrapper img {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: transform 0.3s ease;
            }

        .product-card:hover .product-img-wrapper img {
            transform: scale(1.04);
        }

        .product-actions-overlay {
            position: absolute;
            top: 10px;
            right: 10px;
            display: flex;
            flex-direction: column;
            gap: 6px;
            z-index: 2;
        }

        .action-btn {
            width: 34px;
            height: 34px;
            border-radius: 50%;
            background: #ffffff;
            color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.12);
            transition: all 0.2s ease;
            text-decoration: none;
        }

            .action-btn:hover {
                background: #28a745;
                color: #fff;
            }

        .category-link {
            transition: all 0.2s ease;
            color: #495057;
        }

            .category-link:hover, .category-link.active {
                color: #28a745 !important;
                background-color: #f4fbf6 !important;
                font-weight: 600;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- 1. Shop Header / Breadcrumb (Full Width Edge-to-Edge) -->
    <div class="bg-light py-4 border-bottom w-100">
        <div class="container-fluid px-4 px-lg-5 text-center text-md-start">
            <h2 class="fw-bold text-dark mb-1">Shop</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 justify-content-center justify-content-md-start">
                    <li class="breadcrumb-item"><a href="default.aspx" class="text-success text-decoration-none">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Shop</li>
                </ol>
            </nav>
        </div>
    </div>

    <!-- 2. Main Shop Layout (Full Width Desktop Container) -->
    <div class="container-fluid px-3 px-md-4 px-lg-5 py-4">
        <div class="row g-4">

            <!-- 3. Left Sidebar (Desktop 2 Columns) -->
            <aside class="col-xl-2 col-lg-3 col-md-4">
                <div class="pe-lg-2">

                    <!-- Search Widget -->
                    <div class="card border-0 shadow-sm rounded-3 p-3 mb-4 bg-white">
                        <h6 class="fw-bold text-dark mb-3">Search Products</h6>
                        <div class="input-group">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control border-end-0 shadow-none fs-7" Placeholder="Search products..."></asp:TextBox>
                            <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn btn-outline-success border-start-0">
                                <i class="fas fa-search"></i>
                            </asp:LinkButton>
                        </div>
                    </div>

                    <!-- Categories Widget -->
                    <div class="card border-0 shadow-sm rounded-3 p-3 mb-4 bg-white">
                        <h6 class="fw-bold text-dark mb-3">Categories</h6>
                        <div class="list-group list-group-flush small">
                            <a href="shop.aspx" class="list-group-item list-group-item-action border-0 rounded-2 py-2 px-3 mb-1 category-link active">
                                <i class="fas fa-th-large me-2"></i>All Products
                            </a>
                            <a href="shop.aspx?cat=veg" class="list-group-item list-group-item-action border-0 rounded-2 py-2 px-3 mb-1 category-link">
                                <i class="fas fa-carrot me-2"></i>Vegetables
                            </a>
                            <a href="shop.aspx?cat=fruits" class="list-group-item list-group-item-action border-0 rounded-2 py-2 px-3 mb-1 category-link">
                                <i class="fas fa-apple-alt me-2"></i>Fruits
                            </a>
                            <a href="shop.aspx?cat=snacks" class="list-group-item list-group-item-action border-0 rounded-2 py-2 px-3 mb-1 category-link">
                                <i class="fas fa-cookie me-2"></i>Snacks
                            </a>
                            <a href="shop.aspx?cat=cookies" class="list-group-item list-group-item-action border-0 rounded-2 py-2 px-3 mb-1 category-link">
                                <i class="fas fa-bread-slice me-2"></i>Cookies
                            </a>
                            <a href="shop.aspx?cat=care" class="list-group-item list-group-item-action border-0 rounded-2 py-2 px-3">
                                <i class="fas fa-pump-soap me-2"></i>Personal Care
                            </a>
                        </div>
                    </div>

                    <!-- Price Filter Widget -->
                    <div class="card border-0 shadow-sm rounded-3 p-3 mb-4 bg-white">
                        <h6 class="fw-bold text-dark mb-3">Price Filter</h6>
                        <div class="row g-2 mb-3">
                            <div class="col-6">
                                <asp:TextBox ID="txtMinPrice" runat="server" CssClass="form-control form-control-sm" Placeholder="Min ₹"></asp:TextBox>
                            </div>
                            <div class="col-6">
                                <asp:TextBox ID="txtMaxPrice" runat="server" CssClass="form-control form-control-sm" Placeholder="Max ₹"></asp:TextBox>
                            </div>
                        </div>
                        <asp:Button ID="btnFilterPrice" runat="server" Text="Apply Filter" CssClass="btn btn-success btn-sm w-100 rounded-2 fw-semibold" />
                    </div>

                </div>
            </aside>

            <!-- Product Area (Desktop 10 Columns) -->
            <main class="col-xl-10 col-lg-9 col-md-8">

                <!-- 4. Product Toolbar -->
                <div class="d-flex flex-column flex-sm-row justify-content-between align-items-sm-center bg-white p-3 rounded-3 shadow-sm border mb-4 gap-3">
                    <div class="text-muted small">
                        Showing <span id="visible-count" class="fw-bold text-dark">0</span> of <span id="total-count" class="fw-bold text-dark">0</span> products
                   
                    </div>

                    <div class="d-flex align-items-center gap-2">
                        <label class="small text-muted text-nowrap mb-0">Sort By:</label>
                        <asp:DropDownList ID="ddlSort" runat="server" CssClass="form-select form-select-sm shadow-none" AutoPostBack="true">
                            <asp:ListItem Value="default">Default Sorting</asp:ListItem>
                            <asp:ListItem Value="popularity">Popularity</asp:ListItem>
                            <asp:ListItem Value="price_low">Price: Low to High</asp:ListItem>
                            <asp:ListItem Value="price_high">Price: High to Low</asp:ListItem>
                            <asp:ListItem Value="best_selling">Best Selling</asp:ListItem>
                            <asp:ListItem Value="newest">Newest</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <!-- 5. Product Grid (6 per row on Desktop, 3 on Tablet, 2 on Mobile) -->
                <div class="row g-3" id="product-container">
                    <asp:Repeater ID="rptProducts" runat="server">
                        <ItemTemplate>
                            <div class="col-xl-2 col-lg-3 col-md-4 col-6 product-item">
                                <div class="card h-100 bg-white rounded-3 shadow-sm overflow-hidden product-card">

                                    <!-- Product Image & Overlay Actions -->
                                    <div class="product-img-wrapper">
                                        <img src='<%# "auth/" + Eval("photo_path") %>'
                                            alt='<%# Eval("product_full_name") %>'
                                            onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1542838132-92c53300491e?q=80&w=400&auto=format&fit=crop';" />

                                        <div class="product-actions-overlay">
                                            <a href='<%# "product-details.aspx?id=" + Eval("product_id") %>' class="action-btn" title="View Details">
                                                <i class="fas fa-eye small"></i>
                                            </a>
                                            <a href="#" class="action-btn" title="Add to Wishlist">
                                                <i class="far fa-heart small"></i>
                                            </a>
                                        </div>
                                    </div>

                                    <!-- Product Details -->
                                    <div class="card-body p-3 d-flex flex-column justify-content-between">
                                        <div>
                                            <h6 class="card-title text-dark fw-bold mb-1 text-truncate" title='<%# Eval("product_full_name") %>'>
                                                <%# Eval("product_full_name") %>
                                            </h6>
                                            <div class="text-success fw-bold fs-6 mb-2">
                                                ₹<%# Eval("product_final_sell_price") %>
                                            </div>
                                        </div>

                                        <a href='<%# "cart.aspx?action=add&id=" + Eval("product_id") %>' class="btn btn-outline-success btn-sm w-100 rounded-2 mt-2 fw-semibold">
                                            <i class="fas fa-shopping-basket me-1"></i>Add to Cart
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <!-- 7. Empty Result Placeholder (Hidden by default, shown via JS if Repeater empty) -->
                <div id="empty-state" class="text-center py-5 bg-white rounded-4 border shadow-sm my-4 d-none">
                    <div class="mb-3">
                        <i class="fas fa-search-minus text-muted" style="font-size: 3.5rem;"></i>
                    </div>
                    <h5 class="fw-bold text-dark mb-2">No products found</h5>
                    <p class="text-muted small mb-4">We couldn't find any products matching your criteria.</p>
                    <a href="shop.aspx" class="btn btn-success rounded-pill px-4 py-2">Continue Shopping</a>
                </div>

                <!-- 6. Load More Button -->
                <div class="text-center mt-5 mb-4" id="load-more-wrapper">
                    <button type="button" id="btnLoadMore" class="btn btn-outline-dark rounded-pill px-5 py-2 fw-semibold shadow-sm">
                        Load More <i class="fas fa-chevron-down ms-2 small"></i>
                    </button>
                </div>

                <!-- 8. Compact Special Offer Banner -->
                <!-- Special Offer Banner -->
                <div class="bg-success rounded-4 p-4 p-lg-5 text-white shadow-sm mt-5 position-relative overflow-hidden">
                    <div class="row align-items-center g-3">
                        <!-- Text Column -->
                        <div class="col-md-8 text-center text-md-start">
                            <span class="badge bg-white text-success fw-bold px-3 py-2 rounded-pill mb-3">SPECIAL OFFER</span>
                            <h2 class="fw-bold mb-2">Fresh Products. Great Prices.</h2>
                            <p class="mb-0 opacity-90">Shop quality groceries and everyday essentials at FoodStore.</p>
                        </div>
                        <!-- Button Column -->
                        <div class="col-md-4 text-center text-md-end">
                            <a href="shop.aspx" class="btn btn-light text-success fw-bold rounded-pill px-4 py-3 shadow-sm d-inline-flex align-items-center justify-content-center">
                                <span>Shop Now</span>
                                <i class="fas fa-arrow-right ms-2"></i>
                            </a>
                        </div>
                    </div>
                </div>

            </main>
        </div>
    </div>

    <!-- Client-side Load More & Product Counter Logic -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const items = document.querySelectorAll('.product-item');
            const totalCount = items.length;
            const loadMoreBtn = document.getElementById('btnLoadMore');
            const loadMoreWrapper = document.getElementById('load-more-wrapper');
            const emptyState = document.getElementById('empty-state');
            const visibleCountElem = document.getElementById('visible-count');
            const totalCountElem = document.getElementById('total-count');

            let itemsShown = 12;

            totalCountElem.innerText = totalCount;

            if (totalCount === 0) {
                emptyState.classList.remove('d-none');
                loadMoreWrapper.style.display = 'none';
                visibleCountElem.innerText = '0';
                return;
            }

            function updateVisibility() {
                let currentVisible = 0;
                items.forEach((item, index) => {
                    if (index < itemsShown) {
                        item.style.display = 'block';
                        currentVisible++;
                    } else {
                        item.style.display = 'none';
                    }
                });

                visibleCountElem.innerText = currentVisible;

                if (itemsShown >= totalCount) {
                    loadMoreWrapper.style.display = 'none';
                } else {
                    loadMoreWrapper.style.display = 'block';
                }
            }

            // Initial view setup
            updateVisibility();

            // Click Handler
            if (loadMoreBtn) {
                loadMoreBtn.addEventListener('click', function () {
                    itemsShown += 12;
                    updateVisibility();
                });
            }
        });
    </script>

    <!-- Start Instagram Feed  -->
    <div class="instagram-box">
        <div class="main-instagram owl-carousel owl-theme">
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-01.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-02.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-03.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-04.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-05.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-06.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-07.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-08.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-09.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-05.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Instagram Feed  -->

</asp:Content>

