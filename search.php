<!DOCTYPE html>
<html lang="en">
	<head>
		<script type="text/javascript">
		var request = new XMLHttpRequest();
		function displayResult () {
			if (request.readyState == 4) {
				var result = request.responseText;
				document.getElementById('count').innerHTML = result;
			}
		};


		function addToCart(isbn,bookname){
			request.onreadystatechange = displayResult;
		    request.open("POST","mycart.php?ISBN="+isbn+"&title="+bookname); 
		    request.send();	
		}
		</script>
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
		
		<?php
		session_start();
		if(!isset($_SESSION['user_session'])){
			header("Location: customer.php");
			exit();
		}

		if(isset($_POST['logout'])){
			session_destroy();
			header("Location: customer.php");
			exit();
		}
		
		if(!isset($_SESSION['basket'])){
			$_SESSION['basket'] = array();

		}
		?>

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
	        <div id="navbar" class="collapse navbar-collapse">
	            <form class="navbar-form navbar-right" action ="search.php" method ="POST">
	  				<input class="btn btn-danger" type="submit" name="logout" value="Logout"/>
	  			</form> 		
	        </div>
	      </div>
	    </nav>
	
		<div class="container">
	     	<div class="page-header">
	        	<h1>Search Your Book Here</h1>
	      	</div>
	    
	        <div class="jumbotron">
				<form action ="search.php" method ="POST">
					
					<div class="form-group">
	         			<label>Search :</label>
	            		<input name="searchText" type="text">
	        		</div><br>

					<input type="submit" style="margin-right: 5px;" class="btn btn-primary" value="Search By Author" name="Search">

					<input type="submit" class="btn btn-primary" value="Search By Title" name="Search">
				</form>
			</div>

		<?php

		try{
			if(isset($_POST['Search'])){
			$dbh = new PDO("mysql:host=127.0.0.1:3306;dbname=cheapbooks","root","",array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
			$sql="";
		    if($_POST['Search'] == 'Search By Author'){
			$searchauthor = $_POST['searchText'];
			$sql = "SELECT book.title as book_name, writtenby.ISBN , stocks.number, book.price, stocks.warehousecode from writtenby INNER JOIN author on author.ssn = writtenby.ssn INNER JOIN book on book.ISBN = writtenby.ISBN INNER join stocks on stocks.ISBN = book.ISBN WHERE author.name like '%{$searchauthor}%'";
			}
			else if($_POST['Search'] == 'Search By Title'){
			$searchbytitle = $_POST['searchText'];
			$sql = "SELECT book.title as book_name, writtenby.ISBN , stocks.number, book.price, stocks.warehousecode from writtenby INNER JOIN author on author.ssn = writtenby.ssn INNER JOIN book on book.ISBN = writtenby.ISBN INNER join stocks on stocks.ISBN = book.ISBN WHERE book.title like '%{$searchbytitle}%'";
			}
			
		    $dbh->beginTransaction();
			$statement = $dbh->prepare($sql);
			$statement->execute();
			$dbh->commit();
			$searchResults = array();
				if($statement->rowcount()){
				echo "<table class='table table-bordered' >";	
				echo "<tr><th>ISBN</th><th>Book Title</th><th>Price</th><th>No. of Available Books </th><th></th></tr>";
				while($row=$statement ->fetch()){
					if($row['number']>0){
						$searchResults[$row['ISBN']] = $row;
						echo "<tr><td>".$row['ISBN']."</td><td>".$row['book_name']."</td><td>".$row['price']."</td><td>".$row['number']."</td><td>
						<button class='btn btn-success' type='button' onClick='addToCart(&quot;{$row['ISBN']}&quot;,&quot;{$row['book_name']}&quot;)'>Add to cart</button>;</td></tr>";				
					}
				}
				echo "</table><br/>";				
			}
			$_SESSION['searchResults'] = $searchResults;
		}
		}
		catch(PDOException $e){
			echo $e->getMessage();
						}

		?>	

	  <button type="button" class="btn btn-info" name="shoppingbasket" onclick="location.href='checkout.php';" /> Shopping Basket</button><br>	  	  
	  <h4><div id="count">Counter - 0</div></h4><br>	  	  
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