package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import CCP.*;
import java.sql.*;
import java.time.LocalDate;

public final class report2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<link href=\"bootstrap/css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<h1> Report #2 </h1>\n");

    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con;

    con = DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");

    Statement statement = con.createStatement() ;
    ResultSet resultset = statement.executeQuery("select distinct year(date_booked) from bookings where date_cancelled is null") ;

      out.write("\n");
      out.write("\n");
      out.write("<center>\n");
      out.write("        <p>Year</p>\n");
      out.write("            <select name = \"year\">\n");
      out.write("            ");
  while(resultset.next()){ 
      out.write("\n");
      out.write("                <option>");
      out.print( resultset.getInt("year(date_booked)"));
      out.write("</option>\n");
      out.write("            ");
 } 
      out.write("\n");
      out.write("            </select>\n");
      out.write("            \n");
      out.write("           \n");
      out.write("            \n");
      out.write("            <br> \n");
      out.write("            <br>\n");
      out.write("            \n");
      out.write("            <input type=\"submit\" value=\"submit\" name=\"submit\" class=\"btn btn-info\">\n");
      out.write("            \n");
      out.write("            <br>\n");
      out.write("            <br>\n");
      out.write("            \n");
      out.write("    \n");
      out.write("                                              \n");
      out.write("    <div class=\"col-sm-8\">\n");
      out.write("                <div class=\"panel-body\">\n");
      out.write("                    <table id=\"report2\" class=\"table table-responsive table-bordered\" cellpadding=\"0\" tablewidth=\"100%\">\n");
      out.write("                        <thead>\n");
      out.write("                            <tr>\n");
      out.write("                                <th>Booking ID</th>\n");
      out.write("                                <th>Date Booked</th>\n");
      out.write("                                <th>Date Confirmed</th>\n");
      out.write("                                <th>Amount</th>\n");
      out.write("                                <th>Class Rating</th>\n");
      out.write("                                <th>Class Feedback</th>\n");
      out.write("                                <th>Lecturer Rating</th>\n");
      out.write("                                <th>Lecturer Feedback</th>\n");
      out.write("                                <th>Class ID</th>\n");
      out.write("                                <th> Total Amount</th>\n");
      out.write("                                \n");
      out.write("                            </tr>\n");
      out.write("                             ");

                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
                                statement = con.createStatement();
                                String stat =   "select booking_id, date_booked, date_confirmed, amount, class_rating, class_feedback, lecturer_rating, lecturer_feedback, class_id, SUM(amount) AS total "
                                                + ""
                                                + "from  bookings "
                                                + ""
                                                + "where date_cancelled is not null "
                                                + ""
                                                + "and year(date_confirmed) = "
                                                +  request.getParameter("year")
                                                + " "
                                                + "group by date_confirmed "
                                                + ""
                                                + "order by date_confirmed "
                                                + "";
                                             
                           
                                resultset = statement.executeQuery(stat) ;
                                while(resultset.next())
                                {
                                    String info = resultset.getString("booking_id");
                            
      out.write("\n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                             <tr>\n");
      out.write("                                <td> ");
      out.print(resultset.getString("date_booked"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(resultset.getString("date_confirmed"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(resultset.getString("amount"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(resultset.getString("class_rating"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(resultset.getString("class_feedback"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(resultset.getString("lecturer_rating"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(resultset.getString("lecturer_feedback"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(resultset.getString("class_id"));
      out.write("</td>\n");
      out.write("                                <td> ");
      out.print(resultset.getString("SUM(amount)"));
      out.write("</td>\n");
      out.write("                                <td></td>\n");
      out.write("                                <td></td>\n");
      out.write("                            </tr>\n");
      out.write("                        </thead>\n");
      out.write("                        ");

                            }
                              con.close();
                        
      out.write("\n");
      out.write("                        \n");
      out.write("                    </table>\n");
      out.write("                        </center>\n");
      out.write("\n");
      out.write("\n");
      out.write("            \n");
 con.close(); 
      out.write(" \n");
      out.write("\n");
      out.write("   \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <br><br><br><br><br><br><br>\n");
      out.write("        <a href=\"index.html\"> Back to Homepage </a><br>\n");
      out.write("\n");
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
