
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
 if(request.getParameter("submit")!=null)  
 {
     String id = request.getParameter("id");
     String name = request.getParameter("sname");
     String course = request.getParameter("course");
     String fee = request.getParameter("fee");

     Connection con;
     PreparedStatement pst;
     ResultSet rs;
     
     Class.forName("com.mysql.jdbc.Driver");
     con= DriverManager.getConnection("jdbc:mysql://localhost/school","root","");
     pst=con.prepareStatement("update records set stname= ?,course= ?,fee= ? where id=?");
     pst.setString(1, name);
     pst.setString(2, course);
     pst.setString(3, fee);
      pst.setString(4, id);
     
     pst.executeUpdate();
     
     %>
     <script>
         alert("Record updated");
         </script>
 <% 
 }




%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Student Update</h1>
        <div class="row">
                        <div class="col-sm-4">
                <form method="POST" action="#">
                   <% 
                      Connection con;
                      PreparedStatement pst;
                      ResultSet rs;
     
                      Class.forName("com.mysql.jdbc.Driver");
                      con= DriverManager.getConnection("jdbc:mysql://localhost/school","root","");
                      
                      String id = request.getParameter("id");
                      pst= con.prepareStatement("select * from records where id = ?");
                      pst.setString(1, id);
                      rs = pst.executeQuery();
                      while(rs.next())
                      {
                          
                   
                   
                   
                   
                   
                   
                   
                   %> 
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    <div aligt="left">
                        <label class="form-label"> Student Name</label>
                        <input type ="text" class="form-control" placeholder="student name" value="<%= rs.getString("stname")%>" name="sname" id="sname" required>
                        
                    </div> 
                    <div align="left">
                        <label class="form-label">Course</label>
                        <input type ="text" class="form-control" placeholder="Course" value="<%= rs.getString("course")%> "name="course" id="course" required>
                        
                    </div>
                     <div align="left">
                        <label class="form-label">Fee</label>
                        <input type ="text" class="form-control" placeholder="fee" value="<%= rs.getString("fee")%>" name="fee" id="fee" required>
                        
                    </div>
                   <% } %>
                    </br>
                    <div align="right">
                        <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                       <input type="submit" id="reset" value="reset" name="reset" class="btn btn-warning">  
                        
                    </div>
                    <div align="right">
                        <p><a href="index.jsp">Click to Back</a></p>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
