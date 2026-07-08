<%@ Page Language="C#" AutoEventWireup="true" CodeFile="category-products.aspx.cs" Inherits="category_products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>Freshshop - Ecommerce Bootstrap 4 HTML Template</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <div class="all-title-box">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>PRODUCTS</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.aspx">Home</a></li>
                            <li class="breadcrumb-item active">Products</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Start Products -->
        <div class="products-box">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="title-all text-center">
                            <h1>Fruits & Vegetables</h1>
                            <p>Fresh and healthy products for your daily needs.</p>
                        </div>
                    </div>
                </div>

                <div class="row special-list">
                    <asp:Repeater ID="rptProducts" runat="server">
                        <ItemTemplate>
                            <div class="col-lg-3 col-md-6 special-grid best-seller">
                                <div class="products-single fix">
                                    <div class="box-img-hover">

                                        <img class="img-fluid"
                                            src='auth/<%# Eval("photo_path") %>' />

                                        <div class="mask-icon">
                                            <ul>
                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                            </ul>
                                            <asp:LinkButton runat="server" ID="btnCart" OnClick="btnCart_Click" class="cart">Add to Cart</asp:LinkButton>
                                        </div>
                                    </div>
                                    <div class="why-text">
                                        <a href='product_details.aspx?ref=<%# Eval("product_id") %>'>
                                            <h4><%# Eval("product_full_name") %></h4>
                                        </a>
                                        <h5>Rs. <%# Eval("product_final_sell_price") %></h5>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <!-- End Products -->

        <div>
        </div>
    </form>
</body>
</html>
