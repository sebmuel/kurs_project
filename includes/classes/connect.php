<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "includes/config/db.php";

abstract class DatabaseObjekt
{
    protected static function conn()
    {
        return new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME, USER, PW);
    }
}
