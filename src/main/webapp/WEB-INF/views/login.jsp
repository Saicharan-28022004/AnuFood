<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	
	<c:if test="${not empty success}">
	    <div class="alert alert-success text-center">
	        ${success}
	    </div>
	</c:if>
	
    <title>Login - Anu Food Restaurant</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/styles.css">
    <style>
        body { background: linear-gradient(135deg, #1a1a1a 0%, #3d1a1a 100%); min-height: 100vh; display: flex; flex-direction: column; }
        .login-wrapper { flex: 1; display: flex; align-items: center; justify-content: center; padding: 40px 16px; }
        .login-card {
            background: white;
            border-radius: 20px;
            padding: 45px 40px;
            width: 100%;
            max-width: 440px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.4);
        }
        .login-logo { text-align: center; margin-bottom: 30px; }
        .login-logo .icon { font-size: 3rem; }
        .login-logo h2 { font-family: 'Playfair Display', serif; font-size: 1.8rem; color: var(--text-dark); margin-top: 10px; }
        .login-logo h2 span { color: var(--primary); }
        .login-logo p { color: var(--text-muted); font-size: 0.9rem; }
        .divider-text { text-align: center; margin: 20px 0; color: var(--text-muted); font-size: 0.85rem; }
        /* responsive */
        @media (max-width: 480px) {
            .login-card { padding: 30px 18px; }
        }
    </style>
</head>
<body>
    <div class="login-wrapper">
        <div class="login-card">
            <div class="login-logo">
                <div class="icon"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwvXmktVgSBu2TD3zOFN6ZNPt4cA7gq-v6fg&s" alt="AnuFood" style="max-width:80px;border-radius:50%;"></div>
                <h2>Anu <span>Food</span></h2>
                <p>Welcome back! Please login to continue.</p>
            </div>

            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>

            <form action="/login" method="post">
                <div class="form-group">
                    <label>Username <span class="required">*</span></label>
                    <input type="text" name="username" class="form-control" placeholder="Enter your username" required>
                </div>
                <div class="form-group">
                    <label>Password <span class="required">*</span></label>
                    <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block" style="padding:13px; font-size:1rem; margin-top:10px;">
                    &#128100; Login
                </button>
            </form>

            <div class="divider-text">&#8592;or &#8592;</div>

            <div class="text-center">
                <p style="color: var(--text-muted); font-size:0.9rem;">Don't have an account?</p>
                <a href="/users/create" class="btn btn-secondary btn-block" style="padding:11px;">Create Account</a>
            </div>

            <div class="text-center mt-3">
                <a href="/home" style="color: var(--text-muted); font-size:0.85rem; text-decoration:none;">&#8592; Back to Home</a>
            </div>
        </div>
    </div>
</body>
</html>
