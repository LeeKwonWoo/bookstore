package com.springmvc.service;

import java.util.List;
import com.springmvc.domain.Book;
import java.util.Map;
import java.util.Set;

public interface BookService {
	List<Book> getAllBookList();
	List<Book> getBookListByCategory(String category);
	Set<Book> getBookListByFilter(Map<String, List<String>> filter);
	Book getBookById(String bookId);
}
