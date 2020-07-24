<%@page import="java.util.Iterator"%>
<%@page import="Bean.UserBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="loginstyle.css" rel="stylesheet" type="text/css">
</head>
<body style="background-color:#b7efcd;">

<div class="container top-bar">
<div class="row">
<div class="col-sm company-logo">
<a href="Products.jsp">
<img class="company-logo-image" alt="Logo" src="https://images-na.ssl-images-amazon.com/images/G/01/gc/designs/livepreview/amazon_drkblue_noto_printfold_v2016_us-main._CB468920742_.png">
</a>
</div>
<div class="col-sm-auto welcome-message">
<%String name=(String)request.getSession().getAttribute("name"); 
//String email=(String)request.getSession().getAttribute("email id");
%>
<h1 style="color:red"><%out.print("Welcome,"+name);%></h1>
</div>
<div class="col-sm-auto cart-logo">
<a href="CartServlet1">
<img class="cart-logo-image" alt="Logo" src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRB-j__mvPa4Z9wsX9O8pKdCYaRBnZ8nWnkrA&usqp=CAU">
</a>
</div>
</div>
</div>

<%String message=(String)request.getAttribute("message");  %>

<div class="container confirmed-order">
<div class="row">
<div class="col-sm-auto">
<h4 style="color:red"><%out.print(message);%></h4>
</div>
</div>
</div>

<div class="container order">
<h4 style="color:red"><%out.print("Your order details are"); %></h4>
<table width="40%" align="center"
class="table table-bordered table-striped">
<%

String order=(String)request.getAttribute("order");

%>
<tr>
<th>Product Image</th>
<th>Product Name</th>
<th>Product Specifications</th>
</tr>
<%
String[]ord=order.trim().split(";");
for(int i=0;i<ord.length;i++)
{
	//out.print(ord[i]);
	String[]ord1=ord[i].trim().split(",");
%>
<tr>
<td><img src="<%= ord1[6] %>"width="80" height="80"/></td>
<td><%=ord1[4] %></td>
<td>
<p>Product Size:<%=ord1[2] %></p>
<p>Product Quantity:<%=ord1[3] %></p>
<%
int p=(Integer.parseInt(ord1[3])*Integer.parseInt(ord1[5]));
%>
<p>Product Price:<%=p %></p>
</td>
</tr>
<%
}
%>
</table>
</div>

<div class="container logout">
<form action="LogoutServlet" method="post">
<div class="row">
<div class="col-sm">
<div class="form-group">
<input type="submit" class="btnSubmit" value="Logout" />
</div>
</div>
</div>
</form>
</div>

</body>
</html>