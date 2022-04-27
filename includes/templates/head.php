<?php

# start or continue session
session_start();

# check if db connection is working
require_once "./includes/classes/init.php";
$db_connection = new Init();

require_once "./includes/classes/auth.php";
$auth = new Auth();


?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title><?php echo $site_title ?></title>
    <meta name="description" content="Just a little App">
    <meta name="author" content="Sebastian Müller">
</head>

</html>

<?php

# include the nav
require_once "./includes/templates/nav.php";
