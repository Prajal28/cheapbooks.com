<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>CheapBooks.com</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sticky-footer-navbar.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>

  <body>

    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Web Data Management : Project 4</a>
        </div>
        
      </div>
    </nav>



    <!-- Begin page content -->
    <div class="container">
      <div class="page-header">
        <h1>New User Registration</h1>
      </div>
      <!-- Every other code comes here -->
<?php
      session_start();

      error_reporting(E_ALL);
      ini_set('display_errors','On');
      if(isset($_POST['register']))
      {
        try {
        $dbh = new PDO("mysql:host=127.0.0.1:3306;dbname=cheapbooks","root","",array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
        $user_name = trim($_POST['user_name']);
        $new_pass = trim($_POST['new_pass']);
        $address = trim($_POST['address']);
        $email = trim($_POST['email']);
        $contact_number = trim($_POST['contact_number']);
        
      if($user_name==""){
        $error[] = "Please provide a UserName";
        echo "<h4 style='color: red;'>Please provide a UserName</h4>";
        }
        else if($new_pass==""){
         $error[] = "Please provide a password";
         echo "<h4 style='color: red;'>Please provide a password</h4>";
         }
        else if($email==""){
          $error[]= "Please provide an E-Mail ID";
          echo "<h4 style='color: red;'>Please provde an E-Mail ID</h4>";
        }
         else if (!filter_var($email, FILTER_VALIDATE_EMAIL)){
    $error[]= "Please provide a valid E-Mail address";
    echo "<h4 style='color: red;'>Please provide a valid E-Mail address</h4>";  
}
        else
         {
      $stmt = $dbh->prepare("insert into customers (username,password,address,phone,email) values(:user_name,:new_pass,:address,:contact_number,:email)");
      $hashpassword= md5($new_pass);
      $stmt->bindparam(":user_name", $user_name);
      $stmt->bindparam(":new_pass", $hashpassword);
      $stmt->bindparam(":address", $address);
      $stmt->bindparam(":contact_number", $contact_number);
      $stmt->bindparam(":email", $email);
      $stmt->execute();
      header("Location: customer.php");      
      exit();   
        }
        }
      catch (PDOException $e) {
        print "Error!: " . $e->getMessage() . "<br/>";
        die();
      }
      }
?>
      <div class="jumbotron">

      <form action="register.php" method="post">
        <div class="form-group">
            <label>UserName :</label>
            <input id="user_name" name="user_name" type="text">
        </div>
        <div class="form-group">
            <label>Password :</label>
            <input id="new_pass" name="new_pass" type="password">
        </div>
        <div class="form-group">
            <label>Address :</label>
            <input id="address" name="address" type="text">
        </div>
        <div class="form-group">
            <label>Email: </label>
            <input id="email" name="email" type="email">
        </div>
        <div class="form-group">
            <label>Contact Number:</label>
            <input id="contact_number" name="contact_number" type="text">
        </div>
        <button class="btn btn-primary" type="submit" name="register">Register</button>
        
                 
      </form>      




      <!-- Every other code stops here -->
      </div>
    </div>

    <footer class="footer">
      <div class="container">
        <h4 class="text-muted" style="text-align: center;">Name - Prajal Mishra ; ID - 1001434611 ; This is my forth project for CSE 5335 - Web Data Mangement.</h4>
      </div>
    </footer>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
