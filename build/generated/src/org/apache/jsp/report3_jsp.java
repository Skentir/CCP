package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import CCP.*;
import java.sql.*;
import java.time.LocalDate;

public final class report3_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>CULTURAL CLASSES</title>\n");
      out.write("    </head>\n");
      out.write("<body>\n");
      out.write("        <h1> Report #3 </h1>\n");
      out.write("        <p> Global Distribution(countries where customers are coming from) of customers for a specific month and year. </p>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-sm-3\">\n");
      out.write("                    <form class=\"card\" method=\"POST\">\n");
      out.write("                        <div class=\"col-sm-12\">\n");
      out.write("                            <div alight=\"left\">\n");
      out.write("                                <label class=\"form-label\">Year</label>\n");
      out.write("                                <div class=\"dropdown\">\n");
      out.write("                                    <select name = \"year\" class=\"form-control\" required=\"\">\n");
      out.write("                                    ");

                                        PreparedStatement stat;
                                        ResultSet res;
                                        Connection con;
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
                                            stat = con.prepareStatement( "select distinct year(date_booked) as yr from bookings group by facilitator");
                                            res = stat.executeQuery();
                                            while(res.next())
                                            {
                                                String l_id = res.getString("yr");
                                    
      out.write("\n");
      out.write("                                        <option>");
      out.print( res.getString("yr"));
      out.write("</option>\n");
      out.write("                                    ");
      }; con.close();
                                        } catch(Exception e) { System.out.println("Something went wrong "+e.getMessage());}
      out.write("\n");
      out.write("                                    </select>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div alight=\"left\">\n");
      out.write("                                <label class=\"form-label\">Month</label>\n");
      out.write("                                <div class=\"dropdown\">\n");
      out.write("                                    <select name = \"month\" class=\"form-control\" required=\"\">\n");
      out.write("                                        ");

                                            try {
                                                Class.forName("com.mysql.jdbc.Driver");
                                                con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
                                                stat = con.prepareStatement( "select distinct month(date_booked) as m from bookings group by facilitator");
                                                res = stat.executeQuery();
                                                while(res.next())
                                                {
                                                    String l_id = res.getString("m");
                                        
      out.write("\n");
      out.write("                                        <option>");
      out.print( res.getString("m"));
      out.write("</option>\n");
      out.write("                                        ");
      }; con.close();
                                            } catch(Exception e) { System.out.println("Something went wrong "+e.getMessage());}
      out.write("\n");
      out.write("                                    </select>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div><br>\n");
      out.write("                        <div class=\"col-sm-12\">\n");
      out.write("                            <div alight=\"right\">\n");
      out.write("                                <input type=\"submit\" value=\"submit\" name=\"submit\" class=\"btn btn-info\">\n");
      out.write("                                <a href=\"index.html\"> Go Back </a> \n");
      out.write("                            </div><br>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>         \n");
      out.write("                <div class=\"col-sm-3\">\n");
      out.write("                    <div class=\"panel-body\">\n");
      out.write("                        <table id=\"report5\" class=\"table table-responsive table-bordered\" cellpadding=\"0\" tablewidth=\"100%\">\n");
      out.write("                            <thead>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th>Country</th>\n");
      out.write("                                    <th>Number of Users</th>                         \n");
      out.write("                                </tr>\n");
      out.write("                                ");

                                    boolean has_data = false;
                                    if (request.getParameter("submit") != null) {
                                        try {
                                            int year = Integer.parseInt(request.getParameter("year"));
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                            ResultSet res2;
                                            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
                                            String s =  "select cu.country, count(bk.facilitator) as number from bookings bk "
                                                        + "join clientusers cu on bk.facilitator = cu.email "
                                                        + "where year(date_booked)=? and month(date_booked)=?"
                                                        + "group by cu.country order by cu.country, number ";
                                            stat = con.prepareStatement(s);
                                            stat.setInt(1,Integer.parseInt(request.getParameter("year")));
                                            stat.setInt(2,Integer.parseInt(request.getParameter("month")));
                                            res = stat.executeQuery() ;
                                            has_data = res.next();
                                            while(has_data) {
                                
      out.write("\n");
      out.write("\n");
      out.write("                                <tr>                      \n");
      out.write("                                    <td> ");
      out.print(res.getString("country"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("number"));
      out.write("</td>\n");
      out.write("                                </tr>\n");
      out.write("\n");
      out.write("                                ");

                                             has_data = res.next(); 
                                          } con.close();
                                    } catch (Exception e) {
                                        System.out.print("Something went wrong " + e.getMessage());
                                    }
                                }
                            
      out.write("\n");
      out.write("                        </thead>\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("            </div> \n");
      out.write("        </div>     \n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
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
