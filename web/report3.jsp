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
<body>
        <h1> Report #3 </h1>
        <p> Global Distribution(countries where customers are coming from) of customers for a specific month and year. </p>
            <div class="row">
                <div class="col-sm-3">
                    <form class="card" method="POST">
                        <div class="col-sm-12">
                            <div alight="left">
                                <label class="form-label">Year</label>
                                <div class="dropdown">
                                    <select name = "year" class="form-control" required="">
                                    <%
                                        PreparedStatement stat;
                                        ResultSet res;
                                        Connection con;
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                            stat = con.prepareStatement( "select distinct year(date_booked) as yr from bookings group by facilitator");
                                            res = stat.executeQuery();
                                            while(res.next())
                                            {
                                                String l_id = res.getString("yr");
                                    %>
                                        <option><%= res.getString("yr")%></option>
                                    <%      }; con.close();
                                        } catch(Exception e) { System.out.println("Something went wrong "+e.getMessage());}%>
                                    </select>
                                </div>
                            </div>
                            <div alight="left">
                                <label class="form-label">Month</label>
                                <div class="dropdown">
                                    <select name = "month" class="form-control" required="">
                                        <%
                                            try {
                                                Class.forName("com.mysql.jdbc.Driver");
                                                con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                                stat = con.prepareStatement( "select distinct month(date_booked) as m from bookings group by facilitator");
                                                res = stat.executeQuery();
                                                while(res.next())
                                                {
                                                    String l_id = res.getString("m");
                                        %>
                                        <option><%= res.getString("m")%></option>
                                        <%      }; con.close();
                                            } catch(Exception e) { System.out.println("Something went wrong "+e.getMessage());}%>
                                    </select>
                                </div>
                            </div>
                        </div><br>
                        <div class="col-sm-12">
                            <div alight="right">
                                <input type="submit" value="submit" name="submit" class="btn btn-info">
                                <a href="index.html"> Go Back </a> 
                            </div><br>
                        </div>
                    </form>
                </div>     
                <% String yeer = request.getParameter("year"); if (yeer != null) {%>
                <div class="col-sm-3">
                    <div class="panel-body">
                        <table id="report5" class="table table-responsive table-bordered" cellpadding="0" tablewidth="100%">
                            <thead>
                                <tr>
                                    <th>Country</th>
                                    <th>Number of Users</th>                         
                                </tr>
                                <%
                                    boolean has_data = false;
                                    if (request.getParameter("submit") != null) {
                                        try {
                                            int year = Integer.parseInt(request.getParameter("year"));
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                            ResultSet res2;
                                            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                            String s =  "select cu.country, count(bk.facilitator) as number from bookings bk "
                                                        + "join clientusers cu on bk.facilitator = cu.email "
                                                        + "where year(date_booked)=? and month(date_booked)=? "
                                                        + "group by cu.country order by cu.country, number ";
                                            stat = con.prepareStatement(s);
                                            stat.setInt(1,Integer.parseInt(request.getParameter("year")));
                                            stat.setInt(2,Integer.parseInt(request.getParameter("month")));
                                            res = stat.executeQuery() ;
                                           
                                            while(res.next()) {
                                                String info = res.getString("email");
                                            
                                %>

                                <tr>                      
                                    <td> <%=res.getString("country")%></td>
                                    <td> <%=res.getString("number")%></td>
                                </tr>

                                <%
                                          } con.close();
                                    } catch (Exception e) {
                                        System.out.print("Something went wrong " + e.getMessage());
                                    }
                                }
                            %>
                        </thead>
                    </table>
                </div>
            </div>
                        <% } %>
        </div>     
    </body>
</html>

