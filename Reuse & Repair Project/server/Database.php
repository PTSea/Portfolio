<?php
/**
 * Created by PhpStorm.
 * User: kaylafitzsimmons
 * Date: 2/4/16
 * Time: 8:53 PM
 */
class Database
{

    private $user;
    private $pass;
    private $db_name;
    private $host;
    public $link;

    /**
     * Database constructor.
     */
    public function __construct()
    {
        $this->setUser("root");
        $this->setPass("");
        $this->setDbName("reuse_and_repair_db");
        $this->setHost("localhost");
        $this->setLink();
    }
    /*  intitalizes connnection to the database
     *  error mode is on while debugging
     *  will halt program with exception if
     *  connection fails
     */
    public function setLink()
    {
        try {

            $this->link = new PDO('mysql:host='. $this->getHost().';dbname='.$this->getDbName().'; charset=utf8', $this->getUser(), $this->getPass());
            $this->link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        } catch (PDOException $e) {
            echo 'Connection failed: ' . $e->getMessage();
        }
    }
    /**
     * @param mixed $pass
     */
    public function setPass($pass)
    {
        $this->pass = $pass;
    }
    /**
     * @return mixed
     */
    public function getPass()
    {
        return $this->pass;
    }
    /**
     * @return mixed
     */
    public function getUser()
    {
        return $this->user;
    }
    /**
     * @param mixed $user
     */
    public function setUser($user)
    {
        $this->user = $user;
    }
    /**
     * @return mixed
     */
    public function getDbName()
    {
        return $this->db_name;
    }
    /**
     * @param mixed $db_name
     */
    public function setDbName($db_name)
    {
        $this->db_name = $db_name;
    }
    /**
     * @return mixed
     */
    public function getHost()
    {
        return $this->host;
    }
    /**
     * @param mixed $host
     */
    public function setHost($host)
    {
        $this->host = $host;
    }

}
?>
