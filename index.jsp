<%@ page import="java.sql.*" %>

<html>
  <head>
   <title>Login Page </title>  
 <link rel="icon" href="logo.ico"/>
  <style>
.output{background-color:white;color:black;width:20%;border-radius:30px;}
*{font-size: 50px;}
    a{background-color:white;color:black;width:20%;border-radius:30px;}
h1{background-color:white;color:black;width:50%;border-radius:30px;}
h3{background-color:white;color:black;width:20%;border-radius:30px;}
 body{ background-image: url("https://wallpaperaccess.com/full/1209535.jpg");}
</style>

  </head>
   <body>
     <center>
    <h1>Student Management System</h1>
<h3>Login Page</h3>
     <form method="POST">
       <input type="text" name="un" placeholder="enter your username" required/> <br/> <br/>
       <input type="password" name="pswd" placeholder="enter your password" required/> <br/> <br/>
        <input type="submit" name="btn" value="login"/> <br/> <br/>
       <a href="signup.jsp">Click for registation</a>
      
      </form>
     <div class="output">
        <%  if(request.getParameter("btn")!=null)
         {
             String un=request.getParameter("un");
             String pswd=request.getParameter("pswd");
           
          try{
 
              DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
              String url="jdbc:mysql://localhost:3306/db12";
              Connection con=DriverManager.getConnection(url,"root","abc456");
              String sql="select * from users where username=? and password=?";
              PreparedStatement pst=con.prepareStatement(sql);
              pst.setString(1,un);
              pst.setString(2,pswd);
              ResultSet rs=pst.executeQuery();
             
             if(rs.next())
            {   request.getSession().setAttribute("user",un);
                response.sendRedirect("StudentManagement.jsp");
                
          } else   {out.println("invalid login");}
            
         }catch(SQLException er )
          {
            out.println("isuue" + er);
         }
            

          }
         
        %> 
</div>
   
     
       
    </center>
   </body>

</html>