package com.bookapp.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
import org.bson.Document;
import org.bson.types.ObjectId;

import java.io.IOException;

@WebServlet("/updateBook")
public class UpdateBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String priceStr = request.getParameter("price");

        if (id == null || title == null || author == null || priceStr == null || priceStr.isEmpty()) {
            response.sendRedirect("error.jsp"); // Redirect to an error page or show a message
            return;
        }

        double price = 0;
        try {
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp"); // Redirect to an error page or show a message
            return;
        }

        // Connect to MongoDB
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("bookdb");
        MongoCollection<Document> collection = database.getCollection("books");

        try {
            // Update the book in the database
            collection.updateOne(
                Filters.eq("_id", new ObjectId(id)),
                Updates.combine(
                    Updates.set("title", title),
                    Updates.set("author", author),
                    Updates.set("price", price)
                )
            );
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to an error page or show a message
            return;
        } finally {
            // Close the MongoClient to avoid resource leaks
            mongoClient.close();
        }

        // Redirect to the view book page or show a success message
        response.sendRedirect("viewbook.jsp");
    }
}
