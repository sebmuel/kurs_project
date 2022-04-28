<?php

$site_title = "Login";
require_once "./includes/templates/head.php";

if ($_SERVER["REQUEST_METHOD"] == 'POST') {
    if (count($_POST) > 0 and !empty($_POST["username"]) and !empty($_POST["password"])) {
        if ($auth->login(htmlspecialchars($_POST["username"]), htmlspecialchars($_POST["password"]))) {
            $auth->force_redirect("/uebersicht.php");
            $_SESSION["ERROR_MESSAGE"] = "Willkommen " . $_SESSION["username"];
        }
    }
}

?>
<div class="content-wrapper grid">
    <div class="login-form form">
        <form action="" method="post">
            <input type="text" name="username" placeholder="Nutzer">
            <input type="password" name="password" placeholder="Passwort">
            <input type="submit" value="Login">
        </form>
    </div>
</div>