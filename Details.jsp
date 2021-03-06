<%@page import="java.util.Iterator"%>
<%@page import="Bean.UserBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
.address-details {
    text-align:center;
}
</style>
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

<%
@SuppressWarnings("unchecked")
String email=(String)request.getSession().getAttribute("email id");

%>
<div class="container order">
<table width="40%" align="center"
class="table table-bordered table-striped">
<%
 @SuppressWarnings("unchecked")
List<UserBean>l=(List<UserBean>)request.getAttribute("CartItems"); 
int sum=0;
if (l!= null) 
{
%>
<tr>
<th>Product Name</th>
<th>Product Image</th>
<th>Product Details</th>
<th>Total</th>

</tr>
<%
Iterator<UserBean> it = l.iterator();
while (it.hasNext()) {
UserBean bean = it.next();
%>
<tr>
<td><%=bean.getP_name()%></td>
<td><img src="<%=bean.getP_img_url()%>" alt="Tshirt-Image" width="100" height="100"/></td>
<td><p>Product Price:<%=bean.getP_price()%></p>
<p>Product Size:<%=bean.getSize()%></p>
<p>Product Quantity:<%=bean.getQuan()%></p>
</td>
<td><%out.print(bean.getP_price()*bean.getQuan());%></td>
</tr>
<%
sum+=bean.getP_price()*bean.getQuan();
}
}
%>
</table>
<br>
<br>

<div class="container total-amount-payable">
<h5 align="center">Total amount payable is:</h5>
<h3><%out.print(sum); %></h3>
</div>
</div>



<div class="container order-confirm">
<div class="address-details">
<form action="OrderServlet" >
<div class="form-group">
<input type="text" class="form-control" placeholder="Name" name="name" required/>
</div>
<div class="form-group">
<input type="email"   class="form-control" name="e-mail" placeholder="Mail Id"  required>
</div>
<div class="form-group">
<input type="text" class="form-control" placeholder="Address Line1" name="a1" required/>
</div>
<div class="form-group">
<input type="text" class="form-control" placeholder="Address Line2" name="a2" required/>
</div>
<div class="form-group">
<input type="text" class="form-control" placeholder="City" name="city" required/>
</div>
<div class="form-group">
<input type="text" class="form-control" placeholder="District" name="dist" required/>
</div>
<div class="form-group">
<input type="text" class="form-control" placeholder="Pincode" name="pcode" required/>
</div>
<div class="form-group">
<input type="text" class="form-control" placeholder="State" name="state" required/>
</div>
<input type="hidden" name="mail" value="<%=email %>">
<div class="form-group">
<input type="submit" class="btnSubmit" value="Confirm Order" />
</div>

</form>



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