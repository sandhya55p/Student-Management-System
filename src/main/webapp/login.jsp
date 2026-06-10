<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial;
    background:linear-gradient(to right,#74ebd5,#ACB6E5);
}

.container{

    width:35%;
    margin:100px auto;
    background:white;
    padding:40px;
    border-radius:15px;
    text-align:center;
    box-shadow:0px 0px 15px rgba(0,0,0,0.3);
}

h2{
    color:#333;
    margin-bottom:30px;
}

input{

    width:85%;
    padding:12px;
    margin:12px;
    border-radius:8px;
    border:1px solid #ccc;
    font-size:15px;
}

input[type="submit"]{

    background:#4CAF50;
    color:white;
    border:none;
    font-weight:bold;
    cursor:pointer;
}

input[type="submit"]:hover{

    background:#45a049;
}

img{

    width:100px;
    margin-bottom:15px;
}

</style>

</head>

<body>

<div class="container">

<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png">

<h2>Admin Login</h2>

<form action="login" method="post">

<input type="email"
       name="email"
       placeholder="Enter Email"
       required>

<br>

<input type="password"
       name="password"
       placeholder="Enter Password"
       required>

<br>

<input type="submit"
       value="Login">

</form>

</div>

</body>
</html>