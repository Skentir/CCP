package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import CCP.*;
import java.sql.*;
import java.time.LocalDate;

public final class delete_005fbookings_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");

    Connection con = null;
    PreparedStatement stat = null;
    boolean has_data = false;
    if (request.getParameter("submit")!= null)
    {
        int id = Integer.parseInt(request.getParameter("book_id"));
        Class.forName("com.mysql.jdbc.Driver");
        con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
        stat = con.prepareStatement("delete from bookings where class_id = ?");
        stat.setInt(1, id);
        stat.executeUpdate();

      out.write("\n");
      out.write("<script>\n");
      out.write("    alert(\"Record Deleted!\");\n");
      out.write("</script>\n");

    }

      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>CULTURAL CLASSES</title>\n");
      out.write("    </head>\n");
      out.write("    <link href=\"bootstrap/css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    <link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    <body>\n");
      out.write("        <h1>Delete a Booking</h1><br>\n");
      out.write("        <div class = \"row\">\n");
      out.write("            <div class=\"col-sm-4\">\n");
      out.write("                <form class=\"card\">\n");
      out.write("                     <div alight=\"left\">\n");
      out.write("                        <label class=\"form-label\">Course ID:</label>\n");
      out.write("                         <div class=\"dropdown\">\n");
      out.write("                            ");

                                Class.forName("com.mysql.jdbc.Driver");
                                con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
                                stat = con.prepareStatement("select booking_id from bookings");
                                ResultSet res = stat.executeQuery();
                            
      out.write("\n");
      out.write("                            <select name=\"book_id\" class=\"form-control\" required>\n");
      out.write("                                ");

                                    while(res.next())
                                    {
                                        String l_id = res.getString("booking_id");
                                
      out.write("\n");
      out.write("                                <option>");
      out.print(res.getString("booking_id"));
      out.write("</option>\n");
      out.write("                                ");
 } 
      out.write("\n");
      out.write("                                \n");
      out.write("                            </select>\n");
      out.write("                            ");
 con.close(); 
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div><br>\n");
      out.write("                    <div alight=\"right\">\n");
      out.write("                        <input type=\"submit\" value=\"submit\" name=\"submit\" class=\"btn btn-info\">\n");
      out.write("                        <input type=\"reset\" value=\"reset\" name=\"reset\" class=\"btn btn-warning\" onClick=\"this.form.reset()\" >\n");
      out.write("                        <p><a href=\"index.html\">Go Back</a></p>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("         <div class=\"col-sm-8\">\n");
      out.write("                <div class=\"panel-body\">\n");
      out.write("                    <table id=\"tb-offerings\" class=\"table table-responsive table-bordered\" cellpadding=\"0\" tablewidth=\"100%\">\n");
      out.write("                        <thead>\n");
      out.write("                             <tr>\n");
      out.write("                                 <th>ID</th>\n");
      out.write("                                 <th>Date Booked</th>\n");
      out.write("                                 <th>Date Confirmed</th>\n");
      out.write("                                 <th>Date Cancelled</th>\n");
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
 if (con != null) con.close(); 
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
