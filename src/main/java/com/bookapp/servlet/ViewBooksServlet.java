
package com.bookapp.servlet;

import com.bookapp.model.Book;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ViewBooksServlet")
public class ViewBooksServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Example: Retrieve list of books from the database or mock data
        List<Book> books = getBooksFromDatabase(); // Implement this method

        // Set the list of books in the request attributes
        request.setAttribute("books", books);

        // Forward to viewBooks.jsp
        request.getRequestDispatcher("/viewBooks.jsp").forward(request, response);
    }

    private List<Book> getBooksFromDatabase() {
        // This method should interact with your database and return a list of books.
        // For now, you can return a mock list of books.
        return List.of(
            new Book("Book 1", "Author 1", 29.99),
            new Book("Book 2", "Author 2", 39.99),
            new Book("Book 3", "Author 3", 49.99)
        );
    }
}
