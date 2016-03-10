<?php

/**
 * Created by PhpStorm.
 * User: kaylafitzsimmons
 * Date: 2/9/16
 * Time: 10:18 AM
 */
 
class Category implements JsonSerializable
{
    private $id;
    private $name;

    public function jsonSerialize() {
        return [ 
		    'id' => $this->id,
		    'name' => $this->name
	    ];
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return mixed
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param mixed $name
     */
    public function setName($name)
    {
        $this->name = $name;
    }

    /**
     * Category constructor.
     * @param $id
     */
    public function __construct($id,$name)
    {
        $this->id = $id;
        $this->name = $name;
    }
}
