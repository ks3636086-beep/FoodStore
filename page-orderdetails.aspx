<%@ Page Language="C#" AutoEventWireup="true" CodeFile="page-orderdetails.aspx.cs" Inherits="page_orderdetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
    <center>
        <div style="margin-top:250px;">
            <asp:Label runat="server"><b style="color:black;">Thanks for your purchase. Your Order Id is </b></asp:Label>
            <asp:Label ID="oredr_id" runat="server"><b style="color:black;">ODR-1</b></asp:Label>.
            <br />
            <p><b style="color:black;">will be shipped within 3-5 days. We will send you an email as soon as your parcel is on its way.</b></p>
            <br />
            <a href="#" class="text-decoration-none" >
                <span class="h1 text-uppercase text-primary bg-dark px-2">Food</span>
                <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Store</span>
            </a>
            <br />
            <button style="margin-top:30px;" id="btnhome" runat="server" onserverclick="btnhome_ServerClick" class="btn btn-danger">Back To Home</button>
        </div>
    </center>
</form>
</body>
</html>
