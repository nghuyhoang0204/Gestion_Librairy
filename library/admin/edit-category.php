<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])==0)
    {   
header('location:index.php');
}
else{ 

if(isset($_POST['update']))
{
$category=$_POST['category'];
$status=$_POST['status'];
$catid=intval($_GET['catid']);
$sql="update  tblcategory set CategoryName=:category,Status=:status where id=:catid";
$query = $dbh->prepare($sql);
$query->bindParam(':category',$category,PDO::PARAM_STR);
$query->bindParam(':status',$status,PDO::PARAM_STR);
$query->bindParam(':catid',$catid,PDO::PARAM_STR);
$query->execute();
$_SESSION['updatemsg']="Marque mise à jour avec succès";
header('location:manage-categories.php');


}
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Gestion de Bibliotheque | Modifier les catégories</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME STYLE  -->
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
                <h4 class="header-line">Modifier les catégories</h4>
                
                            </div>

</div>
<div class="row">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3"></div>
<div class="panel panel-info">
<div class="panel-heading">
Informations sur la catégorie
</div>
 
<div class="panel-body">
<form role="form" method="post">
<?php 
$catid=intval($_GET['catid']);
$sql="SELECT * from tblcategory where id=:catid";
$query=$dbh->prepare($sql);
$query-> bindParam(':catid',$catid, PDO::PARAM_STR);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
if($query->rowCount() > 0)
{
foreach($results as $result)
{               
  ?> 
<div class="form-group">
<label>Nom de catégorie</label>
<input class="form-control" type="text" name="category" value="<?php echo htmlentities($result->CategoryName);?>" required />
</div>
<div class="form-group"></div>
<label>Status</label>
<?php if($result->Status==1) {?>
 <div class="radio">
<label>
<input type="radio" name="status" id="status" value="1" checked="checked">Active
</label>
</div>
<div class="radio">
<label>
<input type="radio" name="status" id="status" value="0">Inactive
</label>
</div>
<?php } else { ?>
<div class="radio">
<label>
<input type="radio" name="status" id="status" value="0" checked="checked">Inactf
</label>
</div>
<div class="radio"></div>
<label>
<input type="radio" name="status" id="status" value="1">Actif
</label>
<?php } ?>
<?php }} ?>
<button type="submit" name="update" class="btn btn-info">Mettre à jour</button>

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