<?php

require_once $_SERVER['DOCUMENT_ROOT'] . "includes/classes/connect.php";


class Init
{
    use DatabaseObjekt;

    public bool $db_status;

    public function __construct()
    {
        $this->set_status();
    }

    /**
     * checks if db connection is valid
     * @return boolean
     */
    public function status()
    {
        try {
            $db = $this->conn();
            return true;
        } catch (PDOException $e) {
            echo "Error!: " . $e->getMessage() . "<br/>" . "Check the db config file for your Credentials";
            return false;
        }
    }

    /**
     * setter for $db_status
     * @return void
     */
    private function set_status()
    {
        if ($this->status()) {
            $this->db_status = true;
        } else {
            $this->db_status = false;
        }
    }
}
