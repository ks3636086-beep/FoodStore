<%@ Page Title="" Language="C#" MasterPageFile="~/auth/admin.master" AutoEventWireup="true" CodeFile="Return_Request.aspx.cs" Inherits="auth_add_about" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <style>
        .table td, .table th {
            padding: 0.3rem !important;
            vertical-align: top;
            border-top: 1px solid #dee2e6;
            font-size: 13px !important;
        }

        .pagination-ys {
            /*display: inline-block;*/
            padding-left: 0;
            margin: 20px 0;
            border-radius: 4px;
        }

            .pagination-ys table > tbody > tr > td {
                display: inline;
            }

                .pagination-ys table > tbody > tr > td > a,
                .pagination-ys table > tbody > tr > td > span {
                    position: relative;
                    float: left;
                    padding: 8px 12px;
                    line-height: 1.42857143;
                    text-decoration: none;
                    color: #dd4814;
                    background-color: #ffffff;
                    border: 1px solid #dddddd;
                    margin-left: -1px;
                }

                .pagination-ys table > tbody > tr > td > span {
                    position: relative;
                    float: left;
                    padding: 8px 12px;
                    line-height: 1.42857143;
                    text-decoration: none;
                    margin-left: -1px;
                    z-index: 2;
                    color: #aea79f;
                    background-color: #f5f5f5;
                    border-color: #dddddd;
                    cursor: default;
                }

                .pagination-ys table > tbody > tr > td:first-child > a,
                .pagination-ys table > tbody > tr > td:first-child > span {
                    margin-left: 0;
                    border-bottom-left-radius: 4px;
                    border-top-left-radius: 4px;
                }

                .pagination-ys table > tbody > tr > td:last-child > a,
                .pagination-ys table > tbody > tr > td:last-child > span {
                    border-bottom-right-radius: 4px;
                    border-top-right-radius: 4px;
                }

                .pagination-ys table > tbody > tr > td > a:hover,
                .pagination-ys table > tbody > tr > td > span:hover,
                .pagination-ys table > tbody > tr > td > a:focus,
                .pagination-ys table > tbody > tr > td > span:focus {
                    color: #97310e;
                    background-color: #eeeeee;
                    border-color: #dddddd;
                }
    </style>


    <div class="alert" id="alert_container"></div>

    <div class="row"></div>
    <br />
    <asp:Label ID="lbl_query" hidden runat="server" Text=""></asp:Label>
    <div id="accordion-container">
        <div class="panel-group" id="accordion">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapsetwo" style="text-decoration: none">Return Requests Report</a>
                    </h4>
                </div>

                <div id="collapsetwo" class="panel-collapse collapse in">
                    <div class="panel panel-white">
                        <div class="panel-body">
                            <br />

                            <div class="col-md-4 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Search<span style="color: red">&nbsp;*</span> </label>
                                    <asp:TextBox ID="txt_search" runat="server" class="form-control" placeholder=""></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4 col-sm-12 col-xs-12">
                                <button type="submit" id="btnsearch" runat="server" style="margin-top: 30px" class="btn btn-success"><i class="fas fa-search"></i></button>
                                <button type="button" id="btnalldata" runat="server" style="margin-top: 30px" class="btn btn-primary">All Data</button>
                            </div>


                            <div class="col-lg-12 col-md-12">

                                <div class="panel-body">
                                    <div class="table-responsive project-stats">
                                        <table id="order" class="table">
                                            <thead>
                                                <tr>
                                                    <th>#Order</th>
                                                    <th>Request Date</th>
                                                    <th>Customer</th>
                                                    <th>Return Reason</th>
                                                    <th>Comment</th>
                                                    <th>Return Status</th>
                                                     <th>Item</th>
                                                    <th>Action</th>
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
                                                                <%# Eval("order_date") %>
                                                             </td>

                                                          
                                                            <td>
                                                                <%# Eval("customer_name") %>
                                            </td>
                                                            <td>
                                                                <%# Eval("order_return_reason") %>
                                            </td>
                                                            <td> <%# Eval("order_return_comment") %>
                                            </td>
                                                            <td>
                                                                <%# Eval("order_status") %>
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
                </div>
            </div>
        </div>
    </div>


</asp:Content>

