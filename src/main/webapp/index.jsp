<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management System</title>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background:linear-gradient(to right,#74ebd5,#ACB6E5);
}

/* Navbar */

nav{
    background:#222;
    color:white;
    padding:18px 40px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    font-size:28px;
    font-weight:bold;
    letter-spacing:1px;
}

/* Dashboard */

.dashboard{
    display:flex;
    justify-content:center;
    gap:20px;
    margin-top:30px;
    flex-wrap:wrap;
}

.card{
    background:white;
    padding:25px;
    width:220px;
    border-radius:15px;
    text-align:center;
    box-shadow:0px 0px 10px rgba(0,0,0,0.2);
}

.card h2{
    color:#4CAF50;
    margin:0;
}

/* Main Container */

.container{
    width:85%;
    margin:40px auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0px 0px 15px rgba(0,0,0,0.3);
}

.container:hover{
    transform:scale(1.01);
    transition:0.3s;
}

h2{
    color:#333;
    text-align:center;
}

/* Search Box */

.search-box{
    width:50%;
    padding:10px;
    border-radius:8px;
    border:1px solid gray;
    margin-bottom:20px;
}

/* Table */

table{
    width:100%;
    border-collapse:collapse;
    margin-top:20px;
}

th{
    background:#4CAF50;
    color:white;
    padding:12px;
}

td{
    border:1px solid #ccc;
    padding:10px;
    text-align:center;
}

tr:hover{
    background:#f1f1f1;
}

/* Buttons */

.delete-btn{
    background:red;
    color:white;
    padding:6px 12px;
    border-radius:5px;
    text-decoration:none;
    font-weight:bold;
}

.delete-btn:hover{
    background:darkred;
}

.edit-btn{
    background:#2196F3;
    color:white;
    padding:6px 12px;
    border-radius:5px;
    text-decoration:none;
    margin-right:5px;
    font-weight:bold;
}

.edit-btn:hover{
    background:#0b7dda;
}

/* Logout Button */

.logout-btn{
    background:red;
    color:white;
    padding:8px 15px;
    border-radius:6px;
    text-decoration:none;
    font-size:16px;
}

.logout-btn:hover{
    background:darkred;
}

/* Add Student Button */

.add-btn{
    background:#4CAF50;
    color:white;
    padding:12px 20px;
    border-radius:8px;
    text-decoration:none;
    font-weight:bold;
    display:inline-block;
    margin-bottom:20px;
}

.add-btn:hover{
    background:#45a049;
}

/* Footer */

footer{
    text-align:center;
    padding:15px;
    color:#333;
    font-weight:bold;
}

</style>

</head>

<body>

<!-- Navbar -->

<!-- Navbar -->

<nav>

<div>
    Student Management Portal
</div>

<div style="
display:flex;
gap:15px;
align-items:center;
">

<a href="addStudent.jsp"
style="
background:#4CAF50;
color:white;
padding:8px 15px;
border-radius:6px;
text-decoration:none;
font-size:16px;
font-weight:bold;
">

+ Add Student

</a>

<a href="logout"
class="logout-btn">

Logout

</a>

</div>

</nav>
<!-- Dashboard -->

<div class="dashboard">

<div class="card">

<h2>
<%= request.getAttribute("totalStudents") %>
</h2>

<h3>Total Students</h3>

</div>

<div class="card">

<h2>
<%= request.getAttribute("activeStudents") %>
</h2>

<h3>Active Students</h3>

</div>

<div class="card">

<h2>
<%= request.getAttribute("inactiveStudents") %>
</h2>

<h3>Inactive Students</h3>

</div>

<div class="card">

<h2>
<%= request.getAttribute("maleStudents") %>
</h2>

<h3>Male Students</h3>

</div>

<div class="card">

<h2>
<%= request.getAttribute("femaleStudents") %>
</h2>

<h3>Female Students</h3>

</div>

</div>
<!-- Main Container -->

<div class="container">

<!-- Add Student Button -->

<a href="pdf"
style="
background:#ff5722;
color:white;
padding:10px 15px;
border-radius:6px;
text-decoration:none;
font-weight:bold;
">

Download PDF

</a>

<h2>Student Data</h2>


<!-- Filters -->

<div style="
display:flex;
justify-content:center;
gap:20px;
margin-bottom:20px;
flex-wrap:wrap;
">

<select id="courseFilter"
style="
padding:10px;
border-radius:8px;
width:200px;
">

<option value="">
All Courses
</option>

<option value="CS">
CS
</option>

<option value="IT">
IT
</option>

<option value="Civil">
Civil
</option>

<option value="Mechanical">
Mechanical
</option>

<option value="Electrical">
Electrical
</option>

<option value="AI">
AI
</option>
<option value="Pharmacy">
Pharmacy
</option>

</select>

<select id="statusFilter"
style="
padding:10px;
border-radius:8px;
width:200px;
">

<option value="">
All Status
</option>

<option value="Active">
Active
</option>

<option value="Inactive">
Inactive
</option>

</select>

</div>

<center>

<input type="text"
id="searchInput"
class="search-box"
placeholder="Search Student">

</center>

<table id="studentTable">

<tr>

<th>ID</th>
<th>Photo</th>
<th>Name</th>
<th>Email</th>
<th>Course</th>
<th>Gender</th>
<th>Status</th>
<th>Joined Date</th>
<th>Action</th>

</tr>

<%

ResultSet rs =
(ResultSet) request.getAttribute("rs");

if(rs != null){

while(rs.next()){

%>

<tr>

<td>
<%= rs.getInt("id") %>
</td>

<td>

<img src="images/<%= rs.getString("image") %>"
width="70"
height="70"
style="
border-radius:50%;
object-fit:cover;
border:2px solid #4CAF50;
">

</td>

<td>

<a href="profile?id=<%= rs.getInt("id") %>"
style="
text-decoration:none;
color:#2196F3;
font-weight:bold;
">

<%= rs.getString("name") %>

</a>

</td>

<td>
<%= rs.getString("email") %>
</td>

<td>
<%= rs.getString("course") %>
</td>

<td>
<%= rs.getString("gender") %>
</td>

<td>
<%= rs.getString("status") %>
</td>

<td>
<%= rs.getString("joined_date") %>
</td>

<td>

<a class="edit-btn"
href="plain?edit=<%= rs.getInt("id") %>">

Edit

</a>

<a class="delete-btn"
href="plain?delete=<%= rs.getInt("id") %>">

Delete

</a>

</td>

</tr>

<%
}
}
%>

</table>
<!-- Pagination -->

<div style="
margin-top:25px;
text-align:center;
">

<%

Integer totalPages =
(Integer)request.getAttribute(
"totalPages"
);

Integer currentPage =
(Integer)request.getAttribute(
"currentPage"
);

if(totalPages != null){

for(int i = 1; i <= totalPages; i++){

%>

<a href="plain?page=<%= i %>"
style="
padding:10px 15px;
margin:5px;
text-decoration:none;
border-radius:5px;
background:
<%= i == currentPage
? "#4CAF50"
: "#2196F3" %>;
color:white;
font-weight:bold;
">

<%= i %>

</a>

<%
}
}
%>

</div>
</div>

<footer>

Developed By Sandhya Pawar

</footer>

<script>

const searchInput =
document.getElementById("searchInput");

const courseFilter =
document.getElementById("courseFilter");

const statusFilter =
document.getElementById("statusFilter");

function filterTable(){

    let searchValue =
    searchInput.value.toLowerCase();

    let courseValue =
    courseFilter.value.toLowerCase();

    let statusValue =
    statusFilter.value.toLowerCase();

    let table =
    document.getElementById("studentTable");

    let tr =
    table.getElementsByTagName("tr");

    for(let i = 1; i < tr.length; i++){

        let rowText =
        tr[i].textContent.toLowerCase();

        let matchSearch =
        rowText.includes(searchValue);

        let matchCourse =
        courseValue === "" ||
        rowText.includes(courseValue);

        let matchStatus =
        statusValue === "" ||
        rowText.includes(statusValue);

        if(
        matchSearch &&
        matchCourse &&
        matchStatus
        ){

            tr[i].style.display = "";

        }
        else{

            tr[i].style.display = "none";
        }
    }
}

searchInput.addEventListener(
"keyup",
filterTable
);

courseFilter.addEventListener(
"change",
filterTable
);

statusFilter.addEventListener(
"change",
filterTable
);

</script>

</body>
</html>