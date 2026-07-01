<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Users - Anu Food Admin</title>
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
            .top-bar { flex-direction: column; align-items: flex-start !important; }
        }
    </style>
</head>
<body>
    <div class="page-banner">
        <h1>Manage <span>Users</span></h1>
        <p>View and manage all registered accounts</p>
    </div>

    <div class="container" style="padding: 40px 20px;">
        <div class="top-bar" style="margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 10px;">
            <h4 style="font-family: 'Playfair Display', serif; color: var(--text-dark);">All Users (${users.size()})</h4>
            <div style="display: flex; gap: 10px; flex-wrap: wrap;">
                <a href="/users/create" class="btn btn-success btn-sm">+ Add User</a>
                <a href="/admin/dashboard" class="btn btn-secondary btn-sm">&#8592; Dashboard</a>
            </div>
        </div>

        <c:choose>
            <c:when test="${not empty users}">

                <!-- Search -->
                <div class="search-bar-wrap">
                    <input type="text" id="userSearch" placeholder="&#128269; Search by username, email or role...">
                </div>

                <div class="table-responsive-wrap">
                    <table class="data-table" id="usersTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Username</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Role</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr class="user-row"
                                    data-username="${user.username}"
                                    data-email="${user.email}"
                                    data-role="${user.role}">
                                    <td>#${user.id}</td>
                                    <td><strong>${user.username}</strong></td>
                                    <td>${user.email}</td>
                                    <td>${user.phone_number}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${user.role == 'ADMIN'}">
                                                <span class="badge badge-danger">ADMIN</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-info">USER</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td style="white-space: nowrap;">
                                        <a href="/users/edit/${user.id}" class="btn btn-warning btn-sm">Edit</a>
                                        <a href="/users/delete/${user.id}" class="btn btn-danger btn-sm"
                                           onclick="return confirm('Delete user ${user.username}?')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:when>
            <c:otherwise>
                <div style="text-align: center; padding: 60px 0;">
                    <div style="font-size: 4rem; margin-bottom: 20px;">&#128101;</div>
                    <h4 style="color: var(--text-muted); font-family: 'Playfair Display', serif;">No users found</h4>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <script>
    var userSearch = document.getElementById('userSearch');
    if (userSearch) {
        userSearch.addEventListener('input', function() {
            var q = this.value.toLowerCase().trim();
            document.querySelectorAll('.user-row').forEach(function(row) {
                var username = (row.getAttribute('data-username') || '').toLowerCase();
                var email    = (row.getAttribute('data-email') || '').toLowerCase();
                var role     = (row.getAttribute('data-role') || '').toLowerCase();
                row.style.display = (!q || username.includes(q) || email.includes(q) || role.includes(q)) ? '' : 'none';
            });
        });
    }
    </script>

    <%@ include file="footer.jsp" %>
</body>
</html>
