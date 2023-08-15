<html>
 <head>
<title>home page</title>
<link rel="icon" href="logo.ico"/>
<style>*{font-size:50px;}
body{ background-image: url("https://thumbs.dreamstime.com/b/student-desktop-education-design-vector-illustration-flat-colorful-67097701.jpg");}
</style>
 </head>
 <body>
<center>

<%

 if(session.getAttribute("user")!=null)
     {
       

}else
  {  response.sendRedirect("index.jsp");}

%>
    <h1> Student Management System </h1>
   
<form method="POST">
   <input type="submit" value="Add" name="abtn">
<input type="submit" value="Update" name="ubtn">
<input type="submit" value="View & Delete" name="dbtn">
</form>
<% 
if(request.getParameter("abtn")!=null)
{
response.sendRedirect("Add.jsp");
}
if(request.getParameter("vbtn")!=null)
{
response.sendRedirect("View.jsp");
}
if(request.getParameter("ubtn")!=null)
{
response.sendRedirect("Update.jsp");
}
if(request.getParameter("dbtn")!=null)
{
response.sendRedirect("Delete.jsp");
}



%>
<form>
   <input type="submit" value="logout" name="btn"/>
</form>
<% 
  if(request.getParameter("btn")!=null)
{   request.getSession().invalidate();
   response.sendRedirect("index.jsp");
}
%>
</center>
 </body>

</html>