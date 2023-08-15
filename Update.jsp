<%@page import="java.sql.*" %>

<html>
<head>
<title>Update Page</title>
 <link rel="icon" href="logo.ico"/>
</head>
<body>

<%

 if(session.getAttribute("user")!=null)
     {
       

}else
  {  response.sendRedirect("index.jsp");}

%>

<center>
<style> 
.output{background-color:white;color:black;width:20%;border-radius:30px;}
   *{font-size:30px;}  
h1{background-color:white;color:black;width:50%;border-radius:30px;}
body{ background-image: url("https://wallpaperaccess.com/full/1209535.jpg");}
 </style>
<form method="POST">
<h1>Update the required information</h1>

<input type ="number"name="rno"placeholder="enter ur roll no" required >
<br><br>
<input type ="text"name="name"placeholder="enter ur name" required>
<br><br>
<input type ="number"name="mark1"placeholder="enter ur marks in 1st sub" required>
<br><br>
<input type ="number"name="mark2"placeholder="enter ur marks in 2nd sub" required>
<br><br>
<input type ="number"name="mark3"placeholder="enter ur marks in 3rd sub" required>
<br><br>
<input type ="submit"name="ubtn"value="Update">

</form>


 <div class="output">
<%

if(request.getParameter("ubtn")!=null)

{
int rno=Integer.parseInt(request.getParameter("rno") );
String name=request.getParameter("name");
int mark1=Integer.parseInt(request.getParameter("mark1"));
int mark2=Integer.parseInt(request.getParameter("mark2"));
int mark3=Integer.parseInt(request.getParameter("mark3"));

 if (rno ==0 || name == null )
out.println("enter values");
else if(rno<1)
out.println("enter positive rno");

else if(name.trim().length()<2)
out.println("invalid name");



else if (mark1<0 || mark1>100 )
out.println("mark1 is not between 0 to 100");
else if (mark2<0  || mark2>100 )
out.println("mark2 is not between 0 to 100");
else if (mark3<0 || mark3>100 )
out.println("mark3 is not between 0 to 100");




else
{ 


try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/db12";
Connection con =DriverManager.getConnection(url,"root","abc456");
String sql="update  student set name=?,mark1 =?,mark2 =?,mark3 =? where rno =?";
String sql2="select * from student where rno=?";
PreparedStatement pst=con.prepareStatement(sql);
PreparedStatement pst1=con.prepareStatement(sql2);

pst.setString(1,name);
pst.setInt(2,mark1);
pst.setInt(3,mark2);
pst.setInt(4,mark3);
pst.setInt(5,rno);
pst1.setInt(1,rno);
ResultSet rs=pst1.executeQuery();



if(rs.next())
            {   
                pst.executeUpdate();
              out.println("record has been updated");  
response.sendRedirect("Delete.jsp");
          } else   {

out.println("invalid rno");
}




con.close();





}

catch(SQLException err)
{

out.println("issue "+ err);
}
}
}

%>
</div>
<form>
<input type ="submit"name="bbtn"value="Back">
</form>

<%

if(request.getParameter("bbtn")!=null)
{
response.sendRedirect("StudentManagement.jsp");
}

%>

</center>
</body>
</html>