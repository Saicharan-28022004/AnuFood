# 🍽️ Anu Food Restaurant - Web Application

A full-featured Spring Boot restaurant web application built following the same MVC pattern as the Ecommerce reference project.

---

## 🚀 Tech Stack

- **Backend:** Spring Boot 3.3.6, Spring MVC, Spring Data JPA
- **Frontend:** JSP, Bootstrap 4, Custom CSS (Playfair Display + Poppins fonts)
- **Database:** MySQL
- **Payments:** Razorpay Integration
- **Email:** Spring Mail (Gmail SMTP)
- **Build:** Maven

---

## 📁 Project Structure

```
AnuFood/
├── src/main/
│   ├── java/com/anufood/restaurant/
│   │   ├── AnuFoodApplication.java           ← Main entry point
│   │   ├── configurtion/
│   │   │   └── WebConfig.java                ← Static resources config
│   │   ├── controllers/
│   │   │   ├── LoginController.java          ← Auth (login/logout/home)
│   │   │   ├── MenuItemController.java       ← Menu CRUD
│   │   │   ├── CartController.java           ← Cart + Razorpay
│   │   │   ├── UserController.java           ← User management
│   │   │   ├── AdminController.java          ← Admin dashboard
│   │   │   └── ReservationController.java    ← Table reservations
│   │   ├── model/
│   │   │   ├── User.java
│   │   │   ├── MenuItem.java
│   │   │   ├── Order.java
│   │   │   ├── OrderItem.java
│   │   │   └── Reservation.java
│   │   ├── repositories/
│   │   │   ├── UserRepository.java
│   │   │   ├── MenuItemRepository.java
│   │   │   ├── OrderRepository.java
│   │   │   └── ReservationRepository.java
│   │   └── service/
│   │       ├── iface/
│   │       │   ├── MenuItemService.java
│   │       │   ├── UserService.java
│   │       │   └── OrderService.java
│   │       └── impl/
│   │           ├── MenuItemServiceImpl.java
│   │           ├── UserServiceImpl.java
│   │           ├── OrderServiceImpl.java
│   │           ├── EmailService.java
│   │           └── RazorpayService.java
│   ├── resources/
│   │   ├── static/styles.css                 ← Professional restaurant CSS
│   │   └── application.properties
│   └── webapp/WEB-INF/views/                 ← All JSP pages
│       ├── header.jsp / footer.jsp
│       ├── home.jsp                          ← Landing page
│       ├── login.jsp
│       ├── menu-list.jsp                     ← Menu with category filter
│       ├── add-menu-item.jsp
│       ├── edit-menu-item.jsp
│       ├── cart.jsp
│       ├── order-success.jsp
│       ├── payment-success.jsp
│       ├── reservation.jsp
│       ├── reservation-success.jsp
│       ├── reservation-list.jsp              ← Admin only
│       ├── admin-dashboard.jsp
│       ├── user-create.jsp
│       ├── user-list.jsp
│       └── user-edit.jsp
└── uploads/images/                           ← Uploaded food images
```

---

## ⚙️ Setup Instructions

### 1. Database Setup
```sql
CREATE DATABASE anufood;
```

### 2. Configure `application.properties`
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/anufood
spring.datasource.username=root
spring.datasource.password=your_password

razorpay.key=your_razorpay_key
razorpay.secret=your_razorpay_secret

spring.mail.username=your_gmail@gmail.com
spring.mail.password=your_app_password
```

### 3. Run the Application
```bash
mvn spring-boot:run
```

Open: [http://localhost:8080](http://localhost:8080)

---

## 🌐 URL Routes

| URL | Description | Access |
|-----|-------------|--------|
| `/` or `/home` | Restaurant landing page | Public |
| `/login` | Login page | Public |
| `/users/create` | Register new account | Public |
| `/menu` | Browse full menu | Logged In |
| `/menu?category=Biryani` | Filter by category | Logged In |
| `/cart` | View shopping cart | User |
| `/reservation` | Book a table | User |
| `/admin/dashboard` | Admin dashboard | Admin |
| `/menu/add` | Add menu item | Admin |
| `/users` | Manage users | Admin |
| `/reservation/list` | View all reservations | Admin |

---

## 🍽️ Menu Categories
- Starters
- Main Course
- Biryani
- Breads
- Desserts
- Beverages

---

## 🔑 Default Admin Setup
Create a user in the DB with role = `ADMIN`:
```sql
INSERT INTO users (username, password, role, email) 
VALUES ('admin', 'admin123', 'ADMIN', 'admin@anufood.com');
```

---

## 💳 Payment
Integrated with **Razorpay** test keys. Replace with live keys in production.

---

## 📧 Email
Sends welcome email on registration. Uses Gmail SMTP — enable 2FA and create App Password.

---

*Built with ❤️ for Anu Food Restaurant*
