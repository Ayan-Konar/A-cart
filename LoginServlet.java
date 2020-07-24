package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.UserBean;
import Dao.UserDao;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email2");
		String pass=request.getParameter("pass2");
		UserBean u=new UserBean();
		u.setEmail_id(email);
		u.setPassword(pass);
		UserBean ub=UserDao.login(u);
		if(ub.getName()!=null && ub.getEmail_id()!=null)
		{
			
		request.getSession().setAttribute("name",ub.getName());
		request.getSession().setAttribute("email id",ub.getEmail_id());
		/*
		 * if(status==1) { response.sendRedirect("Products.jsp"); } else {
		 * out.print("Login not served"); }
		 */
		response.sendRedirect("Products.jsp");
		}
		else
		{
			out.print("Login Credentials are wrong");
		}
		
		doGet(request, response);
	}

}
