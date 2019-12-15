package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import CCP.*;
import java.sql.*;
import java.time.LocalDate;
import java.util.TimeZone;
import java.time.Duration;
import java.time.temporal.ChronoUnit;

public final class edit_005fbookings_jsp extends org.apache.jasper.runtime.HttpJspBase
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
        String newValue = request.getParameter("new_val");
        
        Class.forName("com.mysql.jdbc.Driver");
        con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
        switch (type) {
            case "d_book":     
                Date d_book = Date.valueOf(newValue);
                d_book.setTime(d_book.getTime() + TimeZone.getDefault().getRawOffset());
                stat = con.prepareStatement("Update bookings set date_booked = ? WHERE booking_id = ?");
                stat.setDate(1,d_book);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "d_confirm":
                stat = con.prepareStatement("Update bookings set date_confirmed = ? WHERE booking_id = ?");
                Date d_confirm = Date.valueOf(newValue);
                d_confirm.setTime(d_confirm.getTime() + TimeZone.getDefault().getRawOffset());
                stat.setDate(1,d_confirm);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "d_cancel":
                stat = con.prepareStatement("Update bookings set date_cancelled = ? WHERE booking_id = ?");
                Date d_cancel = Date.valueOf(newValue);
                d_cancel.setTime(d_cancel.getTime() + TimeZone.getDefault().getRawOffset());
                stat.setDate(1,d_cancel);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "amount":
                stat = con.prepareStatement("Update bookings set amount = ? WHERE booking_id = ?");
                Double amount = Double.parseDouble(newValue);
                stat.setDouble(1,amount);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "refund":
                stat = con.prepareStatement("Update bookings set refund_amount = ? WHERE booking_id = ?");
                Double refund = Double.parseDouble(newValue);
                stat.setDouble(1,refund);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "c_rating":
                stat = con.prepareStatement("Update bookings set class_rating = ? WHERE booking_id = ?");
                int c_rating = Integer.parseInt(newValue);
                stat.setInt(1,c_rating);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "l_rating":
                stat = con.prepareStatement("Update bookings set lecturer_rating = ? WHERE booking_id = ?");
                int l_rating = Integer.parseInt(newValue);
                stat.setInt(1,l_rating);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;    
            case "c_feedback":
                stat = con.prepareStatement("Update bookings set class_feedback = ? WHERE booking_id = ?");
                String c_feedback = newValue;
                stat.setString(1,c_feedback);
                stat.setInt(2,id);
                stat.executeUpdate();
                break; 
            case "l_feedback":
                stat = con.prepareStatement("Update bookings set lecturer_feedback = ? WHERE booking_id = ?");
                String l_feedback = newValue;
                stat.setString(1,l_feedback);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;  
            case "class_id":
                stat = con.prepareStatement("Update bookings set class_id = ? WHERE booking_id = ?");
                int c_id = Integer.parseInt(newValue);
                stat.setInt(1,c_id);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
            case "group_id":
                stat = con.prepareStatement("Update bookings set group_id = ? WHERE booking_id = ?");
                int g_id = Integer.parseInt(newValue);
                stat.setInt(1,g_id);
                stat.setInt(2,id);
                stat.executeUpdate();
                break;
        }

      out.write("\n");
      out.write("<script>\n");
      out.write("    alert(\"Record Updated\");\n");
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
      out.write("        <h1>Update a Booking</h1><br>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-sm-4\">\n");
      out.write("            <form class=\"card\" method=\"POST\" action=\"#\">\n");
      out.write("                <div class=\"col-sm-6\">\n");
      out.write("                    <div alight=\"left\">\n");
      out.write("                        <label class=\"form-label\">Enter ID:</label>\n");
      out.write("                            <div class=\"dropdown\">\n");
      out.write("                                ");

                                    Class.forName("com.mysql.jdbc.Driver");
                                    con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
                                    stat = con.prepareStatement("select booking_id from bookings");
                                    ResultSet list = stat.executeQuery();
                                
      out.write("\n");
      out.write("                                <select name=\"id\" class=\"form-control\" required>\n");
      out.write("                                    ");

                                        while(list.next())
                                        {
                                            String l_id = list.getString("booking_id");
                                    
      out.write("\n");
      out.write("                                    <option>");
      out.print(list.getString("booking_id"));
      out.write("</option>\n");
      out.write("                                    ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("                                </select>\n");
      out.write("                                ");
 con.close(); 
      out.write("\n");
      out.write("                            </div> <br>\n");
      out.write("                        </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-8\">\n");
      out.write("                    <div alight=\"left\">\n");
      out.write("                        <label class=\"form-label\">Enter New Value:</label><br>\n");
      out.write("                        <input type=\"text\" step=\"any\" class=\"form-control\" name=\"new_val\" placeholder=\"YYYY-MM-DD for Dates\"><br>\n");
      out.write("                    </div>        \n");
      out.write("                    <div alight=\"left\">\n");
      out.write("                        <select class=\"form-control\" name=\"edit_type\" required>\n");
      out.write("                            <option value = \"d_book\">Change Date Booked</option>\n");
      out.write("                            <option value = \"d_confirm\">Change Date Confirmed</option>\n");
      out.write("                            <option value = \"d_cancel\">Change Date Cancelled</option>\n");
      out.write("                            <option value = \"amount\">Change Amount</option>\n");
      out.write("                            <option value = \"refund\">Change Refund</option>\n");
      out.write("                            <option value = \"c_rating\">Change Class Rating</option>\n");
      out.write("                            <option value = \"l_rating\">Change Lecturer Rating</option>\n");
      out.write("                            <option value = \"c_feedback\">Change Class Feedback</option>\n");
      out.write("                            <option value = \"l_feedback\">Change Lecturer Feedback</option>\n");
      out.write("                            <option value = \"c_id\">Change Class ID</option>\n");
      out.write("                            <option value = \"g_id\">Change Group ID</option>\n");
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
      out.write("                                    <th>Date Booked</th>\n");
      out.write("                                    <th>Date Cancelled</th>\n");
      out.write("                                    <th>Date Confirmed</th>\n");
      out.write("                                    <th>Amount</th>\n");
      out.write("                                    <th>Refund Amount</th>\n");
      out.write("                                    <th>Class Rating</th>\n");
      out.write("                                    <th>Class Feedback</th>\n");
      out.write("                                    <th>Lecturer Rating</th>\n");
      out.write("                                    <th>Lecturer Feedback</th>\n");
      out.write("                                    <th>Class ID</th>\n");
      out.write("                                    <th>Group ID</th>\n");
      out.write("                                    <th>Facilitator</th>\n");
      out.write("                                </tr>\n");
      out.write("                                ");

                                    Class.forName("com.mysql.jdbc.Driver");
                                    boolean has_data = false;
                                    con =  DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","password");
                                    stat = con.prepareStatement("select * from bookings where booking_id = ?");
                                    stat.setInt(1, id);
                                    res = stat.executeQuery();
                                    has_data = res.next();
                                    if (has_data){
                                        String offer_info = res.getString("booking_id");
                                
      out.write("\n");
      out.write("                                <tr>\n");
      out.write("                                    <td> ");
      out.print(res.getString("booking_id"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("date_booked"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("date_cancelled"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("date_confirmed"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("amount"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("refund_amount"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("class_rating"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("class_feedback"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("lecturer_rating"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("lecturer_feedback"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("class_id"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("group_id"));
      out.write("</td>\n");
      out.write("                                    <td> ");
      out.print(res.getString("facilitator"));
      out.write("</td>\n");
      out.write("                                </tr>\n");
      out.write("                            </thead>\n");
      out.write("                            ");

                                }
                                  con.close();
                            
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
