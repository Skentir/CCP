<%-- 
    Document   : update_offerings.jsp
    Created on : Dec 14, 2019, 1:50:13 PM
    Author     : kirstensison
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="CCP.*, java.sql.*, java.time.LocalDate" %>
<%@page import="java.util.TimeZone"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.temporal.ChronoUnit"%>
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
        String newValue = request.getParameter("new_val");
        
        Class.forName("com.mysql.jdbc.Driver");
        con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
        switch (type) {
            case "d_book":     
                Date d_book = Date.valueOf(newValue);
                d_book.setTime(d_book.getTime() + TimeZone.getDefault().getRawOffset());
                stat = con.prepareStatement("Update bookings set date_booked = ? WHERE booking_id = ?");
                stat.setDate(1,d_book);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "d_confirm":
                stat = con.prepareStatement("Update bookings set date_confirmed = ? WHERE booking_id = ?");
                Date d_confirm = Date.valueOf(newValue);
                d_confirm.setTime(d_confirm.getTime() + TimeZone.getDefault().getRawOffset());
                stat.setDate(1,d_confirm);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "d_cancel":
                stat = con.prepareStatement("Update bookings set date_cancelled = ? WHERE booking_id = ?");
                Date d_cancel = Date.valueOf(newValue);
                d_cancel.setTime(d_cancel.getTime() + TimeZone.getDefault().getRawOffset());
                stat.setDate(1,d_cancel);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "amount":
                stat = con.prepareStatement("Update bookings set amount = ? WHERE booking_id = ?");
                Double amount = Double.parseDouble(newValue);
                stat.setDouble(1,amount);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "refund":
                stat = con.prepareStatement("Update bookings set refund_amount = ? WHERE booking_id = ?");
                Double refund = Double.parseDouble(newValue);
                stat.setDouble(1,refund);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "c_rating":
                stat = con.prepareStatement("Update bookings set class_rating = ? WHERE booking_id = ?");
                int c_rating = Integer.parseInt(newValue);
                stat.setInt(1,c_rating);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "l_rating":
                stat = con.prepareStatement("Update bookings set lecturer_rating = ? WHERE booking_id = ?");
                int l_rating = Integer.parseInt(newValue);
                stat.setInt(1,l_rating);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;    
            case "c_feedback":
                stat = con.prepareStatement("Update bookings set class_feedback = ? WHERE booking_id = ?");
                String c_feedback = newValue;
                stat.setString(1,c_feedback);
                stat.setInt(2,id);
                stat.executeUpdate();
                break; 
            case "l_feedback":
                stat = con.prepareStatement("Update bookings set lecturer_feedback = ? WHERE booking_id = ?");
                String l_feedback = newValue;
                stat.setString(1,l_feedback);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;  
            case "class_id":
                stat = con.prepareStatement("Update bookings set class_id = ? WHERE booking_id = ?");
                int c_id = Integer.parseInt(newValue);
                stat.setInt(1,c_id);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "group_id":
                stat = con.prepareStatement("Update bookings set group_id = ? WHERE booking_id = ?");
                int g_id = Integer.parseInt(newValue);
                stat.setInt(1,g_id);
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
        <h1>Update a Booking</h1><br>
        <div class="row">
            <div class="col-sm-4">
            <form class="card" method="POST" action="#">
                <div class="col-sm-6">
                    <div alight="left">
                        <label class="form-label">Enter ID:</label>
                            <div class="dropdown">
                                <%
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                    stat = con.prepareStatement("select booking_id from bookings");
                                    ResultSet list = stat.executeQuery();
                                %>
                                <select name="id" class="form-control" required>
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
                <div class="col-sm-8">
                    <div alight="left">
                        <label class="form-label">Enter New Value:</label><br>
                        <input type="text" step="any" class="form-control" name="new_val" placeholder="YYYY-MM-DD for Dates"><br>
                    </div>        
                    <div alight="left">
                        <select class="form-control" name="edit_type" required>
                            <option value = "d_book">Change Date Booked</option>
                            <option value = "d_confirm">Change Date Confirmed</option>
                            <option value = "d_cancel">Change Date Cancelled</option>
                            <option value = "amount">Change Amount</option>
                            <option value = "refund">Change Refund</option>
                            <option value = "c_rating">Change Class Rating</option>
                            <option value = "l_rating">Change Lecturer Rating</option>
                            <option value = "c_feedback">Change Class Feedback</option>
                            <option value = "l_feedback">Change Lecturer Feedback</option>
                            <option value = "c_id">Change Class ID</option>
                            <option value = "g_id">Change Group ID</option>
                         </select><br>
                    </div>
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
                                    boolean has_data = false;
                                    con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                    stat = con.prepareStatement("select * from bookings where booking_id = ?");
                                    stat.setInt(1, id);
                                    res = stat.executeQuery();
                                    has_data = res.next();
                                    if (has_data){
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
