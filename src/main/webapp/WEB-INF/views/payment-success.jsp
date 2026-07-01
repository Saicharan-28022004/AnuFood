<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<style>
	.gpay-tick {
	    display: inline-flex;
	    justify-content: center;
	    align-items: center;
	    width: 48px;
	    height: 48px;
	    border-radius: 50%;
	    background: #34a853;
	    color: white;
	    font-size: 32px;
	}
	</style>
    <title>Payment Successful - Anu Food</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/styles.css">
    <style>
        @media (max-width: 480px) {
            .pay-btns { flex-direction: column !important; }
            .pay-btns .btn { width: 100%; }
        }
    </style>
</head>
<body>
    <div class="container" style="padding: 80px 20px; text-align: center;">
        <div style="font-size: 5rem; margin-bottom: 20px;"><span class="gpay-tick">&#10004;</span></div>
        <h2 style="font-family: 'Playfair Display', serif; color: var(--text-dark); margin-bottom: 15px;">Payment Successful!</h2>
        <p style="color: var(--text-muted); font-size: 1rem; max-width: 500px; margin: 0 auto 30px;">
            ${message} Our chefs are now preparing your delicious meal!
        </p>
        <div class="pay-btns" style="display:flex; gap:15px; justify-content:center; flex-wrap:wrap;">
            <a href="/menu" class="btn btn-primary">Order More</a>
            <a href="/home" class="btn btn-secondary">Back to Home</a>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
