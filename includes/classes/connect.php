<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "includes/config/db.php";

/**
 *  A simple trait to use in classes that need db objekts to store or load data
 */
trait DatabaseObjekt
{
    /**
     * creates a new PDO object
     * @return object[PDO]
     */
    protected function conn()
    {
        return new PDO("mysql:host=" . HOST . ";dbname=" . DBNAME, USER, PW);
    }
}
