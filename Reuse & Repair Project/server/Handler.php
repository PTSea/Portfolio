<?php

/**
 * Created by PhpStorm.
 * User: kaylafitzsimmons
 * Date: 2/9/16
 * Time: 8:44 PM
 */
abstract class Handler
{
    public $results = array();
    public $db;

    /**
     * CategoryHandler constructor.
     * @param array $results
     */
    function __construct()
    {
        $this->db = new Database();
    }

    /**
     * @return mixed
     */
    public function getResults()
    {
        return $this->results;
    }
    /**
     * @param mixed $results
     */
    public function setResults($results)
    {
        $this->results = $results;
    }
    /**
     * @return string
     */
    public function getJSON(){
        return json_encode($this->getResults());
    }
    /**
     * @return
     */
    abstract public function getAll();
    /**
     * @param $id
     * @return string
     */
    abstract public function get($id);
    /**
     * @param $id
     * @return string
     */
    abstract public function delete($id);

    /**
     * @return string
     */
    abstract public function update($object);

    /**
     * @return string
     */
    abstract public function add($object);
}