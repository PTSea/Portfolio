<?php
include_once('Database.php');
include_once('Handler.php');
require_once('Admin.php');
require_once('Role.php');
/**
 * Created by PhpStorm.
 * User: kaylafitzsimmons
 * Date: 2/9/16
 * Time: 8:06 PM
 */
class AdminHandler extends Handler
{
    /**
     * @param $id
     * @return boolean
     */  
    private function adminExist($id)
    {
        $sql = "SELECT * FROM reuse_and_repair_db.Admin
          WHERE reuse_and_repair_db.Admin.admin_id = ?;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $id);
        $success = $prepared->execute();

        return ($prepared->rowCount() > 0 ? true : false);
    }

    /**
     * @param $name
     * @return boolean
     */  
    private function usernameExist($name)
    {
        $sql = "SELECT * FROM reuse_and_repair_db.Admin
          WHERE reuse_and_repair_db.Admin.username = ?;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $name);
        $success = $prepared->execute();

        return ($prepared->rowCount() > 0 ? true : false);
    }
          
    /**
     * @return
     */
    public function getAll()
    {
        $sql = "SELECT * FROM reuse_and_repair_db.Admin
                INNER JOIN reuse_and_repair_db.Role
                ON reuse_and_repair_db.Admin.fk_role_id = reuse_and_repair_db.Role.role_id
                ORDER BY reuse_and_repair_db.Admin.last_name, reuse_and_repair_db.Admin.first_name, reuse_and_repair_db.Admin.username;";
        $prepared = $this->db->link->prepare($sql);
        $success = $prepared->execute();
        $all = $prepared->fetchAll();

        foreach ($all as $row) {
          $role = new Role($row['role_id'],$row['role_name']);
          $admin = new Admin($row['admin_id'],$row['username'],$row['first_name'],$row['last_name'],$row['email'],$role);
          $this->results[]= $admin->jsonSerialize();
        }
        return $this->getJSON();
    }

    /**
     * Get a admin by id
     * @param $id
     * @return string
     */
    public function get($id)
    {
        $sql = "SELECT * FROM reuse_and_repair_db.Admin
                INNER JOIN reuse_and_repair_db.Role
                ON reuse_and_repair_db.Admin.fk_role_id = reuse_and_repair_db.Role.role_id
                WHERE reuse_and_repair_db.Admin.admin_id = ?
                ORDER BY reuse_and_repair_db.Admin.last_name, reuse_and_repair_db.Admin.first_name, reuse_and_repair_db.Admin.username;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $id);
        $success = $prepared->execute();
        $all = $prepared->fetchAll();

        foreach ($all as $row) {
          $role = new Role($row['role_id'],$row['role_name']);
          $admin = new Admin($row['admin_id'],$row['username'],$row['first_name'],$row['last_name'],$row['email'],$role);
          $this->results[]= $admin->jsonSerialize();
        }
        return $this->getJSON();
    }

    /**
     * @param $id
     * @return string
     */
    public function delete($id)
    {
        // Check if admin exists
        if (!$this->adminExist($id))
          return ['message' => 'Admin does not exist', 'status_code' => 404];
        
        // Delete admin
        $sql = "DELETE FROM reuse_and_repair_db.Admin
          WHERE reuse_and_repair_db.Admin.admin_id = ?;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $id);
        $success = $prepared->execute(); 
        
        if ($success)
          return ['message' => 'Success', 'status_code' => 200];
        else
          return ['message' => 'Fail', 'status_code' => 400];
    }

    /**
     * @return string
     */
    public function update($object)
    {
        // Check if admin exists
        if (!$this->adminExist($object['admin_id']))
          return ['message' => 'Admin does not exist', 'status_code' => 404];

        $result = $this->get($object['admin_id']);
        $json_result = json_decode($result, true);
        $admin_info = $json_result[0];

        // Update admin info in object
        if ($object['username'] != null)
        {
          // Check if username exists
          if ($this->usernameExist($object['username']))
            return ['message' => 'Username already exists', 'status_code' => 409];
          $admin_info['username'] = $object['username'];
        }
        if ($object['first_name'] != null)
          $admin_info['first_name'] = $object['first_name'];
        if ($object['last_name'] != null)
          $admin_info['last_name'] = $object['last_name'];
        if ($object['email'] != null)
          $admin_info['email'] = $object['email'];

        if ($object['first_name'] == '')
          $admin_info['first_name'] = null;
        if ($object['last_name'] == '')
          $admin_info['last_name'] = null;
        if ($object['email'] == '')
          $admin_info['email'] = null;

        // Update admin
        $sql = "UPDATE reuse_and_repair_db.Admin
            SET reuse_and_repair_db.Admin.username = ?,
            reuse_and_repair_db.Admin.first_name = ?,
            reuse_and_repair_db.Admin.last_name = ?,
            reuse_and_repair_db.Admin.email = ?
            WHERE reuse_and_repair_db.Admin.admin_id = ?;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $admin_info['username']);
        $prepared->bindParam(2, $admin_info['first_name']);
        $prepared->bindParam(3, $admin_info['last_name']);
        $prepared->bindParam(4, $admin_info['email']);
        $prepared->bindParam(5, $admin_info['admin_id']);
        $success = $prepared->execute();

        if ($success)
          return ['message' => 'Success', 'status_code' => 200];
        else
          return ['message' => 'Fail', 'status_code' => 400];
    }

    /**
     * @return string
     */
    public function updateRole($object)
    {
        if ($object['role_id'] == null)
          return ['message' => 'Invalid parameter', 'status_code' => 400];
          
        // Check if admin exists
        if (!$this->adminExist($object['admin_id']))
          return ['message' => 'Admin does not exist', 'status_code' => 404];

        // Update admin
        $sql = "UPDATE reuse_and_repair_db.Admin
            SET reuse_and_repair_db.Admin.fk_role_id = ?
            WHERE reuse_and_repair_db.Admin.admin_id = ?;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $object['role_id']);
        $prepared->bindParam(2, $object['admin_id']);
        $success = $prepared->execute();

        if ($success)
          return ['message' => 'Success', 'status_code' => 200];
        else
          return ['message' => 'Fail', 'status_code' => 400];
    }

    /**
     * @return string
     */
    public function updatePassword($object)
    {
        if ($object['password'] == null)
          return ['message' => 'Invalid parameter', 'status_code' => 400];
          
        // Check if admin exists
        if (!$this->adminExist($object['admin_id']))
          return ['message' => 'Admin does not exist', 'status_code' => 404];

        // Hash password
        $hash = password_hash($object['password'], PASSWORD_BCRYPT);

        // Update admin
        $sql = "UPDATE reuse_and_repair_db.Admin
            SET reuse_and_repair_db.Admin.password = ?
            WHERE reuse_and_repair_db.Admin.admin_id = ?;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $hash);
        $prepared->bindParam(2, $object['admin_id']);
        $success = $prepared->execute();

        if ($success)
          return ['message' => 'Success', 'status_code' => 200];
        else
          return ['message' => 'Fail', 'status_code' => 400];
    }

    /**
     * @return string
     */
    public function add($object)
    {
        if ($object['username'] == null || $object['password'] == null || $object['role_id'] == null)
          return ['message' => 'Invalid parameter', 'status_code' => 400];
        
        // Check if username exists
        if ($this->usernameExist($object['username']))
          return ['message' => 'Username already exists', 'status_code' => 409];

        // Hash password
        $hash = password_hash($object['password'], PASSWORD_BCRYPT);
          
        $sql = "INSERT INTO reuse_and_repair_db.Admin (username, password, first_name, last_name, email, fk_role_id)
               VALUES (?, ?, ?, ?, ?, ?);";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $object['username']);
        $prepared->bindParam(2, $hash);
        $prepared->bindParam(3, $object['first_name']);
        $prepared->bindParam(4, $object['last_name']);
        $prepared->bindParam(5, $object['email']);
        $prepared->bindParam(6, $object['role_id']);
        $success = $prepared->execute();
       
        if ($success)
            return ['message' => 'Created', 'status_code' => 201];
        else
            return ['message' => 'Fail', 'status_code' => 400];
    }

}