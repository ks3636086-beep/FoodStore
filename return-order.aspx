<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="return-order.aspx.cs" Inherits="return_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container m-3" >
        <div class="card p-4">
            <h4>Return Order</h4>

            <div class="form-group">
                <label>Return Reason</label>
                <asp:DropDownList ID="ddlReturnReason" runat="server" CssClass="form-control">
                    <asp:ListItem>Please Select</asp:ListItem>
                    <asp:ListItem>Product Damaged</asp:ListItem>
                    <asp:ListItem>Wrong Product Received</asp:ListItem>
                    <asp:ListItem>Product Quality Issue</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group mt-3">
                <label>Return Comment</label>
                <asp:TextBox ID="txtReturnComment" runat="server"
                    CssClass="form-control" TextMode="MultiLine" Rows="4">
            </asp:TextBox>
            </div>

            <br />


            <button id="btnReturnSubmit" runat="server"
                  onserverclick="btnReturnSubmit_ServerClick"
                class="btn btn-success">
                Submit Return
       
            </button>
            <asp:Label ID="lblOrderId" runat="server"></asp:Label>
        </div>
    </div>

</asp:Content>

