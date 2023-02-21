package com.crivera.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.crivera.bookclub.models.Book;
import com.crivera.bookclub.models.User;
import com.crivera.bookclub.services.BookService;
import com.crivera.bookclub.services.UserService;

@Controller
public class BookController {
	@Autowired
	UserService userService;

	@Autowired
	BookService bookService;

	// Dashboard
	@GetMapping("/books")
	public String dashboard(HttpSession session, Model model) {
		// If user isn't logged in, return to login page
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		User user = userService.findById((Long) session.getAttribute("userId"));

		model.addAttribute("user", user);
		model.addAttribute("books", bookService.getAllBooks());
		model.addAttribute("usersBooks", bookService.getUserBooks(user));

		return "books/dashboard.jsp";
	}

	// Route for creating new book
	@GetMapping("/books/new")
	public String newBook(Model model, HttpSession session, @ModelAttribute("book") Book book) {
		// If user isn't logged in, return to login page
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}

		model.addAttribute("user", userService.findById((Long) session.getAttribute("userId")));
		return "books/newBook.jsp";
	}

	// Post Route to validate and create a book
	@PostMapping("/books")
	public String insertBook(Model model, HttpSession session, @Valid @ModelAttribute("book") Book book,
			BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute("user", userService.findById((Long) session.getAttribute("userId")));
			return "newBook.jsp";
		}
		System.out.println(book.getUser().getName());
		bookService.saveBook(book);
		return "redirect:/books";
	}

	// View one book's details
	@GetMapping("/books/{id}")
	public String showBook(Model model, HttpSession session, @PathVariable("id") Long id) {
		// If user isn't logged in, return to login page
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		model.addAttribute("user", userService.findById((Long) session.getAttribute("userId")));
		model.addAttribute("book", bookService.getOneBook(id));
		return "books/showBook.jsp";
	}

	// Route for editing one book
	@GetMapping("/books/{id}/edit")
	public String editBook(Model model, HttpSession session, @PathVariable("id") Long id) {
		// If user isn't logged in, return to login page
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		User user = userService.findById((Long) session.getAttribute("userId"));
		Book book = bookService.getOneBook(id);
		
		// If user attempting to edit a book isn't the
		// one that created it, redirect to /books.  
		if (user.getId() != book.getUser().getId()) {
			return "redirect:/books";
		}
		
		model.addAttribute("user", user);
		model.addAttribute("book", book);
		return "books/editBook.jsp";
	}
	
	@PutMapping("/books/{id}/update")
	public String updateBook(Model model, HttpSession session, @Valid @ModelAttribute("book") Book book,
			BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute("user", userService.findById((Long) session.getAttribute("userId")));
			return "books/editBook.jsp";
		}
		bookService.saveBook(book);
		return "redirect:/books";
	}

	@DeleteMapping("/books/{id}/delete")
	public String deleteBook(@PathVariable("id") Long id) {
		bookService.deleteBook(bookService.getOneBook(id));
		return "redirect:/books";
	}
}
