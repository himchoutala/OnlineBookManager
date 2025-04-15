<%@ page import="org.bson.types.ObjectId" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mongodb.client.MongoClients, com.mongodb.client.MongoClient, com.mongodb.client.MongoDatabase, com.mongodb.client.MongoCollection" %>
<%@ page import="org.bson.Document" %>

<%
    MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
    MongoDatabase database = mongoClient.getDatabase("bookdb");
    MongoCollection<Document> collection = database.getCollection("books");
    List<Document> books = collection.find().into(new java.util.ArrayList<>());
%>

<html>
<head>
    <title>All Books</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: rgba(23, 40, 24, 0.8);
            color: #ffff;
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #ffff;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 20px;
            border-bottom: 1px solid #ddd;
            text-align: left;
            color:black;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:hover {
            background-color: #f2f2f2;
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
<body>
    <h2>All Books</h2>

    <table border="1">
        <tr>
            <th>Book ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
        <%
            for (Document book : books) {
                ObjectId id = book.getObjectId("_id");
        %>
           <tr>
                <td><%= id.toHexString() %></td>
                <td><%= book.getString("title") %></td>
                <td><%= book.getString("author") %></td>
                <td><%= book.getDouble("price") %></td>
                <td>
                    <a href="updateBook.jsp?id=<%= id.toHexString() %>">Update</a> |
                    <a href="deleteBook.jsp?id=<%= id.toHexString() %>" onclick="return confirm('Are you sure you want to delete this book?');">Delete</a>
                </td>
            </tr>
        <%
            }
        %>
    </table>
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
