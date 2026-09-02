<%@ Page Title="" Language="C#" MasterPageFile="~/auth/admin.master" AutoEventWireup="true" CodeFile="Coupon_List.aspx.cs" Inherits="auth_Coupon_List" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row"></div>
    <br />
    <!-- Top Button: Add Coupon -->
    <a href="Add_Coupon.aspx" class="btn btn-success" runat="server">
        <i class="fas fa-plus"></i>&nbsp;Add Coupon
    </a>
    <br />
    <br />

    <div class="alert" id="alert_container"></div>

    <div id="accordion-container">
        <div class="panel-group" id="accordion">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" style="text-decoration: none">Manage Coupon
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in">
                    <div class="panel panel-white">
                        <div class="panel-body">
                            <br />

                            <div class="table-responsive">

                                <table id="tbl_coupons" class="table table-striped table-bordered table-hover" style="width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>Coupon Name</th>
                                            <th>Coupon Code</th>
                                            <th>Apply Customer</th>
                                            <th>Discount (%)</th>
                                            <th>From Date</th>
                                            <th>To Date</th>
                                            <th>Coupon Detail</th>
                                            <th>Status</th>
                                            <th style="width: 120px; text-align: center;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rptCoupons" runat="server" OnItemCommand="rptCoupons_ItemCommand">
                                            <itemtemplate>
                                                <tr>
                                                    <td><%# Eval("coupon_name") %></td>
                                                    <td>
                                                        <span class="label label-info" style="font-size: 11px;"><%# Eval("coupon_code") %></span>
                                                    </td>
                                                    <td><%# Eval("apply_customer") %></td>
                                                    <td><%# Eval("discount_percentage") %>%</td>
                                                    <td><%# Eval("from_date", "{0:dd-MMM-yyyy}") %></td>
                                                    <td><%# Eval("to_date", "{0:dd-MMM-yyyy}") %></td>
                                                    <td>
                                                        <span title='<%# Eval("coupon_detail") %>'>
                                                            <%# Eval("coupon_detail") != null && Eval("coupon_detail").ToString().Length > 30 ? 
                                                        Eval("coupon_detail").ToString().Substring(0, 30) + "..." : 
                                                        Eval("coupon_detail") %>
                                                </span>
                                                    </td>
                                                    <td>
                                                        <span class='<%# Eval("coupon_status").ToString().ToLower() == "active" ? "label label-success" : "label label-danger" %>'>
                                                            <%# Eval("coupon_status") %>
                                                </span>
                                                    </td>
                                                    <td style="text-align: center;">
                                                        <!-- Edit Button -->
                                                        <a href='<%# "Add_Coupon.aspx?id=" + Eval("id") %>' class="btn btn-sm btn-primary" title="Edit">
                                                            <i class="fas fa-edit"></i>
                                                        </a>

                                                        <!-- Delete Button -->
                                                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteCoupon" CommandArgument='<%# Eval("id") %>'
                                                            CssClass="btn btn-sm btn-danger" Title="Delete"
                                                            OnClientClick="return confirm('Are you sure you want to delete this coupon?');">
                                                            <i class="fas fa-trash"></i>
                                                        </asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </itemtemplate>

                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>

                            <!-- Empty State Panel -->
                            <asp:Panel ID="pnlEmpty" runat="server" Visible="false" CssClass="text-center" Style="padding: 40px 15px;">
                                <i class="fas fa-tags fa-3x text-muted" style="color: #ccc; margin-bottom: 15px;"></i>
                                <h4 class="text-muted">No coupons found.</h4>
                                <p class="text-muted">You haven't added any discount coupons yet.</p>
                                <br />
                                <a href="Add_Coupon.aspx" class="btn btn-success">
                                    <i class="fas fa-plus"></i>&nbsp;Add Coupon
                                </a>
                            </asp:Panel>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- DataTables Script Initialization (Optional/Standard for Bootstrap 3) -->
    <script type="text/javascript">
        $(document).ready(function () {
            if ($('#tbl_coupons').length > 0) {
                $('#tbl_coupons').DataTable({
                    "responsive": true,
                    "autoWidth": false,
                    "order": [[0, "asc"]]
                });
            }
        });
    </script>


</asp:Content>

