<%-- 
    Document   : edit_group
    Created on : Dec 15, 2019, 4:33:42 PM
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="CCP.*, java.sql.*, java.time.LocalDate" %>

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
        con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
        switch (type) {
            case "start_date":     
                stat = con.prepareStatement("Update clientgroups set start_date = ? WHERE group_id = ?");
                Date start_date = Date.valueOf(request.getParameter("new_val"));
                stat.setDate(1,start_date);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "end_date":
                stat = con.prepareStatement("Update clientgroups set end_date = ? WHERE group_id = ?");
                Date end_date = Date.valueOf(request.getParameter("new_val"));
                stat.setDate(1,end_date);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "rep_email":
                stat = con.prepareStatement("Update clientgroups set rep_email = ? WHERE group_id = ?");
                String rep_email = request.getParameter("new_val");
                stat.setString(1,rep_email);
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
        <h1>Update Client Groups</h1><br>
        <div class="row">
            <div class="col-sm-4">
            <form class="card" method="POST" action="#">
                <div class="col-sm-6">
                    <div alight="left">
                        <label class="form-label">Enter ID:</label>
                        <input type="text" class="form-control" name="id" placeholder="Enter Class Offering ID"><br>
                    </div>
                    <div alight="left">
                        <label class="form-label">Enter New Value:</label><br>
                        <input type="text" class="form-control" name="new_val" placeholder="YYYY-MM-DD for Dates"><br>
                    </div>        
                    <div alight="left">
                        <select class="form-control" name="edit_type" required>
                            <option value = "venue">Change Start Date</option>
                            <option value = "date">Change End Date</option>
                            <option value = "date_cancel">Change Representative E-mail</option>
                            
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
            <div class="col-sm-4">
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
                                    boolean has_data = false;
                                    con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","p@ssword");
                                    stat = con.prepareStatement("select * from clientgroups where group_id = ?");
                                    stat.setInt(1, id);
                                    res = stat.executeQuery();
                                    has_data = res.next();
                                    if (has_data){
                                        String offer_info = res.getString("group_id");
                                %>
                                <tr>
                                    <td> <%=res.getString("group_id")%></td>
                                    <td> <%=res.getString("start_date")%></td>
                                    <td> <%=res.getString("end_date")%></td>
                                    <td> <%=res.getString("rep_email")%></td>
                                </tr>
                            </thead>
                            <%  } con.close();%>
                        </table>
                    </div>
                </div>
            </div>
    </body>
</html>
