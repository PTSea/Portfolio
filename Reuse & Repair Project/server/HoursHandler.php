<?php

/**
 * Created by PhpStorm.
 * User: kaylafitzsimmons
 * Date: 2/4/16
 * Time: 8:53 PM
 */
include_once('Database.php');
include_once('Hours.php');
include_once('Handler.php');
class HoursHandler extends Handler
{
    /**
     * @param $id
     * @return boolean
     */  
    private function hoursExist($id)
    {
        $sql = "SELECT * FROM reuse_and_repair_db.Hours
          WHERE reuse_and_repair_db.Hours.hours_id = ?;";
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
        // Check if hours exists
        if (!$this->hoursExist($id))
          return ['message' => 'Hours does not exist', 'status_code' => 404];

        // Delete hours from table
        $sql = "DELETE FROM reuse_and_repair_db.Hours
          WHERE reuse_and_repair_db.Hours.hours_id = ?;";
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
        // Check if hours exists
        if (!$this->hoursExist($object['hours_id']))
          return ['message' => 'Hours does not exist', 'status_code' => 404];

        // Update address
        $sql = "UPDATE reuse_and_repair_db.Hours
            SET reuse_and_repair_db.Hours.hours_entry = ?
            WHERE reuse_and_repair_db.Hours.hours_id = ?;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $object['hours_entry']);
        $prepared->bindParam(2, $object['hours_id']);
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
        $sql = "INSERT INTO reuse_and_repair_db.Hours (hours_entry)
                VALUES (?);";      
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $object['hours_entry']);
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
