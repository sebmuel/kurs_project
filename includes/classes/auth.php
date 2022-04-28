<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "includes/classes/connect.php";

class Auth
{
    use DatabaseObjekt;

    private string $last_login;
    private array $messages;

    public function login($username, $password)
    {
        try {
            $pdo = $this->conn();
            $statement = $pdo->prepare("SELECT * FROM Auth WHERE user_name Like ?");
            $statement->execute(array($username));
            $result = $statement->fetch();

            if (!empty($result)) {

                if (password_verify($password, $result["user_password"])) {
                    $_SESSION["username"] = $username;
                    $_SESSION["logged"] = true;
                    $this->logged_in = true;
                    $this->last_login = date('d-m-y h:i:s');
                    return true;
                }
            }
        } catch (PDOException $err) {
            echo $err->getMessage();
        }
    }

    public function get_last_login()
    {
        return $this->last_login;
    }

    public function is_logged()
    {
        return isset($_SESSION["logged"]);
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
