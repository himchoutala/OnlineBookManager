<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bookapp.model.Book" %>

<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 30px;
            color: #333;
        }

        h2 {
            color: #2c3e50;
            text-align: center;
        }

        ul {
            list-style: none;
            padding: 0;
            max-width: 600px;
            margin: 30px auto;
        }

        li {
            background-color: #ffffff;
            border: 1px solid #ddd;
            margin-bottom: 10px;
            padding: 15px;
            border-radius: 6px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .dashboard-btn {
            text-align: center;
            margin-top: 30px;
        }

        .dashboard-btn a {
            padding: 10px 25px;
            background-color: #2ecc71;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            font-size: 14px;
        }

        .dashboard-btn a:hover {
            background-color: #27ae60;
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

    <h2>🔍 Search Results</h2>

    <%
        List<Book> results = (List<Book>) request.getAttribute("results");
        if (results != null && !results.isEmpty()) {
    %>
        <ul>
        <% for (Book book : results) { %>
            <li>
                <strong><%= book.getTitle() %></strong><br>
                Author: <%= book.getAuthor() %><br>
                Price: ₹<%= book.getPrice() %>
            </li>
        <% } %>
        </ul>
    <% } else { %>
        <p style="text-align: center;">😕 No results found for your query.</p>
    <% } %>

    <div class="dashboard-btn">
        <a href="dashboard.html">Back to Dashboard</a>
    </div>

</body>
</html>
