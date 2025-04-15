/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bookapp.servlet;

import com.bookapp.dao.BookDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/deleteBook")
public class DeleteBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id"); // This should be the ID of the book

        BookDAO dao = new BookDAO();
        dao.deleteBook(id); // Ensure the deleteBook method is implemented in BookDAO

        response.sendRedirect("success.html"); // Redirect to a success page
    }
}



