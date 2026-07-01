<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Account - Anu Food</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/styles.css">
    <style>
        body {
            background: linear-gradient(135deg, #1a1a1a 0%, #3d1a1a 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 16px;
        }
        .register-card {
            background: white;
            border-radius: 20px;
            padding: 45px 40px;
            width: 100%;
            max-width: 520px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.4);
        }
        .register-logo { text-align: center; margin-bottom: 30px; }
        .register-logo .icon { font-size: 2.5rem; }
        .register-logo h2 {
            font-family: 'Playfair Display', serif;
            font-size: 1.7rem;
            color: var(--text-dark);
            margin-top: 8px;
        }
        .register-logo h2 span { color: var(--primary); }
        .register-logo p { color: var(--text-muted); font-size: 0.9rem; }
        /* responsive */
        @media (max-width: 480px) {
            .register-card { padding: 28px 16px; }
            .pw-row { flex-direction: column !important; }
        }
    </style>
</head>
<body>
    <div class="register-card">
        <div class="register-logo">
            <div class="icon"> <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwvXmktVgSBu2TD3zOFN6ZNPt4cA7gq-v6fg&s" alt="AnuFood" style="max-width:72px;border-radius:50%;"></div>
            <h2>Anu <span>Food</span></h2>
            <p>Create your account to start ordering</p>
        </div>

        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <form action="/users/create" method="post">
            <div class="form-group">
                <label>Username <span class="required">*</span></label>
                <input type="text" name="username" class="form-control" placeholder="Choose a username" required>
            </div>
            <div class="pw-row" style="display: flex; gap: 15px;">
                <div class="form-group" style="flex: 1;">
                    <label>Password <span class="required">*</span></label>
                    <input type="password" name="password" class="form-control" placeholder="Create a password" required>
                </div>
            </div>
            <div class="form-group">
                <label>Email Address <span class="required">*</span></label>
                <input type="email" name="email" class="form-control" placeholder="your@email.com" required>
            </div>
            <div class="form-group">
                <label>Phone Number</label>
                <input type="tel" name="phone_number" class="form-control" placeholder="+91-9876543210">
            </div>
            <div class="form-group">
                <label>Delivery Address</label>
                <textarea name="address" class="form-control" rows="2" placeholder="Your home or office address"></textarea>
            </div>

            <button type="submit" class="btn btn-primary btn-block" style="padding: 13px; font-size: 1rem; margin-top: 5px;">
                &#127881; Create Account
            </button>
        </form>

        <div style="text-align: center; margin-top: 20px;">
            <p style="color: var(--text-muted); font-size: 0.9rem;">Already have an account?</p>
            <a href="/login" class="btn btn-secondary btn-block" style="padding: 11px;">Login</a>
        </div>
        <div style="text-align: center; margin-top: 12px;">
            <a href="/home" style="color: var(--text-muted); font-size: 0.85rem; text-decoration: none;">&#8592; Back to Home</a>
        </div>
    </div>
</body>
</html>
