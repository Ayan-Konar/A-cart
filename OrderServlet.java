package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.UserBean;
import Dao.UserDao;

/**
 * Servlet implementation class OrderServlet
 */
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();

		String b_name=(String)request.getSession().getAttribute("name");
		
		
		  String s_name=request.getParameter("name");  
		  String s_email=request.getParameter("e-mail"); 
		  String ad1=request.getParameter("a1");
		  String ad2=request.getParameter("a2"); 
		  String city=request.getParameter("city"); 
		  String dist=request.getParameter("dist");
		  String pcode=request.getParameter("pcode");
		  int pincode=Integer.parseInt(pcode); 
		  String state=request.getParameter("state");
		
		  
		 
		String b_mail=request.getParameter("mail");
		
		List<UserBean>l=UserDao.carttoorder(b_mail);
		String s="";

		if(l!=null)
		{
			for(UserBean u:l)
			{
				s+=u.getSerial_no()+","+u.getP_id()+","+u.getSize()+","+u.getQuan()+","+u.getP_name()+","+u.getP_price()+","+u.getP_img_url()+";";
			}
		}
		s=s.substring(0,s.length()-1);
		
		
		
		
		
		
		
		UserBean u=new UserBean();
		u.setBilling_name(b_name);
		u.setBilling_email(b_mail);
		u.setShipping_name(s_name);
		u.setShipping_email(s_email);
		u.setAddress1(ad1);
		u.setAddress2(ad2);
		u.setCity(city);
		u.setDist(dist);
		u.setPincode(pincode);
		u.setState(state);
		u.setProduct_details(s);
		int status=UserDao.order(u);
		
		if(status>0)
		{
			int stat=UserDao.deletefromcart(b_mail);
			if(stat>0)
			{
				UserBean order_details=UserDao.viewOrder();
				
				  String msg="Your order has been successfully placed!!!!";
				  String order=order_details.getProduct_details();
				  request.setAttribute("message",msg);
				  request.setAttribute("order",order);
				  request.getRequestDispatcher("OrderConfirmed.jsp").include(request,
				  response);
				 
			}
		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
