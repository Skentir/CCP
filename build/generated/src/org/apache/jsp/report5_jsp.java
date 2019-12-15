package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import CCP.*;
import java.sql.*;
import java.time.LocalDate;

public final class report5_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<link href=\"bootstrap/css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<h1> Report #5 </h1>\n");
      out.write("<p> Number of feedback per star for the class service offered by the provider, given a specific year. </p>\n");

    PreparedStatement statement;
    ResultSet resultset;
    Connection con;
    boolean has_data = false;
    if (request.getParameter("submit") != null) {
        try {
            int year = Integer.parseInt(request.getParameter("year"));
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            has_data = false;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");

            statement = con.prepareStatement("select distinct year(date_booked) from bookings");
            resultset = statement.executeQuery() ;
            has_data = resultset.next();
            con.close();
        } catch (Exception e) {
            System.out.println("Something went wrong" + e.getMessage());
            int status =0;
        }
    }
        

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <div class=\"row\">\n");
      out.write("          <div class=\"col-sm-4\">\n");
      out.write("            <form class=\"card\" method=\"POST\">\n");
      out.write("                <div class=\"col-sm-6\">\n");
      out.write("                    <div alight=\"left\">\n");
      out.write("                        <label class=\"form-label\">Year</label>\n");
      out.write("                        <div class=\"dropdown\">\n");
      out.write("                            <select name = \"year\" class=\"form-control\" required=\"\">\n");
      out.write("                                ");

                                    Class.forName("com.mysql.jdbc.Driver");
                                    con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
                                    statement = con.prepareStatement( "select distinct year(date_booked) as yr from bookings");
                                    resultset = statement.executeQuery();
                                    while(resultset.next())
                                    {
                                        String l_id = resultset.getString("yr");
                                
      out.write("\n");
      out.write("                                <option>");
      out.print( resultset.getString("yr"));
      out.write("</option>\n");
      out.write("                                ");
  }; con.close(); 
      out.write("\n");
      out.write("                            </select>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div><br>\n");
      out.write("                <div class=\"col-sm-6\">\n");
      out.write("                    <div alight=\"right\">\n");
      out.write("                        <input type=\"submit\" value=\"submit\" name=\"submit\" class=\"btn btn-info\">\n");
      out.write("                        <a href=\"index.html\"> Go Back </a>\n");
      out.write("                    </div>\n");
      out.write("                </div><br>\n");
      out.write("            </form>\n");
      out.write("         </div>\n");
      out.write("    </div> \n");
      out.write("\n");
      out.write("    ");
 String yearstr = request.getParameter("year"); if (yearstr != null) {
      out.write("\n");
      out.write("            <br><br>                               \n");
      out.write("    <div class=\"col-sm-8\">\n");
      out.write("                <div class=\"panel-body\">\n");
      out.write("                    <table id=\"report5\" class=\"table table-responsive table-bordered\" cellpadding=\"0\" tablewidth=\"100%\">\n");
      out.write("                        <thead>\n");
      out.write("                            <tr>\n");
      out.write("                                <th>Course Name</th>\n");
      out.write("                                <th>Class Rating</th>\n");
      out.write("                                <th>Number of Feedbacks</th>\n");
      out.write("                                <th>Cultural Class Provider</th>\n");
      out.write("                                \n");
      out.write("                            </tr>\n");
      out.write("                            ");

                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
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
                            
      out.write("\n");
      out.write("                                    <tr>\n");
      out.write("                                        ");
 if (resultset != null && has_data) { 
      out.write("\n");
      out.write("                                        <td> ");
      out.print(resultset.getString("course_name"));
      out.write("</td>\n");
      out.write("                                        <td> ");
      out.print(resultset.getString("class_rating"));
      out.write("</td>\n");
      out.write("                                        <td> ");
      out.print(resultset.getString("numfeedback"));
      out.write("</td>\n");
      out.write("                                        <td> ");
      out.print(resultset.getString("ccp_email"));
      out.write("</td>\n");
      out.write("                                    </tr>\n");
      out.write("                                \n");
      out.write("                            ");

                                    }
                                }
                              con.close();
                            
      out.write("\n");
      out.write("                        </thead>\n");
      out.write("                    </table>\n");
      out.write("            </div>\n");
      out.write("    </div>         \n");
      out.write("        ");
 } 
      out.write("\n");
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
