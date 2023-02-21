package com.crivera.bookclub.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crivera.bookclub.models.Book;
import com.crivera.bookclub.models.User;
import com.crivera.bookclub.repositories.BookRepository;

@Service
public class BookService {

	@Autowired
	BookRepository bookRepository;

	// Get all books
	public List<Book> getAllBooks() {
		return bookRepository.findAll();
	}

	// Get one user's books
	public List<Book> getUserBooks(User user) {
		return bookRepository.findByUser(user);
	}

	// Get one book
	public Book getOneBook(Long id) {
//		Optional<Book> optionalBook = bookRepository.findById(id);
//		if (optionalBook.isEmpty())
//			return null;
//		return optionalBook.get();
		return bookRepository.findById(id).orElse(null);
	}

	// Save book (update/create)
	public Book saveBook(Book book) {
		return bookRepository.save(book);
	}

	// Delete book
	public void deleteBook(Book book) {
		bookRepository.delete(book);
	}

}
