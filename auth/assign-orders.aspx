<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/auth/admin.master" CodeFile="assign-orders.aspx.cs" Inherits="auth_assign_orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="alert" id="alert_container"></div>

    <div class="row"></div>
    <br />

    <div id="accordion-container">
        <div class="panel-group" id="accordion">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapsetwo" style="text-decoration: none">Assign Order</a>
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
                                <button type="submit" id="btnsearch" runat="server" class="btn btn-success" style="margin-top: 22px" onserverclick="btnsearch_ServerClick">Assign Order</button>
                            </div>

                            </div>


                            <div class="col-md-12">


                            <div class="body-box table-responsive">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Order</th>
                                            <th>Place Date</th>
                                            <th>Customer</th>
                                            <th>Mobile no.</th>
                                            <th>Payment</th>
                                            <th>Amount</th>
                                            <th>No of Items</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        </tr>
                                    </tfoot>
                                    <tbody id="tlist" runat="server">

                                        <asp:Repeater ID="rptbindorderdata" runat="server" OnItemCommand="rptbindorderdata_ItemCommand" OnItemDataBound="rptbindorderdata_ItemDataBound">
                                            <ItemTemplate>

                                                <asp:Label ID="lblorderid" hidden runat="server" Text='<%# Eval("order_id") %>'></asp:Label>
                                                  <asp:Label ID="lbl_customer_mobileno" hidden runat="server" Text='<%# Eval("customer_mobileno") %>'></asp:Label>

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
                                                        <%#   DateTime.ParseExact(Eval("order_date").ToString(), "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture).ToString("MMMM, dd, yyyy", System.Globalization.CultureInfo.InvariantCulture)  %> <%# Eval("order_delivery_time") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("customer_name") %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("customer_mobileno") %>
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
                                                        <a class="link-primary" href="order-details.aspx?ref=<%# Eval("order_id") %>" target="_blank" title="View Order Details"><i class="fa fa-eye"></i></a>
                                                        <a class="link-danger" href="#" data-toggle="modal" data-target="#Del<%#  Eval("order_id") %>" title="Delete" hidden><i class="fa fa-trash"></i></a>
                                                    
                                                    </td>

                                                </tr>

                                                <%-- Delete Modal--%>

                                                <div class="modal fade" id="Del<%# Eval("order_id") %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                <h4 class="modal-title" id="myModalLabel2">Confirm Delete</h4>
                                                            </div>

                                                            <div class="panel-body">
                                                                <asp:Label ID="lblroworderid" hidden runat="server" Text='<%# Eval("order_id") %>'></asp:Label>

                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <center>
                                                                             <label style="font-size:25px;">Are you sure you want to delete this order?</label>
                                                                        </center>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                                                                <asp:LinkButton ID="lnkdelete" CommandName="btndelete" runat="server" class="btn btn-danger" Text="Yes"></asp:LinkButton>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>


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
