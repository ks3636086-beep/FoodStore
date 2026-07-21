<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Cart</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active">Cart</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Cart  -->
    <div class="cart-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Images</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptCart" runat="server" OnItemCommand="rptCart_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="thumbnail-img">
                                                <a href="#">
                                                    <img class="img-fluid" src='auth/<%# Eval("photo_path") %>' alt="" />
                                                </a>
                                            </td>

                                            <td class="name-pr">
                                                <asp:Label runat="server" ID="lblname" Text='<%# Eval("product_name") %>'></asp:Label>
                                            </td>

                                            <td class="price-pr">
                                                <asp:Label runat="server" ID="lblprice" Text='<%# Eval("product_sell_price") %>'></asp:Label>
                                            </td>

                                            <td class="quantity-box">

                                                <asp:LinkButton runat="server" ID="btnminus" CommandName="btnminus" Text="-" />

                                                <asp:Label runat="server" ID="qty" Text='<%# Eval("cart_qty") %>' class="c-input-text qty text"></asp:Label>
                                                <asp:Label runat="server" Hidden ID="qty1" Text='<%# Eval("cart_qty") %>' class="c-input-text qty text"></asp:Label>

                                                <asp:LinkButton runat="server" ID="btnplus" CommandName="btnplus" Text="+" />

                                            </td>

                                            <td class="total-pr">
                                                <asp:Label ID="lbltotal" runat="server" Text='<%# Eval("total_amount_of_product") %>'></asp:Label></td>
                                            <asp:Label ID="lblprc" hidden runat="server" Text='<%# Eval("product_sell_price") %>'></asp:Label>
                                            <%-- <asp:Label runat="server" ID="lblprc" Text='<%# Eval("product_final_sell_price") %>'></asp:Label>--%>
                                            <asp:Label ID="lblproduct_id" hidden runat="server" Text='<%# Eval("product_id") %>'></asp:Label>

                                            </td>

                                            <td class="remove-pr">
                                                <asp:LinkButton runat="server" ID="btndel" CommandName="btndel"><i class="fas fa-times"></i>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="row my-5">
                <div class="col-lg-6 col-sm-6">
                    <div class="coupon-box">
                        <div class="input-group input-group-sm">
                            <input class="form-control" placeholder="Enter your coupon code" aria-label="Coupon code" type="text">
                            <div class="input-group-append">
                                <button class="btn btn-theme" type="button">Apply Coupon</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-sm-6">
                    <div class="update-box">
                        <input value="Update Cart" type="submit">
                    </div>
                </div>
            </div>

            <div class="row my-5">
                <div class="col-lg-8 col-sm-12"></div>
                <div class="col-lg-4 col-sm-12">
                    <div class="order-box">
                        <h3>Order summary</h3>
                        <div class="d-flex">
                            <h4>Sub Total</h4>
                            <asp:Label runat="server" ID="SubTotal" class="ml-auto font-weight-bold"> </asp:Label>
                        </div>
                        <div class="d-flex">
                            <h4>Shipping</h4>
                            <asp:Label runat="server" ID="lblshipping" CssClass="ml-auto font-weight-bold"></asp:Label>
                        </div>

                        <hr>
                        <div class="d-flex gr-total">
                            <h5>Grand Total</h5>
                            <asp:Label runat="server" ID="GrandTotal" class="ml-auto h5"> </asp:Label>
                        </div>
                        <hr>
                    </div>
                </div>
                <asp:Button ID="checkoutbtn" runat="server" Text="Proceed To Checkout" CssClass="col-4 ml-auto btn hvr-hover" OnClick="checkoutbtn_Click" />



            </div>

        </div>
    </div>
    <!-- End Cart -->

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

