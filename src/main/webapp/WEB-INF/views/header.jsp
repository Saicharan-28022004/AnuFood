<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<!-- Responsive Header Styles -->
<style>
  .hamburger-btn {
    display: none;
    background: none;
    border: none;
    color: #fff;
    font-size: 1.4rem;
    cursor: pointer;
    padding: 6px 8px;
    line-height: 1;
  }

  .nav-overlay {
    display: none;
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.5);
    z-index: 998;
  }
  .nav-overlay.open { display: block; }

  @media (max-width: 768px) {
    header { padding: 0 14px !important; height: 62px !important; flex-wrap: nowrap !important; }
    header h1 { font-size: 1.15rem !important; }
    .brand-icon { width: 34px !important; height: 34px !important; font-size: 1rem !important; }
    .hamburger-btn { display: flex; align-items: center; }

    /* ✅ FIXED SIDEBAR */
    .header-nav {
      position: fixed;
      top: 0;
      right: -260px;   /* hidden */
      width: 260px;
      height: 100vh;
      background: #1a1a1a;
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      padding: 70px 18px 30px;
      gap: 4px !important;
      z-index: 999;
      box-shadow: -4px 0 20px rgba(0,0,0,0.4);
      overflow-y: auto;
      transition: right 0.3s ease;
    }

    .header-nav.open {
      right: 0;   /* visible */
    }

    .header-nav .nav-link-header {
      width: 100%;
      padding: 11px 14px !important;
      font-size: 0.95rem !important;
      border-radius: 8px;
    }

    .user-info p { display: none; }
    .user-info { gap: 8px !important; }
    .logout-btn { font-size: 0.8rem !important; padding: 7px 11px !important; }
  }

  @media (max-width: 480px) {
    header h1 { font-size: 1rem !important; }
  }
</style>

<header>
    <!-- Left: Brand -->
    <a href="/home" class="header-brand" style="text-decoration:none;">
        <div class="brand-icon">
            <i class="fas fa-utensils"></i>
        </div>
        <h1>Anu <span>Food</span></h1>
    </a>

    <!-- Center Nav -->
    <div class="header-nav" id="mainNav">
        <c:if test="${loggedInUser != null}">
            <a href="/home" class="nav-link-header">Home</a>
            <a href="/menu" class="nav-link-header">Menu</a>

            <c:if test="${loggedInUser.role != 'ADMIN'}">
                <a href="/reservation" class="nav-link-header">Reserve a Table</a>
                <a href="/cart" class="nav-link-header">
                    <i class="fas fa-shopping-cart"></i> Cart
                </a>
            </c:if>

            <c:if test="${loggedInUser.role == 'ADMIN'}">
                <a href="/admin/dashboard" class="nav-link-header">Dashboard</a>
                <a href="/reservation/list" class="nav-link-header">Reservations</a>
                <a href="/users" class="nav-link-header">Users</a>
            </c:if>
        </c:if>
    </div>

    <!-- Right: User Info + Hamburger -->
    <div style="display:flex;align-items:center;gap:8px;">
        <div class="user-info">
            <c:if test="${loggedInUser != null}">
                <p>
                    <i class="fas fa-user"></i>
                    Welcome, <strong>${loggedInUser.username}</strong>
                </p>
                <a href="/logout" class="logout-btn">Sign Out</a>
            </c:if>
            <c:if test="${loggedInUser == null}">
                <a href="/login" class="logout-btn">Login</a>
            </c:if>
        </div>

        <button class="hamburger-btn" id="hamburgerBtn">
            <i class="fas fa-bars" id="hamburgerIcon"></i>
        </button>
    </div>
</header>

<div class="nav-overlay" id="navOverlay"></div>

<!-- ✅ IMPROVED SCRIPT -->
<script>
(function(){
  var btn = document.getElementById('hamburgerBtn');
  var nav = document.getElementById('mainNav');
  var overlay = document.getElementById('navOverlay');
  var icon = document.getElementById('hamburgerIcon');

  function openMenu(){
    nav.classList.add('open');
    overlay.classList.add('open');
    icon.className = 'fas fa-times';
  }

  function closeMenu(){
    nav.classList.remove('open');
    overlay.classList.remove('open');
    icon.className = 'fas fa-bars';
  }

  function toggleMenu(e){
    e.stopPropagation();
    if(nav.classList.contains('open')){
      closeMenu();
    } else {
      openMenu();
    }
  }

  btn.addEventListener('click', toggleMenu);
  overlay.addEventListener('click', closeMenu);

  document.addEventListener('keydown', function(e){
    if(e.key === 'Escape') closeMenu();
  });

  // close on link click
  document.querySelectorAll('#mainNav a').forEach(function(link){
    link.addEventListener('click', closeMenu);
  });

})();
</script>