<%@ page import="java.sql.*" %>

<html>
  <head>
   <title>Signup page </title>  
 <link rel="icon" href="logo.ico"/>
  <style>
.output{background-color:white;color:black;width:20%;border-radius:30px;}
*{font-size: 50px;}
   *{font-size: 30px;}
    a{text-decoration:none;}

h1{background-color:white;color:black;width:50%;border-radius:30px;}
a{background-color:white;color:black;width:50%;border-radius:30px;}

body{ background-image: url("https://images.pexels.com/photos/4050315/pexels-photo-4050315.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");}
</style>
  </head>
   <body>
     <center>
    <h1>Signup Page</h1>
     <form method="POST">
       <input type="text" name="un" placeholder="enter your username" pattern="[A-Za-z ]+" required/> <br/> <br/>
       <input type="password" name="pswd" placeholder="enter your password" required/> <br/> <br/>
        <input type="password" name="pswd2" placeholder=" confirm password" required/> <br/> <br/>
        <input type="submit" name="btn" value="Signup"/> <br/> <br/>
       <a href="index.jsp">Go to Login page</a>
       </form>
       <div class="output">
        <%  if(request.getParameter("btn")!=null)
         {
             String un=request.getParameter("un");
             String pswd=request.getParameter("pswd");
             String pswd2=request.getParameter("pswd2");
           
         if(un.trim().length()<2)
out.println("invalid username");

          else if(!pswd.equals(pswd2))
            {out.println("password didn not match ");
              return;     }

           else if(pswd.length()<8)
            {out.println("min 8 character plzz ");
              return;}



else if(pswd.trim().length()<8)
{out.println("invalid password");
return;}



else if(pswd2.trim().length()<8)
{out.println("invalid password");
return;}
           else{
          try{
 
              DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
              String url="jdbc:mysql://localhost:3306/db12";
              Connection con=DriverManager.getConnection(url,"root","abc456");
              String sql="insert into users values(?,?)";
              PreparedStatement pst=con.prepareStatement(sql);
              pst.setString(1,un);
              pst.setString(2,pswd);
              pst.executeUpdate();
              con.close();
              response.sendRedirect("index.jsp");
           out.println("registered successfully");
         }catch(SQLException er )
          {
            out.println("username already existed");
         }
            
}
          }
         
        %> 
</div>
    
    </center>
   </body>

</html>