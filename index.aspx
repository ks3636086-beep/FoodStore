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

    <!-- Start Slider -->
    <div id="slides-shop" class="cover-slides">
        <ul class="slides-container">
            <li class="text-center">
                <img src="images/banner-05.png" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="display-6"><strong>Welcome To
                                <br>
                                Freshshop</strong></h1>
                            <p class="small">
                                See how your users experience your website in realtime or view
                                <br>
                                trends to see any changes in performance over time.
                            </p>
                            <p><a class="btn hvr-hover" href="shop.aspx">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="images/banner-06.png" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To
                                <br>
                                FoodStore</strong></h1>
                            <p class="m-b-40">
                                Fresh groceries, fruits, vegetables, snacks, and daily essentials
                                <br>
                                delivered to your doorstep with quality you can trust.
                            </p>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="images/banner-04.png" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To
                                <br>
                                Freshshop</strong></h1>
                            <p class="m-b-40">
                                See how your users experience your website in realtime or view
                                <br>
                                trends to see any changes in performance over time.
                            </p>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>
    <!-- End Slider -->

    <!-- Start Categories -->
    <div class="categories-shop">
        <div class="container">
            <div class="row">
                <asp:Repeater ID="rptCategory" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-6 col-xs-6 mb-3">
                            <div class="shop-cat-box">
                                <img class="img-fluid"
                                    src='auth/<%# Eval("category_photo") %>'
                                    alt='<%# Eval("category_title") %>' />

                                <a class="btn hvr-hover"
                                    href='category-products.aspx?catid=<%# Eval("category_id") %>'>
                                    <%# Eval("category_title") %>
                                </a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <!-- End Categories -->

    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="title-all text-center">
                    <h1>Fruits & Vegetables</h1>
                    <p>Fresh and healthy products for your daily needs.</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="special-menu text-center">
                    <div class="button-group filter-button-group">
                        <button class="active" data-filter="*">All</button>
                        <button data-filter=".top-featured">Top featured</button>
                        <button data-filter=".best-seller">Best seller</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Start Products  -->
    <div class="container-fluid pt-5 pb-3">
        <div class="row special-list">
            <asp:Repeater ID="rptProducts" OnItemCommand="rptProducts_ItemCommand" runat="server">
                <ItemTemplate>
                    <div class="col-lg-3 col-md-4 col-sm-6 col-6 special-grid best-seller">
                        <div class="products-single fix">
                            <div class="box-img-hover">

                                <img class="img-fluid"
                                    src='auth/<%# Eval("photo_path") %>' />

                                <div class="mask-icon">
                                    <ul>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                        <li>
                                            <asp:LinkButton runat="server" ID="btnwishlist" CommandArgument='<%# Eval("product_id") %>' CommandName="btnwishlist" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></asp:LinkButton></li>
                                    </ul>
                                    <asp:LinkButton runat="server" ID="btncart" CommandArgument='<%# Eval("product_id") %>' CommandName="cartbtn" CssClass="cart" Text="Add to Cart"></asp:LinkButton>
                                </div>
                            </div>
                            <asp:Label ID="lblproduct_id" runat="server" Text='<%# Eval("product_id") %>' Visible="false" />
                            <asp:Label ID="lblname" runat="server" Text='<%# Eval("product_full_name") %>' Visible="false" />
                            <asp:Label ID="lbl_sell_price" runat="server" Text='<%# Eval("product_final_sell_price") %>' Visible="false" />
                            <asp:Label ID="lbl_unit" runat="server" Text='<%# Eval("product_unit") %>' Visible="false" />
                            <asp:Label ID="lbl_unit_value" runat="server" Text='<%# Eval("product_unit_value") %>' Visible="false" />
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
    </div>
    <!-- End Products  -->


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

