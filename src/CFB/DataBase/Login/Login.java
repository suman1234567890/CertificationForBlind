package CFB.DataBase.Login;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import CFB.DataBase.DbConnect;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		auth(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		auth(request,response);
	}
	void auth(HttpServletRequest request,HttpServletResponse response)
	{
		try 
		{
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			DbConnect db= new DbConnect();
			ResultSet rs=db.executeQueryIntoDataBase("select uid,category from user where username='"+username+"' and password='"+password+"'");
		
			if(rs.next())
			{
				HttpSession hs= request.getSession();
				hs.setAttribute("uid", rs.getString(1));
				hs.setAttribute("category", rs.getString(2));
				hs.setAttribute("DbConnection",db );
				try {
					response.sendRedirect("pages/users/home.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
								
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print("Error in Login.java :");
			e.printStackTrace();
		}
		
	}

}
