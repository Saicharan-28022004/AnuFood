<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Anu Food</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- Font Awesome (Icons) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <link rel="stylesheet" href="/styles.css">

    <!-- Internal Styling -->
    <style>
        .stat-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            border-top: 4px solid #e74c3c;
            margin-bottom: 20px;
        }

        .stat-icon i {
            font-size: 28px;
            padding: 18px;
            border-radius: 50%;
            background: #fdecea;
            color: #e74c3c;
        }

        /* Different colors */
        .green-icon {
            background: #eafaf1 !important;
            color: #27ae60 !important;
        }

        .gold-icon {
            background: #fff8e6 !important;
            color: #f39c12 !important;
        }

        .action-icon i {
            font-size: 28px;
            padding: 18px;
            border-radius: 50%;
            background: #fdecea;
            color: #e74c3c;
        }

        /* ── Search ── */
        .search-bar-wrap {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 16px;
        }
        .search-bar-wrap input {
            flex: 1;
            padding: 9px 14px;
            border: 1.5px solid var(--border);
            border-radius: 8px;
            font-size: 0.92rem;
            outline: none;
            transition: border-color 0.2s;
            max-width: 340px;
        }
        .search-bar-wrap input:focus { border-color: var(--primary); }

        /* ── Responsive ── */
        @media (max-width: 767px) {
            .col-4 { flex: 0 0 100%; max-width: 100%; }
            .data-table { font-size: 0.82rem; }
            .data-table th, .data-table td { padding: 8px 6px; }
        }
        .table-responsive-wrap { overflow-x: auto; }
    </style>
</head>

<body>

<div class="page-banner">
    <h1>Admin <span>Dashboard</span></h1>
    <p>Manage Anu Food Restaurant operations</p>
</div>

<div class="container" style="padding: 40px 20px;">

    <!-- Stats -->
    <div class="row">

        <!-- Menu -->
        <div class="col-md-4 col-sm-6">
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-utensils"></i>
                </div>
                <div class="stat-number">${totalMenuItems}</div>
                <div class="stat-label">Menu Items</div>
            </div>
        </div>

        <!-- Orders -->
        <div class="col-md-4 col-sm-6">
            <div class="stat-card" style="border-top-color: #27ae60;">
                <div class="stat-icon">
                    <i class="fas fa-shopping-cart green-icon"></i>
                </div>
                <div class="stat-number" style="color: #27ae60;">${totalOrders}</div>
                <div class="stat-label">Total Orders</div>
            </div>
        </div>

        <!-- Users -->
        <div class="col-md-4 col-sm-6">
            <div class="stat-card" style="border-top-color: var(--gold);">
                <div class="stat-icon">
                    <i class="fas fa-users gold-icon"></i>
                </div>
                <div class="stat-number" style="color: var(--gold);">${totalUsers}</div>
                <div class="stat-label">Registered Users</div>
            </div>
        </div>

    </div>

    <!-- Quick Actions -->
    <div class="section-heading" style="margin-top: 40px;">
        <h2>Quick <span>Actions</span></h2>
        <div class="divider"></div>
    </div>

    <div class="row">

        <!-- Manage Menu -->
        <div class="col-md-4 col-sm-6 mb-4">
            <div style="background: white; border-radius: 14px; padding: 30px; text-align: center; box-shadow: var(--shadow);">
                <div class="action-icon">
                    <i class="fas fa-utensils"></i>
                </div>
                <h5 style="font-family: 'Playfair Display', serif; margin-bottom: 10px;">Manage Menu</h5>
                <p style="color: var(--text-muted); font-size: 0.9rem; margin-bottom: 20px;">
                    Add, edit, or remove menu items from the restaurant menu.
                </p>
                <a href="/menu" class="btn btn-primary btn-block">Go to Menu</a>
                <a href="/menu/add" class="btn btn-secondary btn-block" style="margin-top:8px;">+ Add New Item</a>
            </div>
        </div>

        <!-- Manage Users -->
        <div class="col-md-4 col-sm-6 mb-4">
            <div style="background: white; border-radius: 14px; padding: 30px; text-align: center; box-shadow: var(--shadow);">
                <div class="action-icon">
                    <i class="fas fa-user-friends"></i>
                </div>
                <h5 style="font-family: 'Playfair Display', serif; margin-bottom: 10px;">Manage Users</h5>
                <p style="color: var(--text-muted); font-size: 0.9rem; margin-bottom: 20px;">
                    View, edit, and manage all registered customer accounts.
                </p>
                <a href="/users" class="btn btn-primary btn-block">Go to Users</a>
            </div>
        </div>

        <!-- Reservations -->
        <div class="col-md-4 col-sm-6 mb-4">
            <div style="background: white; border-radius: 14px; padding: 30px; text-align: center; box-shadow: var(--shadow);">
                <div class="action-icon">
                    <i class="fas fa-calendar-alt"></i>
                </div>
                <h5 style="font-family: 'Playfair Display', serif; margin-bottom: 10px;">Reservations</h5>
                <p style="color: var(--text-muted); font-size: 0.9rem; margin-bottom: 20px;">
                    View and manage all table reservation requests.
                </p>
                <a href="/reservation/list" class="btn btn-primary btn-block">View Reservations</a>
            </div>
        </div>

    </div>

    <!-- Recent Orders -->
    <c:if test="${not empty recentOrders}">
        <div class="section-heading" style="margin-top: 40px;">
            <h2>Recent <span>Orders</span></h2>
            <div class="divider"></div>
        </div>

        <!-- Order Search -->
        <div class="search-bar-wrap">
            <input type="text" id="orderSearch" placeholder="&#128269; Search orders by customer or type...">
        </div>

        <div class="table-responsive-wrap">
            <table class="data-table" id="ordersTable">
                <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer</th>
                    <th>Total</th>
                    <th>Type</th>
                    <th>Status</th>
                    <th>Date</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="order" items="${recentOrders}" varStatus="loop">
                    <c:if test="${loop.index < 10}">
                        <tr class="order-row"
                            data-customer="${order.user.username}"
                            data-type="${order.orderType}">
                            <td>#${order.id}</td>
                            <td>${order.user.username}</td>
                            <td><strong>&#8377;${order.totalPrice}</strong></td>
                            <td>
                                <c:choose>
                                    <c:when test="${order.orderType == 'DELIVERY'}">
                                        <i class="fas fa-truck"></i> Delivery
                                    </c:when>
                                    <c:when test="${order.orderType == 'TAKEAWAY'}">
                                        <i class="fas fa-box"></i> Takeaway
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fas fa-utensils"></i> Dine In
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><span class="badge badge-success">${order.orderStatus}</span></td>
                            <td>${order.orderDate}</td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>

</div>

<script>
var orderSearch = document.getElementById('orderSearch');
if (orderSearch) {
    orderSearch.addEventListener('input', function() {
        var q = this.value.toLowerCase().trim();
        document.querySelectorAll('.order-row').forEach(function(row) {
            var customer = (row.getAttribute('data-customer') || '').toLowerCase();
            var type = (row.getAttribute('data-type') || '').toLowerCase();
            row.style.display = (!q || customer.includes(q) || type.includes(q)) ? '' : 'none';
        });
    });
}
</script>

<%@ include file="footer.jsp" %>
</body>
</html>
