<%@ Page Title="" Language="C#" MasterPageFile="~/auth/admin.master" AutoEventWireup="true" CodeFile="assigned_delivery_boy.aspx.cs" Inherits="auth_assigned_delivery_boy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="alert" id="alert_container"></div>

    <div class="row"></div>
    <br />

    <div id="accordion-container">
        <div class="panel-group" id="accordion">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapsetwo" style="text-decoration: none">Assigned Delivery Boy</a>
                    </h4>
                </div>

                <div id="collapsetwo" class="panel-collapse collapse in">
                    <div class="panel panel-white">
                        <div class="panel-body">
                            <br />



                            <div class="col-md-12">


                                <div class="body-box table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>#Order</th>
                                                <th>Place Date</th>
                                                <th>Assigned Date</th>
                                                <th>Delivery Boy Name</th>
                                                <th>Delivery Status</th>
                                                <th>Total Amount</th>

                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                            </tr>
                                        </tfoot>
                                        <tbody id="tlist" runat="server">

                                            <asp:Repeater ID="rptbindorderdata" runat="server">
                                                <ItemTemplate>

                                                    <asp:Label ID="lblorderid" hidden runat="server" Text='<%# Eval("order_id") %>'></asp:Label>

                                                    <tr>
                                                        <td>
                                                            <a href="order-details.aspx?ref=<%# Eval("order_id") %>" target="_blank">
                                                                <%# Eval("order_id") %>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <%#   DateTime.ParseExact(Eval("order_date").ToString(), "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture).ToString("MMMM, dd, yyyy", System.Globalization.CultureInfo.InvariantCulture)  %>  
                                                        </td>
                                                        <td>
                                                            <%# Eval("assigned_date") %>
                                                        </td>
                                                        <td>
                                                            <%# Eval("delivery_boy_name") %>
                                                        </td>

                                                        <td><%# Eval("delivery_status") %>
                                                        </td>
                                                        <td>₹ <%# Eval("total_order_amount") %>
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

