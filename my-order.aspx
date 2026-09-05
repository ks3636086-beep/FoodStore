<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="my-order.aspx.cs" Inherits="my_order" %>

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
                    <span class="breadcrumb-item active">My Orders</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- My Order Start -->
    <div class="container-fluid"
        data-aos="fade-left"
        data-aos-duration="800"
        data-aos-once="true">
        <div class="row px-xl-5">

            <div class="col-lg-12">

                <div class="bg-light p-4 mb-5 shadow-sm">

                    <h4 class="mb-4" style="color: #28a745;">
                        <i class="fa fa-shopping-bag"></i>My Orders
                    </h4>


                    <div class="table-responsive">

                        <table class="table table-hover text-center mb-0">

                            <thead style="background: #343a40; color: white;">
                                <tr>
                                    <th>Product</th>
                                    <th>Order ID</th>
                                    <th>Customer Name</th>
                                    <th>Mobile</th>
                                    <th>Total Amount</th>
                                    <th>Order Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>


                            <tbody>

                                <asp:Repeater ID="rptbindproduct" OnItemCommand="rptbindproduct_ItemCommand" runat="server">


                                    <ItemTemplate>

                                        <tr>

                                            <td class="align-middle">
                                                <asp:Image ID="imgOrderProduct" runat="server"
                                                    ImageUrl='<%# "auth/" + Eval("product_photo") %>'
                                                    CssClass="rounded-2"
                                                    Style="width: 50px; height: 50px; object-fit: cover;" />

                                            </td>

                                            <td class="align-middle">#<asp:Label ID="lblorderid" runat="server"
                                                Text='<%# Eval("order_id") %>'></asp:Label>
                                            </td>


                                            <td class="align-middle">
                                                <asp:Label ID="lblname" runat="server"
                                                    Text='<%# Eval("customer_name") %>'></asp:Label>
                                            </td>


                                            <td class="align-middle">
                                                <asp:Label ID="lblmob" runat="server"
                                                    Text='<%# Eval("customer_mobileno") %>'></asp:Label>
                                            </td>


                                            <td class="align-middle">
                                                <span style="color: #28a745; font-weight: bold;">₹
                                           
                                                   

                                                    <asp:Label ID="lbltotal" runat="server"
                                                        Text='<%# Eval("total_order_amount") %>'></asp:Label>
                                                </span>
                                            </td>


                                            <td class="align-middle">
                                                <asp:Label ID="lbldate" runat="server"
                                                    Text='<%# Eval("order_date") %>'></asp:Label>
                                            </td>


                                            <td class="align-middle">

                                                <span class="badge badge-success" style="font-size: 14px; color: black;">
                                                    <asp:Label ID="lblstatus" runat="server"
                                                        Text='<%# Eval("order_status") %>'></asp:Label>
                                                </span>

                                            </td>


                                            <td class="align-middle">

                                                <a href="view-order-details.aspx?ref=<%# Eval("order_id") %>"
                                                    class="btn btn-sm"
                                                    style="background: #ff8800; color: white; border-radius: 20px;">View
                                        </a>

                                            </td>


                                        </tr>


                                    </ItemTemplate>

                                </asp:Repeater>


                            </tbody>

                        </table>

                    </div>

                </div>

            </div>

        </div>
    </div>


</asp:Content>

