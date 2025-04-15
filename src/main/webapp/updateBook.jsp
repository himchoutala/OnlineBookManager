<%@ page import="org.bson.types.ObjectId" %>
<%@ page import="com.mongodb.client.MongoClients, com.mongodb.client.MongoClient, com.mongodb.client.MongoDatabase, com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.model.Filters" %>
<%@ page import="org.bson.Document" %>

<%
    String id = request.getParameter("id");
    MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
    MongoDatabase database = mongoClient.getDatabase("bookdb");
    MongoCollection<Document> collection = database.getCollection("books");

    // Fetch the book document from the database
    Document book = collection.find(Filters.eq("_id", new ObjectId(id))).first();

    if (book == null) {
        response.sendRedirect("viewBooks.jsp");
        return;
    }

    // Populate form fields with current data
    String title = book.getString("title");
    String author = book.getString("author");
    Double price = book.getDouble("price");
%>

<html>
<head>
    <title>Update Book</title>
    <head>
    <title>Update Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: rgba(23, 40, 24, 0.8);
            color: #fff;
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #fff;
        }

        form {
            width: 40%;
            margin: 40px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }
        .dashboard-btn {
    text-align: center;
    margin-top: 40px;
}

.dashboard-btn a {
    display: inline-block;
    padding: 12px 28px;
    background-color: #3498db;
    color: #fff;
    text-decoration: none;
    font-size: 16px;
    font-weight: bold;
    border-radius: 8px;
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.dashboard-btn a:hover {
    background-color: #2980b9;
    transform: translateY(-2px);
}

    </style>
</head>

</head>
<body>
    <h2>Update Book</h2>
    <form action="updateBookAction.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        
        <label>New Title:</label>
        <input type="text" name="title" value="<%= title %>" required><br><br>

        <label>New Author:</label>
        <input type="text" name="author" value="<%= author %>" required><br><br>

        <label>New Price:</label>
        <input type="number" name="price" step="0.01" value="<%= price %>" required><br><br>

        <input type="submit" value="Update Book">
    </form>
       <div style="text-align: right; margin: 20px;">
    <a href="dashboard.html" style="
        padding: 10px 20px;
        background-color: #2ecc71;
        color: white;
        text-decoration: none;
        border-radius: 6px;
        font-weight: bold;
        font-family: Arial, sans-serif;
    ">Back to Dashboard</a>
</div>

</body>
</html>
