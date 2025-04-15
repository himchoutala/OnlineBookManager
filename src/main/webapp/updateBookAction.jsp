<%@ page import="com.mongodb.client.MongoClients, com.mongodb.client.MongoClient, com.mongodb.client.MongoDatabase, com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.model.Updates" %>
<%@ page import="com.mongodb.client.model.Filters" %>
<%@ page import="org.bson.Document" %>
<%@ page import="org.bson.types.ObjectId" %>

<%
    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String priceStr = request.getParameter("price");

    if (id == null || title == null || author == null || priceStr == null || priceStr.isEmpty()) {
        response.sendRedirect("error.jsp"); // Handle error if data is invalid
        return;
    }

    double price = 0;
    try {
        price = Double.parseDouble(priceStr);
    } catch (NumberFormatException e) {
        response.sendRedirect("error.jsp"); // Handle error if price is invalid
        return;
    }

    // Connect to MongoDB and update the book
    MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
    MongoDatabase database = mongoClient.getDatabase("bookdb");
    MongoCollection<Document> collection = database.getCollection("books");

    // Update the book in the database
    collection.updateOne(
        Filters.eq("_id", new ObjectId(id)),
        Updates.combine(
            Updates.set("title", title),
            Updates.set("author", author),
            Updates.set("price", price)
        )
    );

    // Close MongoClient
    mongoClient.close();

    // Redirect back to the viewBooks.jsp page to show updated data
    response.sendRedirect("viewBooks.jsp");
%>
