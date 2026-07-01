<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Anu Food Restaurant - Authentic Indian Cuisine</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/styles.css">
    <style>
        /* Hero */
        .hero {
            background: linear-gradient(135deg, rgba(26,26,26,0.92) 0%, rgba(61,26,26,0.88) 100%),
                        url('https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=1400&q=80') center/cover no-repeat;
            min-height: 88vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            position: relative;
        }
        .hero-content { max-width: 700px; padding: 40px 20px; }
        .hero-tag {
            display: inline-block;
            background: rgba(212,160,23,0.2);
            border: 1px solid var(--gold);
            color: var(--gold);
            padding: 6px 20px;
            border-radius: 30px;
            font-size: 0.85rem;
            font-weight: 600;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-bottom: 20px;
        }
        .hero h1 {
            font-family: 'Playfair Display', serif;
            font-size: 3.5rem;
            font-weight: 700;
            line-height: 1.2;
            margin-bottom: 20px;
            text-align: center;
            color: white;
        }
        .hero h1 span { color: var(--gold); }
        .hero p { font-size: 1.1rem; color: rgba(255,255,255,0.8); margin-bottom: 35px; }
        .hero-btns { display: flex; gap: 15px; justify-content: center; flex-wrap: wrap; }

        /* Features */
        .features-section { padding: 60px 0; background: white; }
        .feature-item { text-align: center; padding: 30px 20px; }
        .feature-icon { font-size: 2.5rem; margin-bottom: 15px; }
        .feature-item h4 {
            font-family: 'Playfair Display', serif;
            font-size: 1.15rem;
            margin-bottom: 10px;
            color: var(--text-dark);
        }
        .feature-item p { color: var(--text-muted); font-size: 0.9rem; }

        /* Popular Dishes */
        .popular-section { padding: 60px 0; background: var(--light-bg); }

        /* CTA */
        .cta-section {
            background: linear-gradient(135deg, var(--dark), #3d1a1a);
            padding: 70px 20px;
            text-align: center;
            color: white;
        }
        .cta-section h2 {
            font-family: 'Playfair Display', serif;
            font-size: 2rem;
            margin-bottom: 15px;
        }
        .cta-section h2 span { color: var(--gold); }
        .cta-section p { color: rgba(255,255,255,0.7); margin-bottom: 30px; font-size: 1rem; }

        /* Testimonials */
        .testimonial-section { padding: 60px 0; background: white; }
        .testimonial-card {
            background: var(--light-bg);
            border-radius: 14px;
            padding: 30px;
            text-align: center;
            height: 100%;
        }
        .testimonial-card .stars { color: var(--gold); font-size: 1.2rem; margin-bottom: 15px; }
        .testimonial-card p { font-style: italic; color: var(--text-dark); margin-bottom: 15px; }
        .testimonial-card strong { color: var(--primary); font-size: 0.9rem; }

        /* ── RESPONSIVE ── */
        @media (max-width: 768px) {
            .hero { min-height: 65vh; }
            .hero h1 { font-size: 2rem; }
            .hero p { font-size: 0.95rem; }
            .features-section, .popular-section, .testimonial-section { padding: 36px 0; }
            .cta-section { padding: 48px 16px; }
            .cta-section h2 { font-size: 1.5rem; }
            .testimonial-card { margin-bottom: 16px; }
        }
        @media (max-width: 480px) {
            .hero h1 { font-size: 1.6rem; }
            .hero-btns .btn { width: 100%; }
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <!-- HERO SECTION -->
	<section class="hero">
	    <div class="hero-content">

	        <div class="hero-tag">
	            <i class="fas fa-star"></i> Authentic Indian Cuisine
	        </div>

	        <h1>A Taste of <span>Tradition</span>, A Touch of <span>Love</span></h1>

	        <p>Experience the finest South Indian flavours crafted with passion and served with warmth.</p>

	        <div class="hero-btns">

	            <a href="/menu" class="btn btn-primary" style="padding:14px 35px;">
	                <i class="fas fa-utensils"></i> View Our Menu
	            </a>

	            <a href="/reservation" class="btn btn-gold" style="padding:14px 35px;">
	                <i class="fas fa-calendar-alt"></i> Reserve a Table
	            </a>

	        </div>
	    </div>
	</section>

    <!-- FEATURES -->
	<section class="features-section">
	    <div class="container">
	        <div class="row justify-content-center">

	            <div class="col-md-3 col-6">
	                <div class="feature-item">
	                    <div class="feature-icon"><i class="fas fa-leaf"></i></div>
	                    <h4>Fresh Ingredients</h4>
	                    <p>Farm-fresh produce sourced daily.</p>
	                </div>
	            </div>

	            <div class="col-md-3 col-6">
	                <div class="feature-item">
	                    <div class="feature-icon"><i class="fas fa-utensils"></i></div>
	                    <h4>Expert Chefs</h4>
	                    <p>Decades of culinary expertise.</p>
	                </div>
	            </div>

	            <div class="col-md-3 col-6">
	                <div class="feature-item">
	                    <div class="feature-icon"><i class="fas fa-motorcycle"></i></div>
	                    <h4>Fast Delivery</h4>
	                    <p>Delivered right on time.</p>
	                </div>
	            </div>

	            <div class="col-md-3 col-6">
	                <div class="feature-item">
	                    <div class="feature-icon"><i class="fas fa-trophy"></i></div>
	                    <h4>Award Winning</h4>
	                    <p>Best restaurant in Guntur.</p>
	                </div>
	            </div>

	        </div>
	    </div>
	</section>

    <!-- POPULAR DISHES -->
	<section class="popular-section">
	    <div class="container">
	        <div class="section-heading">
	            <h2>Our <span>Signature</span> Dishes</h2>
	            <div class="divider"></div>
	        </div>

	        <div class="row">

	            <!-- Dish 1 -->
	            <div class="col-md-4 col-sm-6 mb-4">
	                <div class="menu-card">
					<div class="menu-card" onclick="window.location.href='menu?category=Main%20Course'" style="cursor:pointer;">
                        <img src="https://static.vecteezy.com/system/resources/thumbnails/068/494/726/small/traditional-indian-thali-meal-served-on-banana-leaf-displaying-culinary-delights-photo.jpg" alt="Pesarattu" style="width:100%;height:180px;object-fit:cover;">
                    </div>
                    <div class="menu-card-body">
                        <div class="menu-card-category">Main Course</div>
                        <div class="menu-card-title">Full Meals</div>
                        <div class="menu-card-desc">A wholesome platter of rice, curries, dal, sides &amp; accompaniments for a complete feast.</div>
                        <div class="menu-card-price">&#8377;220</div>
                    </div>
	                </div>
	            </div>

	            <!-- Dish 2 -->
	            <div class="col-md-4 col-sm-6 mb-4">
	                <div class="menu-card">
					<div class="menu-card" onclick="window.location.href='menu?category=Biryani'" style="cursor:pointer;">
                        <img src="https://images.getrecipekit.com/20250430065258-blog-20templates-20-25.webp?aspect_ratio=16:9&quality=90&" alt="Biryani" style="width:100%;height:180px;object-fit:cover;">
                    </div>
                    <div class="menu-card-body">
                        <div class="menu-card-category">Biryani</div>
                        <div class="menu-card-title">Chicken Biryani</div>
                        <div class="menu-card-desc">Aromatic basmati rice with spicy chicken.</div>
                        <div class="menu-card-price">&#8377;299</div>
                    </div>
	                </div>
	            </div>

	            <!-- Dish 3 -->
	            <div class="col-md-4 col-sm-6 mb-4">
	                <div class="menu-card">
					<div class="menu-card" onclick="window.location.href='menu?category=Desserts'" style="cursor:pointer;">
                        <img src="https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=800" alt="Dessert" style="width:100%;height:180px;object-fit:cover;">
                    </div>
                    <div class="menu-card-body">
                        <div class="menu-card-category">Dessert</div>
                        <div class="menu-card-title">Sweet Dessert</div>
                        <div class="menu-card-desc">Traditional Indian sweet delight.</div>
                        <div class="menu-card-price">&#8377;99</div>
                    </div>
	                </div>
	            </div>

	        </div>
	    </div>
	</section>

    <!-- TESTIMONIALS -->
	<section class="testimonial-section">
	    <div class="container">
	        <div class="section-heading">
	            <h2>What Our <span>Guests</span> Say</h2>
	            <div class="divider"></div>
	        </div>

	        <div class="row">

	            <div class="col-md-4 mb-4">
	                <div class="testimonial-card">
	                    <div class="stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
	                    <p>"The biryani at Anu Food is absolutely outstanding. The flavours are authentic and the portions are generous!"</p>
	                    <strong>&mdash; Ravi Kumar, Guntur</strong>
	                </div>
	            </div>

	            <div class="col-md-4 mb-4">
	                <div class="testimonial-card">
	                    <div class="stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
	                    <p>"Best South Indian food I've had in a long time. The ambiance is warm and the service is exceptional."</p>
	                    <strong>&mdash; Priya Sharma, Hyderabad</strong>
	                </div>
	            </div>

	            <div class="col-md-4 mb-4">
	                <div class="testimonial-card">
	                    <div class="stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
	                    <p>"Anu Food is our go-to restaurant for family gatherings. The variety and quality are consistently excellent."</p>
	                    <strong>&mdash; Suresh Reddy, Vijayawada</strong>
	                </div>
	            </div>

	        </div>
	    </div>
	</section>

    <!-- CTA -->
    <section class="cta-section">
        <h2>Ready to Experience <span>Anu Food</span>?</h2>
        <p>Join thousands of happy food lovers. Login or create an account to place your order today.</p>
        <div style="display:flex; gap:15px; justify-content:center; flex-wrap:wrap;">
            <a href="/login" class="btn btn-primary" style="padding:13px 35px; font-size:1rem;">Login to Order</a>
            <a href="/users/create" class="btn btn-gold" style="padding:13px 35px; font-size:1rem;">Create Account</a>
        </div>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>
