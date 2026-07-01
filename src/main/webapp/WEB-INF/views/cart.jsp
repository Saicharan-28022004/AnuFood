<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart - Anu Food</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/styles.css">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <style>
        /* ── Responsive cart layout ── */
        .cart-layout { display: flex; gap: 30px; flex-wrap: wrap; }
        .cart-summary { width: 300px; flex-shrink: 0; }
        .table-responsive-wrap { overflow-x: auto; }
        @media (max-width: 768px) {
            .cart-layout { flex-direction: column; }
            .cart-summary { width: 100%; }
            .cart-summary > div { position: static !important; }
        }
        @media (max-width: 480px) {
            .data-table { font-size: 0.8rem; }
            .data-table th, .data-table td { padding: 7px 5px; }
        }
    </style>
</head>
<body>
    <div class="page-banner">
        <h1>Your <span>Cart</span></h1>
        <p>Review your order before placing it</p>
    </div>

    <div class="container" style="padding: 40px 20px;">
        <c:choose>
            <c:when test="${not empty cartItems}">
                <div class="cart-layout">
                    <!-- Cart Table -->
                    <div style="flex: 1; min-width: 260px;">
                        <div class="table-responsive-wrap">
                            <table class="data-table">
                                <thead>
                                    <tr>
                                        <th>Item</th>
                                        <th>Price</th>
                                        <th>Qty</th>
                                        <th>Subtotal</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${cartItems}">
                                        <tr>
                                            <td>
                                                <strong>${item.menuItem.name}</strong>
                                                <c:if test="${not empty item.menuItem.category}">
                                                    <br><small style="color: var(--text-muted);">${item.menuItem.category}</small>
                                                </c:if>
                                            </td>
                                            <td>&#8377;${item.price}</td>
                                            <td>
                                                <form action="/cart/update" method="post" style="display:inline-flex; gap:6px; align-items:center;">
                                                    <input type="hidden" name="menuItemId" value="${item.menuItem.id}">
                                                    <input type="number" name="quantity" value="${item.quantity}" min="0" class="qty-input">
                                                    <button type="submit" class="btn btn-secondary btn-sm">Update</button>
                                                </form>
                                            </td>
                                            <td><strong>&#8377;${item.price * item.quantity}</strong></td>
                                            <td>
                                                <form action="/cart/update" method="post">
                                                    <input type="hidden" name="menuItemId" value="${item.menuItem.id}">
                                                    <input type="hidden" name="quantity" value="0">
                                                    <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Order Summary -->
                    <div class="cart-summary">
                        <div style="background: white; border-radius: 14px; padding: 25px; box-shadow: var(--shadow); position: sticky; top: 90px;">
                            <h4 style="font-family: 'Playfair Display', serif; margin-bottom: 20px; color: var(--text-dark);">Order Summary</h4>
                            <div style="display:flex; justify-content:space-between; margin-bottom:10px; font-size:0.95rem;">
                                <span style="color: var(--text-muted);">Subtotal</span>
                                <span>&#8377;${totalPrice}</span>
                            </div>
                            <div style="display:flex; justify-content:space-between; margin-bottom:10px; font-size:0.95rem;">
                                <span style="color: var(--text-muted);">GST (5%)</span>
                                <span>&#8377;<fmt:formatNumber value="${totalPrice * 0.05}" maxFractionDigits="2" xmlns:fmt="http://java.sun.com/jsp/jstl/fmt"/></span>
                            </div>
                            <hr style="border-color: var(--border);">
                            <div style="display:flex; justify-content:space-between; font-size:1.1rem; font-weight:700; color: var(--primary);">
                                <span>Total</span>
                                <span>&#8377;${totalPrice}</span>
                            </div>

                            <div style="margin-top: 20px;">
                                <label style="font-weight:600; font-size:0.9rem; display:block; margin-bottom:6px;">Order Type</label>
                                <select id="orderType" class="form-control" style="height:45px; padding:10px; width:100%;">
                                    <option value="DINE_IN">&#127869; Dine In</option>
                                    <option value="TAKEAWAY">&#129489; Takeaway</option>
                                    <option value="DELIVERY">&#128640; Delivery</option>
                                </select>
                                <div id="addressDiv" style="display:none; margin-bottom:10px; margin-top:10px;">
                                    <label style="font-weight:600; font-size:0.9rem; display:block; margin-bottom:6px;">Delivery Address</label>
                                    <textarea id="deliveryAddress" class="form-control" rows="2" placeholder="Enter delivery address..."></textarea>
                                </div>
                            </div>

                            <button id="checkoutButton" class="btn btn-success btn-block" style="margin-top:12px; padding:13px;">
                               &#128179; Pay Now
                            </button>
                            <a href="/menu" class="btn btn-secondary btn-block" style="margin-top:10px; padding:11px;">
                                &#8592; Continue Ordering
                            </a>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="text-center" style="padding: 80px 20px;">
                    <div style="font-size: 5rem; margin-bottom: 20px;">&#128722;</div>
                    <h3 style="font-family: 'Playfair Display', serif; color: var(--text-muted);">Your cart is empty</h3>
                    <p style="color: var(--text-muted); margin-bottom: 25px;">Browse our menu and add your favourite dishes!</p>
                    <a href="/menu" class="btn btn-primary" style="padding: 12px 35px;">Explore Menu</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <%@ include file="footer.jsp" %>

    <script>
        document.getElementById('orderType').addEventListener('change', function() {
            document.getElementById('addressDiv').style.display = this.value === 'DELIVERY' ? 'block' : 'none';
        });

        document.getElementById('checkoutButton') && document.getElementById('checkoutButton').addEventListener('click', function(e) {
            e.preventDefault();
            fetch('/cart/razorpayOrder', { method: 'POST', headers: { 'Content-Type': 'application/json' } })
            .then(r => r.json())
            .then(data => {
                if (data && data.id) {
                    const options = {
                        key: "rzp_test_VxDXNU2LjZXDcy",
                        amount: data.amount,
                        currency: data.currency,
                        name: "Anu Food Restaurant",
                        description: "Order Payment",
                        order_id: data.id,
                        handler: function(response) {
                            window.location.href = "/cart/payment-success";
                        },
                        prefill: { name: "Customer", email: "customer@example.com", contact: "9876543210" },
                        theme: { color: "#c0392b" }
                    };
                    new Razorpay(options).open();
                } else {
                    alert("Failed to create order. Please try again.");
                }
            }).catch(err => { console.error(err); alert("An error occurred."); });
        });
    </script>
</body>
</html>
