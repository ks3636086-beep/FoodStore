<%@ Page Language="C#" AutoEventWireup="true" CodeFile="my-profile.aspx.cs" Inherits="my_profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Profile - Food Store</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

    <style>
        body {
            background-color: #f8f9fa;
            color: #212529;
            font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        }

        /* Profile Card Container */
        .profile-card {
            max-width: 900px;
            width: 100%;
            border: 1px solid #e3e8ee;
            border-radius: 0.85rem;
            background-color: #ffffff;
        }

        /* Avatar Container */
        .profile-avatar-box {
            width: 56px;
            height: 56px;
            background-color: #e8f5e9;
            color: #198754;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        /* Form Inputs Custom Styling */
        .form-control-custom {
            height: 44px;
            border-radius: 0.5rem;
            border: 1px solid #ced4da;
            padding: 0.5rem 0.85rem;
            font-size: 0.95rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

            .form-control-custom:focus {
                border-color: #198754;
                box-shadow: 0 0 0 0.25rem rgba(25, 135, 84, 0.15);
            }

        /* Submit Button Styling */
        .btn-save {
            height: 44px;
            min-width: 140px;
            font-weight: 600;
            font-size: 0.95rem;
            border-radius: 0.5rem;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        /* Responsive Mobile Behavior */
        @media (max-width: 575.98px) {
            .profile-card {
                border-radius: 0.5rem;
            }

            .profile-avatar-box {
                width: 48px;
                height: 48px;
                font-size: 1.25rem;
            }

            .btn-save {
                width: 100% !important;
            }
        }
    </style>
</head>
<body>
    <form id="form" runat="server">

        <div class="container-xl min-vh-100 d-flex align-items-center justify-content-center py-4 px-3">

            <!-- MAIN PROFILE CARD -->
            <div class="profile-card shadow-sm p-4 p-md-5 my-auto">

                <!-- 1. HEADER SECTION -->
                <div class="d-flex align-items-center gap-3 pb-3 mb-4 border-bottom">
                    <div class="profile-avatar-box flex-shrink-0">
                        <i class="fas fa-user"></i>
                    </div>
                    <div>
                        <h1 class="h4 fw-bold text-dark mb-0">My Profile</h1>
                        <p class="text-muted small mb-0">Manage your personal information and account settings.</p>
                    </div>
                </div>

                <!-- 2. PERSONAL INFORMATION SECTION -->
                <div class="mb-4">
                    <h2 class="h6 fw-bold text-secondary text-uppercase mb-3" style="letter-spacing: 0.5px; font-size: 0.8rem;">
                        <i class="fas fa-id-card me-1 text-success"></i>Personal Information
                    </h2>

                    <!-- FORM GRID -->
                    <div class="row g-3">

                        <!-- Name Field -->
                        <div class="col-md-6">
                            <label for="name" class="form-label small fw-semibold text-secondary">Full Name <span class="text-danger">*</span></label>
                            <!-- PRESERVED ID: name -->
                            <asp:TextBox ID="name" runat="server" CssClass="form-control form-control-custom" placeholder="Enter your full name"></asp:TextBox>
                        </div>

                        <!-- Email Field -->
                        <div class="col-md-6">
                            <label for="email" class="form-label small fw-semibold text-secondary">Email Address <span class="text-danger">*</span></label>
                            <!-- PRESERVED ID: email -->
                            <asp:TextBox ID="email" runat="server" CssClass="form-control form-control-custom" placeholder="name@example.com"></asp:TextBox>
                        </div>

                        <!-- Mobile Field -->
                        <div class="col-md-4">
                            <label for="mobileno" class="form-label small fw-semibold text-secondary">Mobile No. <span class="text-danger">*</span></label>
                            <!-- PRESERVED ID: mobileno -->
                            <asp:TextBox ID="mobileno" runat="server" CssClass="form-control form-control-custom" placeholder="10-digit mobile number"></asp:TextBox>
                        </div>

                        <!-- Gender Field -->
                        <div class="col-md-4">
                            <label for="gender" class="form-label small fw-semibold text-secondary">Gender <span class="text-danger">*</span></label>
                            <!-- PRESERVED ID: gender -->
                            <asp:TextBox ID="gender" runat="server" CssClass="form-control form-control-custom" placeholder="Male / Female / Other"></asp:TextBox>
                        </div>

                        <!-- DOB Field -->
                        <div class="col-md-4">
                            <label for="dob" class="form-label small fw-semibold text-secondary">Date of Birth <span class="text-danger">*</span></label>
                            <!-- PRESERVED ID: dob & TextMode="Date" -->
                            <asp:TextBox ID="dob" TextMode="Date" runat="server" CssClass="form-control form-control-custom"></asp:TextBox>
                        </div>

                    </div>
                </div>

                <!-- 3. SUBMIT ACTION BUTTON -->
                <div class="pt-2 mb-4">
                    <!-- PRESERVED ID: btnsubmit & onserverclick="btnsubmit_ServerClick" -->
                    <button type="submit"
                        class="btn btn-success btn-save shadow-sm"
                        id="btnsubmit"
                        runat="server"
                        onserverclick="btnsubmit_ServerClick">
                        <i class="fas fa-check-circle me-2"></i>Save Changes
                   
                    </button>
                </div>

                <!-- 4. INFORMATIONAL FOOTER -->
                <div class="bg-light border rounded-3 p-3 d-flex align-items-center gap-2 text-muted small">
                    <i class="fas fa-info-circle text-success fs-6"></i>
                    <span>Keep your profile information up to date for a better shopping and delivery experience.</span>
                </div>

            </div>

        </div>

    </form>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/bootstrap.bundle.min.js"></script>
</body>
</html>
