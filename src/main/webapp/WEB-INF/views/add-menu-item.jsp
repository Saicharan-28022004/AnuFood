<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Menu Item - Anu Food</title>
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
        <h1>Add <span>Menu Item</span></h1>
        <p>Add a new dish to the Anu Food menu</p>
    </div>

    <div class="container" style="padding: 40px 20px;">
        <div class="form-card" style="max-width: 600px;">
            <form action="/menu/add" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Item Name <span class="required">*</span></label>
                    <input type="text" name="name" class="form-control" placeholder="e.g. Chicken Biryani" required>
                </div>
                <div class="form-group">
                    <label>Category <span class="required">*</span></label>
                    <select name="category" class="form-control" required style="height:45px; padding:10px; width:100%;">
                        <option value="">-- Select Category --</option>
						<option value="Tiffins">Tiffins</option>
                        <option value="Starters">Starters</option>
                        <option value="Main Course">Main Course</option>
                        <option value="Biryani">Biryani</option>
                        <option value="Breads">Breads</option>
                        <option value="Desserts">Desserts</option>
                        <option value="Beverages">Beverages</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Description</label>
                    <textarea name="description" class="form-control" rows="3" placeholder="Describe this dish..."></textarea>
                </div>
                <div class="form-group">
                    <label>Price &#8377; <span class="required">*</span></label>
                    <input type="number" name="price" class="form-control" step="0.01" min="0" placeholder="e.g. 199.00" required>
                </div>
                <div class="form-group">
                    <label>Available</label>
                    <select name="available" class="form-control" style="height:45px; padding:10px; width:100%;">
                        <option value="true">Yes - Available</option>
                        <option value="false">No - Unavailable</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Item Image</label>
                    <input type="file" name="imageFile" class="form-control" accept="image/*">
                    <small style="color: var(--text-muted); font-size: 0.8rem;">Upload JPG, PNG (max 2MB)</small>
                </div>

                <div class="btn-row" style="display:flex; gap:12px; margin-top:10px;">
                    <button type="submit" class="btn btn-success">&#10004; Add Item</button>
                    <a href="/menu" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
