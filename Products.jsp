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

<div class="container Success">
<% String msg=(String)request.getAttribute("Success"); 
if(msg!=null)
{
	out.print("Item is sucessfully added to cart!!!Continue Shopping");
}
%>
</div>

<%-- <div class="container no-item">
<% String message=(String)request.getAttribute("message"); 
if(message!=null)
{
	out.print("You have not items in your cart currently");
}
%>
</div> --%>


<div class="container products">
<div class="row justify-content-center">
<div class="col-sm apparels">
<div class="row justify-content-center align-items-center">
<div class="col-sm apparels-container-0-0 justify-content-center">
<div class="apparels-image-container-0-0">
<a href="TShirtServlet">
<img class="all-categories-image" alt="T-shirt" src="https://lsco.scene7.com/is/image/lsco/levis/clothing/177830137-alt1-pdp.jpg?$regular_mobile$">
</a>
</div>
<p align="center">T-Shirts</p>
</div>
<div class="col-sm apparels-container-0-1 justify-content-center">
<div class="apparels-image-container-0-1">
<a href="ShirtServlet">
<img class="all-categories-image" alt="Shirt" src="https://i.pinimg.com/originals/67/32/33/6732338307e4a9c123f9f2f799c0cf06.jpg">
</a>
</div>
<p align="center">Shirts</p>
</div>
</div>
<div class="row justify-content-center align-items-center">
<div class="col-sm apparels-container-1-0 justify-content-center">
<div class="apparels-image-container-1-0">
<a href="JeansServlet">
<img class="all-categories-image" alt="Jeans" src="https://rukminim1.flixcart.com/image/332/398/k4k7f680/jean/a/c/v/32-19a4l2rs5210i-901-united-colors-of-benetton-original-imafnfwmvtaf9e3g.jpeg?q=50">
</a>
</div>
<p align="center">Jeans</p>
</div>
<div class="col-sm apparels-container-1-1 justify-content-center">
<div class="apparels-image-container-1-1">
<a href="FormalWearServlet">
<img class="all-categories-image" alt="Formals" src="https://i.pinimg.com/originals/df/a1/de/dfa1de6a46586afaa0439707f78c80ec.jpg">
</a>
</div>
<p align="center">Formals</p>
</div>
</div>
</div>
<div class="col-sm shoes">
<div class="row justify-content-center align-items-center">
<div class="col-sm shoes-container-0-0 justify-content-center">
<div class="shoes-image-container-0-0">
<a href="CasualShoesServlet">
<img class="all-categories-image" alt="Casuals" src="https://acrossports.s3.amazonaws.com/productPhotos/NIKE/BQ4222002/BQ4222002_1.jpg">
</a>
</div>
<p align="center">Casuals</p>
</div>
<div class="col-sm shoes-container-0-1 justify-content-center">
<div class="shoes-image-container-0-1">
<a href="FormalShoesServlet">
<img class="all-categories-image" alt="Formals" src="https://5.imimg.com/data5/QX/PM/MY-11928137/brown-leather-shoes-500x500.jpg">
</a>
</div>
<p align="center">Formals</p>
</div>
</div>
<div class="row justify-content-center align-items-center">
<div class="col-sm shoes-container-1-0 justify-content-center">
<div class="shoes-image-container-1-0">
<a href="SportsShoesServlet">
<img class="all-categories-image" alt="Sports" src="https://www.sepsport.com/media/x490/Nike_Air_Max_Shoes/Nike_Air_VaporMax_2019/Nike_Air_Max_2019_Footwear_Black_White_524977-500.jpg">
</a>
</div>
<p align="center">Sports Shoes</p>
</div>
<div class="col-sm shoes-container-1-1 justify-content-center">
<div class="shoes-image-container-1-1">
<a href="Sneakers">
<img class="all-categories-image" alt="Sneakers" src="https://i.pinimg.com/originals/a4/e9/f7/a4e9f74ff9c92dc95c137c9d8b51f1d9.jpg">
</a>
</div>
<p align="center">Sneakers</p>
</div>
</div>
</div>
</div>
<div class="row">
<div class="col-sm books">
<div class="row justify-content-center align-items-center">
<div class="col-sm books-container-0-0">
<div class="books-image-container-0-0">
<a href="FictionServlet">
<img class="all-categories-image" alt="Fiction" src="https://imgix.bustle.com/uploads/image/2018/11/26/303ba8eb-9308-48f3-8a71-bfa48bcc6da2-fictionbest.jpg">
</a>
</div>
<p align="center">Fiction</p>
</div>
<div class="col-sm books-container-0-1">
<div class="books-image-container-0-1">
<a href="PoetryServlet">
<img class="all-categories-image" alt="Poetry" src="https://worldofwanderlust.com/wp-content/uploads/2018/09/September-26.jpg">
</a>
</div>
<p align="center">Poetry</p>
</div>
</div>
<div class="row justify-content-center align-items-center">
<div class="col-sm books-container-1-0">
<div class="books-image-container-1-0">
<a href="DetectiveServlet">
<img class="all-categories-image" alt="Detectives" src="https://images-na.ssl-images-amazon.com/images/I/41BpCr6CRbL._SX331_BO1,204,203,200_.jpg">
</a>
</div>
<p align="center">Detectives</p>
</div>
<div class="col-sm books-container-1-1">
<div class="books-image-container-1-1">
<a href="AdventureServlet">
<img class="all-categories-image" alt="Adventures" src="https://www.mensjournal.com/wp-content/uploads/2014/11/best-adventure-books-2019.jpg">
</a>
</div>
<p align="center">Adventures</p>
</div>
</div>
</div>
<div class="col-sm grocery">
<div class="row justify-content-center align-items-center">
<div class="col-sm grocery-container-0-0">
<div class="grocery-image-container-0-0">
<a href="BabyFoodsServlet">
<img class="all-categories-image" alt="Baby-Foods" src="https://www.forbaby.co.nz/var/forbaby/storage/images/baby-foods-products/baby-food-wattie-s-for-baby/1761-53-eng-US/Baby-Food-Wattie-s-for-Baby.jpg">
</a>
</div>
<p align="center">Baby Foods</p>
</div>
<div class="col-sm grocery-container-0-1">
<div class="grocery-image-container-0-1">
<a href="WheyProteinServlet">
<img class="all-categories-image" alt="Whey-Proteins" src="https://images-na.ssl-images-amazon.com/images/I/713RJa%2BLENL._SX522_.jpg">
</a>
</div>
<p align="center">Whey-Proteins</p>
</div>
</div>
<div class="row justify-content-center align-items-center">
<div class="col-sm grocery-container-1-0">
<div class="grocery-image-container-1-0">
<a href="GroceryItemsServlet">
<img class="all-categories-image" alt="Grocery-Items" src="https://pluspng.com/img-png/grocery-items-png-supermarket-coupons-png-image-12852-366.png">
</a>
</div>
<p align="center">Grocery-Items</p>
</div>
<div class="col-sm grocery-container-1-1">
<div class="grocery-image-container-1-1">
<a href="MassGainerServlet">
<img class="all-categories-image" alt="Mass-gainers" src="https://images-na.ssl-images-amazon.com/images/I/61Y0fmDZtfL._SX466_.jpg">
</a>
</div>
<p align="center">Mass-Gainers</p>
</div>
</div>
</div>
</div>
<!-- <div class="row">
<div class="col-sm beauty">
<div class="row justify-content-center align-items-center">
<div class="col-sm beauty-container-0-0">
<div class="beauty-image-container-0-0">
<img class="all-categories-image" alt="Cream" src="https://i.ytimg.com/vi/X_agCQP11EM/maxresdefault.jpg">
</div>
<p align="center">Cream</p>
</div>
<div class="col-sm beauty-container-0-1">
<div class="beauty-image-container-0-1">
<img class="all-categories-image" alt="Powder" src="https://images-na.ssl-images-amazon.com/images/I/71pw6vqVl6L._SL1500_.jpg">
</div>
<p align="center">Powder</p>
</div>
</div>
<div class="row justify-content-center align-items-center">
<div class="col-sm beauty-container-1-0">
<div class="beauty-image-container-1-0 ">
<img class="all-categories-image" alt="Deos" src="https://www.deobazaar.com/admin/product_image/AdidasIceDivePerfumeAndDeodorantCombo_d03bdf.jpg">
</div>
<p align="center">Perfumes/Deos</p>
</div>
<div class="col-sm beauty-container-1-1">
<div class="beauty-image-container-1-1 ">
<img class="all-categories-image" alt="Hair/Skin care" src="https://www.beautyinmymind.com/wp-content/uploads/2013/01/Favourite-Skin-Hair-and-Body-Care-2012-1.jpg">
</div>
<p align="center">Hair/Skin Care</p>
</div>
</div>
</div>
<div class="col-sm bags">
<div class="row justify-content-center align-items-center">
<div class="col-sm bags-container-0-0">
<div class="bags-image-container-0-0">
<img class="all-categories-image" alt="Trolleys" src="https://images-na.ssl-images-amazon.com/images/I/61D3%2BdFQ3OL._SY741_.jpg">
</div>
<p align="center">Trolleys</p>
</div>
<div class="col-sm bags-container-0-1">
<div class="bags-image-container-0-1 ">
<img class="all-categories-image" alt="Handbags" src="https://ae01.alicdn.com/kf/HTB1p1MoSQvoK1RjSZFNq6AxMVXaW/Men-Genuine-Leather-Handbags-Casual-Leather-Laptop-Bags-Male-Business-Travel-Messenger-Bags-Men-s-Crossbody.jpg">
</div>
<p align="center">Handbags</p>
</div>
</div>
<div class="row justify-content-center align-items-center">
<div class="col-sm bags-container-1-0">
<div class="bags-image-container-1-0 ">
<img class="all-categories-image" alt="Wallets" src="https://img.letgo.com/images/5e/46/73/e9/5e4673e9d41114708d4d806927770cde.jpeg?impolicy=img_600_pwa">
</div>
<p align="center">Wallets</p>
</div>
<div class="col-sm bags-container-1-1">
<div class="bags-image-container-1-1 ">
<img class="all-categories-image" alt="Ladies-Bags" src="https://i.ebayimg.com/thumbs/images/g/gsYAAOSwxuxbGFR4/s-l225.jpg">
</div>
<p align="center">Ladies-Bags</p>
</div>
</div>
</div>
</div> -->
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