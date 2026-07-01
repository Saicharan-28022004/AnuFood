<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Menu - Anu Food Restaurant</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/styles.css">
    <style>
        /* ── Search Bar ── */
        .search-bar-wrap {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }
        .search-bar-wrap input {
            flex: 1;
            padding: 10px 16px;
            border: 1.5px solid var(--border);
            border-radius: 8px;
            font-size: 0.95rem;
            outline: none;
            transition: border-color 0.2s;
        }
        .search-bar-wrap input:focus { border-color: var(--primary); }
        .search-bar-wrap .search-icon {
            color: var(--text-muted);
            font-size: 1.1rem;
            margin-left: -38px;
            pointer-events: none;
        }
        .no-results-msg { display: none; text-align: center; padding: 50px 0; }
        .no-results-msg i { font-size: 3.5rem; color: var(--text-muted); display: block; margin-bottom: 14px; }

        /* ── Responsive grid ── */
        @media (max-width: 767px) {
            .col-4 { flex: 0 0 50%; max-width: 50%; }
        }
        @media (max-width: 480px) {
            .col-4 { flex: 0 0 100%; max-width: 100%; }
            .category-filter { flex-wrap: wrap; gap: 6px; }
        }
    </style>
</head>
<body>

    <!-- Page Banner -->
    <div class="page-banner">
        <h1>Our <span>Menu</span></h1>
        <p>Explore our wide selection of authentic dishes crafted with love</p>
    </div>

    <div class="container" style="padding-top: 30px;">

        <!-- Admin Add Button -->
        <c:if test="${loggedInUser.role == 'ADMIN'}">
            <div style="margin-bottom: 20px;">
                <a href="/menu/add" class="btn btn-success">+ Add New Menu Item</a>
            </div>
        </c:if>

        <!-- Search Bar -->
        <div class="search-bar-wrap">
            <input type="text" id="menuSearch" placeholder="&#128269; Search dishes by name or category...">
        </div>

        <!-- Category Filter -->
		<div class="category-filter">
		    <a href="/menu" class="cat-btn ${empty selectedCategory ? 'active' : ''}">All Items</a>
			
			<a href="/menu?category=Tiffins" 
			   class="cat-btn ${'Tiffins' == selectedCategory ? 'active' : ''}">
			    &#127835; Tiffins
			</a>

		    <a href="/menu?category=Starters" 
		       class="cat-btn ${'Starters' == selectedCategory ? 'active' : ''}">
		        &#129367; Starters
		    </a>

		    <a href="/menu?category=Main Course" 
		       class="cat-btn ${'Main Course' == selectedCategory ? 'active' : ''}">
		        &#127858; Main Course
		    </a>

		    <a href="/menu?category=Biryani" 
		       class="cat-btn ${'Biryani' == selectedCategory ? 'active' : ''}">
		        &#127834; Biryani
		    </a>

		    <a href="/menu?category=Breads" 
		       class="cat-btn ${'Breads' == selectedCategory ? 'active' : ''}">
		        &#129747; Breads
		    </a>

		    <a href="/menu?category=Desserts" 
		       class="cat-btn ${'Desserts' == selectedCategory ? 'active' : ''}">
		        &#127856; Desserts
		    </a>

		    <a href="/menu?category=Beverages" 
		       class="cat-btn ${'Beverages' == selectedCategory ? 'active' : ''}">
		        &#129380; Beverages
		    </a>
		</div>

        <!-- Menu Grid -->
        <div class="row" id="menuGrid">
            <c:choose>
                <c:when test="${not empty menuItems}">
                    <c:forEach var="item" items="${menuItems}">
                        <div class="col-4 menu-item-col"
                             data-name="${item.name}"
                             data-category="${item.category}">
                            <div class="menu-card">
                                <!-- Item Image -->
                                <c:choose>
                                    <c:when test="${not empty item.imagePath}">
                                        <img src="${item.imagePath}" alt="${item.name}">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="menu-card-img-placeholder">
                                            <c:choose>
											<c:when test="${item.category == 'Tiffins'}">&#129367;</c:when>
                                                <c:when test="${item.category == 'Starters'}">&#129367;</c:when>
                                                <c:when test="${item.category == 'Biryani'}">🍚</c:when>
                                                <c:when test="${item.category == 'Desserts'}">🍮</c:when>
                                                <c:when test="${item.category == 'Beverages'}">🥤</c:when>
                                                <c:when test="${item.category == 'Breads'}">🫓</c:when>
                                                <c:otherwise>&#127835;</c:otherwise>
                                            </c:choose>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                                <div class="menu-card-body">
                                    <c:if test="${not empty item.category}">
                                        <div class="menu-card-category">${item.category}</div>
                                    </c:if>
                                    <div class="menu-card-title">${item.name}</div>
                                    <div class="menu-card-desc">${item.description}</div>
                                    <div class="menu-card-price">&#8377;${item.price}</div>
                                    <c:if test="${!item.available}">
                                        <span class="badge badge-danger" style="margin-top:6px; display:inline-block;">Currently Unavailable</span>
                                    </c:if>
                                </div>
								<div class="menu-card-footer">

								    <c:if test="${loggedInUser.role != 'ADMIN' && item.available}">
								        <form onsubmit="addToCartAjax(event, this)" style="display:flex; gap:8px;">
								            
								            <input type="hidden" name="menuItemId" value="${item.id}">
								            <input type="hidden" name="quantity" value="1">

								            <button type="submit" class="btn btn-primary btn-sm add-btn">
								                &#128722; Add to Cart
								            </button>
								        </form>
								    </c:if>

								    <c:if test="${loggedInUser.role == 'ADMIN'}">
								        <a href="/menu/edit/${item.id}" class="btn btn-warning btn-sm">Edit</a>
								        <a href="/menu/delete/${item.id}" class="btn btn-danger btn-sm"
								           onclick="return confirm('Delete this menu item?')">Delete</a>
								    </c:if>

								</div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="col-12 text-center" style="padding: 60px 0;">
                        <div style="font-size: 4rem; margin-bottom: 20px;">&#127869;</div>
                        <h3 style="color: var(--text-muted); font-family: 'Playfair Display', serif;">No items found in this category</h3>
                        <p style="color: var(--text-muted);">Try browsing another category or check back later.</p>
                        <a href="/menu" class="btn btn-primary" style="margin-top:15px;">View All Menu</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- No-search-results placeholder -->
        <div class="no-results-msg" id="noResults">
            <i class="fas fa-search"></i>
            <h4 style="color:var(--text-muted); font-family:'Playfair Display',serif;">No dishes match your search</h4>
            <p style="color:var(--text-muted);">Try a different keyword.</p>
        </div>

        <!-- View Cart -->
        <c:if test="${loggedInUser.role != 'ADMIN'}">
            <div style="text-align:right; margin: 20px 0 40px;">
                <a href="/cart" class="btn btn-gold">&#128722; View Cart</a>
            </div>
        </c:if>
    </div>

	<script>
	function addToCartAjax(event, form) {
	    event.preventDefault();
	    var btn = form.querySelector(".add-btn");
	    var formData = new FormData(form);
	    fetch("/cart/add", { method: "POST", body: formData })
	    .then(function(response) {
	        if (response.ok) {
	            btn.innerHTML = "&#10004; Added";
	            btn.style.background = "#28a745";
	            btn.disabled = true;
	        }
	    })
	    .catch(function() { alert("Error adding to cart"); });
	}

    /* Live search */
    document.getElementById('menuSearch').addEventListener('input', function() {
        var q = this.value.toLowerCase().trim();
        var cols = document.querySelectorAll('.menu-item-col');
        var visible = 0;
        cols.forEach(function(col) {
            var name = (col.getAttribute('data-name') || '').toLowerCase();
            var cat  = (col.getAttribute('data-category') || '').toLowerCase();
            var match = !q || name.includes(q) || cat.includes(q);
            col.style.display = match ? '' : 'none';
            if (match) visible++;
        });
        document.getElementById('noResults').style.display = (visible === 0 && cols.length > 0) ? 'block' : 'none';
    });
	</script>

    <%@ include file="footer.jsp" %>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
