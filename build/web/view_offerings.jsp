<%-- 
    Document   : update_offerings.jsp
    Created on : Dec 14, 2019, 1:50:13 PM
    Author     : kirstensison
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="CCP.*, java.sql.*, java.time.LocalDate" %>

<!DOCTYPE html>
<%
    Connection con = null;
    PreparedStatement stat = null;
    ResultSet res = null; 
    boolean has_data = false;
    if (request.getParameter("submit")!= null)
    {
        int id = Integer.parseInt(request.getParameter("offer_id"));
        Class.forName("com.mysql.jdbc.Driver");
        con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
        stat = con.prepareStatement("select * from classofferings where class_id = ?");
        stat.setInt(1, id);
        res = stat.executeQuery();
        
        has_data = res.next();
        String offer_data = "";
        if (has_data)
            offer_data = res.getString("class_id");
                               
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CULTURAL CLASSES</title>
    </head>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <body>
        <h1>Search and Display Offerings</h1><br>
        <div class="row">
            <div class="col-sm-4">
                <form class="card">
                            <div alight="left">
                                <div class="col-sm-6 form-group">
                                    <label class="form-label">Class ID:</label>
                                    <div class="dropdown">
                                       <%
                                           Class.forName("com.mysql.jdbc.Driver");
                                           con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                           stat = con.prepareStatement("select class_id from classofferings");
                                           ResultSet list = stat.executeQuery();
                                       %>
                                       <select name="offer_id" class="form-control" required>
                                           <%
                                               while(list.next())
                                               {
                                                   String l_id = list.getString("class_id");
                                           %>
                                           <option><%=list.getString("class_id")%></option>
                                           <% } %>

                                       </select>
                                       <% con.close(); %>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div alight="right">
                                    <input type="submit" value="submit" name="submit" class="btn btn-info">
                                    <input type="reset" value="reset" name="reset" class="btn btn-warning" onClick="this.form.reset()"><br>
                                </div>
                                <div alight="right">
                                     <p><a href="index.html">Go Back</a></p>
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
                                        <tr>
                                            <% if (res != null && has_data) { %>
                                            <td> <%=res.getString("class_id")%></td>
                                            <td> <%=res.getString("venue")%></td>
                                            <td> <%=res.getString("date")%></td>
                                            <td> <%=res.getString("date_cancelled")%></td>
                                            <td> <%=res.getString("date_confirmed")%></td>
                                            <td> <%=res.getString("num_students")%></td>
                                            <td> <%=res.getString("lecturer_id")%></td>
                                            <td> <%=res.getString("course_id")%></td>
                                            <% } %>
                                        </tr>
                                    </thead>                 
                            </table>
                </div>
            </div>
        </div>
    </body>
</html>
<% if (con != null) con.close(); %>