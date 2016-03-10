<?php

/**
 * Created by PhpStorm.
 * User: kaylafitzsimmons
 * Date: 2/10/16
 * Time: 10:39 AM
 * @property  role_id
 */
class Role implements JsonSerializable
{

    private $role_id;
    private $role_name;


    /**
     * Address constructor.
     * @param $role_id
     * @param $role_name
     */
    public function __construct($role_id, $role_name)
    {
        $this->role_id = $role_id;
        $this->role_name = $role_name;
    }

    public function jsonSerialize()
    {
        return [
            'role_id' => $this->role_id,
            'role_name' => $this->role_name
        ];
    }
    
    /**
     * @return mixed
     */
    public function getRoleId()
    {
        return $this->role_id;
    }

    /**
     * @param mixed $role_id
     */
    public function setRoleId($role_id)
    {
        $this->role_id = $role_id;
    }

    /**
     * @return mixed
     */
    public function getRoleName()
    {
        return $this->role_name;
    }

    /**
     * @param mixed $role_name
     */
    public function setRoleName($role_name)
    {
        $this->role_name = $role_name;
    }


}