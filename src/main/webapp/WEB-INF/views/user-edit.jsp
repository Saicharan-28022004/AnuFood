<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User - Anu Food Admin</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/styles.css">
    <style>
        @media (max-width: 600px) {
            .form-card { padding: 20px 14px !important; }
            .btn-row { flex-direction: column !important; }
            .btn-row .btn { width: 100%; }
        }
    </style>
</head>
<body>
    <div class="page-banner">
        <h1>Edit <span>User</span></h1>
        <p>Update user account details</p>
    </div>

    <div class="container" style="padding: 40px 20px;">
        <div class="form-card" style="max-width: 550px;">
            <h4 style="font-family: 'Playfair Display', serif; margin-bottom: 25px; color: var(--text-dark);">
                &#9998; Edit: ${user.username}
            </h4>
            <form action="/users/update/${user.id}" method="post">
                <div class="form-group">
                    <label>Username <span class="required">*</span></label>
                    <input type="text" name="username" class="form-control" value="${user.username}" required>
                </div>
                <div class="form-group">
                    <label>Password <span class="required">*</span></label>
                    <input type="password" name="password" class="form-control" value="${user.password}" required>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" value="${user.email}">
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="tel" name="phone_number" class="form-control" value="${user.phone_number}">
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <textarea name="address" class="form-control" rows="2">${user.address}</textarea>
                </div>
                <div class="form-group">
                    <label>Role <span class="required">*</span></label>
                    <select name="role" class="form-control" required>
                        <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>User</option>
                        <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>Admin</option>
                    </select>
                </div>
                <div class="btn-row" style="display: flex; gap: 12px; margin-top: 10px;">
                    <button type="submit" class="btn btn-warning">&#10003; Update User</button>
                    <a href="/users" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
