<%-- 
    Document   : view_group
    Created on : Dec 15, 2019, 4:40:36 PM
    Author     : Administrator
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
        con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
        stat = con.prepareStatement("select * from clientgroups where class_id = ?");
        stat.setInt(1, id);
        res = stat.executeQuery();
        
        has_data = res.next();
        String offer_data = "";
        if (has_data)
            offer_data = res.getString("group_id");
                               
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
        <h1>Search and Display Client Groups</h1><br>
        <div class="row">
            <div class="col-sm-4">
                <form class="card" method="POST" action="#">
                    <div class="col-sm-6">
                        <div alight="left">
                            <label class="form-label">Course ID:</label>
                                    <div class="dropdown">
                                       <%
                                           Class.forName("com.mysql.jdbc.Driver");
                                           con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                           stat = con.prepareStatement("select group_id from clientgroups");
                                           ResultSet list = stat.executeQuery();
                                       %>
                                       <select name="offer_id" class="form-control" required>
                                           <%
                                               while(list.next())
                                               {
                                                   String l_id = list.getString("group_id");
                                           %>
                                           <option><%=list.getString("group_id")%></option>
                                           <% } %>

                                       </select>
                                       <% con.close(); %>
                                    </div> <br>
                                </div>
                        </div>
                        <div class="col-sm-6">
                            <div alight="right">
                                <input type="submit" value="submit" name="submit" class="btn btn-info">
                                <input type="reset" value="reset" name="reset" class="btn btn-warning" onClick="this.form.reset()">
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
                                    <th>Date Started</th>
                                    <th>Date Ended</th>
                                    <th>Representative E-mail</th>
                                </tr>
                                <tr>
                                    <% if (res != null && has_data) { %>
                                    <td> <%=res.getString("group_id")%></td>
                                    <td> <%=res.getString("start_date")%></td>
                                    <td> <%=res.getString("end_date")%></td>
                                    <td> <%=res.getString("rep_email")%></td>
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