<?php

require_once "./includes/templates/head.php";

if ($auth->is_logged()) {
    $auth->force_redirect("übersicht.php");
} else {
    $auth->force_redirect("login.php");
}
