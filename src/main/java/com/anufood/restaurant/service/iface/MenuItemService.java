package com.anufood.restaurant.service.iface;

import com.anufood.restaurant.model.MenuItem;
import java.io.IOException;
import java.util.List;

public interface MenuItemService {
    List<MenuItem> getAllMenuItems();
    List<MenuItem> getMenuItemsByCategory(String category);
    MenuItem getMenuItemById(int id);
    void saveMenuItem(MenuItem menuItem);
    void deleteMenuItem(int id);
    String saveMenuItemImage(org.springframework.web.multipart.MultipartFile file) throws IOException;
}
