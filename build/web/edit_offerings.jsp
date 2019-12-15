<%-- 
    Document   : update_offerings.jsp
    Created on : Dec 14, 2019, 1:50:13 PM
    Author     : kirstensison
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="CCP.*, java.sql.*, java.time.LocalDate" %>
<%@page import="java.time.Duration"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.util.TimeZone"%>
<!DOCTYPE html>
<%
    Connection con = null;
    PreparedStatement stat = null;
    ResultSet res = null; 
    int id = 0;
    if (request.getParameter("submit")!= null)
    {
        id = Integer.parseInt(request.getParameter("id"));
        String type = request.getParameter("edit_type");
        Class.forName("com.mysql.jdbc.Driver");
        con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
        switch (type) {
            case "venue":     
                String venue = request.getParameter("new_val");
                stat = con.prepareStatement("Update  classofferings set venue = ? WHERE class_id = ?");
                stat.setString(1,venue);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "date":
                stat = con.prepareStatement("Update classofferings set date = ? WHERE class_id = ?");
                Date d = Date.valueOf(request.getParameter("new_val"));
                d.setTime(d.getTime() + TimeZone.getDefault().getRawOffset());
                stat.setDate(1,d);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "date_cancel":
                stat = con.prepareStatement("Update classofferings set date_cancelled = ? WHERE class_id = ?");
                Date d_cancel = Date.valueOf(request.getParameter("new_val"));
                d_cancel.setTime(d_cancel.getTime() + TimeZone.getDefault().getRawOffset());
                stat.setDate(1,d_cancel);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "date_confirm":
                stat = con.prepareStatement("Update classofferings set date_confirmed = ? WHERE class_id = ?");
                Date d_confirm = Date.valueOf(request.getParameter("new_val"));
                d_confirm.setTime(d_confirm.getTime() + TimeZone.getDefault().getRawOffset());
                stat.setDate(1,d_confirm);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "num":
                stat = con.prepareStatement("Update classofferings set num_students = ? WHERE class_id = ?");
                int num = Integer.parseInt(request.getParameter("new_val"));
                stat.setInt(1,num);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "lecturer":
                stat = con.prepareStatement("Update classofferings set lecturer_id = ? WHERE class_id = ?");
                int lect = Integer.parseInt(request.getParameter("new_val"));
                stat.setInt(1,lect);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "course":
                stat = con.prepareStatement("Update classofferings set course_id = ? WHERE class_id = ?");
                int course = Integer.parseInt(request.getParameter("new_val"));
                stat.setInt(1,course);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;     
        }
%>
<script>
    alert("Record Updated");
</script>
<%
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
        <h1>Update Class Offerings</h1><br>
        <div class="row">
            <div class="col-sm-4">
            <form class="card" method="POST" action="#">
                <div class="col-sm-6">
                    <label class="form-label">Enter Class ID:</label><br>
                        <div class="dropdown">
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                stat = con.prepareStatement("select class_id from classofferings");
                                ResultSet list = stat.executeQuery();
                            %>
                            <select name="id" class="form-control" required>
                                <%
                                    while(list.next())
                                    {
                                        String l_id = list.getString("class_id");
                                %>
                                <option><%=list.getString("class_id")%></option>
                                <% } %>

                            </select>
                            <% con.close(); %>
                         </div> <br>
                </div>
                <div class="col-sm-8">
                   <div alight="left">
                       <label class="form-label">Enter New Value:</label><br>
                       <input type="text" class="form-control" name="new_val" placeholder="YYYY-MM-DD for Dates"><br>
                   </div>        
                   <div alight="left">
                       <select class="form-control" name="edit_type" required>
                           <option value = "venue">Change Venue</option>
                           <option value = "date">Change Date</option>
                           <option value = "date_cancel">Change Date Cancelled</option>
                           <option value = "date_confirm">Change Date Confirmed</option>
                           <option value = "num">Change # of Students</option>
                           <option value = "lecturer">Change Lecturer</option>
                           <option value = "course">Change Course ID</option>
                        </select><br>
                   </div>
                </div>
                <div class="col-sm-6">
                    <div alight="right">
                        <input type="submit" value="submit" name="submit" class="btn btn-info">   
                        <input type="reset" value="reset" name="reset" class="btn btn-warning" onClick="this.form.reset()">
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
                                    <th>Date Confirmed</th>
                                    <th>Date Cancelled</th>
                                    <th># of Students</th>
                                    <th>Lecturer ID</th>
                                    <th>Course ID</th>
                                </tr>
                                <%
                                    Class.forName("com.mysql.jdbc.Driver");
                                    boolean has_data = false;
                                    con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                    stat = con.prepareStatement("select * from classofferings where class_id = ?");
                                    stat.setInt(1, id);
                                    res = stat.executeQuery();
                                    has_data = res.next();
                                    if (has_data){
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
                            </thead>
                            <%  } con.close();%>
                        </table>
                    </div>
                </div>
            </div>
    </body>
</html>
