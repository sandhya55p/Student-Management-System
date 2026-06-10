<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Profile</title>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial;
    background:linear-gradient(to right,#74ebd5,#ACB6E5);
}

.container{

    width:45%;
    margin:50px auto;
    background:white;
    padding:40px;
    border-radius:20px;
    text-align:center;
    box-shadow:0px 0px 15px rgba(0,0,0,0.3);
}

img{

    width:150px;
    height:150px;
    border-radius:50%;
    object-fit:cover;
    border:4px solid #4CAF50;
}

h1{
    color:#333;
    margin-top:15px;
}

.info{

    margin-top:30px;
    text-align:left;
}

.info p{

    font-size:18px;
    padding:10px;
    border-bottom:1px solid #ddd;
}

.back-btn{

    display:inline-block;
    margin-top:25px;
    background:#2196F3;
    color:white;
    padding:10px 20px;
    border-radius:8px;
    text-decoration:none;
    font-weight:bold;
}

.back-btn:hover{

    background:#0b7dda;
}

</style>

</head>

<body>

<div class="container">

<%

ResultSet rs =
(ResultSet) request.getAttribute("profile");

if(rs.next()){

%>

<img src="images/<%= rs.getString("image") %>">

<h1><%= rs.getString("name") %></h1>

<div class="info">

<p>
<span class="label">
ID:
</span>

<%= rs.getInt("id") %>
</p>

<p>
<span class="label">
Email:
</span>

<%= rs.getString("email") %>
</p>

<p>
<span class="label">
Course:
</span>

<%= rs.getString("course") %>
</p>

<p>
<span class="label">
Phone:
</span>

<%= rs.getString("phone") %>
</p>

<p>
<span class="label">
Address:
</span>

<%= rs.getString("address") %>
</p>

<p>
<span class="label">
Gender:
</span>

<%= rs.getString("gender") %>
</p>

<p>
<span class="label">
Status:
</span>

<%= rs.getString("status") %>
</p>

<p>
<span class="label">
Joined Date:
</span>

<%= rs.getString("joined_date") %>
</p>

</div>

<a href="plain" class="back-btn">

Back To Dashboard

</a>

<%
}
%>

</div>

</body>
</html>