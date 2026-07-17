<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="view-order-details.aspx.cs" Inherits="view_order_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <!-- Breadcrumb -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="index.aspx">Home</a>
                    <a class="breadcrumb-item text-dark" href="my-order.aspx">My Orders</a>
                    <span class="breadcrumb-item active">Order Details</span>
                </nav>
            </div>
        </div>
    </div>


    <!-- Shipping Details -->
    <div class="container-fluid">
        <div class="row px-xl-5">

            <div class="col-lg-12">

                <div class="bg-light p-4 mb-4 shadow-sm">

                    <h4 class="mb-3" style="color:#28a745;">
                        <i class="fa fa-map-marker"></i> Shipping Details
                    </h4>

                    <div class="row">

                        <div class="col-md-6 mb-2">
                            <b>Customer Name :</b>
                            <asp:Label ID="lblcname" runat="server"></asp:Label>
                        </div>

                        <div class="col-md-6 mb-2">
                            <b>Mobile :</b>
                            <asp:Label ID="lblcmob" runat="server"></asp:Label>
                        </div>


                        <div class="col-md-6 mb-2">
                            <b>Email :</b>
                            <asp:Label ID="lblcmail" runat="server"></asp:Label>
                        </div>


                        <div class="col-md-6 mb-2">
                            <b>Address :</b>
                            <asp:Label ID="lblcadd" runat="server"></asp:Label>
                        </div>

                    </div>

                </div>

            </div>

        </div>
    </div>



    <!-- Product Details -->

    <div class="container-fluid">
        <div class="row px-xl-5">

            <div class="col-lg-12">

                <div class="bg-light p-4 shadow-sm">

                    <h4 class="mb-4" style="color:#28a745;">
                        <i class="fa fa-shopping-cart"></i> Ordered Products
                    </h4>


                    <div class="table-responsive">

                        <table class="table table-hover text-center">

                            <thead style="background:#343a40;color:white;">

                                <tr>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                </tr>

                            </thead>


                            <tbody>


                            <asp:Repeater ID="rptbindproduct" runat="server" 
                                >

                            <ItemTemplate>


                                <tr>

                                    <td class="align-middle">

                                        <asp:Label ID="lblname" runat="server"
                                        Text='<%# Eval("product_name") %>'>
                                        </asp:Label>

                                    </td>


                                    <td class="align-middle">

                                        ₹
                                        <asp:Label ID="lblprice" runat="server"
                                        Text='<%# Eval("product_sell_price") %>'>
                                        </asp:Label>

                                    </td>


                                    <td class="align-middle">

                                        <span class="badge badge-success">
                                            <asp:Label ID="lblqty" runat="server"
                                            Text='<%# Eval("product_qty") %>'>
                                            </asp:Label>
                                        </span>

                                    </td>


                                    <td class="align-middle">

                                        ₹
                                        <asp:Label ID="lbltotal" runat="server"
                                        Text='<%# Eval("total_amount_of_product") %>'>
                                        </asp:Label>

                                    </td>


                                    <asp:Label ID="lblprc" hidden runat="server"
                                    Text='<%# Eval("product_sell_price") %>'>
                                    </asp:Label>


                                    <asp:Label ID="lblproduct_id" hidden runat="server"
                                    Text='<%# Eval("product_id") %>'>
                                    </asp:Label>


                                </tr>


                            </ItemTemplate>

                            </asp:Repeater>


                            </tbody>


                        </table>


                    </div>


                    <div class="text-center mt-4">

                        <button id="btncancel" runat="server"
                         
                        class="btn"
                        style="background:#dc3545;color:white;border-radius:25px;padding:10px 30px;">

                            <i class="fa fa-times"></i>
                            Cancel Order

                        </button>

                    </div>


                </div>


            </div>

        </div>
    </div>


</asp:Content>

