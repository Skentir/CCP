<%-- 
    Document   : add_group
    Created on : Dec 15, 2019, 3:45:30 PM
    Author     : Administrator
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="CCP.*, java.sql.*, java.time.LocalDate" %>
<%@page import="java.time.Duration"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.util.TimeZone"%>
<%
    Connection con = null;
    PreparedStatement stat = null, gen = null;
    ResultSet res = null, num = null; 
    boolean has_data = false;
     
    if (request.getParameter("submit")!=null)
    {
        Date start_date = Date.valueOf(request.getParameter("start_date"));
        Date end_date = Date.valueOf(request.getParameter("end_date"));
        start_date.setTime(start_date.getTime() + TimeZone.getDefault().getRawOffset());
        end_date.setTime(end_date.getTime() + TimeZone.getDefault().getRawOffset());
        String rep_email = request.getParameter("rep_email");
        
        Class.forName("com.mysql.jdbc.Driver");
        con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
        stat = con.prepareStatement("insert into clientgroups(start_date,end_date,rep_email) values (?,?,?)");
        stat.setDate(1, start_date);
        stat.setDate(2, end_date);
        stat.setString(3, rep_email);
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
        <h1>Client Groups</h1>
            </br>
        <div class="row">
            <div class="col-sm-4">
                <form class="card" name="addoffering" method="POST" action="#">
                    <div class="col-sm-6">
                        <div alight="left">
                            <label class="form-label">Start Date:</label>
                            <input type="date" class="form-control" name="start_date" id="date" placeholder="YYYY-MM-DD" required><br>
                        </div>

                        <div alight="left">
                            <label class="form-label">End Date:</label>
                            <input type="date" class="form-control" name="date" id="end_date" placeholder="YYYY-MM-DD" required><br>
                        </div>

                        <div alight="left">
                             <label class="form-label">Representative E-mail:</label>
                              <div class="dropdown">
                                 <%
                                     Class.forName("com.mysql.jdbc.Driver");
                                     con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                     stat = con.prepareStatement("select email from clientusers");
                                     res = stat.executeQuery();
                                 %>
                                 <select name="email" class="form-control" required>
                                     <%
                                         while(res.next())
                                         {
                                             String l_id = res.getString("email");
                                     %>
                                     <option><%=res.getString("email")%></option>
                                     <% } %>

                                 </select>
                                 <% con.close(); %>
                             </div>
                        </div>
                    </div><br>

                    <div class="col-sm-6">
                        <div alight="right">
                            <input type="submit" value="submit" name="submit" class="btn btn-info">
                            <input type="reset" value="reset" name="reset" class="btn btn-warning" onClick="this.form.reset()">
                        </div>
                        <div align="left">
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
                                 <th>Start Date</th>
                                 <th>End Date</th>
                                 <th>Representative E-mail</th>
                            </tr>
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                stat = con.prepareStatement("select * from clientgroups");
                                res = stat.executeQuery();
                                while(res.next())
                                {
                                    String offer_info = res.getString("group_id");
                            %>
                            <tr>
                                <td> <%=res.getString("group_id")%></td>
                                <td> <%=res.getString("start_date")%></td>
                                <td> <%=res.getString("end_date")%></td>
                                <td> <%=res.getString("rep_email")%></td>
                            </tr>
                        </thead>
                        <%
                            }
                              con.close();
                        %>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
