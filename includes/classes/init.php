<?php

require_once $_SERVER['DOCUMENT_ROOT'] . "includes/classes/connect.php";


class Init extends DatabaseObjekt
{

    public bool $db_status;

    public function __construct()
    {
        $this->set_status();
    }

    public function status()
    {
        try {
            $db = DatabaseObjekt::conn();
            return true;
        } catch (PDOException $e) {
            echo "Error!: " . $e->getMessage() . "<br/>" . "Check the db config file for your Credentials";
            return false;
        }
    }

    private function set_status()
    {
        if (self::status()) {
            $this->db_status = true;
        } else {
            $this->db_status = false;
        }
    }
}
