package com.nikcruciani.developerproject.services;

import java.util.List;
import java.util.Optional;


import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.nikcruciani.developerproject.models.LoginUser;

import com.nikcruciani.developerproject.models.User;
import com.nikcruciani.developerproject.repositories.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepo;
    

    public User register(User newUser, BindingResult result) {
        Optional<User> existingUser = userRepo.findByEmail(newUser.getEmail());
        if (existingUser.isPresent()) {
            result.rejectValue("email", "Matches", "Another user already has this email.");
        } else {
            if (!newUser.getPassword().equals(newUser.getConfirm())) {
                result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
            }

            if (result.hasErrors()) {
                return null;
            } else {
                String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
                System.out.println("Hashed password: " + hashed); // Print the hashed password
                newUser.setPassword(hashed);
                User savedUser = userRepo.save(newUser);
                return savedUser != null ? savedUser : null;
            }
        }
        return null;
    }
    public User login(LoginUser newLoginUser, BindingResult result) {
        Optional<User> existingUser = userRepo.findByEmail(newLoginUser.getEmail());

        if (!existingUser.isPresent()) {
            result.rejectValue("email", "Not Found", "User not found!");
            return null;
        } else {
            User user = existingUser.get();

            if (!BCrypt.checkpw(newLoginUser.getPassword(), user.getPassword())) {
                result.rejectValue("password", "Invalid", "Invalid Password!");
                return null;
            } else {
                return user;
            }
        }
    }

    public User findById(Long id) {
        Optional<User> potentialUser = userRepo.findById(id);

        if (potentialUser.isPresent()) {
            return potentialUser.get();
        } else {
            return null;
        }
    }
	public List<User> findAllUsers() {
		return userRepo.findAll();
	}
	public User saveUser(User user) {
	    return userRepo.save(user);
	}

}