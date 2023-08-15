<%@page import="java.sql.*"    %>
<%

if(request.getParameter("r")!=null)
{
int rno=Integer.parseInt(request.getParameter("r"));


try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/db12";
Connection con =DriverManager.getConnection(url,"root","abc456");
String sql="delete from student where rno=?";
PreparedStatement pst=con.prepareStatement(sql);
pst.setInt(1,rno);
pst.executeUpdate();
con.close();
}
catch(SQLException er)
{

out.println("issues "+ er);

}
}
%>
<html>
<head>
<title>Delete page</title>
 <link rel="icon" href="logo.ico"/>

<style>

body{background-color:azure;}
*{font-size:40px;}
.nav{background-color:black;}
.nav a{color:white;text-decoration:none;margin:5%;}
</style>
</head>
<body> 
<%

 if(session.getAttribute("user")!=null)
     {
       

}else
  {  response.sendRedirect("index.jsp");}

%> 
<center>
<div class="nav">
<a href="StudentManagement.jsp">HOME</a>
<a href="Update.jsp">Update</a>
</div>
<h1>   Home Page</h1>
<table border="3"style="width:50%";>
<tr>
<th>Rno</th>
<th>Name</th>
<th>Mark1</th>
<th>Mark2</th>
<th>Mark3</th>
<th>Delete</th>
</tr>
<%

try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/db12";
Connection con =DriverManager.getConnection(url,"root","abc456");
String sql="select * from student";
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
int rno=rs.getInt(1);
String name=rs.getString(2);
int mark1=rs.getInt(3);
int mark2=rs.getInt(4);
int mark3=rs.getInt(5);

%>
<tr style="text-align:center;">
<td><%=rno%></td>
<td><%=name%></td>
<td><%=mark1%></td>
<td><%=mark2%></td>
<td><%=mark3%></td>
<td><a href="?r=<%=rno%>"onclick="return confirm('you really want to delete this?')">Delete</a></td>

</tr>
<%

}

}
catch(SQLException er)
{

out.println("issues "+ er);

}


%>
</table>
</center>
</body>
</html>
