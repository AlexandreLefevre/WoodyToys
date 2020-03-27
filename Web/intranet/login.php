<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Connexion</title>
</head>

<body>

    <?php require('bdd.php')// Appelle de la connexion à la BDD?>
<?php 

if(isset($_POST['login-form']))
{
    $username = $_POST['username'];
    $password = $_POST['password'];

    if($username && $password){
        $salt = '_nadomesti_';    
        $password = sha1($salt.$password);  
        $requser = $bdd->prepare("SELECT * FROM user WHERE username = ? && password = ?");
        $requser->execute(array($username,$password));
        $userexist = $requser->rowCount();
        if($userexist == 1) {
            $_SESSION['username']=$username;
             header('Location:dashboard.php');        
        } else {
            echo "Pseudo ou mot de passe incorect !";
        }
      
    }else echo "Veuillez saisir tous les champs!";
}

?>
    <h1>Connexion</h1>

    <form method="post">
        <label>Pseudo
            <input name="username" type="text">
        </label>

        <br>

        <label>Mot de passe
            <input name="password" type="password">
        </label>

        <br>

        <button name="login-form" type="submit">Connexion</button>
    </form>


    <a href="register">Inscription</a>

</body>

</html>