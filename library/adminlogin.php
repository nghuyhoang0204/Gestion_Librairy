<?php
session_start();
error_reporting(0);
include('includes/config.php');
if($_SESSION['alogin']!=''){
$_SESSION['alogin']='';
}
if(isset($_POST['login']))
{
 //code pour la vérification du captcha
if ($_POST["vercode"] != $_SESSION["vercode"] OR $_SESSION["vercode"]=='')  {
        echo "<script>alert('Incorrect verification code');</script>" ;
    } 
        else {

$username=$_POST['username'];
$password=md5($_POST['password']);
$sql ="SELECT UserName,Password FROM admin WHERE UserName=:username and Password=:password";
$query= $dbh -> prepare($sql);
$query-> bindParam(':username', $username, PDO::PARAM_STR);
$query-> bindParam(':password', $password, PDO::PARAM_STR);
$query-> execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
if($query->rowCount() > 0)
{
$_SESSION['alogin']=$_POST['username'];
echo "<script type='text/javascript'> document.location ='admin/dashboard.php'; </script>";
} else{
echo "<script>alert('Invalid Details');</script>";
}
}
}
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Gestion de Bibliotheque</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT STYLE  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>
    <!------DÉBUT DE LA SECTION DU MENU-->
<?php include('includes/header.php');?>
<!-- FIN DE LA SECTION DU MENU-->
<div class="content-wrapper">
<div class="container">
<div class="row pad-botm">
<div class="col-md-12">
<h4 class="header-line">FORMULAIRE DE CONNEXION ADMIN</h4>
</div>
</div>
             
<!--DÉMARRAGE DU PANNEAU DE CONNEXION-->           
<div class="row">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" >
<div class="panel panel-info">
<div class="panel-heading">
FORMULAIRE DE CONNEXION
</div>
<div class="panel-body">
<form role="form" method="post">

<div class="form-group">
<label>Saisissez votre nom d'utilisateur</label>
<input class="form-control" type="text" name="username" autocomplete="off" required />
</div>
<div class="form-group">
<label>Mot de passe</label>
<input class="form-control" type="password" name="password" autocomplete="off" required />
</div>
 <div class="form-group">
<label>Code de vérification: </label>
<input type="text"  name="vercode" maxlength="5" autocomplete="off" required style="width: 150px; height: 25px;" />&nbsp;<img src="captcha.php">
</div>  

 <button type="submit" name="login" class="btn btn-info">CONNEXION </button>
</form>
 </div>
</div>
</div>
</div>  
<!---FIN DU PABNEL DE CONNEXION-->            
             
 
    </div>
    </div>
     <!-- FIN DE LA SECTION CONTENU-WRAPPER-->
 <?php include('includes/footer.php');?>
      <!-- FIN DE LA SECTION DE PIED-->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- SCRIPTS BOOTSTRAP  -->
    <script src="assets/js/bootstrap.js"></script>
      <!-- SCRIPTS PERSONNALISÉS -->
    <script src="assets/js/custom.js"></script>
</body>
</html>
