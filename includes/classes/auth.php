<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "includes/classes/connect.php";

class Auth extends DatabaseObjekt
{

    private string $last_login;
    private $logged_in = false;

    public function login($username, $password)
    {
        try {
            $pdo = DatabaseObjekt::conn();
            $statement = $pdo->prepare("SELECT * FROM Auth WHERE user_name Like ?");
            $statement->execute(array($username));
            $result = $statement->fetch();

            if (password_verify($password, $result["user_password"])) {
                $_SESSION["username"] = $username;
                $_SESSION["logged"] = true;
                $this->logged_in = true;
                $this->last_login = date('d-m-y h:i:s');
                return true;
            } else {
                return false;
            }
        } catch (PDOException $err) {
            echo $err->getMessage();
        }
    }

    public function is_logged()
    {
        return $this->logged_in;
    }

    public function force_redirect($url)
    {
        header("Location:" . $url);
    }

    private function generate_hash($password)
    {
        return password_hash($password, PASSWORD_BCRYPT);
    }
}
