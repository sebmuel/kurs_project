<?php

require_once "./includes/templates/head.php";

if ($auth->is_logged()) {
    $auth->force_redirect("uebersicht.php");
} else {
    $auth->force_redirect("login.php");
}
