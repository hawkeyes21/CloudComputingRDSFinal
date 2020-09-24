<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<% 

    try
    {
       Class.forName("com.mysql.jdbc.Driver");
       Connection conn = DriverManager.getConnection("jdbc:mysql://aws-rds-student-db.cwgm9pi0yf0q.us-east-1.rds.amazonaws.com:3306/studentdb?useSSL=false", "admin","admin123");
       String id = request.getParameter("id");
       PreparedStatement pst = conn.prepareStatement("delete from student where rollno = ?");
       pst.setString(1, id);
       pst.executeUpdate();
       
    }catch (ClassNotFoundException ex)
    {
        System.out.println(ex.getMessage());
    }
    catch (SQLException ex)
    {
        System.out.println(ex.getMessage());
    }
%>
        
       
     <script>
         alert("Record Deleted");
         window.location = 'http://localhost:8080/CloudComputing/index.jsp';
     </script>
     