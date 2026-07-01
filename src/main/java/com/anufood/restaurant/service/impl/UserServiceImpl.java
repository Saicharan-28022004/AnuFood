package com.anufood.restaurant.service.impl;

import com.anufood.restaurant.model.User;
import com.anufood.restaurant.repositories.UserRepository;
import com.anufood.restaurant.service.iface.UserService;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public User authenticate(String username, String password) {
        Optional<User> userOpt = userRepository.findByUsername(username);
        if (userOpt.isPresent() && userOpt.get().getPassword().equals(password)) {
            return userOpt.get();
        }
        return null;
    }

    @Override
    public void createUser(String username, String password, String role, String phoneNumber, String email, String address) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole(role != null ? role : "USER");
        user.setPhone_number(phoneNumber);
        user.setEmail(email);
        user.setAddress(address);
        userRepository.save(user);
    }

    @Override
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public User getUserById(int id) {
        return userRepository.findById(id).orElse(null);
    }

    @Override
    public void updateUser(int id, String username, String password, String role, String phoneNumber, String email, String address) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            user.setUsername(username);
            user.setPassword(password);
            user.setRole(role);
            user.setPhone_number(phoneNumber);
            user.setEmail(email);
            user.setAddress(address);
            userRepository.save(user);
        }
    }

    @Override
    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }
}
