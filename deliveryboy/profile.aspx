<%@ Page Title="" Language="C#" MasterPageFile="~/deliveryboy/deliveryboy.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="deliveryboy_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="panel panel-white">
        <div class="panel-heading">
            <h4 class="panel-title" style="color: #3f51b5;">My Profile</h4>
        </div>

        <div class="panel-body">

            <div class="row">

                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label>Profile Photo</label><br />
                        <asp:Image ID="img_profile" runat="server" Width="100px" Height="100px" />
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label>Name</label>
                        <asp:TextBox ID="txt_name" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label>Mobile No.</label>
                        <asp:TextBox ID="txt_mobile" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label>Email</label>
                        <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>


                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label>Gender</label>
                        <asp:TextBox ID="txt_gender" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>


                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label>State</label>
                        <asp:TextBox ID="txt_state" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>


                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label>City</label>
                        <asp:TextBox ID="txt_city" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>


                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label>Pincode</label>
                        <asp:TextBox ID="txt_pincode" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>


                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label>Status</label>
                        <asp:TextBox ID="txt_status" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>


                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label>Joining Date</label>
                        <asp:TextBox ID="txt_date" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>


                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="form-group">
                        <label>Address</label>
                        <asp:TextBox ID="txt_address" TextMode="MultiLine" Rows="3" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>

            </div>
<%--            <asp:Button ID="btn_update" runat="server" Text="Update Profile" CssClass="btn btn-success" />--%>

        </div>
    </div>

</asp:Content>

