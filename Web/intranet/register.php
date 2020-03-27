<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Inscription</title>
</head>

<body>

     <?php require('bdd.php');// Appelle de la connexion à la BDD?>

    <h1>Inscription</h1>

    <?php
     // Si le tableau register-form existe alors le formulaire a été envoyé
    if(isset($_POST['register-form']))
    {
      
        $username= htmlspecialchars($_POST['username']);
        $firstname= htmlspecialchars($_POST['firstname']);
        $name= htmlspecialchars($_POST['name']);
        $email= htmlspecialchars($_POST['email']);
        $emailConfirm = htmlspecialchars($_POST['email-confirm']);
        $password = htmlspecialchars($_POST['password']);
        $passwordConfirm = htmlspecialchars($_POST['password-confirm']);
            if($username && $firstname && $name && $email && $emailConfirm && $password && $passwordConfirm)
            
            {
                if($password == $passwordConfirm)
                { 
                $salt = '_nadomesti_';    
                $password = sha1($salt.$password);  
                if(filter_var($email, FILTER_VALIDATE_EMAIL)) {
                    $reqmail = $bdd->prepare("SELECT * FROM user WHERE email = ?");
                    $reqmail->execute(array($email));
                    $mailexist = $reqmail->rowCount();
                    if($mailexist == 0) {
                     
                    } else {
                        die("Adresse mail déjà utilisée !");
                    }
                }
                if(filter_var($username)) {
                    $requsername = $bdd->prepare("SELECT * FROM user WHERE username = ?");
                    $requsername->execute(array($username));
                    $usernameexist = $requsername->rowCount();
                    if($usernameexist == 0) {
                     
                    } else {
                        die("Pseudo déjà utilisée !");
                    }
                }
              
                $req = $bdd->prepare('INSERT INTO user(username,firstname,name,email,password) VALUES(:username,:firstname,:name,:email,:password)');
                $req->execute(array(
                'username' => $username,
                'firstname'=> $firstname,
                'name'=> $name,
                'email'=> $email,
                'password'=> $password
                ));

                die("Inscription terminé");

                }else echo "Les deux mots de passe doivent être identique !!";
            }else echo "Veuilez saisir tous les champs !";

    }
    
    
    
    ?>


    <form method="post">
        <label>Pseudo
            <input name="username" type="text">
        </label>

        <br>

        <label>Prénom
            <input name="firstname" type="text">
        </label>

        <br>

        <label>Nom
            <input name="name" type="text">
        </label>

        <br>

        <label>Email
            <input name="email" type="mail">
        </label>

        <br>

        <label>Confirmation email
            <input name="email-confirm" type="mail">
        </label>

        <br>

        <label>Mot de passe
            <input name="password" type="password">
        </label>

        <br>

        <label>Confirmation mot de passe
            <input name="password-confirm" type="password">
        </label>

        <br>

        <button type="submit" name="register-form">S'inscrire</button>
    </form>


    <a href="login">Connexion</a>

</body>

</html>