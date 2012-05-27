package CFB.DataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DbConnect
{
	Connection con=null;
	Statement stmt=null;
	String dbname="CFB";
	String uid="db2inst1";
	String pwd="fedora";
	public DbConnect()
	{
		con=Connect();
	}
       
	public Connection Connect()
	{
		Connection con = null;
	    try 
	    {
	         String url;
	         //  URL is jdbc:db2:dbname hyan
	        // url = "jdbc:db2://localhost:50002:" + dbname;
	         url="jdbc:db2://localhost:50002/CFB:retrieveMessagesFromServerOnGetMessage=true;";
	         //  connect with id and password
	         Class.forName("com.ibm.db2.jcc.DB2Driver");
	         con = DriverManager.getConnection(url, uid, pwd);
	         System.out.println (">Connected to " + dbname);
	    } 
	    catch (Exception e) { e.printStackTrace(); }
	      
	    return con;    

	}
	public ResultSet executeQueryIntoDataBase(String query)
	{
		ResultSet rs=null;
		try
		{
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(query);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.err.print(e.getClass().getName());
			System.err.println(e.getMessage());
		}
		return rs;
	}
	public int insertIntoDataBase(String query)
	{
		try
		{
			stmt = con.createStatement();
			stmt.executeUpdate(query);
			return 1;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.err.print(e.getClass().getName());
			System.err.println(e.getMessage());
			return 0;
		}
		
	}

}
