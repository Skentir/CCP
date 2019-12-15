package CCP;

import java.sql.*;
import java.util.ArrayList;
import java.time.LocalDate;

public class ClassOffering
{
	private Connection 			conn;
	private PreparedStatement 	sqlstatement;
	
	private int 				class_id;
	private LocalDate 			date;
	private String 				venue;
	
	private LocalDate 				date_confirmed;
	private LocalDate 				date_cancelled;
	private int 				num_students;
        private int                             lecturer_id;
        private int                             course_id;
	
	private int				results;
        
        ArrayList offerings_list = new ArrayList(); // list of class
	
	public ClassOffering(int class_id, LocalDate date, String venue, int lecturer_id, int course_id)
	{
		this.class_id = class_id;
		this.date = date;
		this.venue = venue;
		this.date_confirmed = null;
		this.date_cancelled = null;
		num_students = 0;
                this.lecturer_id = lecturer_id;
                this.course_id = course_id;
	}
	
	public void register()
	{
		try
		{
                        Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?autoReconnect=true&useSSL=false&user=root&password=password","root","password");
			sqlstatement = conn.prepareStatement("INSERT INTO CLASSOFFERINGS (class_id, date, venue, date_confirmed, date_cancelled, lecturer_id, course_id) VALUES (?, ?, ?, ?, ?, ?, ?)");
                        sqlstatement.setInt(1, 1);
			sqlstatement.setDate(2, Date.valueOf(date));
			sqlstatement.setString(3, venue);
			sqlstatement.setDate(4, Date.valueOf(date_confirmed));
			sqlstatement.setDate(5, Date.valueOf(date_cancelled));
                        sqlstatement.setInt(6, lecturer_id);
                        sqlstatement.setInt(7, course_id);
			
			results = sqlstatement.executeUpdate();
			
                        sqlstatement.close();
			conn.close();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
	
	public void updateClassOffering(int num_students)
	{
		try
		{
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?autoReconnect=true&useSSL=false&user=root&password=password");
			sqlstatement = conn.prepareStatement("UPDATE CLASSOFFERINGS SET num_students = ? WHERE class_id = ?");
			sqlstatement.setInt(1, num_students);
			sqlstatement.setInt(2, class_id);
			
			results = sqlstatement.executeUpdate();
			
			this.num_students = num_students;
			
                        sqlstatement.close();
			conn.close();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}

        public void updateClassOffering(String venue)
	{
		try
		{
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
			sqlstatement = conn.prepareStatement("UPDATE CLASSOFFERINGS SET venue = ? WHERE class_id = ?");
			sqlstatement.setString(1, venue);
			sqlstatement.setInt(2, class_id);
			
			results = sqlstatement.executeUpdate();
			
			this.venue = venue;
			
                        sqlstatement.close();
			conn.close();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
                
	public void updateClassOffering(LocalDate date_c, boolean is_confirm)
	{
		try
		{
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?autoReconnect=true&useSSL=false&user=root&password=password");
			
			if(is_confirm)
			{
				sqlstatement = conn.prepareStatement("UPDATE CLASSOFFERINGS SET date_confirmed = ? WHERE class_id = ?");
				sqlstatement.setDate(1, Date.valueOf(date_c));
				sqlstatement.setInt(2, class_id);
				
				results = sqlstatement.executeUpdate();
			
				this.date_confirmed = date_c;
			
			}
			else
			{
				sqlstatement = conn.prepareStatement("UPDATE CLASSOFFERINGS SET date_cancelled = ? WHERE class_id = ?");
				sqlstatement.setDate(1, Date.valueOf(date_c));
				sqlstatement.setInt(2, class_id);
				
				results = sqlstatement.executeUpdate();
			
				this.date_cancelled = date_c;
			}
			sqlstatement.close();
			conn.close();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
	
	public void dropClassOffering()
	{
		try
		{
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/enderdb?autoReconnect=true&useSSL=false&user=root&password=password");
			sqlstatement = conn.prepareStatement("DELETE FROM CLASSOFFERINGS WHERE class_id = ?"); // fix
			sqlstatement.setInt(1, class_id);
			
			results = sqlstatement.executeUpdate(); // fix
			
			class_id = 1000000; // set to default 
			conn = null;
			sqlstatement = null;
			date = null;
			date_confirmed = null;
			date_cancelled = null;
			num_students = 0;
			
                        sqlstatement.close();
			conn.close();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
        
        public int getID()
        {
            return class_id;
        }
	
        public LocalDate getDateConfirmed()
        {
            return date_confirmed;
        }
        
        public LocalDate getDateCancelled()
        {
            return date_cancelled;
        }
        public int getNum() 
        {
            return num_students;
        }
        public String getVenue()
        {
            return venue;
        }
        public LocalDate getDate()
        {
            return date;
        }
                
}