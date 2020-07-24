package Util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil
{
	public static Connection getConnection(){
		Connection con = null;
		try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/A_cart","root","ayan@123");
		}
		catch(Exception e){}
		return con;
		}

}
