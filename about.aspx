<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Page Banner / Header -->
    <div class="bg-light py-4 border-bottom">
        <div class="container text-center text-md-start">
            <h2 class="fw-bold text-dark mb-1">About Us</h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 justify-content-center justify-content-md-start">
                    <li class="breadcrumb-item"><a href="default.aspx" class="text-success text-decoration-none">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">About Us</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="container py-5">

        <!-- SECTION 1 & 2: About FoodStore & Our Mission -->
        <div class="row align-items-center g-4 mb-5">
            <div class="col-lg-6" data-aos="fade-right" data-aos-duration="1000">
                <div class="rounded-4 overflow-hidden shadow-sm border">
                    <img class="img-fluid w-100" src="images/about-img.jpg" alt="About FoodStore"
                        onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1542838132-92c53300491e?q=80&w=800&auto=format&fit=crop';"
                        style="object-fit: cover; max-height: 400px;" />
                </div>
            </div>
            <div class="col-lg-6"
                data-aos="fade-left"
                data-aos-duration="1000">
                <span class="badge bg-success-subtle text-success fw-bold px-3 py-2 rounded-pill border border-success border-opacity-25 mb-2">WELCOME TO FOODSTORE
                </span>
                <h2 class="fw-bold text-dark mb-3">Your One-Stop Shop for Everyday Essentials</h2>
                <p class="text-muted leading-relaxed">
                    At <strong>FoodStore</strong>, we are committed to delivering farm-fresh fruits, crisp vegetables, delicious snacks, bakery items, personal care products, and daily groceries right to your doorstep. We take the hassle out of traditional grocery shopping by connecting you with top-quality essentials in just a few clicks.
               
                </p>

                <!-- Mission Box -->
                <div class="p-3 bg-light rounded-3 border-start border-success border-4 mt-4">
                    <h6 class="fw-bold text-success mb-1">
                        <i class="fas fa-bullseye me-2"></i>Our Mission
                    </h6>
                    <p class="text-secondary small mb-0">
                        To make high-quality grocery shopping convenient, affordable, and completely reliable for every household, without compromising on freshness or speed.
                   
                    </p>
                </div>
            </div>
        </div>

        <!-- SECTION 3: Why Choose FoodStore -->
        <div class="text-center mb-4"
            data-aos="fade-up"
            data-aos-duration="800">
            <h3 class="fw-bold text-dark">Why Choose FoodStore</h3>
            <p class="text-muted small">We prioritize quality and customer satisfaction in everything we do</p>
        </div>

        <div class="row g-4 mb-5">
            <div class="col-md-4"
                data-aos="fade-up"
                data-aos-duration="800"
                data-aos-delay="100">
                <div class="card h-100 border-0 shadow-sm rounded-4 p-4 text-center bg-white hover-up">
                    <div class="bg-success-subtle text-success rounded-circle d-inline-flex align-items-center justify-content-center mb-3 mx-auto" style="width: 60px; height: 60px;">
                        <i class="fas fa-leaf fs-3"></i>
                    </div>
                    <h5 class="fw-bold text-dark">Fresh & Quality Products</h5>
                    <p class="text-muted small mb-0">
                        Sourced directly from trusted local farms and certified suppliers to ensure maximum freshness.
                   
                    </p>
                </div>
            </div>
            <div class="col-md-4"
                data-aos="fade-up"
                data-aos-duration="800"
                data-aos-delay="250">
                <div class="card h-100 border-0 shadow-sm rounded-4 p-4 text-center bg-white hover-up">
                    <div class="bg-warning-subtle text-warning rounded-circle d-inline-flex align-items-center justify-content-center mb-3 mx-auto" style="width: 60px; height: 60px;">
                        <i class="fas fa-tags fs-3"></i>
                    </div>
                    <h5 class="fw-bold text-dark">Affordable Prices</h5>
                    <p class="text-muted small mb-0">
                        Enjoy competitive market prices, daily discount offers, and incredible savings on every order.
                   
                    </p>
                </div>
            </div>
            <div class="col-md-4"
                data-aos="fade-up"
                data-aos-duration="800"
                data-aos-delay="400">
                <div class="card h-100 border-0 shadow-sm rounded-4 p-4 text-center bg-white hover-up">
                    <div class="bg-info-subtle text-info rounded-circle d-inline-flex align-items-center justify-content-center mb-3 mx-auto" style="width: 60px; height: 60px;">
                        <i class="fas fa-shipping-fast fs-3"></i>
                    </div>
                    <h5 class="fw-bold text-dark">Fast & Convenient Delivery</h5>
                    <p class="text-muted small mb-0">
                        Get your groceries packed with care and delivered straight to your door in record time.
                   
                    </p>
                </div>
            </div>
        </div>

        <!-- SECTION 4: How FoodStore Works -->
        <div class="bg-light rounded-5 p-4 p-md-5 mb-5 border"
            data-aos="fade-up"
            data-aos-duration="1000">
            <div class="text-center mb-4">
                <span class="badge bg-white text-success fw-bold px-3 py-2 rounded-pill shadow-sm mb-2">SIMPLE 3-STEP PROCESS</span>
                <h3 class="fw-bold text-dark">How FoodStore Works</h3>
            </div>
            <div class="row g-4 text-center">
                <div class="col-md-4">
                    <div class="p-3">
                        <div class="badge bg-success text-white rounded-circle fs-5 mb-3" style="width: 45px; height: 45px; line-height: 33px;">1</div>
                        <h5 class="fw-bold text-dark">Browse Products</h5>
                        <p class="text-muted small mb-0">Choose from thousands of fresh fruits, vegetables, snacks, and home needs.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-3">
                        <div class="badge bg-success text-white rounded-circle fs-5 mb-3" style="width: 45px; height: 45px; line-height: 33px;">2</div>
                        <h5 class="fw-bold text-dark">Place Your Order</h5>
                        <p class="text-muted small mb-0">Add items to your cart and check out securely using multiple payment options.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-3">
                        <div class="badge bg-success text-white rounded-circle fs-5 mb-3" style="width: 45px; height: 45px; line-height: 33px;">3</div>
                        <h5 class="fw-bold text-dark">Get It Delivered</h5>
                        <p class="text-muted small mb-0">Sit back and relax while our express delivery team brings your package right to you.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- SECTION 5: Our Promise -->
        <div class="row align-items-center g-4 mb-5">
            <div class="col-lg-6 order-lg-2"
                data-aos="fade-left"
                data-aos-duration="1000">
                <div class="rounded-4 overflow-hidden shadow-sm border">
                    <img class="img-fluid w-100" src="images/instagram-img-01.jpg" alt="Our Promise"
                        onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1578916171728-46686eac8d58?q=80&w=800&auto=format&fit=crop';"
                        style="object-fit: cover; max-height: 350px;" />
                </div>
            </div>
            <div class="col-lg-6 order-lg-1"
                data-aos="fade-right"
                data-aos-duration="1000">
                <h3 class="fw-bold text-dark mb-3">Our Promise to You</h3>
                <ul class="list-unstyled">
                    <li class="d-flex align-items-start mb-3">
                        <i class="fas fa-check-circle text-success fs-5 me-3 mt-1"></i>
                        <div>
                            <strong class="text-dark d-block">100% Quality Check</strong>
                            <span class="text-muted small">Every item undergoes strict quality checks before packing.</span>
                        </div>
                    </li>
                    <li class="d-flex align-items-start mb-3">
                        <i class="fas fa-check-circle text-success fs-5 me-3 mt-1"></i>
                        <div>
                            <strong class="text-dark d-block">Hassle-Free Returns</strong>
                            <span class="text-muted small">Easy, no-questions-asked replacement for damaged or poor-quality items.</span>
                        </div>
                    </li>
                    <li class="d-flex align-items-start">
                        <i class="fas fa-check-circle text-success fs-5 me-3 mt-1"></i>
                        <div>
                            <strong class="text-dark d-block">Dedicated Support</strong>
                            <span class="text-muted small">Our customer care team is always here to resolve any issues quickly.</span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <!-- SECTION 6: Call To Action -->
        <div class="rounded-5 p-4 p-md-5 text-center text-white shadow-sm position-relative overflow-hidden"
            style="background: linear-gradient(135deg, #14532d 0%, #1e7e34 25%, #28a745 50%, #34b94f 75%, #5dcc72 100%);">
            <div class="position-relative"
                style="z-index: 2;"
                data-aos="fade-up"
                data-aos-duration="1000">
                <h2 class="fw-bold mb-2">Ready to Shop?</h2>
                <p class="mb-4 opacity-90 mx-auto" style="max-width: 500px;">
                    Explore our fresh groceries, daily essentials, and exclusive deals right now.
               
                </p>
                <a href="shop.aspx" class="btn btn-light text-success fw-bold rounded-pill px-5 py-3 shadow-sm hover-scale">Shop Now <i class="fas fa-arrow-right ms-2"></i>
                </a>
            </div>
        </div>

    </div>

    <style>
        .hover-up {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

            .hover-up:hover {
                transform: translateY(-5px);
                box-shadow: 0 0.5rem 1.5rem rgba(0,0,0,0.08) !important;
            }

        .hover-scale {
            transition: transform 0.2s ease;
        }

            .hover-scale:hover {
                transform: scale(1.05);
            }
    </style>


</asp:Content>


