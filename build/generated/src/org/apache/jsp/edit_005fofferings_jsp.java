package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import CCP.*;
import java.sql.*;
import java.time.LocalDate;

public final class edit_005fofferings_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    int id = 0;
    if (request.getParameter("submit")!= null)
    {
        id = Integer.parseInt(request.getParameter("id"));
        String type = request.getParameter("edit_type");
        Class.forName("com.mysql.jdbc.Driver");
        con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
        switch (type) {
            case "venue":     
                String venue = request.getParameter("new_val");
                stat = con.prepareStatement("Update  classofferings set venue = ? WHERE class_id = ?");
                stat.setString(1,venue);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "date":
                stat = con.prepareStatement("Update classofferings set date = ? WHERE class_id = ?");
                Date d = Date.valueOf(request.getParameter("new_val"));
                stat.setDate(1,d);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "date_cancel":
                stat = con.prepareStatement("Update classofferings set date_cancelled = ? WHERE class_id = ?");
                Date d_cancel = Date.valueOf(request.getParameter("new_val"));
                stat.setDate(1,d_cancel);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "date_confirm":
                stat = con.prepareStatement("Update classofferings set date_confirmed = ? WHERE class_id = ?");
                Date d_confirm = Date.valueOf(request.getParameter("new_val"));
                stat.setDate(1,d_confirm);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "num":
                stat = con.prepareStatement("Update classofferings set num_students = ? WHERE class_id = ?");
                int num = Integer.parseInt(request.getParameter("new_val"));
                stat.setInt(1,num);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "lecturer":
                stat = con.prepareStatement("Update classofferings set lecturer_id = ? WHERE class_id = ?");
                int lect = Integer.parseInt(request.getParameter("new_val"));
                stat.setInt(1,lect);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "course":
                stat = con.prepareStatement("Update classofferings set course_id = ? WHERE class_id = ?");
                int course = Integer.parseInt(request.getParameter("new_val"));
                stat.setInt(1,course);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;     
        }
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
      out.write("        <h1>Update Class Offerings</h1><br>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-sm-4\">\n");
      out.write("            <form class=\"card\" method=\"POST\" action=\"#\">\n");
      out.write("                <div class=\"col-sm-6\">\n");
      out.write("                    <div alight=\"left\">\n");
      out.write("                        <label class=\"form-label\">Enter ID:</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" name=\"id\" placeholder=\"Enter Class Offering ID\"><br>\n");
      out.write("                    </div>\n");
      out.write("                    <div alight=\"left\">\n");
      out.write("                        <label class=\"form-label\">Enter New Value:</label><br>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" name=\"new_val\" placeholder=\"YYYY-MM-DD for Dates\"><br>\n");
      out.write("                    </div>        \n");
      out.write("                    <div alight=\"left\">\n");
      out.write("                        <select class=\"form-control\" name=\"edit_type\" required>\n");
      out.write("                            <option value = \"venue\">Change Venue</option>\n");
      out.write("                            <option value = \"date\">Change Date</option>\n");
      out.write("                            <option value = \"date_cancel\">Change Date Cancelled</option>\n");
      out.write("                            <option value = \"date_confirm\">Change Date Confirmed</option>\n");
      out.write("                            <option value = \"num\">Change # of Students</option>\n");
      out.write("                            <option value = \"lecturer\">Change Lecturer</option>\n");
      out.write("                            <option value = \"course\">Change Course ID</option>\n");
      out.write("                         </select><br>\n");
      out.write("                    </div>\n");
      out.write("                    <div alight=\"right\">\n");
      out.write("                        <input type=\"submit\" value=\"submit\" name=\"submit\" class=\"btn btn-info\">   \n");
      out.write("                        <input type=\"reset\" value=\"reset\" name=\"reset\" class=\"btn btn-warning\" onClick=\"this.form.reset()\">\n");
      out.write("                    </div>\n");
      out.write("                    <div alight=\"right\">\n");
      out.write("                         <p><a href=\"index.html\">Go Back</a></p>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-sm-8\">\n");
      out.write("                     <div class=\"panel-body\">\n");
      out.write("                        <table id=\"tb-offerings\" class=\"table table-responsive table-bordered\" cellpadding=\"0\" tablewidth=\"100%\">\n");
      out.write("                            <thead>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th>ID</th>\n");
      out.write("                                    <th>Venue</th>\n");
      out.write("                                    <th>Date</th>\n");
      out.write("                                    <th>Date Cancelled</th>\n");
      out.write("                                    <th>Date Confirmed</th>\n");
      out.write("                                    <th># of Students</th>\n");
      out.write("                                    <th>Lecturer ID</th>\n");
      out.write("                                    <th>Course ID</th>\n");
      out.write("                                </tr>\n");
      out.write("                                ");

                                    Class.forName("com.mysql.jdbc.Driver");
                                    boolean has_data = false;
                                    con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
                                    stat = con.prepareStatement("select * from classofferings where class_id = ?");
                                    stat.setInt(1, id);
                                    res = stat.executeQuery();
                                    has_data = res.next();
                                    if (has_data){
                                        String offer_info = res.getString("class_id");
                                
      out.write("\n");
      out.write("                                <tr>\n");
      out.write("                                    <td> ");
      out.print(res.getString("class_id"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("venue"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("date"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("date_cancelled"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("date_confirmed"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("num_students"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("lecturer_id"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("course_id"));
      out.write("</td>\n");
      out.write("                                </tr>\n");
      out.write("                            </thead>\n");
      out.write("                            ");
  } con.close();
      out.write("\n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
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
