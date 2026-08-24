<%@ Page Title="" Language="C#" MasterPageFile="~/auth/admin.master" AutoEventWireup="true" CodeFile="Refund_Requests.aspx.cs" Inherits="auth_Refund_Requests" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="alert" id="alert_container"></div>

    <div class="row"></div>
    <br />

    <div id="accordion-container">
        <div class="panel-group" id="accordion">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapsetwo" style="text-decoration: none">Refund Requests</a>
                    </h4>
                </div>

                <div id="collapsetwo" class="panel-collapse collapse in">
                    <div class="panel panel-white">
                        <div class="panel-body">
                            <br />


                            <%--   <div class="col-md-12">

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">By Order Status</label>
                                        <asp:DropDownList ID="dblorderstatus" AutoPostBack="true" class="form-control" runat="server" OnSelectedIndexChanged="dblorderstatus_SelectedIndexChanged">
                                            <asp:ListItem>All</asp:ListItem>
                                            <asp:ListItem>Delivered</asp:ListItem>
                                            <asp:ListItem>Assigned</asp:ListItem>
                                            <asp:ListItem>Return Assigned</asp:ListItem>
                                             
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-3" id="date_from" runat="server">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Date<span style="color: red">&nbsp;*</span> </label>
                                        <asp:TextBox ID="txt_date_from" TextMode="Date" runat="server" class="form-control" placeholder=""></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-3" id="btn_search" runat="server">
                                    <button type="submit" id="btnsearch" runat="server" onserverclick="btnsearch_ServerClick" class="btn btn-success" style="margin-top: 22px">Search</button>
                                </div>

                            </div>--%>

                            <div class="col-md-12">


                                <div class="body-box table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>

                                                <th>#Order</th>
                                                <th>Customer</th>
                                                <th>Return Date</th>
                                                <th>Return Time</th>
                                                <th>Return Status</th>
                                                <th>Refund Amount</th>
                                                <th>Action</th>
                                                <th>View</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                            </tr>
                                        </tfoot>
                                        <tbody>

                                            <asp:Repeater ID="rptbindorderdata" runat="server" OnItemCommand="rptbindorderdata_ItemCommand">
                                                <ItemTemplate>

                                                    <tr>

                                                        <td>
                                                            <a href="order-details.aspx?ref=<%# Eval("order_id") %>" target="_blank">
                                                                <%# Eval("order_id") %>
                                                            </a>
                                                        </td>

                                                        <td>
                                                            <%# Eval("customer_name") %>
                                                        </td>
                                                        <td>
                                                            <%# Eval("order_return_date") %>
                                                        </td>
                                                        <td><%# Eval("order_return_time") %>
                                                        </td>
                                                        <td>
                                                            <%# Eval("order_status") %>
                                                        </td>

                                                        <td>₹ <%# Eval("total_order_amount") %>
                                                         </td>


                                                        <td>
                                                            <asp:Button ID="btnRefund"
                                                                runat="server"
                                                                Text="Refund"
                                                                CommandName="Refund"
                                                                CommandArgument='<%# Eval("order_id") %>'
                                                                CssClass="btn btn-success btn-sm"
                                                                OnClientClick="return confirm('Are you sure you want to process this refund?');"
                                                                Visible='<%# Eval("order_status").ToString() == "Return Completed" %>' />

                                                            <asp:Label ID="lblRefunded"
                                                                runat="server"
                                                                Text="Refunded"
                                                               CssClass="btn btn-success btn-sm"
                                                                Visible='<%# Eval("order_status").ToString() == "Refunded" %>'>
                                                            </asp:Label>
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

    <script>
        $(document).ready(function () {
            $('#example1').DataTable({
                dom: 'lBfrtip',
                buttons: [
                    'excel', 'pdf', 'print',
                ],
                "lengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
                "ordering": false
            });
        });
        $(document).ready(function () {
            $('#example2').DataTable();
        });
</script>


</asp:Content>

