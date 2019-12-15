<%-- 
    Document   : delete_group
    Created on : Dec 15, 2019, 4:27:00 PM
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="CCP.*, java.sql.*, java.time.LocalDate" %>

<!DOCTYPE html>
<%
    Connection con = null;
    PreparedStatement stat = null;
    boolean has_data = false;
    if (request.getParameter("submit")!= null)
    {
        try {
            int id = Integer.parseInt(request.getParameter("group_id"));
            Class.forName("com.mysql.jdbc.Driver");
            con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
            stat = con.prepareStatement("delete from clientgroups where group_id = ?");
            stat.setInt(1, id);
            stat.executeUpdate();
%>
<script>
    alert("Record Deleted!");
</script>
<%     } catch(Exception e) { System.out.println("Something went wrong " + e.getMessage());}
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
        <h1>Delete Client Groups</h1><br>
        <div class = "row">
            <div class="col-sm-4">
                <form class="card" metho="POST" action="#">
                    <div class="col-sm-6">
                        <div alight="left">
                           <label class="form-label">Group ID:</label>
                            <div class="dropdown">
                               <%
                                   try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                    stat = con.prepareStatement("select group_id from clientgroups");
                                    ResultSet res = stat.executeQuery();
                               %>
                               <select name="group_id" class="form-control" required>
                                   <%
                                       while(res.next())
                                       {
                                           String l_id = res.getString("group_id");
                                   %>
                                   <option><%=res.getString("group_id")%></option>
                                   <% } %>

                               </select>
                                   <% con.close(); } catch(Exception e) { System.out.println(e.getMessage());} %>
                           </div>
                        </div>
                    </div><br>
                    <div class="col-sm-6">
                        <div alight="right">
                            <input type="submit" value="submit" name="submit" class="btn btn-info">
                            <input type="reset" value="reset" name="reset" class="btn btn-warning" onClick="this.form.reset()" >
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
<% if (con != null) con.close(); %>