<?php

/**
 * Created by PhpStorm.
 * User: kaylafitzsimmons
 * Date: 2/4/16
 * Time: 8:53 PM
 */
include_once('Database.php');
include_once('Address.php');
include_once('Handler.php');
class AddressHandler extends Handler
{
    /**
     * @param $id
     * @return boolean
     */  
    private function addressExist($id)
    {
        $sql = "SELECT * FROM reuse_and_repair_db.Address
          WHERE reuse_and_repair_db.Address.address_id = ?;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $id);
        $success = $prepared->execute();

        return ($prepared->rowCount() > 0 ? true : false);
    }

    /**
     * @param $id
     * @return string
     */
    public function delete($id)
    {
        // Check if address exists
        if (!$this->addressExist($id))
          return ['message' => 'Address does not exist', 'status_code' => 404];

        // Delete address from table
        $sql = "DELETE FROM reuse_and_repair_db.Address
          WHERE reuse_and_repair_db.Address.address_id = ?;";
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
        // Check if address exists
        if (!$this->addressExist($object['address_id']))
          return ['message' => 'Address does not exist', 'status_code' => 404];

        // Update address
        $sql = "UPDATE reuse_and_repair_db.Address
            SET reuse_and_repair_db.Address.street_number = ?, reuse_and_repair_db.Address.street_name = ?, reuse_and_repair_db.Address.city = ?, reuse_and_repair_db.Address.state = ?, reuse_and_repair_db.Address.zip = ?, reuse_and_repair_db.Address.geolocation = ?
            WHERE reuse_and_repair_db.Address.address_id = ?;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $object['street_number']);
        $prepared->bindParam(2, $object['street_name']);
        $prepared->bindParam(3, $object['city']);
        $prepared->bindParam(4, $object['state']);
        $prepared->bindParam(5, $object['zip']);
        $prepared->bindParam(6, $object['geolocation']);
        $prepared->bindParam(7, $object['address_id']);
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
        $sql = "INSERT INTO reuse_and_repair_db.Address (street_number, street_name, city, state, zip, geolocation)
                VALUES (?, ?, ?, ?, ?, ?);";      
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $object['street_number']);
        $prepared->bindParam(2, $object['street_name']);
        $prepared->bindParam(3, $object['city']);
        $prepared->bindParam(4, $object['state']);
        $prepared->bindParam(5, $object['zip']);
        $prepared->bindParam(6, $object['geolocation']);
        $success = $prepared->execute();

        if ($success)
          return ['message' => 'Created', 'status_code' => 201];
        else
          return ['message' => 'Fail', 'status_code' => 400];
    }

    public function getAll()
    {

    }

    function get($id)
    {

    }
}
