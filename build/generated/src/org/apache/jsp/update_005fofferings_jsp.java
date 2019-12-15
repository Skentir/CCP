package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import CCP.*;
import java.sql.*;
import java.time.LocalDate;

public final class update_005fofferings_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    ResultSet res = null; 
    boolean has_data = false;
    if (request.getParameter("submit")!= null)
    {
        int id = Integer.parseInt(request.getParameter("offer_id"));
        Class.forName("com.mysql.jdbc.Driver");
        con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
        stat = con.prepareStatement("select * from lecturers where lecturer_id = ?");
        stat.setInt(1, id);
        res = stat.executeQuery();
        
        has_data = res.next();
        String lect_data = "";
        if (has_data)
            lect_data = res.getString("lecturer_id");
                               
    }

      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <link href=\"bootstrap/css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    <link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    <body>\n");
      out.write("        <h1>Search and Modify Offerings</h1><br>\n");
      out.write("        <form class=\"card\">\n");
      out.write("            <div class = \"row\"><br>\n");
      out.write("                <div class=\"col-xs-4 form-group\">\n");
      out.write("                     <label class=\"form-label\">Enter ID:</label>\n");
      out.write("                     <input type=\"text\" class=\"form-control\" name=\"offer_id\" placeholder=\"Enter Class Offering ID\">\n");
      out.write("                     <input type=\"submit\" value=\"submit\" name=\"submit\" class=\"btn btn-info\">\n");
      out.write("                     <input type=\"reset\" value=\"reset\" name=\"reset\" class=\"btn btn-warning\">\n");
      out.write("                     <div class=\"panel-body\">\n");
      out.write("                        <table id=\"tb-offerings\" class=\"table table-responsive table-bordered\" cellpadding=\"0\" tablewidth=\"100%\">\n");
      out.write("                            <thead>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th>ID</th>\n");
      out.write("                                    <th>Venue</th>\n");
      out.write("                                    <th>Date</th>\n");
      out.write("                                    <th># of Students</th>\n");
      out.write("                                    <th>Date Cancelled</th>\n");
      out.write("                                    <th>Date Confirmed</th>\n");
      out.write("                                    <th>Lecturer ID</th>\n");
      out.write("                                    <th>Course ID</th>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    ");
 if (res != null && has_data) { 
      out.write("\n");
      out.write("                                    <td> ");
      out.print(res.getString("lecturer_id"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("firstname"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("lastname"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("degree"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("occupation"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("briefbio"));
      out.write("</td>\n");
      out.write("                                    <td></td>\n");
      out.write("                                    <td></td>\n");
      out.write("                                    ");
 } 
      out.write("\n");
      out.write("                                </tr>\n");
      out.write("                            </thead>                 \n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
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
