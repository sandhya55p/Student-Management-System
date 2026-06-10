<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Student</title>

<style>

body{
    font-family:Arial;
    background:linear-gradient(to right,#74ebd5,#ACB6E5);
}

.container{
    width:50%;
    margin:80px auto;
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
    border:1px solid gray;
}

input[type=submit]{
    background:#2196F3;
    color:white;
    border:none;
    cursor:pointer;
}

input[type=submit]:hover{
    background:#0b7dda;
}

</style>

</head>

<body>

<div class="container">

<h2>Update Student</h2>

<%

ResultSet rs =
(ResultSet) request.getAttribute("editRs");

if(rs != null && rs.next()){

%>

<form action="update"
      method="post"
      enctype="multipart/form-data">

<input type="hidden"
       name="id"
       value="<%= rs.getInt("id") %>">

<input type="text"
       name="name"
       value="<%= rs.getString("name") %>"
       required>

<br>

<input type="email"
       name="email"
       value="<%= rs.getString("email") %>"
       required>

<br>

<input type="text"
       name="course"
       value="<%= rs.getString("course") %>"
       required>

<br>

<input type="text"
       name="phone"
       value="<%= rs.getString("phone") %>"
       placeholder="Enter Phone Number"
       required>

<br>

<input type="text"
       name="address"
       value="<%= rs.getString("address") %>"
       placeholder="Enter Address"
       required>

<br>

<%

String gender = rs.getString("gender");
String status = rs.getString("status");

%>

<select name="gender" required>

<option value="Male" 
    <%= "Male".equals(rs.getString("gender")) ? "selected" : "" %>>
    Male
</option>

<option value="Female" 
    <%= "Female".equals(rs.getString("gender")) ? "selected" : "" %>>
    Female
</option>
</select>

<br>

<select name="status" required>

<option value="Active" <%= rs.getString("status").equals("Active") ? "selected" : "" %>>Active</option>

<option value="Inactive" <%= rs.getString("status").equals("Inactive") ? "selected" : "" %>>Inactive</option>

</select>

<br>
<!-- Current Image -->

<img id="preview"
     src="images/<%= rs.getString("image") %>"
     width="120"
     height="120"
     style="
        border-radius:50%;
        border:3px solid #4CAF50;
        object-fit:cover;
        cursor:pointer;
     ">

<br><br>

<!-- Hidden File Input -->

<input type="file"
       id="imageInput"
       name="image"
       accept="image/*"
       style="display:none;">

<br>

<input type="submit"
       value="Update Student">

</form>

<%
}
%>

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