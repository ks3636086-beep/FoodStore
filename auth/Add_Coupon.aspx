<%@ Page Title="" Language="C#" MasterPageFile="~/auth/admin.master" AutoEventWireup="true" CodeFile="Add_Coupon.aspx.cs" Inherits="auth_Add_Coupon" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row"></div>
    <br />
    <a href="Coupon_List.aspx" class="btn btn-success" runat="server">
        <i class="fas fa-tags"></i>&nbsp;Manage Coupon
    </a>
    <br />

    <div class="alert" id="alert_container"></div>

    <div id="accordion-container">
        <div class="panel-group" id="accordion">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" style="text-decoration: none">Add Coupon
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in">
                    <div class="panel panel-white">
                        <div class="panel-body">
                            <br />

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Coupon Name<span style="color: red">&nbsp;*</span></label>
                                    <asp:TextBox ID="txt_coupon_name" runat="server" class="form-control" placeholder="Enter coupon name"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Coupon Code<span style="color: red">&nbsp;*</span></label>
                                    <asp:TextBox ID="txt_coupon_code" runat="server" class="form-control" placeholder="Enter coupon code"></asp:TextBox>
                                </div>
                            </div>


                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Apply Customer<span style="color: red">&nbsp;*</span></label>
                                    <asp:DropDownList ID="ddl_apply_customer" class="selectpicker form-control"
                                        data-live-search="true" runat="server"
                                        AutoPostBack="true"
                                        OnSelectedIndexChanged="ddl_apply_customer_SelectedIndexChanged">
                                        <asp:ListItem Value="All">All Customers</asp:ListItem>
                                        <asp:ListItem Value="Specific">Specific Customer</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-6" id="specific_customer_container" runat="server" style="display:none;">
                                <div class="form-group">
                                    <label>Select Customer<span style="color: red">&nbsp;*</span></label>
                                    <asp:ListBox ID="ddl_specific_customer" class="selectpicker form-control"
                                        data-live-search="true" SelectionMode="Multiple" runat="server"></asp:ListBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Discount Percentage (%)<span style="color: red">&nbsp;*</span></label>
                                    <asp:TextBox ID="txt_discount_percentage" runat="server" TextMode="Number" class="form-control" placeholder="Enter discount %"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>From Date<span style="color: red">&nbsp;*</span></label>
                                    <asp:TextBox ID="txt_from_date" runat="server" TextMode="DateTimeLocal" class="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>To Date<span style="color: red">&nbsp;*</span></label>
                                    <asp:TextBox ID="txt_to_date" runat="server" TextMode="DateTimeLocal" class="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Coupon Detail</label>
                                    <asp:TextBox ID="txt_coupon_detail" runat="server" TextMode="MultiLine" Rows="3" class="form-control" placeholder="Enter coupon details"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Coupon Status<span style="color: red">&nbsp;*</span></label>
                                    <asp:DropDownList ID="ddl_coupon_status" class="form-control" runat="server">
                                        <asp:ListItem Value="Active">Active</asp:ListItem>
                                        <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btnsave" runat="server" onserverclick="btnsave_ServerClick" class="btn btn-success">
                                <i class="fas fa-save"></i>&nbsp;Submit & Save
                                                    
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

