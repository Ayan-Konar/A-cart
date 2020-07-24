<%@page import="java.util.Iterator"%>
<%@page import="Bean.UserBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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

<div class="container tshirts">
<table width="40%" align="center"
class="table table-bordered table-striped">
<%
@SuppressWarnings("unchecked")
List<UserBean>l=(List<UserBean>)request.getAttribute("SportsShoesList"); 
if (l!= null) 
{
%>
<tr>
<th>Product Image</th>
<th>Product Name</th>
<th>Product Price</th>
<th>View</th>

</tr>
<%
Iterator<UserBean> it = l.iterator();
while (it.hasNext()) {
UserBean bean = it.next();
%>
<tr>
<td><img src="<%= bean.getP_img_url() %>"width="100" height="100"/></td>
<td><%=bean.getP_name()%></td>
<td><%=bean.getP_price()%></td>
<td><a href="ViewProduct?p_id=<%= bean.getP_id() %>&c_id=<%= bean.getC_id() %>">View</a></td>
</tr>
<%
}
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