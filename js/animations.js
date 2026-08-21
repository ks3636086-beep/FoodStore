document.addEventListener("DOMContentLoaded", function () {

    const products = document.querySelectorAll(".product-reveal");

    products.forEach((product, index) => {

        product.style.opacity = "0";
        product.style.transform = "translateY(40px)";
        product.style.transition =
            "opacity 0.6s ease, transform 0.6s ease";

        setTimeout(() => {
            product.style.opacity = "1";
            product.style.transform = "translateY(0)";
        }, index * 100);

    });


    // Wishlist popup animation
    gsap.from(".wishlist-pop", {
        scale: 0,
        rotation: -30,
        opacity: 0,
        duration: 0.8,
        ease: "back.out(2)"
    });


});