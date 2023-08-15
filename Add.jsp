<%@page import="java.sql.*" %>


<html>
<head>
<title>Add Page</title>
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
*{font-size: 50px;}
   *{font-size:30px;}  
h1{background-color:white;color:black;width:50%;border-radius:30px;}
body{ background-image: url("https://wallpaperaccess.com/full/1209535.jpg");}
 </style>
<form method="POST">
<h1>Fill the below information</h1>
<input type ="number"name="rno"placeholder="enter ur roll no" required >
<br><br>
<input type ="text"name="name"placeholder="enter ur name"  pattern="[A-Za-z ]+" required>
<br><br>
<input type ="number"name="mark1"placeholder="enter ur marks in 1st sub" required>
<br><br>
<input type ="number"name="mark2"placeholder="enter ur marks in 2nd sub" required>
<br><br>
<input type ="number"name="mark3"placeholder="enter ur marks in 3rd sub" required>
<br><br>
<input type ="submit"name="sbtn"value="Save">

</form>


<div class="output">
<%

if(request.getParameter("sbtn")!=null)

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
String sql="insert into student values(?,?,?,?,?)";
PreparedStatement pst=con.prepareStatement(sql);
pst.setInt(1,rno);
pst.setString(2,name);
pst.setInt(3,mark1);
pst.setInt(4,mark2);
pst.setInt(5,mark3);
pst.executeUpdate();


con.close();
out.println("ur record has been saved");

}

catch(SQLException err)
{

out.println("rno is already exist");
}

}
}


%>
</div>
<br/>
<form method="POST">
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