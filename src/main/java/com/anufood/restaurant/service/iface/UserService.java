package com.anufood.restaurant.service.iface;

import com.anufood.restaurant.model.User;
import java.util.List;

public interface UserService {
    User authenticate(String username, String password);
    void createUser(String username, String password, String role, String phoneNumber, String email, String address);
    List<User> getAllUsers();
    User getUserById(int id);
    void updateUser(int id, String username, String password, String role, String phoneNumber, String email, String address);
    void deleteUser(int id);
}
