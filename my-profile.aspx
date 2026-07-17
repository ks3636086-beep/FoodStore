<%@ Page Language="C#" AutoEventWireup="true" CodeFile="my-profile.aspx.cs" Inherits="my_profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form id="form" runat="server">

        <div class="container-fluid">
            <div class="row px-xl-5 mt-5">

                <div class="col-lg-12">
                    <div class="bg-light p-30">

                        <h3 class="mb-4">My Profile</h3>

                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Name *</label>
                                    <asp:TextBox ID="name" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>


                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Email *</label>
                                    <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>


                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Mobile No. *</label>
                                    <asp:TextBox ID="mobileno" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>


                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Gender *</label>
                                    <asp:TextBox ID="gender" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>


                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>DOB *</label>
                                    <asp:TextBox ID="dob" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                        </div>


                        <div class="form-group mb-0">
                            <button type="submit"
                                class="btn btn-success px-4"
                                id="btnsubmit"
                                runat="server" onserverclick="btnsubmit_ServerClick">
                                Submit
                            </button>
                        </div>


                    </div>
                </div>

            </div>
        </div>

    </form>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>
