<%@ Page Title="" Language="C#" MasterPageFile="~/auth/admin.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:Label ID="lblsmscredit" hidden runat="server" Text=""></asp:Label>

    <div class="row" style="margin-top: 20px;">

        <div class="col-lg-4 col-md-6">
            <div class="small-box" style="background-color: #3f51b5;">
                <div class="inner">
                    <h3>
                        <asp:Label ID="lbltodayorder" runat="server" Text="0"></asp:Label></h3>
                    <p style="color: white">Today Order</p>
                </div>
                <div class="icon">
                    <i class="fas fa-asterisk"></i>
                </div>

            </div>
        </div>

        <div class="col-lg-4 col-md-6">
            <div class="small-box" style="background-color: #4db6ac;">
                <div class="inner">
                    <h3>
                        <asp:Label ID="lbltodaycancelrequest" runat="server" Text="0"></asp:Label></h3>
                    <p style="color: white">Today Cancel Request</p>
                </div>
                <div class="icon">
                    <i class="fas fa-expand-arrows-alt"></i>
                </div>

            </div>
        </div>

        <div class="col-lg-4 col-md-6">
            <div class="small-box" style="background-color: #9575cd;">
                <div class="inner">
                    <h3>
                        <asp:Label ID="lbl_total_order" runat="server" Text="0"></asp:Label></h3>
                    <p style="color: white">Total Order</p>
                </div>
                <div class="icon">
                    <i class="fas fa-gift"></i>
                </div>

            </div>
        </div>

       <%-- <div class="col-lg-3 col-md-6">
            <div class="small-box" style="background-color: #f06292;">
                <div class="inner">
                    <h3>
                        <asp:Label ID="lbl_total_deliverd" runat="server" Text="0"></asp:Label></h3>
                    <p style="color: white">Delivered Order</p>
                </div>
                <div class="icon">
                    <i class="fas fa-handshake"></i>
                </div>

            </div>

        </div>--%>

    </div>

    <div class="row">

        <div class="col-lg-4 col-md-6">

            <div class="small-box " style="background-color: #ff8a65;">
                <div class="inner">
                    <h3>
                        <asp:Label ID="lbltotalcustomer" runat="server" Text="0"></asp:Label></h3>
                    <p style="color: white">Total Customer</p>
                </div>
                <div class="icon">
                    <i class="fas fa-user-friends"></i>
                </div>

            </div>

        </div>

        


        <div class="col-lg-4 col-md-6">

            <div class="small-box  " style="background-color: #f06292;">
                <div class="inner">
                    <h3>
                        <asp:Label ID="lbltotalproduct" runat="server" Text="0"></asp:Label></h3>
                    <p style="color: white">Total Product</p>
                </div>
                <div class="icon">
                    <i class="fas fa-archive"></i>
                </div>

            </div>

        </div>

         <div class="col-lg-4 col-md-6">

            <div class="small-box " style="background-color:#078f61;">
                <div class="inner">
                    <h3>
                        <asp:Label ID="lbl_total_delivery_boy" runat="server" Text="0"></asp:Label></h3>
                    <p style="color: white">Total Delivery Boy</p>
                </div>
                <div class="icon">
                    <i class="fas fa-user"></i>
                </div>

            </div>

        </div>


        


        

        <div class="col-lg-12 col-md-12">
            <div class="panel panel-white">
                <div class="panel-heading">
                    <h4 class="panel-title" style="color: #3f51b5">Recent Order</h4>
                </div>
                <div class="panel-body">
                    <div class="table-responsive project-stats">
                        <table id="order" class="table">
                            <thead>
                                <tr>
                                    <th>#Order</th>
                                    <th>Place Date</th>
                                    <th>Customer</th>
                                    <th>Payment</th>
                                    <th>Amount</th>
                                    <th>No of Items</th>

                                </tr>
                            </thead>
                            <tbody>

                                <asp:Repeater ID="rptbindorderdata" runat="server" OnItemDataBound="rptbindorderdata_ItemDataBound">
                                    <ItemTemplate>

                                        <asp:Label ID="lblorderid" hidden runat="server" Text='<%# Eval("order_id") %>'></asp:Label>

                                        <tr>
                                            <td>
                                                <a href="order-details.aspx?ref=<%# Eval("order_id") %>" target="_blank">
                                                    <%# Eval("order_id") %>
                                                </a>
                                            </td>
                                            <td>
                                                <%# Eval("order_id") %>
                                                <%--<%#   DateTime.ParseExact(Eval("order_date").ToString(), "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture).ToString("MMMM, dd, yyyy", System.Globalization.CultureInfo.InvariantCulture)  %> <%# Eval("order_delivery_time") %>--%>
                                            </td>
                                            <td>
                                                <%# Eval("customer_name") %>
                                            </td>
                                            <td>
                                                <%# Eval("payment_mode") %>
                                            </td>
                                            <td>₹ <%# Eval("total_order_amount") %>
                                            </td>

                                            <td>
                                                <asp:Label ID="lblnoofitems" runat="server" Text="0"></asp:Label>
                                            </td>

                                            <td>
                                                <a class="btn btn-primary" href="order-details.aspx?ref=<%# Eval("order_id") %>" target="_blank" title="View Order Details"><i class="fa fa-eye"></i></a>
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

