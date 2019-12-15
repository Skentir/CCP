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
        int id = Integer.parseInt(request.getParameter("book_id"));
        Class.forName("com.mysql.jdbc.Driver");
        con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
        stat = con.prepareStatement("select * from bookings where booking_id = ?");
        stat.setInt(1, id);
        res = stat.executeQuery();

        has_data = res.next();
        String offer_data = "";
        if (has_data)
            offer_data = res.getString("booking_id");
                               
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
        <h1>Search and Display Bookings</h1><br>
        <div class="row">
            <div class="col-sm-4">
                <form class="card">
                            <div alight="left">                               
                                <div class="col-sm-6" form-group">
                                     <label class="form-label">Booking ID:</label>
                                    <div class="dropdown">
                                       <%
                                           Class.forName("com.mysql.jdbc.Driver");
                                           con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                           stat = con.prepareStatement("select booking_id from bookings");
                                           ResultSet list = stat.executeQuery();
                                       %>
                                       <select name="book_id" class="form-control" required>
                                           <%
                                               while(list.next())
                                               {
                                                   String l_id = list.getString("booking_id");
                                           %>
                                           <option><%=list.getString("booking_id")%></option>
                                           <% } %>

                                       </select>
                                       <% con.close(); %>
                                    </div> <br>
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
                            <tr>
                                <% if (res != null && has_data) { %>
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
<% if (con != null) con.close(); %>