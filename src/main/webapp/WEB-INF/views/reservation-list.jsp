<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reservations - Anu Food Admin</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/styles.css">
    <style>
        .search-bar-wrap {
            display: flex; align-items: center; gap: 10px; margin-bottom: 16px;
        }
        .search-bar-wrap input {
            flex: 1; max-width: 360px;
            padding: 9px 14px;
            border: 1.5px solid var(--border);
            border-radius: 8px;
            font-size: 0.92rem;
            outline: none;
            transition: border-color 0.2s;
        }
        .search-bar-wrap input:focus { border-color: var(--primary); }
        .table-responsive-wrap { overflow-x: auto; }
        @media (max-width: 767px) {
            .data-table { font-size: 0.8rem; }
            .data-table th, .data-table td { padding: 7px 5px; }
            .header-actions { flex-direction: column; align-items: flex-start !important; }
        }
    </style>
</head>
<body>
    <div class="page-banner">
        <h1>Table <span>Reservations</span></h1>
        <p>Manage all reservation requests</p>
    </div>

    <div class="container" style="padding: 40px 20px;">
        <div class="header-actions" style="margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 10px;">
            <h4 style="font-family: 'Playfair Display', serif; color: var(--text-dark);">All Reservations</h4>
            <a href="/admin/dashboard" class="btn btn-secondary btn-sm">&#8592; Back to Dashboard</a>
        </div>

        <c:choose>
            <c:when test="${not empty reservations}">

                <!-- Search -->
                <div class="search-bar-wrap">
                    <input type="text" id="resSearch" placeholder="&#128269; Search by customer name, email or status...">
                </div>

                <div class="table-responsive-wrap">
                    <table class="data-table" id="resTable">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Customer</th>
                                <th>Contact</th>
                                <th>Date &amp; Time</th>
                                <th>Guests</th>
                                <th>Special Request</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="r" items="${reservations}">
                                <tr class="res-row"
                                    data-name="${r.customerName}"
                                    data-email="${r.email}"
                                    data-status="${r.status}">
                                    <td>#${r.id}</td>
                                    <td><strong>${r.customerName}</strong></td>
                                    <td>
                                        <small>${r.email}</small><br>
                                        <small>${r.phone}</small>
                                    </td>
                                    <td>${r.reservationDate}<br><strong>${r.reservationTime}</strong></td>
                                    <td>${r.guests}</td>
                                    <td style="max-width: 150px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                        ${not empty r.specialRequest ? r.specialRequest : '—'}
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${r.status == 'CONFIRMED'}">
                                                <span class="badge badge-success">CONFIRMED</span>
                                            </c:when>
                                            <c:when test="${r.status == 'CANCELLED'}">
                                                <span class="badge badge-danger">CANCELLED</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-warning">PENDING</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td style="white-space: nowrap;">
                                        <c:if test="${r.status == 'PENDING'}">
                                            <a href="/reservation/confirm/${r.id}" class="btn btn-success btn-sm">&#10003; Confirm</a>
                                            <a href="/reservation/cancel/${r.id}" class="btn btn-danger btn-sm">&#10007; Cancel</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:when>
            <c:otherwise>
                <div style="text-align: center; padding: 60px 0;">
                    <div style="font-size: 4rem; margin-bottom: 20px;">&#128197;</div>
                    <h4 style="color: var(--text-muted); font-family: 'Playfair Display', serif;">No reservations yet</h4>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <script>
    var resSearch = document.getElementById('resSearch');
    if (resSearch) {
        resSearch.addEventListener('input', function() {
            var q = this.value.toLowerCase().trim();
            document.querySelectorAll('.res-row').forEach(function(row) {
                var name   = (row.getAttribute('data-name') || '').toLowerCase();
                var email  = (row.getAttribute('data-email') || '').toLowerCase();
                var status = (row.getAttribute('data-status') || '').toLowerCase();
                row.style.display = (!q || name.includes(q) || email.includes(q) || status.includes(q)) ? '' : 'none';
            });
        });
    }
    </script>

    <%@ include file="footer.jsp" %>
</body>
</html>
