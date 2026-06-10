<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student</title>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial;
    background:linear-gradient(to right,#74ebd5,#ACB6E5);
}

.container{
    width:50%;
    margin:40px auto;
    background:white;
    padding:30px;
    border-radius:15px;
    text-align:center;
    box-shadow:0px 0px 15px rgba(0,0,0,0.3);
}

input, select{
    width:80%;
    padding:12px;
    margin:10px;
    border-radius:8px;
    border:1px solid #ccc;
}

input[type=submit]{
    background:#4CAF50;
    color:white;
    border:none;
    cursor:pointer;
    font-weight:bold;
}

input[type=submit]:hover{
    background:#45a049;
}

</style>

</head>

<body>

<div class="container">

<h2>Add Student</h2>

<form action="plain"
      method="post"
      enctype="multipart/form-data">

<input type="text"
       name="name"
       placeholder="Enter Student Name"
       required>

<br>

<input type="email"
       name="email"
       placeholder="Enter Student Email"
       required>

<br>

<input type="text"
       name="course"
       placeholder="Enter Course"
       required>

<br>

<input type="text"
       name="phone"
       placeholder="Enter Phone Number"
       required>

<br>

<input type="text"
       name="address"
       placeholder="Enter Address"
       required>

<br>

<select name="gender" required>

<option value="">
Select Gender
</option>

<option value="Male">
Male
</option>

<option value="Female">
Female
</option>

</select>

<br>

<select name="status" required>

<option value="">
Select Status
</option>

<option value="Active">
Active
</option>

<option value="Inactive">
Inactive
</option>

</select>

<br>

<img id="preview"
src="https://cdn-icons-png.flaticon.com/512/149/149071.png"
width="120"
height="120"
style="
border-radius:50%;
cursor:pointer;
border:3px solid #4CAF50;
object-fit:cover;
">

<br><br>

<input type="file"
id="imageInput"
name="image"
accept="image/*"
style="display:none;"
required>

<br>

<input type="submit"
value="Add Student">

</form>

<br>

<a href="plain"
style="
text-decoration:none;
color:#2196F3;
font-weight:bold;
">

← Back To Dashboard

</a>

</div>

<script>

const preview =
document.getElementById("preview");

const imageInput =
document.getElementById("imageInput");

preview.addEventListener("click", function(){

    imageInput.click();

});

imageInput.addEventListener("change", function(event){

    const file = event.target.files[0];

    if(file){

        preview.src =
        URL.createObjectURL(file);

    }

});

</script>

</body>
</html>