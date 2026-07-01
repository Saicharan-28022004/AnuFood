package com.anufood.restaurant.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.anufood.restaurant.service.iface.MenuItemService;
import com.anufood.restaurant.service.iface.OrderService;
import com.anufood.restaurant.service.iface.UserService;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final MenuItemService menuItemService;
    private final OrderService orderService;
    private final UserService userService;

    public AdminController(MenuItemService menuItemService, OrderService orderService, UserService userService) {
        this.menuItemService = menuItemService;
        this.orderService = orderService;
        this.userService = userService;
    }

    @GetMapping("/dashboard")
    public String adminDashboard(HttpSession session, Model model) {
        String role = (String) session.getAttribute("role");
        if (!"ADMIN".equals(role)) {
            return "redirect:/login";
        }
        model.addAttribute("totalMenuItems", menuItemService.getAllMenuItems().size());
        model.addAttribute("totalOrders", orderService.getAllOrders().size());
        model.addAttribute("totalUsers", userService.getAllUsers().size());
        model.addAttribute("recentOrders", orderService.getAllOrders());
        return "admin-dashboard";
    }
}
