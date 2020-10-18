
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page import="com.tithi.bookworm.DataBaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    div.sticky {
  position: relative;
  z-index: 1000;
  opacity: .90;
}
    html { 
  background: url(Backgrounds/genre.png) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
} 
.sideByside{
    width:150px;
  height:200px;
  padding-right: 10px;
}
.sideByside:hover{
    width:180px;
  height:230px;
  padding-right: 10px;
}
* {box-sizing: border-box;}

body {
  font-family: Arial, Helvetica, sans-serif;
}

a:link {
  color: black;
  text-decoration: none
}

/* visited link */
a:visited {
  color: black;
  text-decoration: none
}

/* mouse over link */
a:hover {
  color: blue;
  text-decoration: none
}

/* selected link */
a:active {
  color: blue;
  text-decoration: none
}

.column{
    float: left;
    padding: 1px;
    color: black;
    background-color: white;
}

.row:after{
    content: "";
    display: table;
    clear: both;
}

.dropdown {
  float: right;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: #3E1B0F; 
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.topnav {
  list-style-type: none;
  overflow: hidden;
  margin: 0;
  padding: 0;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  background-color: #EFEAE2;
}

.topnav a {
  float: right;
  font-size: 16px;
  color: #3E1B0F; 
  text-align: left;
  padding: 14px 16px;
  text-decoration: none;
}

.topnav a:hover, .dropdown:hover .dropbtn {
  background-color: #3E1B0F; 
  color: white;
}

.topnav a.active {
  background-color: #3E1B0F;
  color: white;
}

select#soflow{
   -webkit-appearance: button;
   
   -webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
   -webkit-padding-end: 20px;
   -webkit-padding-start: 2px;
   -webkit-user-select: none;
   border: none;
   color: #555;
   font-size: inherit;
   margin: 0px;
   overflow: hidden;
   text-align : center;
   text-overflow: ellipsis;
   white-space: nowrap;
   float : left;
   
}

.topnav .search-container {
  float: left;
  margin-top : 7px;
  -webkit-border-radius: 2px;
  -webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
}

.dropdown-content {
  display: none;
  position: fixed;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: #564A3D;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}

.topnav input[type=text] {
  padding: 6px;
  height : 35px;
  font-size: 17px;
  border: none;
}

.topnav .search-container button {
  padding: 6px 10px;
  background: white;
  font-size: 17px;
  border: none;
  cursor: pointer;
  width : 36px;
  height : 35px;
}

.topnav .search-container button:hover {
  border: thin solid #3E1B0F; 
  box-shadow: 0 5px 5px -5px #3E1B0F;
}

select#soflow:hover {
	border: thin solid #3E1B0F; 
    box-shadow: 0 5px 5px -5px #3E1B0F;
}

select#shelfflow:hover {
	border: thin solid #3E1B0F; 
    box-shadow: 0 5px 5px -5px #3E1B0F;
}
.foc {
    
}

.foc:focus {
	border: thin solid #3E1B0F; 
    box-shadow: 0 5px 5px -5px #3E1B0F;
    }
    
@media screen and (max-width: 600px) {
  .topnav .search-container {
    float: none;
  }
  .topnav a, .topnav input[type=text], .topnav .search-container button {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 14px;
  }
  .topnav input[type=text] {
    border: 1px solid #ccc;  
  }
}
table {
                border-collapse: collapse;
                width: 100%;
              }

              th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 2px solid #b4b1b1;
                padding-top: 30px
              }
</style>
<title>BookWorm: Genre</title>
</head>
<body>
    <%
            response.setHeader("Cache-Control","no cache,no store,must-revalidate");
            if(session.getAttribute("username")==null){
                response.sendRedirect("Login.jsp");
            }
            %>
    
<script type="text/javascript">
function searchType(){
var searchType = document.getElementById("searchType");
var selectedItem = searchType.options[searchType.selectedIndex].value;

}
</script>


<!--    navigation bar starts   -->
<div class="sticky">
<div class="topnav" style="border-bottom: thin solid #ccc; box-shadow: 0 5px 5px -5px #ccc">
    <div class="column" style="width: 10%; background-color: #EFEAE2"></div>
    <div class="column" style="padding-top: 8px; background-color: #EFEAE2"><img src="Backgrounds/logo.png" alt="BookWorm" width="150" height="30" style="float: left"></div>
    <div class="column" style="width: 10%; background-color: #EFEAE2"></div>
    <div class="search-container">
        <form name ="searchForm" method="post" action="Search">
            <select id="soflow" name="searchType"  onchange="searchType()" style="height: 35px; background_color: white">
                <option selected value="All">All</option>
                <option value="Title">Title</option>
                <option value="Author">Author</option>
                <option value="Genre">Genre</option>
            </select>
            <input type="text" placeholder="Search" name="title" class="form-control" style="width: 259px"><button type="submit"><i class="fa fa-search"></i></button>
        </form>
    </div>
    <div class="column" style="width: 10%; background-color: #EFEAE2; float: right"></div>
    <% String username=(String)session.getAttribute("username"); 
            if(username.equals("naimajonaki001@gmail.com")){%>
 <div class="dropdown">
    <button class="dropbtn">Admin 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="AllBooks">All Books</a>
      <a href="allUser">All User</a>
      
      <a href="addBook.jsp">Add Books</a>
    </div>
  </div>
 <%}%>
        <div class="dropdown">
            <button class="dropbtn">My Account 
              <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
                <a href="changePass.jsp">Account Settings</a>
                <form name="submitForm" method="POST" action="bookShelf">
                    <a href="javascript:document.submitForm.submit()">My Bookshelf</a>
                </form>
                <a href="ShowHistory">History</a>
                <a href="Logout">LogOut</a>
            </div>
        </div>
        <a href="UserProfile.jsp">Profile</a>
        <a href="NewHome">Home</a>
        <div class="dropdown">
            <button class="dropbtn">Browse 
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
                <a href="AllBooks">All Books</a>
                <a href="Genre">Genre</a>
                <a href="MostRecent">Most Recent</a>
                <a href="MostLiked">Most Liked</a>
            </div>
        </div>
    </div>
        <hr color="#DEDEDE" width="4"></div><br><br><br><br><br><br><br><br>
<!--    navigation bar ends   -->
<div class="row" style="width: auto">
        
        <div class="column" style="width: 25%; background: none; opacity: 1"></div>
        <div class="column" style="width: 50%; min-height: 400px; border: thin solid #ccc; padding-bottom: 80px; padding-top: 70px; padding-left: 30px; padding-right: 30px; opacity: 0.80">
            
            <div class="row" style="width: auto"><font style="font-size: 18px">&emsp;&emsp;All Books by Genre</font><hr></div>
            <div class="row" style="width: auto; padding-left: 30px; padding-right: 30px" >
           
    

 <% boolean first = false;
          ArrayList <String> gname=(ArrayList<String>)session.getAttribute("gname");
           for (int i = 0; i <gname.size(); i++) {
               ResultSet rs = (ResultSet)session.getAttribute(gname.get(i));
            if(rs.next()){ 
               if(first){ %>
                            <br><br><br><br><br><%}%><br><br> 
               <%if(!first) {first = true;}%>
                             <font style="font-size: 18px; font-style: italic;"><b>&nbsp;&nbsp;<%= gname.get(i) %>:</b></font>
<table cellspacing="70" >
   <tr>  <td>  <br> <a href="bookPage_1?bId=<%=rs.getInt("book_id") %>"><img class="sideByside" src="image/<%=rs.getString("book_id")%>.jpg"></a></td>
                 
                <td>  <br>
      <a href="bookPage_1?bId=<%=rs.getInt("book_id") %>"><b><%=rs.getString("book_name") %></b></a>
        <br> <br>      
           by &nbsp; <%=rs.getString("author_name") %>
            <br> <br> <%=rs.getString("description") %>                                            
        <br><br>
                </td>
   </tr>
    </table> 
    <% } %>
    <br>
         
            <%while (rs.next()){ %>
                         <table cellspacing="70" >

   <tr>  <td> <br>  <a href="bookPage_1?bId=<%=rs.getInt("book_id") %>"><img class="sideByside" src="image/<%=rs.getString("book_id")%>.jpg"></a></td>
                 
                <td>  <br>
      <a href="bookPage_1?bId=<%=rs.getInt("book_id") %>"><b><%=rs.getString("book_name") %></b></a>
        <br> <br>      
           by &nbsp; <%=rs.getString("author_name") %>
            <br> <br> <%=rs.getString("description") %>                                            
        <br><br>
                </td>
   </tr>
                   </table> 
    <% } %>
               
         <%      }

            %><br>
             




       

   
            </div>    </div> 
<div class="column" style="width: 25%; background: none; opacity: 1"></div>
</div> 
<br><br><br><br><br><br><br><br>
</body>
</html>