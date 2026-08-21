<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact-us.aspx.cs" Inherits="contact_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Modern Contact Us Custom Styling */
        .contact-card {
            background: #ffffff;
            border-radius: 16px;
            border: 1px solid #eef2f5;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
        }

        .form-control-custom {
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            padding: 12px 16px;
            font-size: 0.95rem;
            transition: all 0.25s ease;
            background-color: #f8fafc;
        }

            .form-control-custom:focus {
                background-color: #ffffff;
                border-color: #198754;
                box-shadow: 0 0 0 4px rgba(25, 135, 84, 0.15);
                outline: none;
            }

        .info-item-icon {
            width: 48px;
            height: 48px;
            background-color: #e8f5e9;
            color: #198754;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
            flex-shrink: 0;
        }

        .map-container {
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            border: 1px solid #eef2f5;
        }

        .map-iframe {
            width: 100%;
            height: 450px;
            border: 0;
        }

        @media (max-width: 767.98px) {
            .map-iframe {
                height: 300px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- 1. Header / Breadcrumb Banner -->
    <div class="bg-light py-4 border-bottom w-100"
        data-aos="fade-down"
        data-aos-duration="800"
        data-aos-once="true">
        <div class="container-fluid px-4 px-lg-5 text-center text-md-start">
            <h2 class="fw-bold text-dark mb-1">Contact Us</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 justify-content-center justify-content-md-start">
                    <li class="breadcrumb-item">
                        <a href="default.aspx" class="text-success text-decoration-none">Home</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Contact Us</li>
                </ol>
            </nav>
        </div>
    </div>

    <!-- 2. Main Contact Section (Form + Information) -->
    <div class="container-fluid px-3 px-md-4 px-lg-5 py-4 py-md-5">
        <div class="row g-4 g-lg-5">

            <!-- LEFT COLUMN: GET IN TOUCH (Contact Form) -->
            <div class="col-lg-8 col-md-12">
                <div class="contact-card p-4 p-md-5 h-100"
                    data-aos="fade-up"
                    data-aos-duration="800"
                    data-aos-once="true">
                    <h3 class="fw-bold text-dark mb-2">GET IN TOUCH</h3>
                    <p class="text-muted small mb-4">Have questions or feedback? Fill out the form below and our team will get back to you shortly.</p>

                    <div class="row g-3">
                        <!-- Your Name -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label fw-semibold text-dark small mb-1">Your Name</label>
                                <!-- Preserved ID="name" -->
                                <asp:TextBox runat="server" type="text" class="form-control form-control-custom" ID="name" name="name" placeholder="John Doe" required="required" data-error="Please enter your name"></asp:TextBox>
                                <div class="help-block with-errors text-danger small mt-1"></div>
                            </div>
                        </div>

                        <!-- Your Email -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label fw-semibold text-dark small mb-1">Your Email</label>
                                <!-- Preserved ID="email" -->
                                <asp:TextBox runat="server" type="text" placeholder="name@example.com" ID="email" class="form-control form-control-custom" name="name" required="required" data-error="Please enter your email"></asp:TextBox>
                                <div class="help-block with-errors text-danger small mt-1"></div>
                            </div>
                        </div>

                        <!-- Subject -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label fw-semibold text-dark small mb-1">Subject</label>
                                <!-- Preserved ID="subject" -->
                                <asp:TextBox runat="server" type="text" class="form-control form-control-custom" ID="subject" name="name" placeholder="Inquiry about order" required="required" data-error="Please enter your Subject"></asp:TextBox>
                                <div class="help-block with-errors text-danger small mt-1"></div>
                            </div>
                        </div>

                        <!-- Contact / Mobile Number -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label fw-semibold text-dark small mb-1">Contact Number</label>
                                <!-- Preserved ID="mobileno" -->
                                <asp:TextBox runat="server" type="text" class="form-control form-control-custom" ID="mobileno" name="name" placeholder="+91 98765 43210" required="required" data-error="Please enter your Contact"></asp:TextBox>
                                <div class="help-block with-errors text-danger small mt-1"></div>
                            </div>
                        </div>

                        <!-- Your Message -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="form-label fw-semibold text-dark small mb-1">Your Message</label>
                                <!-- Preserved ID="message" -->
                                <asp:TextBox runat="server" TextMode="MultiLine" class="form-control form-control-custom" ID="message" placeholder="How can we help you?" Rows="4" data-error="Write your message" required="required"></asp:TextBox>
                                <div class="help-block with-errors text-danger small mt-1"></div>
                            </div>
                        </div>

                        <!-- Submit Button -->
                        <div class="col-md-12 mt-4"
                            data-aos="fade-up"
                            data-aos-duration="800"
                            data-aos-once="true">
                            <div class="submit-button">
                                <!-- Preserved ID="submit" and onserverclick="submit_ServerClick" -->
                                <button runat="server" class="btn btn-success btn-lg px-5 py-3 rounded-pill fw-semibold fs-6 shadow-sm w-100 w-md-auto" id="submit" onserverclick="submit_ServerClick" type="submit">
                                    <i class="fas fa-paper-plane me-2"></i>Send Message
                               
                                </button>
                                <div id="msgSubmit" class="h5 text-center hidden mt-3"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- RIGHT COLUMN: CONTACT INFORMATION -->
            <div class="col-lg-4 col-md-12"
                data-aos="fade-left"
                data-aos-duration="800"
                data-aos-once="true">
                <div class="contact-card p-4 p-md-5 h-100">
                    <h3 class="fw-bold text-dark mb-4">CONTACT INFO</h3>

                    <div class="d-flex flex-column gap-4">

                        <!-- Address Card -->
                        <div class="d-flex align-items-start gap-3"
                            data-aos="fade-up"
                            data-aos-duration="800"
                            data-aos-once="true">
                            <div class="info-item-icon">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <div>
                                <h6 class="fw-bold text-dark mb-1">Our Address</h6>
                                <p class="text-muted small mb-0 leading-relaxed">
                                    Preston Street, Wichita,<br>
                                    KS 87213, United States
                               
                                </p>
                            </div>
                        </div>

                        <!-- Phone Card -->
                        <div class="d-flex align-items-start gap-3"
                            data-aos="fade-up"
                            data-aos-duration="800"
                            data-aos-once="true">
                            <div class="info-item-icon">
                                <i class="fas fa-phone-alt"></i>
                            </div>
                            <div>
                                <h6 class="fw-bold text-dark mb-1">Phone Number</h6>
                                <p class="text-muted small mb-0">
                                    <a href="tel:+1-888705770" class="text-muted text-decoration-none hover-success">+1-888 705 770</a>
                                </p>
                            </div>
                        </div>

                        <!-- Email Card -->
                        <div class="d-flex align-items-start gap-3"
                            data-aos="fade-up"
                            data-aos-duration="800"
                            data-aos-once="true">
                            <div class="info-item-icon">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <div>
                                <h6 class="fw-bold text-dark mb-1">Email Address</h6>
                                <p class="text-muted small mb-0">
                                    <a href="mailto:contactinfo@gmail.com" class="text-muted text-decoration-none hover-success">contactinfo@gmail.com</a>
                                </p>
                            </div>
                        </div>

                        <!-- Business Hours Card -->
                        <div class="d-flex align-items-start gap-3"
                            data-aos="fade-up"
                            data-aos-duration="800"
                            data-aos-once="true">
                            <div class="info-item-icon">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div>
                                <h6 class="fw-bold text-dark mb-1">Business Hours</h6>
                                <p class="text-muted small mb-0">
                                    Mon - Sat: 9:00 AM - 8:00 PM<br>
                                    Sunday: Closed
                               
                                </p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>

        <!-- 3. Google Map Section -->
        <div class="mt-5"
            data-aos="fade-right"
            data-aos-duration="800"
            data-aos-once="true">
            <h4 class="fw-bold text-dark mb-3 text-center text-md-start">Find Us On Map</h4>
            <div class="map-container">
                <iframe
                    class="map-iframe"
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14249.771146313509!2d83.36437508492025!3d26.761895689104058!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3991443725b8fa8b%3A0x6b10696b998246e6!2sGolghar%2C%20Gorakhpur%2C%20Uttar%20Pradesh!5e0!3m2!1sen!2sin!4v1700000000000!5m2!1sen!2sin"
                    allowfullscreen=""
                    loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>

    </div>



</asp:Content>

