<?php 
require_once("includes/config.php");
// code de disponibilité des e-mails de l'utilisateur
if(!empty($_POST["emailid"])) {
	$email= $_POST["emailid"];
	if (filter_var($email, FILTER_VALIDATE_EMAIL)===false) {

		echo "error : Vous n'avez pas entré d'e-mail valide.";
	}
	else {
		$sql ="SELECT EmailId FROM tblstudents WHERE EmailId=:email";
$query= $dbh -> prepare($sql);
$query-> bindParam(':email', $email, PDO::PARAM_STR);
$query-> execute();
$results = $query -> fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query -> rowCount() > 0)
{
echo "<span style='color:red'> Email already exists .</span>";
 echo "<script>$('#submit').prop('disabled',true);</script>";
} else{
	
	echo "<span style='color:green'> Courriel disponible pour l'inscription .</span>";
 echo "<script>$('#submit').prop('disabled',false);</script>";
}
}
}


?>
