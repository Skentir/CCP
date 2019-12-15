<%-- 
    Document   : report_two
    Created on : Dec 15, 2019, 5:11:37 PM
    Author     : Administrator
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="CCP.*, java.sql.*, java.time.LocalDate" %>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
<h1> Report #2 </h1>
<%
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con;

    con = DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");

    Statement statement = con.createStatement() ;
    ResultSet resultset = statement.executeQuery("select distinct year(date_booked) from bookings where date_cancelled is null") ;
%>

<center>
        <p>Year</p>
            <select name = "year">
            <%  while(resultset.next()){ %>
                <option><%= resultset.getInt("year(date_booked)")%></option>
            <% } %>
            </select>

            <br> 
            <br>
            
            <input type="submit" value="submit" name="submit" class="btn btn-info">
            
            <br>
            <br>
            
    
                                              
    <div class="col-sm-8">
                <div class="panel-body">
                    <table id="report2" class="table table-responsive table-bordered" cellpadding="0" tablewidth="100%">
                        <thead>
                            <tr>
                                <th>Booking ID</th>
                                <th>Date Booked</th>
                                <th>Date Confirmed</th>
                                <th>Amount</th>
                                <th>Class Rating</th>
                                <th>Class Feedback</th>
                                <th>Lecturer Rating</th>
                                <th>Lecturer Feedback</th>
                                <th>Class ID</th>
                                <th> Total Amount</th>
                                
                            </tr>
                             <%
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                statement = con.createStatement();
                                String stat =   "select booking_id, date_booked, date_confirmed, amount, class_rating, class_feedback, lecturer_rating, lecturer_feedback, class_id, SUM(amount) AS total "
                                                + ""
                                                + "from  bookings "
                                                + ""
                                                + "where date_cancelled is null "
                                                + ""
                                                + "and year(date_confirmed) = "
                                                +  request.getParameter("year")
                                                + " "
                                                + "group by date_confirmed "
                                                + ""
                                                + "order by date_confirmed "
                                                + "";
                                             
                           
                                resultset = statement.executeQuery(stat) ;
                                while(resultset.next())
                                {
                                    String info = resultset.getString("booking_id");
                            %>
                            
                            
                             <tr>
                                <td> <%=resultset.getString("date_booked")%></td>
                                <td> <%=resultset.getString("date_confirmed")%></td>
                                <td> <%=resultset.getString("amount")%></td>
                                <td> <%=resultset.getString("class_rating")%></td>
                                <td> <%=resultset.getString("class_feedback")%></td>
                                <td> <%=resultset.getString("lecturer_rating")%></td>
                                <td> <%=resultset.getString("lecturer_feedback")%></td>
                                <td> <%=resultset.getString("class_id")%></td>
                                <td> <%=resultset.getString("total")%></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </thead>
                        <%
                            }
                              con.close();
                        %>
                        
                    </table>
                        </center>


            
<% con.close(); %> 

   
                </div>
            </div>
        </div>
        <br><br><br><br><br><br><br>
        <a href="index.html"> Back to Homepage </a><br>

</html>
