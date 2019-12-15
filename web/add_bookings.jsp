<%--- 
    Document   : add_offerings.jsp
    Created on : Dec 11, 2019, 1:28:12 PM
    Author     : kirstensison
--%>

<%@page import="java.time.Duration"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.util.TimeZone"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="CCP.*, java.sql.*, java.time.LocalDate" %>
<%
    Connection con = null;
    PreparedStatement stat = null, gen = null;
    ResultSet res = null, num = null; 
    boolean has_data = false;
    if (request.getParameter("submit")!=null)
    {
        Date d_book = Date.valueOf(request.getParameter("d_book"));
        d_book.setTime(d_book.getTime() + TimeZone.getDefault().getRawOffset());
        double amount = Double.parseDouble(request.getParameter("amount"));
        int class_id = Integer.parseInt(request.getParameter("class"));
        String faci = request.getParameter("faci");
        int group_id = Integer.parseInt(request.getParameter("group"));
        
        Class.forName("com.mysql.jdbc.Driver");
        con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
        
        if (faci == null){
            stat = con.prepareStatement("insert into bookings(date_booked,amount,class_id,group_id,facilitator) values (?,?,?,?,?)");
            gen = con.prepareStatement("select rep_email from clientgroups where group_id = ?");
            gen.setInt(1, group_id);
            res = gen.executeQuery();
            
            stat.setDate(1, d_book);
            stat.setDouble(2, amount);
            stat.setInt(3,class_id);
            stat.setInt(4,group_id);
            
            res.next();
            stat.setString(5,res.getString("rep_email"));
          
        } else{
            stat = con.prepareStatement("insert into bookings(date_booked,amount,class_id,facilitator) values (?,?,?,?)");
            stat.setDate(1, d_book);
            stat.setDouble(2, amount);
            stat.setInt(3,class_id);
            stat.setString(4,faci);
        }
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
<script src="jquery-3.4.1.min.js" type="text/javascript"></script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ender Booking App</title>
    </head>
    <body>
        <h1>Create a Booking</h1>
            </br>
        <div class="row">
            <div class="col-sm-3">
                <form class="card" name="addoffering" method="POST" action="#">
                    <div class="col-sm-12">
                        <div alight="left">
                            <label class="form-label">Date Booked:</label> 
                            <input type="date" class="form-control" name="d_book" required><br>  
                        </div>
                        <div alight="left">
                            <label class="form-label">Amount:</label>
                            <input type="number" step="any" min="0" class="form-control" name="amount" placeholder="Enter Amount" required><br>
                        </div>
                      
                        <div alight="left">
                            <label class="form-label">Class ID:</label>
                            <div class="dropdown">
                                 <select name="class" class="form-control" required placeholder="Hello">
                                <%
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                    stat = con.prepareStatement( "select class_id from classofferings");
                                    res = stat.executeQuery();
                                    while(res.next())
                                    {
                                        String l_id = res.getString("class_id");
                                %>

                                     <option>
                                          <%=res.getString("class_id")%>
                                     </option>
                                <% } con.close(); %>
                                  </select>
                            </div>
                        </div>
                                  
                        <div alight="left">    
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="type-faci">
                                <label class="form-check-label" for="type-faci">Group booking</label>
                            </div>
                        </div>
                                  
                        <div alight="left" id="book-faci">
                            <label class="form-label">Facilitator:</label>
                            <input type="text" class="form-control" name="faci" placeholder="Enter Email" id="faci-field" required><br>
                        </div>
                                  
                        <div alight="left" id="book-group" style="display: none;">
                            <label class="form-label">Group ID:</label>
                             <div class="dropdown">
                                <%
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                    stat = con.prepareStatement("select group_id from clientgroups");
                                    res = stat.executeQuery();
                                %>
                                <select name="group" class="form-control" required>
                                    <%
                                        while(res.next())
                                        {
                                            String l_id = res.getString("group_id");
                                    %>
                                    <option><%=res.getString("group_id")%></option>
                                    <% } %>

                                </select>
                                <% con.close(); %>
                            </div>
                        </div>
                        <script>
                            $(document).ready(function() {
                                $("#type-faci").change(function() {
                                    if ($(this).is(":checked")) {
                                        $("#book-faci").hide();
                                        $("#book-group").show();
                                        $("#faci-field").attr("disabled", "true");
                                    } else {
                                        $("#book-faci").show();
                                        $("#book-group").hide();
                                        $("#faci-field").removeAttr("disabled");
                                    }
                                }); 
                            });
                        </script>
                        
                            </br>
                        <div alight="right">
                            <input type="submit" value="submit" name="submit" class="btn btn-info">
                            <input type="reset" value="reset" name="reset" class="btn btn-warning" onClick="this.form.reset()">
                        </div>
                        <div align="right">
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
                                 <th>Date Booked</th>
                                 <th>Date Cancelled</th>
                                 <th>Date Confirmed</th>
                                 <th>Amount</th>
                                 <th>Refund Amount</th>
                                 <th>Class Rating</th>
                                 <th>Class Feedback</th>
                                 <th>Lecturer Rating</th>
                                 <th>Lecturer Feedback</th>
                                 <th>Class ID</th>
                                 <th>Group ID</th>
                                 <th>Facilitator</th>
                            </tr>
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                stat = con.prepareStatement("select * from bookings");
                                res = stat.executeQuery();
                                while(res.next())
                                {
                                    String offer_info = res.getString("booking_id");
                            %>
                            <tr>
                                <td> <%=res.getString("booking_id")%></td>
                                <td> <%=res.getString("date_booked")%></td>
                                <td> <%=res.getString("date_cancelled")%></td>
                                <td> <%=res.getString("date_confirmed")%></td>
                                <td> <%=res.getString("amount")%></td>
                                <td> <%=res.getString("refund_amount")%></td>
                                <td> <%=res.getString("class_rating")%></td>
                                <td> <%=res.getString("class_feedback")%></td>
                                <td> <%=res.getString("lecturer_rating")%></td>
                                <td> <%=res.getString("lecturer_feedback")%></td>
                                <td> <%=res.getString("class_id")%></td>
                                <td> <%=res.getString("group_id")%></td>
                                <td> <%=res.getString("facilitator")%></td>
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
