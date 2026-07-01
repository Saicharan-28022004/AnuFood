<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmed - Anu Food</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/styles.css">
    <style>
        .success-icon { font-size: 5rem; margin-bottom: 20px; }
        .order-summary-box {
            background: white;
            border-radius: 14px;
            padding: 30px;
            box-shadow: var(--shadow);
            max-width: 600px;
            margin: 0 auto;
        }
        .table-responsive-wrap { overflow-x: auto; }
        @media (max-width: 480px) {
            .order-summary-box { padding: 18px 12px; }
            .btn-row { flex-direction: column !important; }
            .btn-row .btn { width: 100%; }
        }
    </style>
</head>
<body>
    <div class="page-banner" style="background: linear-gradient(135deg, #1a3a1a, #2d5a2d);">
        <h1>Order <span>Confirmed!</span></h1>
        <p>Thank you for dining with Anu Food</p>
    </div>

    <div class="container" style="padding: 50px 20px;">
        <div class="text-center" style="margin-bottom: 30px;">
            <div class="success-icon">&#127881;</div>
            <h2 style="font-family: 'Playfair Display', serif; color: var(--text-dark);">Your order has been placed!</h2>
            <p style="color: var(--text-muted);">We're preparing your food with love. It will be ready shortly.</p>
        </div>

        <div class="order-summary-box">
            <h4 style="font-family: 'Playfair Display', serif; margin-bottom: 20px; border-bottom: 2px solid var(--border); padding-bottom: 12px;">
                &#129534; Order Details
            </h4>
            <div class="table-responsive-wrap">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th>Qty</th>
                            <th>Price</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${order.orderItems}">
                            <tr>
                                <td>${item.menuItem.name}</td>
                                <td>${item.quantity}</td>
                                <td>&#8377;${item.price}</td>
                                <td><strong>&#8377;${item.price * item.quantity}</strong></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div style="text-align:right; margin-top:20px; padding-top:15px; border-top: 2px solid var(--border);">
                <h4 style="color: var(--primary);">Grand Total: &#8377;${order.totalPrice}</h4>
            </div>

            <div style="margin-top: 20px; padding: 15px; background: #f0f9f0; border-radius: 10px;">
                <p style="margin: 0; color: #1e8449; font-weight: 500;">&#9993; A confirmation will be sent to your email shortly.</p>
            </div>

            <div class="btn-row" style="display:flex; gap:12px; margin-top:25px; justify-content:center; flex-wrap:wrap;">
                <a href="/menu" class="btn btn-primary">Order More</a>
                <a href="/home" class="btn btn-secondary">Back to Home</a>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
