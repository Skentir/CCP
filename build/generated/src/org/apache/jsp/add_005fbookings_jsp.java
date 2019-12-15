package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.time.temporal.ChronoUnit;
import java.util.TimeZone;
import CCP.*;
import java.sql.*;
import java.time.LocalDate;

public final class add_005fbookings_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    Connection con = null;
    PreparedStatement stat = null, gen = null;
    ResultSet res = null, num = null; 
    boolean has_data = false;
     
    if (request.getParameter("submit")!=null)
    {
        Date d_book = Date.valueOf(LocalDate.parse(request.getParameter("d_book")).plus(TimeZone.getDefault().getRawOffset(), ChronoUnit.MILLIS));
        double amount = Double.parseDouble(request.getParameter("amount"));
        int class_id = Integer.parseInt(request.getParameter("class"));
        String faci = request.getParameter("faci");
        int group_id = Integer.parseInt(request.getParameter("group"));
        
        Class.forName("com.mysql.jdbc.Driver");
        con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
        
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

      out.write("\n");
      out.write("<script>\n");
      out.write("    alert(\"Record Added!\");\n");
      out.write("</script>\n");

    }

      out.write("\n");
      out.write("<link href=\"bootstrap/css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<script src=\"jquery-3.4.1.min.js\" type=\"text/javascript\"></script>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Ender Booking App</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Create a Booking</h1>\n");
      out.write("            </br>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-sm-3\">\n");
      out.write("                <form class=\"card\" name=\"addoffering\" method=\"POST\" action=\"#\">\n");
      out.write("                    <div class=\"col-sm-12\">\n");
      out.write("                        <div alight=\"left\">\n");
      out.write("                            <label class=\"form-label\">Date Booked:</label> \n");
      out.write("                            <input type=\"date\" class=\"form-control\" name=\"d_book\" required><br>  \n");
      out.write("                        </div>\n");
      out.write("                        <div alight=\"left\">\n");
      out.write("                            <label class=\"form-label\">Amount:</label>\n");
      out.write("                            <input type=\"number\" step=\"any\" min=\"0\" class=\"form-control\" name=\"amount\" placeholder=\"Enter Amount\" required><br>\n");
      out.write("                        </div>\n");
      out.write("                      \n");
      out.write("                        <div alight=\"left\">\n");
      out.write("                            <label class=\"form-label\">Class ID:</label>\n");
      out.write("                            <div class=\"dropdown\">\n");
      out.write("                                 <select name=\"class\" class=\"form-control\" required placeholder=\"Hello\">\n");
      out.write("                                ");

                                    Class.forName("com.mysql.jdbc.Driver");
                                    con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
                                    stat = con.prepareStatement( "select class_id from classofferings");
                                    res = stat.executeQuery();
                                    while(res.next())
                                    {
                                        String l_id = res.getString("class_id");
                                
      out.write("\n");
      out.write("\n");
      out.write("                                     <option>\n");
      out.write("                                          ");
      out.print(res.getString("class_id"));
      out.write("\n");
      out.write("                                     </option>\n");
      out.write("                                ");
 } con.close(); 
      out.write("\n");
      out.write("                                  </select>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                                  \n");
      out.write("                        <div alight=\"left\">    \n");
      out.write("                            <div class=\"form-check\">\n");
      out.write("                                <input type=\"checkbox\" class=\"form-check-input\" id=\"type-faci\">\n");
      out.write("                                <label class=\"form-check-label\" for=\"type-faci\">Group booking</label>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                                  \n");
      out.write("                        <div alight=\"left\" id=\"book-faci\">\n");
      out.write("                            <label class=\"form-label\">Facilitator:</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"faci\" placeholder=\"Enter Email\" id=\"faci-field\" required><br>\n");
      out.write("                        </div>\n");
      out.write("                                  \n");
      out.write("                        <div alight=\"left\" id=\"book-group\" style=\"display: none;\">\n");
      out.write("                            <label class=\"form-label\">Group ID:</label>\n");
      out.write("                             <div class=\"dropdown\">\n");
      out.write("                                ");

                                    Class.forName("com.mysql.jdbc.Driver");
                                    con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
                                    stat = con.prepareStatement("select group_id from clientgroups");
                                    res = stat.executeQuery();
                                
      out.write("\n");
      out.write("                                <select name=\"group\" class=\"form-control\" required>\n");
      out.write("                                    ");

                                        while(res.next())
                                        {
                                            String l_id = res.getString("group_id");
                                    
      out.write("\n");
      out.write("                                    <option>");
      out.print(res.getString("group_id"));
      out.write("</option>\n");
      out.write("                                    ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("                                </select>\n");
      out.write("                                ");
 con.close(); 
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <script>\n");
      out.write("                            $(document).ready(function() {\n");
      out.write("                                $(\"#type-faci\").change(function() {\n");
      out.write("                                    if ($(this).is(\":checked\")) {\n");
      out.write("                                        $(\"#book-faci\").hide();\n");
      out.write("                                        $(\"#book-group\").show();\n");
      out.write("                                        $(\"#faci-field\").attr(\"disabled\", \"true\");\n");
      out.write("                                    } else {\n");
      out.write("                                        $(\"#book-faci\").show();\n");
      out.write("                                        $(\"#book-group\").hide();\n");
      out.write("                                        $(\"#faci-field\").removeAttr(\"disabled\");\n");
      out.write("                                    }\n");
      out.write("                                }); \n");
      out.write("                            });\n");
      out.write("                        </script>\n");
      out.write("                        \n");
      out.write("                            </br>\n");
      out.write("                        <div alight=\"right\">\n");
      out.write("                            <input type=\"submit\" value=\"submit\" name=\"submit\" class=\"btn btn-info\">\n");
      out.write("                            <input type=\"reset\" value=\"reset\" name=\"reset\" class=\"btn btn-warning\" onClick=\"this.form.reset()\">\n");
      out.write("                        </div>\n");
      out.write("                        <div align=\"right\">\n");
      out.write("                           <p><a href=\"index.html\">Go Back</a></p>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"col-sm-8\">\n");
      out.write("                <div class=\"panel-body\">\n");
      out.write("                    <table id=\"tb-offerings\" class=\"table table-responsive table-bordered\" cellpadding=\"0\" tablewidth=\"100%\">\n");
      out.write("                        <thead>\n");
      out.write("                            <tr>\n");
      out.write("                                 <th>ID</th>\n");
      out.write("                                 <th>Date Booked</th>\n");
      out.write("                                 <th>Date Cancelled</th>\n");
      out.write("                                 <th>Date Confirmed</th>\n");
      out.write("                                 <th>Amount</th>\n");
      out.write("                                 <th>Refund Amount</th>\n");
      out.write("                                 <th>Class Rating</th>\n");
      out.write("                                 <th>Class Feedback</th>\n");
      out.write("                                 <th>Lecturer Rating</th>\n");
      out.write("                                 <th>Lecturer Feedback</th>\n");
      out.write("                                 <th>Class ID</th>\n");
      out.write("                                 <th>Group ID</th>\n");
      out.write("                            </tr>\n");
      out.write("                            ");

                                Class.forName("com.mysql.jdbc.Driver");
                                con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
                                stat = con.prepareStatement("select * from bookings");
                                res = stat.executeQuery();
                                while(res.next())
                                {
                                    String offer_info = res.getString("booking_id");
                            
      out.write("\n");
      out.write("                            <tr>\n");
      out.write("                                <td> ");
      out.print(res.getString("booking_id"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(res.getString("date_booked"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(res.getString("date_cancelled"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(res.getString("date_confirmed"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(res.getString("amount"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(res.getString("refund_amount"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(res.getString("class_rating"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(res.getString("class_feedback"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(res.getString("lecturer_rating"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(res.getString("lecturer_feedback"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(res.getString("class_id"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(res.getString("group_id"));
      out.write("</td>\n");
      out.write("                            </tr>\n");
      out.write("                        </thead>\n");
      out.write("                        ");

                            }
                              con.close();
                        
      out.write("\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
