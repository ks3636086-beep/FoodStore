<%@ Page Language="C#" AutoEventWireup="true" CodeFile="category-products.aspx.cs" Inherits="category_products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Products - FoodStore</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        .extra-small {
            font-size: 0.75rem;
        }

        .fw-extrabold {
            font-weight: 800;
        }

        .btn-white {
            background-color: #ffffff;
            border: none;
        }

        .transition-all {
            transition: all 0.25s ease-in-out;
        }

        .transition-transform {
            transition: transform 0.3s ease;
        }

        /* HOVER EFFECTS */
        .hover-shadow:hover {
            transform: translateY(-4px);
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.08) !important;
        }

            .hover-shadow:hover img {
                transform: scale(1.06);
            }

        .hover-text-success:hover {
            color: #198754 !important;
        }

        .hover-danger:hover {
            color: #dc3545 !important;
            background-color: #ffe6e6 !important;
        }

        .hover-primary:hover {
            color: #0d6efd !important;
            background-color: #e6f0ff !important;
        }

        @media (max-width: 576px) {
            .card-title {
                font-size: 0.875rem;
            }

            .img-fluid {
                height: 130px !important;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- 1. COMPACT PAGE HEADER / BREADCRUMB SECTION -->
        <div class="bg-white border-bottom py-3 py-md-4 mb-4 shadow-sm">
            <div class="container-xl">
                <nav aria-label="breadcrumb" class="mb-2">
                    <ol class="breadcrumb extra-small mb-0">
                        <li class="breadcrumb-item"><a href="index.aspx" class="text-decoration-none text-muted"><i class="fas fa-home me-1"></i>Home</a></li>
                        <li class="breadcrumb-item active fw-bold text-success" aria-current="page">Products</li>
                    </ol>
                </nav>
                <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-2">
                    <div>
                        <h1 class="h4 fw-extrabold text-dark mb-1">Fruits & Vegetables</h1>
                        <p class="text-muted small mb-0">Fresh, hand-picked & organic produce delivered to your doorstep daily.</p>
                    </div>
                    <div>
                        <span class="badge bg-success-subtle text-success border border-success-subtle rounded-pill px-3 py-2 fw-semibold small">🌱 100% Quality Guaranteed
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <!-- 2. PRODUCT GRID SECTION -->
        <div class="container-xl pb-5">

            <div class="row g-2 g-sm-3 g-lg-4">
                <asp:Repeater ID="rptProducts" runat="server">
                    <ItemTemplate>
                        <div class="col-6 col-md-4 col-lg-3 d-flex">

                            <!-- E-COMMERCE PRODUCT CARD -->
                            <div class="card border-0 rounded-4 shadow-sm h-100 w-100 overflow-hidden bg-white position-relative d-flex flex-column transition-all hover-shadow">

                                <!-- TOP BADGE & QUICK ACTIONS -->
                                <div class="position-absolute top-0 start-0 end-0 p-2 d-flex justify-content-between align-items-center z-2">
                                    <span class="badge bg-success rounded-pill px-2 py-1 extra-small fw-bold shadow-sm">FRESH
                                    </span>
                                    <div class="d-flex flex-column gap-1">
                                        <a href="#" class="btn btn-sm btn-white rounded-circle shadow-sm p-0 d-flex align-items-center justify-content-center text-secondary hover-danger" style="width: 30px; height: 30px;" title="Add to Wishlist">
                                            <i class="far fa-heart small"></i>
                                        </a>
                                        <a href='product_details.aspx?ref=<%# Eval("product_id") %>' class="btn btn-sm btn-white rounded-circle shadow-sm p-0 d-flex align-items-center justify-content-center text-secondary hover-primary" style="width: 30px; height: 30px;" title="Quick View">
                                            <i class="fas fa-eye small"></i>
                                        </a>
                                    </div>
                                </div>

                                <!-- FULL-WIDTH PRODUCT IMAGE CONTAINER (Padding removed) -->
                                <a href='product_details.aspx?ref=<%# Eval("product_id") %>' class="text-decoration-none d-block bg-light p-0 position-relative overflow-hidden w-100">
                                    <img src='auth/<%# Eval("photo_path") %>'
                                        alt='<%# Eval("product_full_name") %>'
                                        class="img-fluid w-100 object-fit-cover transition-transform"
                                        style="height: 180px;" />
                                </a>

                                <!-- PRODUCT DETAILS & BODY -->
                                <div class="card-body p-2 p-sm-3 d-flex flex-column justify-content-between flex-grow-1">
                                    <div>
                                        <!-- PRODUCT TITLE -->
                                        <a href='product_details.aspx?ref=<%# Eval("product_id") %>' class="text-decoration-none">
                                            <h2 class="card-title h6 fw-bold text-dark text-truncate mb-1 hover-text-success" style="max-width: 100%;" title='<%# Eval("product_full_name") %>'>
                                                <%# Eval("product_full_name") %>
                                            </h2>
                                        </a>
                                        <p class="text-muted extra-small mb-2 text-truncate">Daily Fresh Essentials</p>
                                    </div>

                                    <!-- PRICE & ADD TO CART ACTION -->
                                    <div class="pt-2 border-top mt-auto">
                                        <div class="d-flex align-items-center justify-content-between mb-2">
                                            <div>
                                                <span class="text-muted extra-small d-block lh-1">Price</span>
                                                <span class="fs-6 fw-extrabold text-success">Rs. <%# Eval("product_final_sell_price") %>
                                                </span>
                                            </div>
                                        </div>

                                        <!-- PRESERVED ID & EVENT: btnCart & btnCart_Click -->
                                        <asp:LinkButton runat="server" ID="btnCart" OnClick="btnCart_Click"
                                            CssClass="btn btn-success btn-sm w-100 rounded-pill fw-bold shadow-sm d-flex align-items-center justify-content-center gap-2 py-1.5">
                                    <i class="fas fa-shopping-basket small"></i>
                                    <span>Add to Cart</span>
                                        </asp:LinkButton>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </div>

    </form>
</body>
</html>
