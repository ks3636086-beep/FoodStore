<%@ Page Title="" Language="C#" MasterPageFile="~/deliveryboy/deliveryboy.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="deliveryboy_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lblsmscredit" hidden runat="server" Text=""></asp:Label>

    <div class="row" style="margin-top: 20px;">

        <div class="col-lg-3 col-md-6">

            <div class="small-box" style="background-color: #3f51b5;">
                <div class="inner">
                    <h3>
                        <asp:Label ID="lbltodayorder" runat="server" Text="0"></asp:Label>
                    </h3>
                    <p style="color: white">Today Order</p>
                </div>
                <div class="icon">
                    <i class="fas fa-asterisk"></i>
                </div>

            </div>
        </div>

        <div class="col-lg-3 col-md-6">

            <div class="small-box" style="background-color: #4db6ac;">
                <div class="inner">
                    <h3>
                        <asp:Label ID="lbltodayPending" runat="server" Text="0"></asp:Label>
                    </h3>
                    <p style="color: white">Pending Order</p>
                </div>
                <div class="icon">
                    <i class="fas fa-expand-arrows-alt"></i>
                </div>

            </div>
        </div>

        <div class="col-lg-3 col-md-6">
            <div class="small-box" style="background-color: #9575cd;">
                <div class="inner">
                    <h3>
                        <asp:Label ID="lbl_Delivered_order" runat="server" Text="0"></asp:Label>
                    </h3>
                    <p style="color: white">Delivered Order</p>
                </div>
                <div class="icon">
                    <i class="fas fa-gift"></i>
                </div>

            </div>
        </div>

        <div class="col-lg-3 col-md-6">

            <div class="small-box " style="background-color: #ff8a65;">
                <div class="inner">
                    <h3>
                        <asp:Label ID="lbltotalOrder" runat="server" Text="0"></asp:Label>
                    </h3>
                    <p style="color: white">Total Order</p>
                </div>
                <div class="icon">
                    <i class="fas fa-user-friends"></i>
                </div>

            </div>

        </div>
    </div>


    <div class="row">

        <div class="col-lg-12 col-md-12">
            <div class="panel panel-white">
                <div class="panel-heading">
                    <h4 class="panel-title" style="color: #3f51b5">Recent Assigned Orders</h4>
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
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                <asp:Repeater ID="rptbindorderdata" OnItemDataBound="rptbindorderdata_ItemDataBound" runat="server">
                                    <itemtemplate>

                                        <asp:Label ID="lblorderid" hidden runat="server" Text='<%# Eval("order_id") %>'></asp:Label>

                                        <tr>
                                            <td>
                                                <a href="order-details.aspx?ref=<%# Eval("order_id") %>" target="_blank">
                                                    <%# Eval("order_id") %>
                                                </a>
                                            </td>
                                            <td>
                                                <%# Eval("order_date") %>
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
                                                <a class="btn btn-primary"
                                                    href="order-details.aspx?ref=<%# Eval("order_id") %>"
                                                    target="_blank"
                                                    title="View Order Details">
                                                    <i class="fa fa-eye"></i>
                                                </a>
                                            </td>

                                        </tr>


                                    </itemtemplate>
                                </asp:Repeater>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>




    </div>
</asp:Content>

