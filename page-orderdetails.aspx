<%@ Page Language="C#" AutoEventWireup="true" CodeFile="page-orderdetails.aspx.cs" Inherits="page_orderdetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Confirmation - Food Store</title>
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

        .success-card {
            max-width: 580px;
            width: 100%;
            border: 1px solid #e3e8ee;
            border-radius: 1rem;
            background-color: #ffffff;
        }

        .success-icon-wrapper {
            width: 72px;
            height: 72px;
            background-color: #d1e7dd;
            color: #0f5132;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 2.25rem;
        }

        .order-info-card {
            background-color: #f8f9fa;
            border: 1px solid #e9ecef;
            border-radius: 0.75rem;
        }

        .btn-custom {
            height: 44px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 0.95rem;
            border-radius: 0.5rem;
            transition: all 0.2s ease-in-out;
        }

        /* Responsive refinements for mobile */
        @media (max-width: 575.98px) {
            .success-card {
                border-radius: 0.75rem;
            }

            .success-icon-wrapper {
                width: 60px;
                height: 60px;
                font-size: 1.75rem;
            }

            .btn-container {
                flex-direction: column-reverse;
                gap: 0.75rem !important;
            }

            .btn-custom {
                width: 100% !important;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="min-vh-100 d-flex align-items-center justify-content-center py-4 px-3">

            <!-- MAIN CONFIRMATION CARD -->
            <div class="success-card shadow-sm p-4 p-md-5 text-center my-auto">

                <!-- 1. SUCCESS ICON & HEADER -->
                <div class="mb-3">
                    <div class="success-icon-wrapper mb-3">
                        <i class="fas fa-check"></i>
                    </div>
                    <h1 class="h3 fw-bold text-dark mb-1">Order Placed Successfully!</h1>
                    <p class="text-muted small mb-0">Thank you for your purchase with Food Store.</p>
                </div>

                <!-- 2. ORDER INFORMATION SUMMARY CARD -->
                <div class="order-info-card p-3 my-4 text-start">
                    <div class="row g-3 align-items-center">
                        <div class="col-6 border-end">
                            <span class="d-block text-muted small fw-semibold text-uppercase" style="letter-spacing: 0.5px; font-size: 0.75rem;">Order Status</span>
                            <span class="badge bg-success-subtle text-success fw-bold px-2 py-1 mt-1">
                                <i class="fas fa-circle-check me-1"></i>Confirmed
                            </span>
                        </div>
                        <div class="col-6">
                            <span class="d-block text-muted small fw-semibold text-uppercase" style="letter-spacing: 0.5px; font-size: 0.75rem;">Order ID</span>
                            <div class="fw-bold text-dark text-truncate mt-1">
                                <!-- PRESERVED: oredr_id label -->
                                <asp:Label ID="oredr_id" runat="server"><b style="color:black;">ODR-1</b></asp:Label>
                            </div>
                        </div>
                    </div>
                    <hr class="my-3 opacity-25" />
                    <div class="d-flex align-items-center gap-2 text-secondary small">
                        <i class="fas fa-truck text-success"></i>
                        <span>Estimated Delivery: <strong>3–5 Business Days</strong></span>
                    </div>
                </div>

                <!-- 3. SHIPPING NOTICE -->
                <p class="text-secondary small mb-4 px-md-2">
                    Your order has been successfully placed and will be shipped within 3–5 days. We will send you an email as soon as your parcel is on its way.
               
                </p>

                <!-- 4. ACTION BUTTONS -->
                <div class="d-flex align-items-center justify-content-center gap-3 btn-container mb-4">
                    <!-- Secondary Option: Continue Shopping -->
                    <a href="shop.aspx" class="btn btn-outline-secondary btn-custom px-4 flex-fill text-decoration-none">
                        <i class="fas fa-shopping-bag me-2"></i>Continue Shopping
                    </a>

                    <!-- PRESERVED: btnhome button with onserverclick="btnhome_ServerClick" -->
                    <button id="btnhome" runat="server" onserverclick="btnhome_ServerClick" class="btn btn-success btn-custom px-4 flex-fill">
                        <i class="fas fa-home me-2"></i>Back To Home
                   
                    </button>
                </div>

                <!-- 5. SUPPORT SECTION -->
                <div class="border-top pt-3 text-center">
                    <p class="text-muted small mb-0">
                        Need help with your order? 
                       
                        <a href="contact.aspx" class="text-success text-decoration-none fw-semibold ms-1">Contact Support <i class="fas fa-arrow-right fs-xs ms-1"></i>
                        </a>
                    </p>
                </div>

            </div>

        </div>
    </form>
</body>
</html>
