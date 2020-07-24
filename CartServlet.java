package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.UserBean;
import Dao.UserDao;

/**
 * Servlet implementation class CartServlet
 */
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
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
		String size=request.getParameter("sizes");
		//out.print(size);
		String p_id=request.getParameter("p_id");
		String quantity=request.getParameter("quantity");
		String email=(String)request.getSession().getAttribute("email id");
		int quan=Integer.parseInt(quantity);
		int pid=Integer.parseInt(p_id);
		Integer status=UserDao.SaveProducts(pid, size, quan,email);
		/*
		 * request.setAttribute("status",status);
		 * request.getRequestDispatcher("ViewCart.jsp").include(request, response);
		 */
		if(status>0)
		{
			//List<UserBean>l=UserDao.ViewProducts();
			String msg="Success";
			/*
			 * for(UserBean u:l) { out.print(u.getP_id()+""+u.getSize()+""+u.getQuan()); }
			 */
			request.setAttribute("Success",msg);
			request.getRequestDispatcher("Products.jsp").include(request, response);
		}
		/*
		 * if(status>0) { out.print("Record saved Successfully"); } else {
		 * out.print("Sorry!!!record not saved"); }
		 */
		//out.print(pid);
		
		//doGet(request, response);
	}

}
