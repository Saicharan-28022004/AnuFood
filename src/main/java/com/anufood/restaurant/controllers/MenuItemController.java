package com.anufood.restaurant.controllers;

import java.io.IOException;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.anufood.restaurant.model.MenuItem;
import com.anufood.restaurant.model.User;
import com.anufood.restaurant.service.iface.MenuItemService;
import jakarta.servlet.http.HttpSession;

@Controller
public class MenuItemController {

    private final MenuItemService menuItemService;

    public MenuItemController(MenuItemService menuItemService) {
        this.menuItemService = menuItemService;
    }

    @GetMapping("/menu")
    public String showMenu(HttpSession session, Model model,
                           @RequestParam(required = false) String category) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }

        List<MenuItem> menuItems;
        if (category != null && !category.isEmpty()) {
            menuItems = menuItemService.getMenuItemsByCategory(category);
        } else {
            menuItems = menuItemService.getAllMenuItems();
        }

        model.addAttribute("menuItems", menuItems);
        model.addAttribute("selectedCategory", category);
        return "menu-list";
    }

    @GetMapping("/menu/add")
    public String showAddMenuItemPage(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !"ADMIN".equals(loggedInUser.getRole())) {
            return "redirect:/login";
        }
        return "add-menu-item";
    }

    @PostMapping("/menu/add")
    public String addNewMenuItem(@ModelAttribute MenuItem menuItem) {
        try {
            if (menuItem.getImageFile() != null && !menuItem.getImageFile().isEmpty()) {
                String imagePath = menuItemService.saveMenuItemImage(menuItem.getImageFile());
                menuItem.setImagePath(imagePath);
            }
            menuItemService.saveMenuItem(menuItem);
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/menu/add?error=FileUploadFailed";
        }
        return "redirect:/menu";
    }

    @GetMapping("/menu/edit/{id}")
    public String showEditMenuItemPage(@PathVariable int id, HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null || !"ADMIN".equals(loggedInUser.getRole())) {
            return "redirect:/login";
        }
        MenuItem menuItem = menuItemService.getMenuItemById(id);
        if (menuItem == null) {
            return "redirect:/menu?error=ItemNotFound";
        }
        model.addAttribute("menuItem", menuItem);
        return "edit-menu-item";
    }

    @PostMapping("/menu/edit/{id}")
    public String updateMenuItem(@PathVariable int id, @ModelAttribute MenuItem menuItem) {
        try {
            MenuItem existing = menuItemService.getMenuItemById(id);
            if (existing == null) {
                return "redirect:/menu?error=ItemNotFound";
            }
            if (menuItem.getImageFile() != null && !menuItem.getImageFile().isEmpty()) {
                String imagePath = menuItemService.saveMenuItemImage(menuItem.getImageFile());
                menuItem.setImagePath(imagePath);
            } else {
                menuItem.setImagePath(existing.getImagePath());
            }
            menuItem.setId(id);
            menuItemService.saveMenuItem(menuItem);
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/menu/edit/" + id + "?error=FileUploadFailed";
        }
        return "redirect:/menu";
    }

    @GetMapping("/menu/delete/{id}")
    public String deleteMenuItem(@PathVariable int id) {
        menuItemService.deleteMenuItem(id);
        return "redirect:/menu";
    }
}
