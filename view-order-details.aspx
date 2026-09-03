<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="view-order-details.aspx.cs" Inherits="view_order_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Breadcrumb -->
    <div class="container-fluid"
        data-aos="fade-left"
        data-aos-duration="800"
        data-aos-once="true">
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
    <div class="container-fluid"
        data-aos="fade-right"
        data-aos-duration="800"
        data-aos-once="true">
        <div class="row px-xl-5">

            <div class="col-lg-12">

                <!-- MAIN CONTAINER WITH LIGHT BACKGROUND & SOFT SHADOW -->
                <div class="bg-light p-4 mb-4 shadow-sm rounded-3 border">

                    <!-- HEADER -->
                    <h5 class="mb-3 text-success fw-bold d-flex align-items-center gap-2">
                        <i class="fas fa-map-marker-alt"></i>Shipping Details
                    </h5>

                    <hr class="my-3 text-secondary opacity-25" />

                    <!-- DETAILS LIST -->
                    <div class="row g-3">

                        <!-- Customer Name -->
                        <div class="col-md-6">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-user text-success me-2 fs-6"></i>
                                <span class="fw-bold text-dark me-2">Customer Name :</span>
                                <span class="text-secondary fw-medium">
                                    <asp:Label ID="lblcname" runat="server"></asp:Label>
                                </span>
                            </div>
                        </div>

                        <!-- Mobile -->
                        <div class="col-md-6">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-phone-alt text-success me-2 fs-6"></i>
                                <span class="fw-bold text-dark me-2">Mobile :</span>
                                <span class="text-secondary fw-medium">
                                    <asp:Label ID="lblcmob" runat="server"></asp:Label>
                                </span>
                            </div>
                        </div>

                        <!-- Email -->
                        <div class="col-md-6">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-envelope text-success me-2 fs-6"></i>
                                <span class="fw-bold text-dark me-2">Email :</span>
                                <span class="text-secondary fw-medium">
                                    <asp:Label ID="lblcmail" runat="server"></asp:Label>
                                </span>
                            </div>
                        </div>

                        <!-- Address -->
                        <div class="col-md-6">
                            <div class="d-flex align-items-start">
                                <i class="fas fa-home text-success me-2 mt-1 fs-6"></i>
                                <span class="fw-bold text-dark me-2">Address :</span>
                                <span class="text-secondary fw-medium">
                                    <asp:Label ID="lblcadd" runat="server"></asp:Label>
                                </span>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </div>
    </div>



    <!-- Product Details -->

    <div class="container-fluid"
        data-aos="fade-right"
        data-aos-duration="800"
        data-aos-once="true">
        <div class="row px-xl-5">

            <div class="col-lg-12">

                <div class="bg-light p-4 shadow-sm">

                    <h4 class="mb-4" style="color: #28a745;">
                        <i class="fa fa-shopping-cart"></i>Ordered Products
                    </h4>


                    <div class="table-responsive">

                        <table class="table table-hover text-center">

                            <thead style="background: #343a40; color: white;">

                                <tr>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                </tr>

                            </thead>


                            <tbody>


                                <asp:Repeater ID="rptbindproduct" runat="server">

                                    <ItemTemplate>


                                        <tr>

                                            <td class="align-middle">

                                                <asp:Label ID="lblname" runat="server"
                                                    Text='<%# Eval("product_name") %>'>
                                        </asp:Label>

                                            </td>


                                            <td class="align-middle">₹
                                       
                                               

                                                <asp:Label ID="lblprice" runat="server"
                                                    Text='<%# Eval("product_sell_price") %>'>
                                        </asp:Label>

                                            </td>


                                            <td class="align-middle">

                                               <span class="badge badge-success" style="color: black;">
                                                    <asp:Label ID="lblqty" runat="server"
                                                        Text='<%# Eval("product_qty") %>'>
                                            </asp:Label>
                                                </span>

                                            </td>


                                            <td class="align-middle">₹
                                       
                                               

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

                        <button id="btncancel" runat="server" onserverclick="btncancel_ServerClick"
                            class="btn" visible="false"
                            style="background: #dc3545; color: white; border-radius: 25px; padding: 10px 30px;">

                            <i class="fa fa-times"></i>
                            Cancel Order

                       
                       
                        </button>

                        <button id="btnreturn" runat="server" onserverclick="btnreturn_ServerClick"
                            class="btn" visible="false"
                            style="background: #28a745; color: white; border-radius: 25px; padding: 10px 30px;">

                            <i class="fa fa-undo"></i>
                            Return Order

   
                       
                        </button>

                    </div>


                </div>


            </div>

        </div>
    </div>


</asp:Content>

