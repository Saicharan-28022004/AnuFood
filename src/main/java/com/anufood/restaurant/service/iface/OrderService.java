package com.anufood.restaurant.service.iface;

import com.anufood.restaurant.model.Order;
import java.util.List;

public interface OrderService {
    void saveOrder(Order order);
    List<Order> getAllOrders();
    List<Order> getOrdersByUserId(int userId);
}
