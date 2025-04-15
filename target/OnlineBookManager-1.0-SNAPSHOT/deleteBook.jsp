<%@ page import="org.bson.types.ObjectId" %>
<%@ page import="com.mongodb.client.MongoClients, com.mongodb.client.MongoClient, com.mongodb.client.MongoDatabase, com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.model.Filters" %>
<%@ page import="org.bson.Document" %>

<%
    String id = request.getParameter("id");

    if (id != null && !id.isEmpty()) {
        // Connect to MongoDB
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("bookdb");
        MongoCollection<Document> collection = database.getCollection("books");

        // Delete the book from the collection
        collection.deleteOne(Filters.eq("_id", new ObjectId(id)));

        // Close the MongoDB client
        mongoClient.close();

        // Redirect to the viewBooks.jsp page to refresh the list
        response.sendRedirect("viewBooks.jsp");
    } else {
        // Handle error case if 'id' is not valid
        response.sendRedirect("error.jsp");
    }
%>
