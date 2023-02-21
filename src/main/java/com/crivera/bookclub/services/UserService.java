package com.crivera.bookclub.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.crivera.bookclub.models.LoginUser;
import com.crivera.bookclub.models.User;
import com.crivera.bookclub.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	
	public User register(User user, BindingResult result) {
		// Check if email is already registered.
		Optional<User> potentialUser = userRepository.findByEmail(user.getEmail());

		// Does email already exist
		if (potentialUser.isPresent()) {
			// If email exists, informs the user to login.
			result.rejectValue("email", "emailExists", "Email already registered. Please login.");
		}

		// Checks if passwords match.
		if (!user.getPassword().equals(user.getConfirm())) {
			// Error messages if passwords don't match.
			result.rejectValue("confirm", "noMatch", "Passwords must match.");
		}

		if (result.hasErrors())
			return null;

		// If passwords match, hash password and save the user instance.
		else {
			String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
			user.setPassword(hashed);
			return userRepository.save(user);
		}
	}

	public User login(LoginUser loginUser, BindingResult result) {
		// Check if email exists.
		Optional<User> potentialUser = userRepository.findByEmail(loginUser.getEmail());

		if (potentialUser.isEmpty()) {
			// If email isn't registered, inform the user the credentials are invalid.
			result.rejectValue("email", "noEmail", "Invalid login credentials.");
			return null;
		}

		User user = potentialUser.get();

		// Check if password is correct
		if (!BCrypt.checkpw(loginUser.getPassword(), user.getPassword())) {
			// If hashed password doesn't match database hash, inform the user the credentials are invalid.
			result.rejectValue("password", "noMatch", "Invalid login credentials.");
		}

		if (result.hasErrors())
			return null;
		else
			return user;

	}

	public User findById(Long id) {
		return userRepository.findById(id).orElse(null);
	}

}
