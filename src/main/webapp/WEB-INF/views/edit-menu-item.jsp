<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Menu Item - Anu Food</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/styles.css">
    <style>
        @media (max-width: 600px) {
            .form-card { padding: 18px 12px !important; }
            .btn-row { flex-direction: column !important; }
            .btn-row .btn { width: 100%; }
        }
    </style>
</head>
<body>
    <div class="page-banner">
        <h1>Edit <span>Menu Item</span></h1>
        <p>Update the details of this dish</p>
    </div>

    <div class="container" style="padding: 40px 20px;">
        <div class="form-card" style="max-width: 600px;">
            <form action="/menu/edit/${menuItem.id}" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Item Name <span class="required">*</span></label>
                    <input type="text" name="name" class="form-control" value="${menuItem.name}" required>
                </div>
                <div class="form-group">
                    <label>Category <span class="required">*</span></label>
                    <select name="category" class="form-control" required style="height:45px; padding:10px; width:100%;">
                        <option value="">-- Select Category --</option>
						<option value="Tiffins" ${menuItem.category == 'Tiffins' ? 'selected' : ''}>Tiffins</option>
                        <option value="Starters" ${menuItem.category == 'Starters' ? 'selected' : ''}>Starters</option>
                        <option value="Main Course" ${menuItem.category == 'Main Course' ? 'selected' : ''}>Main Course</option>
                        <option value="Biryani" ${menuItem.category == 'Biryani' ? 'selected' : ''}>Biryani</option>
                        <option value="Breads" ${menuItem.category == 'Breads' ? 'selected' : ''}>Breads</option>
                        <option value="Desserts" ${menuItem.category == 'Desserts' ? 'selected' : ''}>Desserts</option>
                        <option value="Beverages" ${menuItem.category == 'Beverages' ? 'selected' : ''}>Beverages</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Description</label>
                    <textarea name="description" class="form-control" rows="3">${menuItem.description}</textarea>
                </div>
                <div class="form-group">
                    <label>Price (&#8377;) <span class="required">*</span></label>
                    <input type="number" name="price" class="form-control" step="0.01" min="0" value="${menuItem.price}" required>
                </div>
                <div class="form-group">
                    <label>Available</label>
                    <select name="available" class="form-control" style="height:45px; padding:10px; width:100%;">
                        <option value="true" ${menuItem.available ? 'selected' : ''}>Yes - Available</option>
                        <option value="false" ${!menuItem.available ? 'selected' : ''}>No - Unavailable</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Item Image</label>
                    <c:if test="${not empty menuItem.imagePath}">
                        <div style="margin-bottom: 10px;">
                            <img src="${menuItem.imagePath}" alt="${menuItem.name}" style="width:120px; height:80px; object-fit:cover; border-radius:8px;">
                            <p style="font-size:0.8rem; color:var(--text-muted); margin-top:4px;">Current image</p>
                        </div>
                    </c:if>
                    <input type="file" name="imageFile" class="form-control" accept="image/*">
                    <small style="color: var(--text-muted); font-size: 0.8rem;">Leave blank to keep existing image</small>
                </div>

                <div class="btn-row" style="display:flex; gap:12px; margin-top:10px;">
                    <button type="submit" class="btn btn-warning">&#9998; Update Item</button>
                    <a href="/menu" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
