<?php
$hote = 'remotemysql.com';
$port = "3306";
$nom_bdd = '5kiLlmQ5oU';
$utilisateur = '5kiLlmQ5oU';
$mot_de_passe ='UKBrkMKzsd';
try {
	//On test la connexion à la base de donnée
    $bdd = new PDO('mysql:host='.$hote.';port='.$port.';dbname='.$nom_bdd, $utilisateur, $mot_de_passe);
} catch(Exception $e) {
	//Si la connexion n'est pas établie, on stop le chargement de la page.
	echo("Echec de la connexion à la base de données");
    exit();
}
?>

