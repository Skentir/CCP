<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="CCP.*, java.sql.*, java.time.LocalDate" %>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CULTURAL CLASSES</title>
    </head>
<h1> Report #5 </h1>
<p> Number of feedback per star for the class service offered by the provider, given a specific year. </p>
<%
    PreparedStatement statement;
    ResultSet resultset;
    Connection con;
    boolean has_data = false;
    if (request.getParameter("submit") != null) {
        try {
            int year = Integer.parseInt(request.getParameter("year"));
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            has_data = false;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");

            statement = con.prepareStatement("select distinct year(date_booked) from bookings");
            resultset = statement.executeQuery() ;
            has_data = resultset.next();
            con.close();
        } catch (Exception e) {
            System.out.println("Something went wrong" + e.getMessage());
            int status =0;
        }
    }
        
%>


    <div class="row">
          <div class="col-sm-4">
            <form class="card" method="POST">
                <div class="col-sm-6">
                    <div alight="left">
                        <label class="form-label">Year</label>
                        <div class="dropdown">
                            <select name = "year" class="form-control" required="">
                                <%
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                    statement = con.prepareStatement( "select distinct year(date_booked) as yr from bookings");
                                    resultset = statement.executeQuery();
                                    while(resultset.next())
                                    {
                                        String l_id = resultset.getString("yr");
                                %>
                                <option><%= resultset.getString("yr")%></option>
                                <%  }; con.close(); %>
                            </select>
                        </div>
                    </div>
                </div><br>
                <div class="col-sm-6">
                    <div alight="right">
                        <input type="submit" value="submit" name="submit" class="btn btn-info">
                        <a href="index.html"> Go Back </a>
                    </div>
                </div><br>
            </form>
         </div>
    </div> 

    <% String yearstr = request.getParameter("year"); if (yearstr != null) {%>
            <br><br>                               
    <div class="col-sm-8">
                <div class="panel-body">
                    <table id="report5" class="table table-responsive table-bordered" cellpadding="0" tablewidth="100%">
                        <thead>
                            <tr>
                                <th>Course Name</th>
                                <th>Class Rating</th>
                                <th>Number of Feedbacks</th>
                                <th>Cultural Class Provider</th>
                                
                            </tr>
                            <%
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                int year = Integer.parseInt(yearstr);
                                String stat =     "select c.course_name, b.class_rating, count(b.class_feedback) as numfeedback, c.ccp_email "
                                                + "from bookings b "
                                                + "join classofferings co on co.class_id = b.class_id "
                                                + "join classes c on c.course_id = co.course_id "
                                                + "where year(b.date_booked) = ? "
                                                + "group by b.class_rating, c.course_name, c.ccp_email "
                                                + "order by c.course_name, b.class_rating desc";
                                statement = con.prepareStatement(stat);
                                statement.setInt(1, year);
                                resultset = statement.executeQuery() ;
                                while(resultset.next())
                                {
                                    String info = resultset.getString("course_name");
                            %>
                                    <tr>
                                        <% if (resultset != null && has_data) { %>
                                        <td> <%=resultset.getString("course_name")%></td>
                                        <td> <%=resultset.getString("class_rating")%></td>
                                        <td> <%=resultset.getString("numfeedback")%></td>
                                        <td> <%=resultset.getString("ccp_email")%></td>
                                    </tr>
                                
                            <%
                                    }
                                }
                              con.close();
                            %>
                        </thead>
                    </table>
            </div>
    </div>         
        <% } %>
</html>
<% if (con != null) con.close(); %>