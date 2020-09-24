<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>

<% 

    if(request.getParameter("submit")!=null){
        
        Connection conn;
        PreparedStatement statement;
        ResultSet resultSet;

    String rollno = request.getParameter("studrollno");
    String studname = request.getParameter("studname");
    String studphoneno = request.getParameter("studphno");
    String studadd = request.getParameter("studadd");
    
    conn = DriverManager.getConnection("jdbc:mysql://aws-rds-student-db.cwgm9pi0yf0q.us-east-1.rds.amazonaws.com:3306/studentdb?useSSL=false", "admin","admin123");
     statement = conn.prepareStatement("insert into student(rollno,studname,phoneno,address) values(?,?,?,?)");
    
    statement.setString(1, rollno);
    statement.setString(2, studname);
    statement.setString(3, studphoneno);
    statement.setString(4, studadd);
    
    statement.executeUpdate();
    
    
     %>
    
     <script>
         alert("Record Added");
     </script>
     
    <%
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Registration</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
         <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
         
         <style>
        .border-class
        {
            border:thin black solid;
            border-color: lightgray;
            border-radius: 25px;
            margin:5px;
            padding:5px;
            height: 430px;
            width: 100%;
            padding: 10px;
        }
</style>
    </head>
    
    <body>
        <h3 style="margin-left:2.5%;margin-top:2%;color:gray;">Student Registration</h3>
        <br>
        <div class="row" style="margin-left:2.5%">
            <div class="col-sm-4">
                <form class="border-class" method="POST" action="#">
                    
                    <div align="left">
                        <label class="form-label">Roll No</label>
                        <input type="text" class="form-control" placeholder="Enter Student Roll Number" name="studrollno" required>
                    </div>
                     <div align="left"  style="margin-top:5px">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Enter Student Name" name="studname" required>
                    </div>
                    <div align="left">
                        <label class="form-label">Phone No</label>
                        <input type="text" class="form-control" placeholder="Enter Phone Number" name="studphno" required>
                    </div>
                    <div align="left">
                        <label class="form-label">Address</label>
                        <textarea class="form-control" name="studadd" rows="3"></textarea>
                    </div>
                    <br>
                     <div align="right">
                         <input type="submit" name="submit" value="submit" class="btn btn-info">
                          <input type="reset" name="reset" value="reset" class="btn btn-warning">
                    </div>
                    
                </form>
                
            </div>
            <div class="col-sm-6">
                
                <div class="panel-body">
                    <table id="tbl-student" class="table table-bordered">
                        
                        <thead>
                            <tr>
                                <th>Roll Number</th>
                                <th>Student Name</th>
                                <th>Phone No</th>
                                <th>Address</th>
                            </tr>
                            
                            <% 
                                    try
                                    {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://aws-rds-student-db.cwgm9pi0yf0q.us-east-1.rds.amazonaws.com:3306/studentdb?useSSL=false", "admin","admin123");
                                        Statement st = conn.createStatement();
                                        ResultSet rs = st.executeQuery("select * from student");
                                        while(rs.next())
                                        {   
                                         String id = rs.getString("ROLLNO");
                                           
                             %>

                            <tr>                     
                                <td><%= rs.getString("ROLLNO")%></td>
                                <td><%= rs.getString("STUDNAME")%></td>
                                <td><%= rs.getString("PHONENO")%></td>
                                <td><%= rs.getString("ADDRESS")%></td>
                                <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>                                
                            </tr>
                            
                         <%
                            
                              }
                            }  catch (ClassNotFoundException ex)
                                {
                                    System.out.println(ex.getMessage());
                                }
                                catch (SQLException ex)
                                {
                                    System.out.println(ex.getMessage());
                                }
                         %>
                        </thead>
                        
                    </table>
                </div>
                
            </div>
            
            
        </div>
        
    </body>
</html>
