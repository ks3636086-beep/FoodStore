<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ecommerce_customer.aspx.cs" Inherits="ecommerce_customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta content="width=device-width, initial-scale=1" name="viewport" />


    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial;
            background: linear-gradient(135deg, #111, #1b5e20);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 25px;
        }

        .login-box {
            width: 380px;
            background: #fff;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.3);
        }

            .login-box h2 {
                text-align: center;
                color: #1b5e20;
                margin-bottom: 25px;
            }

        .input-box {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            background: #1b5e20;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

            .btn-login:hover {
                background: black;
            }

        @media(max-width:500px) {
            .login-box {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="login-box">
                <h2>Customer Login</h2>
                <asp:TextBox ID="txtname" runat="server" CssClass="input-box" placeholder="Your Name "></asp:TextBox>

                <asp:TextBox ID="txtemail" runat="server" CssClass="input-box" placeholder="Email"></asp:TextBox>

                <%--                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-box" placeholder="Password"></asp:TextBox>--%>
                <asp:TextBox ID="txtmobileno" runat="server" CssClass="input-box" placeholder="Mobile"></asp:TextBox>

                <asp:Button ID="btnLogin" OnClick="btnLogin_Click" runat="server" Text="Login" CssClass="btn-login" />
            </div>
        </div>

        <asp:Label ID="lbltempid" hidden runat="server" Text=""></asp:Label>
        <asp:Label ID="lblid" hidden runat="server" Text=""></asp:Label>

    </form>
</body>
</html>
