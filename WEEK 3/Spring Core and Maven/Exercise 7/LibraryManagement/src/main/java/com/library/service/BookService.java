package com.library.service;

import com.library.repository.BookRepository;

public class BookService {
    private BookRepository bookRepository;
    private String message;

    // Constructor Injection
    public BookService(String message) {
        this.message = message;
    }

    // Setter Injection
    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public void addBook() {
        System.out.println("Message: " + message);
        System.out.println("BookService: Adding book...");
        bookRepository.save();
    }
}
