package com.anufood.restaurant.controllers;

import java.math.BigDecimal;
import java.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.anufood.restaurant.model.*;
import com.anufood.restaurant.service.iface.MenuItemService;
import com.anufood.restaurant.service.iface.OrderService;
import com.anufood.restaurant.service.impl.RazorpayService;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class CartController {

    private final MenuItemService menuItemService;
    private final OrderService orderService;
    private final RazorpayService razorpayService;

    public CartController(MenuItemService menuItemService, OrderService orderService, RazorpayService razorpayService) {
        this.menuItemService = menuItemService;
        this.orderService = orderService;
        this.razorpayService = razorpayService;
    }

    @GetMapping
    public String viewCart(HttpSession session, Model model) {
        List<OrderItem> cartItems = getCartFromSession(session);
        double totalPrice = cartItems.stream().mapToDouble(i -> i.getPrice() * i.getQuantity()).sum();
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("totalPrice", totalPrice);
        return "cart";
    }

    @PostMapping("/add")
    @ResponseBody
    public String addToCart(@RequestParam int menuItemId,
                            @RequestParam int quantity,
                            HttpSession session) {

        List<OrderItem> cartItems = getCartFromSession(session);
        MenuItem menuItem = menuItemService.getMenuItemById(menuItemId);

        boolean exists = false;

        for (OrderItem item : cartItems) {
            if (item.getMenuItem().getId() == menuItemId) {
                item.setQuantity(item.getQuantity() + quantity);
                exists = true;
                break;
            }
        }

        if (!exists) {
            OrderItem newItem = new OrderItem();
            newItem.setMenuItem(menuItem);
            newItem.setPrice(menuItem.getPrice());
            newItem.setQuantity(quantity);
            cartItems.add(newItem);
        }

        session.setAttribute("cartItems", cartItems);

        return "success";
    }
    @PostMapping("/update")
    public String updateCart(@RequestParam int menuItemId, @RequestParam int quantity, HttpSession session) {
        List<OrderItem> cartItems = getCartFromSession(session);
        List<OrderItem> toRemove = new ArrayList<>();
        for (OrderItem item : cartItems) {
            if (item.getMenuItem().getId() == menuItemId) {
                if (quantity == 0) toRemove.add(item);
                else item.setQuantity(quantity);
            }
        }
        cartItems.removeAll(toRemove);
        session.setAttribute("cartItems", cartItems);
        return "redirect:/cart";
    }

    @PostMapping("/checkout")
    public String checkout(HttpSession session, Model model,
                           @RequestParam(required = false) String orderType,
                           @RequestParam(required = false) String deliveryAddress) {
        @SuppressWarnings("unchecked")
        List<OrderItem> cartItems = (List<OrderItem>) session.getAttribute("cartItems");
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (cartItems == null || cartItems.isEmpty() || loggedInUser == null) {
            return "redirect:/cart";
        }

        Order order = new Order();
        order.setUser(loggedInUser);
        order.setOrderStatus("CONFIRMED");
        order.setOrderType(orderType != null ? orderType : "DINE_IN");
        order.setDeliveryAddress(deliveryAddress);

        double totalPrice = 0;
        for (OrderItem item : cartItems) {
            item.setOrder(order);
            totalPrice += item.getPrice() * item.getQuantity();
        }

        order.setTotalPrice(BigDecimal.valueOf(totalPrice));
        order.setOrderItems(cartItems);
        orderService.saveOrder(order);
        session.removeAttribute("cartItems");

        model.addAttribute("order", order);
        return "order-success";
    }

    @GetMapping("/payment-success")
    public String paymentSuccess(HttpSession session, Model model) {
        session.removeAttribute("cartItems");
        model.addAttribute("message", "Your payment was successful! Your order is being prepared.");
        return "payment-success";
    }

    @PostMapping("/razorpayOrder")
    @ResponseBody
    public Map<String, Object> createRazorpayOrder(HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            List<OrderItem> cartItems = getCartFromSession(session);
            if (cartItems.isEmpty()) throw new IllegalStateException("Cart is empty");
            double totalPrice = cartItems.stream().mapToDouble(i -> i.getPrice() * i.getQuantity()).sum();
            com.razorpay.Order razorpayOrder = razorpayService.createOrder(totalPrice, "INR", "AnuFoodReceipt#" + System.currentTimeMillis());
            response.put("id", razorpayOrder.get("id"));
            response.put("amount", razorpayOrder.get("amount"));
            response.put("currency", razorpayOrder.get("currency"));
        } catch (Exception e) {
            e.printStackTrace();
            response.put("error", "Failed to create order: " + e.getMessage());
        }
        return response;
    }

    @SuppressWarnings("unchecked")
    private List<OrderItem> getCartFromSession(HttpSession session) {
        List<OrderItem> cartItems = (List<OrderItem>) session.getAttribute("cartItems");
        if (cartItems == null) {
            cartItems = new ArrayList<>();
            session.setAttribute("cartItems", cartItems);
        }
        return cartItems;
    }
}
