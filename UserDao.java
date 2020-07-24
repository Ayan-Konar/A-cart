package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Bean.UserBean;
import Util.DBUtil;

public class UserDao 
{
	public static int save(UserBean u)
	{
		int status=0;
		try
		{
			Connection con=DBUtil.getConnection();
			PreparedStatement st=con.prepareStatement("insert into login(user_name,email_id,password) values(?,?,?)");
			st.setString(1,u.getName());
			st.setString(2,u.getEmail_id());
			st.setString(3,u.getPassword());
			status=st.executeUpdate();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	public static UserBean login(UserBean u)
	{
		UserBean ub=new UserBean();
		int status=0;
		try
		{
			Connection con=DBUtil.getConnection();
			PreparedStatement st=con.prepareStatement("select * from login where email_id=? and password=?");
			st.setString(1,u.getEmail_id());
			st.setString(2,u.getPassword());
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				ub.setName(rs.getString(1));
				ub.setEmail_id(rs.getString(2));
				
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ub;
	}
	public static List<UserBean> getAllTshirts(int id)
	
	{
		List<UserBean>l=new ArrayList<UserBean>();
		try
		{
			
			Connection con=DBUtil.getConnection();
			PreparedStatement st=con.prepareStatement("select product_id,product_name,product_price,cat_id,product_image_url from product_master where cat_id=?");
			st.setInt(1,id);
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				UserBean ub=new UserBean();
				ub.setP_id(rs.getInt(1));
				ub.setP_name(rs.getString(2));
				ub.setP_price(rs.getInt(3));
				ub.setC_id(rs.getInt(4));
				ub.setP_img_url(rs.getString(5));
				l.add(ub);
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return l;
	}
	
	
	public static UserBean ViewTshirt(int id)
	{
		UserBean u=new UserBean();
		try
		{
			Connection con=DBUtil.getConnection();
			PreparedStatement st=con.prepareStatement("select product_id,product_name,product_price,product_image_url from product_master where product_id=?");
			st.setInt(1,id);
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				u.setP_id(rs.getInt(1));
				u.setP_name(rs.getString(2));
				u.setP_price(rs.getInt(3));
				u.setP_img_url(rs.getString(4));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return u;
	}
	
	
	  public static int SaveProducts(int pid,String size,int quan,String email) 
	  
	  { 
		  int status=0;
		  UserBean u=new UserBean();
		  try 
		  {
			  Connection con=DBUtil.getConnection();
			  PreparedStatement st=con.prepareStatement("insert into cart(email_id,p_id,size,quantity) values(?,?,?,?)");
			  st.setString(1,email);
			  st.setInt(2,pid);
			  st.setString(3, size);
			  st.setInt(4,quan);
			  status=st.executeUpdate();
			  
		  } 
		  catch(Exception e) 
		  { 
			  e.printStackTrace();
		  } 
		  return status;
	   }
	  
	  public static List<UserBean> ViewProducts(String email)
	  {
		  List<UserBean>l=new ArrayList<UserBean>();
		  try
		  {
			  Connection con=DBUtil.getConnection();
			  PreparedStatement st=con.prepareStatement("select product_master.product_name,product_master.product_price,product_master.product_image_url,cart.s_no,cart.size,cart.quantity from product_master,cart WHERE product_master.product_id=cart.p_id AND cart.email_id=? ");
			  st.setString(1,email);
			  ResultSet rs=st.executeQuery();
			  while(rs.next())
			  {
				  UserBean u=new UserBean();
				  u.setP_name(rs.getString(1));
				  u.setP_price(rs.getInt(2));
				  u.setP_img_url(rs.getString(3));
				  u.setSerial_no(rs.getInt(4));
				  u.setSize(rs.getString(5));
				  u.setQuan(rs.getInt(6));
				  l.add(0,u);
			  }
		}
		  
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
		  return l;
	  }
	  
	  public static int deleteitem(int sno)
	  {
		  int status=0;
		  try
		  {
			 Connection con=DBUtil.getConnection();
			 PreparedStatement st=con.prepareStatement("delete from cart where s_no=?");
			 st.setInt(1,sno);
			 status=st.executeUpdate();
			 
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
		  return status;
	  }
	  public static List<UserBean> ViewCart(String email)
	  {
		  List<UserBean>l=new ArrayList<UserBean>();
		  try
		  {
			  Connection con=DBUtil.getConnection();
			  PreparedStatement st=con.prepareStatement("select product_master.product_name,product_master.product_price,product_master.product_image_url,cart.s_no,cart.size,cart.quantity from product_master,cart WHERE product_master.product_id=cart.p_id AND cart.email_id=? ");
			  st.setString(1,email);
			  ResultSet rs=st.executeQuery();
			  while(rs.next())
			  {
				  UserBean u=new UserBean();
				  u.setP_name(rs.getString(1));
				  u.setP_price(rs.getInt(2));
				  u.setP_img_url(rs.getString(3));
				  u.setSerial_no(rs.getInt(4));
				  u.setSize(rs.getString(5));
				  u.setQuan(rs.getInt(6));
				  l.add(0,u);
			  }
		}
		  
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
		  return l;
	  }
	  public static List<UserBean> carttoorder(String mail)
	  {
		  List<UserBean>l=new ArrayList<UserBean>();
		  try
		  {
			  Connection con=DBUtil.getConnection();
			  PreparedStatement st=con.prepareStatement("select cart.s_no,cart.p_id,cart.size,cart.quantity,product_master.product_name,product_master.product_price,product_master.product_image_url from cart,product_master where cart.email_id=? and cart.p_id=product_master.product_id");
			  st.setString(1,mail);
			  ResultSet rs=st.executeQuery();
			  while(rs.next())
			  {
				  UserBean u=new UserBean();
				  u.setSerial_no(rs.getInt(1));
				  u.setP_id(rs.getInt(2));
				  u.setSize(rs.getString(3));
				  u.setQuan(rs.getInt(4));
				  u.setP_name(rs.getString(5));
				  u.setP_price(rs.getInt(6));
				  u.setP_img_url(rs.getString(7));
				  l.add(u);
				  
				  
			  }
			  
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
		  return l;
	  }
	  
	  public static int order(UserBean u)
	  {
		  int status=0;
		  try
		  {
			  Connection con=DBUtil.getConnection();
			  PreparedStatement st=con.prepareStatement("insert into order_details(billing_name,billing_mail,name,email,address_line_1,address_line_2,city,dist,pincode,state,Product_details) values(?,?,?,?,?,?,?,?,?,?,?)");
			  st.setString(1,u.getBilling_name());
			  st.setString(2, u.getBilling_email());
			  st.setString(3, u.getShipping_name());
			  st.setString(4, u.getShipping_email());
			  st.setString(5, u.getAddress1());
			  st.setString(6, u.getAddress2());
			  st.setString(7, u.getCity());
			  st.setString(8, u.getDist());
			  st.setInt(9, u.getPincode());
			  st.setString(10, u.getState());
			  st.setString(11, u.getProduct_details());
			  status=st.executeUpdate();
			  
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
		  return status;
	  }
	  
	  public static int deletefromcart(String b_mail)
	  {
		  int status=0;
		  try
		  {
			  Connection con=DBUtil.getConnection();
			  PreparedStatement st=con.prepareStatement("delete from cart where email_id=?");
			  st.setString(1,b_mail);
			  status=st.executeUpdate();
			  
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
		  return status;
	  }
	   
	  public static UserBean viewOrder()
	  {
		  UserBean u=new UserBean();
		  try
		  {
			  Connection con=DBUtil.getConnection();
			  PreparedStatement st=con.prepareStatement("SELECT Product_details FROM a_cart.order_details ORDER BY order_id DESC LIMIT 1");
			  ResultSet rs=st.executeQuery();
			  if(rs.next())
			  {
				  u.setProduct_details(rs.getString(1));
			  }
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
		  return u;
	  }
	 

}
