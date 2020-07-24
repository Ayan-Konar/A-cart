<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp/Login Page</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="loginstyle.css" rel="stylesheet" type="text/css">
</head>
<body  style="background-color:#b7efcd;">

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

<div class="container login-container">
<div class="row">
<div class="col-sm-6 sign-up-form">
<h1>SignUp</h1>
<form action="SignupServlet" method="post" name="form1">
<div class="form-group">
<input type="text" class="form-control" placeholder="Name" name="uname1" required/>
</div>
<div class="form-group">
<input type="email" class="form-control" placeholder="Email Address" name="email1" required/>
</div>
<div class="form-group">
<input type="password" class="form-control" placeholder="Password" name="pass1" required/>
</div>
<div class="form-group">
<input type="password" class="form-control" placeholder="Confirm Password" name="con_pass1" required/>
</div>
<div class="form-group">
<input type="submit" class="btnSubmit" value="Sign-up"/>
</div>
</form>
</div>
<div class="col-sm-6 login-form">
<h1>Login</h1>
<form action="LoginServlet" method="post" name="form2">
<div class="form-group">
<input type="email" class="form-control" placeholder="Email address" name="email2" required/>
</div>
<div class="form-group">
<input type="password" class="form-control" placeholder="Password" name="pass2" required/>
</div>
<div class="form-group">
<input type="submit" class="btnSubmit" value="Login" />
</div>
</form>
</div>
</div>
</div>



</body>
</html>