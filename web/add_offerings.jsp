<%--- 
    Document   : add_offerings.jsp
    Created on : Dec 11, 2019, 1:28:12 PM
    Author     : kirstensison
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="CCP.*, java.sql.*, java.time.LocalDate" %>
<%
    Connection con = null;
    PreparedStatement stat = null, gen = null;
    ResultSet res = null, num = null; 
    boolean has_data = false;
     
    if (request.getParameter("submit")!=null)
    {
        String venue = request.getParameter("venue");
        Date date = Date.valueOf(request.getParameter("date"));
        int lecturer = Integer.parseInt(request.getParameter("lecturer"));
        int course = Integer.parseInt(request.getParameter("course"));
        Class.forName("com.mysql.jdbc.Driver");
        con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
        stat = con.prepareStatement("insert into classofferings(venue,date,lecturer_id,course_id) values (?,?,?,?)");
        stat.setString(1, venue);
        stat.setDate(2, date);
        stat.setInt(3, lecturer);
        stat.setInt(4, course);
        stat.executeUpdate();
%>
<script>
    alert("Record Added!");
</script>
<%
    }
%>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ender Booking App</title>
    </head>
    <body>
        <h1>Class Offering</h1>
            </br>
        <div class="row">
            <div class="col-sm-4">
                <form class="card" name="addoffering" method="POST" action="#">
                    <div class="col-sm-6">
                        <div alight="left">
                            <label class="form-label">Venue:</label> 
                            <input type="text" class="form-control" name="venue" id="venue" placeholder="Venue" required><br>  
                        </div>
                        <div alight="left">
                            <label class="form-label">Date:</label>
                            <input type="date" class="form-control" name="date" id="date" placeholder="YYYY-MM-DD" required><br>
                        </div>
                        <div alight="left">
                            <label class="form-label">Lecturer ID:</label>
                            <div class="dropdown">
                                 <select name="lecturer" class="form-control" required>
                                <%
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                    stat = con.prepareStatement( "select lecturer_id from lecturers");
                                    res = stat.executeQuery();
                                    while(res.next())
                                    {
                                        String l_id = res.getString("lecturer_id");
                                %>

                                     <option>
                                          <%=res.getString("lecturer_id")%>
                                     </option>
                                <% } con.close(); %>
                                  </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div alight="left">
                            <label class="form-label">Course ID:</label>
                             <div class="dropdown">
                                <%
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                    stat = con.prepareStatement("select course_id from classes");
                                    res = stat.executeQuery();
                                %>
                                <select name="course" class="form-control" required>
                                    <%
                                        while(res.next())
                                        {
                                            String l_id = res.getString("course_id");
                                    %>
                                    <option><%=res.getString("course_id")%></option>
                                    <% } %>

                                </select>
                                <% con.close(); %>
                            </div>
                      
                            </br>
                            <div alight="right">
                                <input type="submit" value="submit" name="submit" class="btn btn-info">
                                <input type="reset" value="reset" name="reset" class="btn btn-warning" onClick="this.form.reset()">
                               <p><a href="index.html">Go Back</a></p>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            
            <div class="col-sm-8">
                <div class="panel-body">
                    <table id="tb-offerings" class="table table-responsive table-bordered" cellpadding="0" tablewidth="100%">
                        <thead>
                            <tr>
                                 <th>ID</th>
                                 <th>Venue</th>
                                 <th>Date</th>
                                 <th>Date Cancelled</th>
                                 <th>Date Confirmed</th>
                                 <th># of Students</th>
                                 <th>Lecturer ID</th>
                                 <th>Course ID</th>
                            </tr>
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                stat = con.prepareStatement("select * from classofferings");
                                res = stat.executeQuery();
                                while(res.next())
                                {
                                    String offer_info = res.getString("class_id");
                            %>
                            <tr>
                                <td> <%=res.getString("class_id")%></td>
                                <td> <%=res.getString("venue")%></td>
                                <td> <%=res.getString("date")%></td>
                                <td> <%=res.getString("date_cancelled")%></td>
                                <td> <%=res.getString("date_confirmed")%></td>
                                <td> <%=res.getString("num_students")%></td>
                                <td> <%=res.getString("lecturer_id")%></td>
                                <td> <%=res.getString("course_id")%></td>
                            </tr>
                        <%
                            }
                              con.close();
                        %>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
