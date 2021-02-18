

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
 if(request.getParameter("submit")!=null)  
 {
     String name = request.getParameter("sname");
          String course = request.getParameter("course");
     String fee = request.getParameter("fee");

     Connection con;
     PreparedStatement pst;
     ResultSet rs;
     
     Class.forName("com.mysql.jdbc.Driver");
     con= DriverManager.getConnection("jdbc:mysql://localhost/school","root","");
     pst=con.prepareStatement("insert into records(stname,course,fee)values(?,?,?)");
     pst.setString(1, name);
     pst.setString(2, course);
     pst.setString(3, fee);
     pst.executeUpdate();
     
     %>
     <script>
         alert("Record added");
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
        <h1>Student Registration System</h1>
        </br>
        <div class="row">
            <div class="col-sm-4">
                <form method="POST" action="#">
                    <div aligt="left">
                        <label class="form-label"> Student Name</label>
                        <input type ="text" class="form-control" placeholder="student name" name="sname" id="sname" required>
                        
                    </div> 
                    <div align="left">
                        <label class="form-label">Course</label>
                        <input type ="text" class="form-control" placeholder="Course" name="course" id="course" required>
                        
                    </div>
                     <div align="left">
                        <label class="form-label">Fee</label>
                        <input type ="text" class="form-control" placeholder="fee" name="fee" id="fee" required>
                        
                    </div>
                    </br>
                    <div align="right">
                        <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                       <input type="submit" id="reset" value="reset" name="reset" class="btn btn-warning">  
                        
                    </div>
                </form>
            </div>
            <div class="col-sm-8">
                <div class="panel-body">
                    <table id="tbl-student" class="table-responsive table-bordered" cellpadding="0" width="100%">
                        <thead>
                            <tr>
                                <th>Student Name</th>
                                <th>Course</th>
                                <th>Fees</th>
                                <th>Edit</th>
                                 <th>Delete</th>
                            </tr>
                            <% 
     Connection con;
     PreparedStatement pst;
     ResultSet rs;
     
     Class.forName("com.mysql.jdbc.Driver");
     con= DriverManager.getConnection("jdbc:mysql://localhost/school","root","");
     
     String query = "select * from records";
     Statement st= con.createStatement();
     rs= st.executeQuery(query);
     while(rs.next())
     {
         String id = rs.getString("id");       
                             %>
                            <tr>
                                <td><%=rs.getString("stname") %></td>
                                <td><%=rs.getString("course") %></td>
                                <td><%=rs.getString("fee") %></td>
                                <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                                <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                            </tr>    
                            <%
                                }
                            %>
                    </table> 
            </div>
        </div>
    </body>
</html>
