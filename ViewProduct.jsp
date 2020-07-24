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
<div class="col-sm-auto cart-logo">
<a href="CartServlet1">
<img class="cart-logo-image" alt="Logo" src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRB-j__mvPa4Z9wsX9O8pKdCYaRBnZ8nWnkrA&usqp=CAU">
</a>
</div>
</div>
</div>

<div class="container tshirt">
<div class="row">
<div class="col-sm">
<%
@SuppressWarnings("unchecked")
UserBean ub = (UserBean) request.getAttribute("details");
PrintWriter s=response.getWriter();
String c_id=request.getParameter("c_id");
int cid=Integer.parseInt(c_id);
//s.print(cid);

%>
<img src="<%=ub.getP_img_url()%>" alt="Tshirt-Image" width="250" height="250"/>
<br/>
<br/>
<p align="center"><%=ub.getP_name() %>
</div>
<div class="col-sm">

<form action="CartServlet" method="post">
<table width="40%" align="center"
class="table table-bordered table-striped">
<tr>
<th>Sizes</th>
<th>Product Price</th>
<th>Product Quantity</th>
</tr>
<tr>
<td>
<%
if(cid==3)
{
%>
<label for="Sizes">Choose a size:</label>
<select name="sizes" id="sizes">
  <option value="30">30</option>
  <option value="32">32</option>
  <option value="34">34</option>
  <option value="36">36</option>
  <option value="38">38</option>
  <option value="40">40</option>
</select> 
<%
}
else if(cid==1||cid==4||cid==2)
{
%>
<label for="Sizes">Choose a size:</label>
<select name="sizes" id="sizes">
  <option value="Extra Small">XS</option>
  <option value="Small">S</option>
  <option value="Medium">M</option>
  <option value="Large">L</option>
  <option value="Extra Large">XL</option>
</select> 
<%	
}
else if(cid==5||cid==6||cid==7||cid==8)
{
%>
<label for="Sizes">Choose a size:</label>
<select name="sizes" id="sizes">
  <option value="Extra Small">XS</option>
  <option value="Small">S</option>
  <option value="Medium">M</option>
  <option value="Large">L</option>
  <option value="Extra Large">XL</option>
</select> 
<%	
}
else
{
%>
<label for="Sizes">Choose a size:</label>
<select name="sizes" id="sizes">
  <option value="ONE SIZE">One Size</option>
</select> 
<%
}
%>
</td>
<td>
<%=ub.getP_price() %>
</td>
<td>
<label for="Quantity">Choose Quantity:</label>
<select name="quantity" id="quantity">
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option>
  <option value="4">4</option>
  <option value="5">5</option>
</select> 
</td>
</tr>
</table>
<% String name=ub.getP_name(); %>
<input type="hidden" name="p_id" value="<%=ub.getP_id()%>">
<input type="submit" class="btnSubmit" value="Add to Cart" />

</form>
</div>
</div>
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