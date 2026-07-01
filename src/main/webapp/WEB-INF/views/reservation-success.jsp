<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Confirmed - Anu Food</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/styles.css">
    <style>
        .detail-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; }
        @media (max-width: 480px) {
            .detail-grid { grid-template-columns: 1fr; }
            .res-box { padding: 18px 12px !important; }
        }
    </style>
</head>
<body>
    <div class="container" style="padding: 60px 16px; text-align: center; max-width: 650px;">
        <div style="font-size: 5rem; margin-bottom: 20px;">&#127881;</div>
        <h2 style="font-family: 'Playfair Display', serif; color: var(--text-dark); margin-bottom: 12px;">
            Reservation Confirmed!
        </h2>
        <p style="color: var(--text-muted); font-size: 1rem; margin-bottom: 35px;">
            Thank you, <strong>${reservation.customerName}</strong>! Your table has been reserved. We look forward to welcoming you.
        </p>

        <div class="res-box" style="background: white; border-radius: 14px; padding: 30px; box-shadow: var(--shadow); text-align: left; margin-bottom: 30px;">
            <h5 style="font-family: 'Playfair Display', serif; margin-bottom: 20px; border-bottom: 2px solid var(--border); padding-bottom: 12px;">
                &#128203; Reservation Details
            </h5>
            <div class="detail-grid">
                <div>
                    <p style="color: var(--text-muted); font-size: 0.8rem; margin-bottom: 2px;">NAME</p>
                    <p style="font-weight: 600;">${reservation.customerName}</p>
                </div>
                <div>
                    <p style="color: var(--text-muted); font-size: 0.8rem; margin-bottom: 2px;">PHONE</p>
                    <p style="font-weight: 600;">${reservation.phone}</p>
                </div>
                <div>
                    <p style="color: var(--text-muted); font-size: 0.8rem; margin-bottom: 2px;">DATE</p>
                    <p style="font-weight: 600;">${reservation.reservationDate}</p>
                </div>
                <div>
                    <p style="color: var(--text-muted); font-size: 0.8rem; margin-bottom: 2px;">TIME</p>
                    <p style="font-weight: 600;">${reservation.reservationTime}</p>
                </div>
                <div>
                    <p style="color: var(--text-muted); font-size: 0.8rem; margin-bottom: 2px;">GUESTS</p>
                    <p style="font-weight: 600;">${reservation.guests} Guest(s)</p>
                </div>
                <div>
                    <p style="color: var(--text-muted); font-size: 0.8rem; margin-bottom: 2px;">STATUS</p>
                    <span class="badge badge-warning">PENDING CONFIRMATION</span>
                </div>
            </div>
            <c:if test="${not empty reservation.specialRequest}">
                <div style="margin-top: 15px; padding-top: 15px; border-top: 1px solid var(--border);">
                    <p style="color: var(--text-muted); font-size: 0.8rem; margin-bottom: 2px;">SPECIAL REQUEST</p>
                    <p>${reservation.specialRequest}</p>
                </div>
            </c:if>
        </div>

        <p style="color: var(--text-muted); font-size: 0.9rem; margin-bottom: 25px;">
            &#128231; A confirmation will be sent to <strong>${reservation.email}</strong>. We will call you to confirm your booking.
        </p>

        <div style="display: flex; gap: 12px; justify-content: center; flex-wrap: wrap;">
            <a href="/menu" class="btn btn-primary">Browse Menu</a>
            <a href="/home" class="btn btn-secondary">Back to Home</a>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
