<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reserve a Table - Anu Food</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/styles.css">
    <style>
        /* ── Responsive layout ── */
        .res-layout { display: flex; gap: 40px; flex-wrap: wrap; align-items: flex-start; }
        .res-info-panel { width: 280px; flex-shrink: 0; }
        @media (max-width: 768px) {
            .res-layout { flex-direction: column; }
            .res-info-panel { width: 100%; }
        }
        @media (max-width: 480px) {
            .date-time-row { flex-direction: column !important; }
        }
    </style>
</head>
<body>
    <div class="page-banner">
        <h1>Reserve a <span>Table</span></h1>
        <p>Book your dining experience at Anu Food Restaurant</p>
    </div>

    <div class="container" style="padding: 50px 20px;">
        <div class="res-layout">

            <!-- Form -->
            <div style="flex: 1; min-width: 280px;">
                <div class="form-card" style="max-width: 100%; margin: 0;">
                    <h4 style="font-family: 'Playfair Display', serif; margin-bottom: 25px; color: var(--text-dark);">
                        &#128197; Book Your Table
                    </h4>
                    <form action="/reservation/book" method="post">
                        <div class="form-group">
                            <label>Full Name <span class="required">*</span></label>
                            <input type="text" name="customerName" class="form-control" placeholder="Your full name" required>
                        </div>
                        <div class="form-group">
                            <label>Email Address <span class="required">*</span></label>
                            <input type="email" name="email" class="form-control" placeholder="your@email.com" required>
                        </div>
                        <div class="form-group">
                            <label>Phone Number <span class="required">*</span></label>
                            <input type="tel" name="phone" class="form-control" placeholder="+91-9876543210" required>
                        </div>
                        <div class="date-time-row" style="display: flex; gap: 15px;">
                            <div class="form-group" style="flex: 1;">
                                <label>Date <span class="required">*</span></label>
                                <input type="date" name="reservationDate" class="form-control" required>
                            </div>
                            <div class="form-group" style="flex: 1;">
                                <label>Time <span class="required">*</span></label>
                                <select name="reservationTime" class="form-control" required style="height:45px; padding:10px;" >
                                    <option value="">Select Time</option>
									<option value="11:00 AM">11:00 AM</option>
									<option value="11:30 AM">11:30 AM</option>
                                    <option value="12:00 PM">12:00 PM</option>
                                    <option value="12:30 PM">12:30 PM</option>
                                    <option value="01:00 PM">01:00 PM</option>
                                    <option value="01:30 PM">01:30 PM</option>
                                    <option value="02:00 PM">02:00 PM</option>
                                    <option value="07:00 PM">07:00 PM</option>
                                    <option value="07:30 PM">07:30 PM</option>
                                    <option value="08:00 PM">08:00 PM</option>
                                    <option value="08:30 PM">08:30 PM</option>
                                    <option value="09:00 PM">09:00 PM</option>
									<option value="09:30 PM">09:30 PM</option>
									<option value="10:00 PM">10:00 PM</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Number of Guests <span class="required">*</span></label>
                            <select name="guests" class="form-control" required style="height:45px; padding:10px;">
                                <option value="">Select guests</option>
                                <option value="1">1 Guest</option>
                                <option value="2">2 Guests</option>
                                <option value="3">3 Guests</option>
                                <option value="4">4 Guests</option>
                                <option value="5">5 Guests</option>
                                <option value="6">6 Guests</option>
                                <option value="7">7 Guests</option>
                                <option value="8">8+ Guests</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Special Requests</label>
                            <textarea name="specialRequest" class="form-control" rows="3"
                                placeholder="Dietary requirements, occasion, seating preference..."></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block" style="padding: 13px; font-size: 1rem;">
                            &#10004; Confirm Reservation
                        </button>
                    </form>
                </div>
            </div>

            <!-- Info Panel -->
            <div class="res-info-panel">
                <div style="background: white; border-radius: 14px; padding: 28px; box-shadow: var(--shadow); margin-bottom: 20px;">
                    <h5 style="font-family: 'Playfair Display', serif; margin-bottom: 18px; color: var(--text-dark);">&#9200; Opening Hours</h5>
                    <div style="display: flex; justify-content: space-between; margin-bottom: 10px; font-size: 0.9rem;">
                        <span style="color: var(--text-muted);">Monday - Friday</span>
                        <strong>11 AM - 10 PM</strong>
                    </div>
                    <div style="display: flex; justify-content: space-between; margin-bottom: 10px; font-size: 0.9rem;">
                        <span style="color: var(--text-muted);">Saturday</span>
                        <strong>10 AM - 11 PM</strong>
                    </div>
                    <div style="display: flex; justify-content: space-between; font-size: 0.9rem;">
                        <span style="color: var(--text-muted);">Sunday</span>
                        <strong>10 AM - 10 PM</strong>
                    </div>
                </div>

                <div style="background: white; border-radius: 14px; padding: 28px; box-shadow: var(--shadow); margin-bottom: 20px;">
                    <h5 style="font-family: 'Playfair Display', serif; margin-bottom: 18px; color: var(--text-dark);">&#128205; Location</h5>
                    <p style="font-size: 0.9rem; color: var(--text-muted); line-height: 1.7;">
                        RTC Colony 1st Street,<br>
                        Vijayawada - 520007,<br>
                        Andhra Pradesh, India
                    </p>
                </div>

                <div style="background: var(--primary); border-radius: 14px; padding: 28px; color: white;">
                    <h5 style="font-family: 'Playfair Display', serif; margin-bottom: 15px;">&#9742; Call Us</h5>
                    <p style="font-size: 1.1rem; font-weight: 700; margin-bottom: 5px;">+91-8977974556</p>
                    <p style="font-size: 0.85rem; opacity: 0.85;">For urgent reservations or group bookings, call directly.</p>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
