<%@ Page Title="" Language="C#" MasterPageFile="~/auth/admin.master" AutoEventWireup="true" CodeFile="Return_Request.aspx.cs" Inherits="auth_add_about" %>

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
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapsetwo" style="text-decoration: none">Assign Return</a>
                    </h4>
                </div>

                <div id="collapsetwo" class="panel-collapse collapse in">
                    <div class="panel panel-white">
                        <div class="panel-body">
                            <br />

                            <div class="col-md-12">

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Delivery boy</label>
                                        <asp:DropDownList ID="dblorderstatus" AutoPostBack="true" class="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-3" id="btn_search" runat="server">
                                    <button type="submit" id="btnsearch" runat="server" class="btn btn-success" style="margin-top: 22px" onserverclick="btnsearch_ServerClick">Assign Return</button>
                                </div>

                            </div>

                            <div class="col-md-12">


                                <div class="body-box table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>#Order</th>
                                                <th>Request Date</th>
                                                <th>Customer</th>
                                                <th>Return Reason</th>
                                                <th>Comment</th>
                                                <th>Return Status</th>
                                                <th>Items</th>
                                                <th>Return Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                            </tr>
                                        </tfoot>
                                        <tbody>

                                            <asp:Repeater ID="rptbindorderdata" runat="server" OnItemCommand="rptbindorderdata_ItemCommand" >
                                                <ItemTemplate>

                                                    <asp:Label ID="lblorderid" hidden runat="server" Text='<%# Eval("order_id") %>'></asp:Label>

                                                    <tr>

                                                        <td>
                                                            <asp:CheckBox ID="chk_delete" runat="server" />
                                                        </td>
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
                                                        <td><%# Eval("order_return_comment") %>
                                                        </td>
                                                        <td>
                                                            <%# Eval("order_status") %>
                                                        </td>

                                                        <td>
                                                            <asp:Label ID="lblnoofitems" runat="server" Text="0"></asp:Label>
                                                        </td>

                                                        <td>
                                                            <asp:Button ID="btnReject"
                                                                runat="server"
                                                                Text="Reject"
                                                                CommandName="Reject"
                                                                CommandArgument='<%# Eval("order_id") %>'
                                                                CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Are you sure you want to reject this return request?');" />
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

