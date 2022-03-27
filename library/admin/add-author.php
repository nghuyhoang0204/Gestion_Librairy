<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])==0)
    {   
header('location:index.php');
}
else{ 

if(isset($_POST['create']))
{
$author=$_POST['author'];
$sql="INSERT INTO  tblauthors(AuthorName) VALUES(:author)";
$query = $dbh->prepare($sql);
$query->bindParam(':author',$author,PDO::PARAM_STR);
$query->execute();
$lastInsertId = $dbh->lastInsertId();
if($lastInsertId)
{
$_SESSION['msg']="Auteur répertorié avec succès";
header('location:manage-authors.php');
}
else 
{
$_SESSION['error']="Un problème est survenu. Veuillez réessayer";
header('location:manage-authors.php');
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
    <title>Gestion de Bibliotheque| Add Auteur</title>
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
    <div class="content-wra"></div>
    <div class="content-wrapper">
         <div class="container">
        <div class="row pad-botm">
            <div class="col-md-12">
                <h4 class="header-line">Add Auteur</h4>
                
                            </div>

</div>
<div class="row">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3"></div>
<div class="panel panel-info">
<div class="panel-heading">
Informations sur l'auteur
</div>
<div class="panel-body">
<form role="form" method="post">
<div class="form-group">
<label>Nom de l'auteur</label>
<input class="form-control" type="text" name="author" autocomplete="off"  required />
</div>

<button type="submit" name="create" class="btn btn-info">Ajout </button>

                                    </form>
                            </div>
                        </div>
                            </div>

        </div>
   
    </div>
    <div></div>
     <!-- FIN DE LA SECTION CONTENU-WRAPPER-->
  <?php include('includes/footer.php');?>
    <!-- CORE JQUERY  -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- SCRIPTS BOOTSTRAP  -->
    <script src="assets/js/bootstrap.js"></script>
      <!-- SCRIPTS PERSONNALISÉS  -->
    <script src="assets/js/custom.js"></script>
</body>
</html>
<?php } ?>
