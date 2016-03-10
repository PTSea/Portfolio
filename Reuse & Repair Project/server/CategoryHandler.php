<?php

/**
 * Created by PhpStorm.
 * User: kaylafitzsimmons
 * Date: 2/4/16
 * Time: 8:53 PM
 */
include_once('Database.php');
include_once('Category.php');
include_once('Handler.php');
class CategoryHandler extends Handler
{
    /**
     * @param $id
     * @return boolean
     */
    private function categoryExistById($id)
    {
        $sql = "SELECT * FROM reuse_and_repair_db.Category
            WHERE reuse_and_repair_db.Category.category_id = ?;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $id);
        $success = $prepared->execute();

        return ($prepared->rowCount() > 0 ? true : false);
    }

    /**
     * @param $id
     * @return boolean
     */
    private function categoryExistByName($name)
    {
        $sql = "SELECT * FROM reuse_and_repair_db.Category
            WHERE reuse_and_repair_db.Category.category_name = ?;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $name);
        $success = $prepared->execute();

        return ($prepared->rowCount() > 0 ? true : false);
    }
    
    /*
     * getAll
     * @param recursive - if true return all nested objects, else return
     * only category objects
     * @return string
     */
    public function getAll()
    {
        $sql = "SELECT * FROM reuse_and_repair_db.Category";
        $prepared = $this->db->link->prepare($sql);
        $success = $prepared->execute();
        $fetchAll = $prepared->fetchAll();

        foreach ($fetchAll as $row) {
            $category = new Category($row['category_id'],$row['category_name']);
            $this->results[] = $category->jsonSerialize();
        }
        return $this->getJSON();
    }

    /**
     * @param $id
     * @return string
     */
    public function get($id)
    {
        setResults($id);
        return $this->getJSON();
    }

    /**
     * @param $id
     * @return string
     */
    public function delete($id)
    {
        // Check if category exists
        if (!$this->categoryExistById($id))
          return ['message' => 'Category does not exist', 'status_code' => 404];

        // Delete subcategory
        $sql = "DELETE FROM reuse_and_repair_db.Category
        WHERE reuse_and_repair_db.Category.category_id = ?;";
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
        if ($object['new_category'] == null)
          return ['message' => 'Invalid parameter', 'status_code' => 400];

        // Check if category exists
        if (!$this->categoryExistById($object['category_id']))
          return ['message' => 'Category does not exist', 'status_code' => 404];

        // Check if new category exists
        if ($this->categoryExistByName($object['new_category']))
          return ['message' => 'New category already exists', 'status_code' => 409];

        // Update category
        $sql = "UPDATE reuse_and_repair_db.Category
            SET reuse_and_repair_db.Category.category_name = ?
            WHERE reuse_and_repair_db.Category.category_id = ?;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $object['new_category']);
        $prepared->bindParam(2, $object['category_id']);
        $success = $prepared->execute();

        if ($success)
          return ['message' => 'Success', 'status_code' => 200];
        else
          return ['message' => 'Fail', 'status_code' => 400];
    }

    /**
     * @return string
     */
    public function add($name)
    {
        if ($name == null)
          return ['message' => 'Invalid parameter', 'status_code' => 400];

        // Check if category exists
        if ($this->categoryExistByName($name))
          return ['message' => 'Category already exists', 'status_code' => 400];

        // Create category
        $sql = "INSERT INTO reuse_and_repair_db.Category (category_name) VALUES (?);";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $name);
        $success = $prepared->execute();

        if ($success)
          return ['message' => 'Created', 'status_code' => 201];
        else
          return ['message' => 'Fail', 'status_code' => 400];
    }


    function recursiveGetAll()
    {
        $sql = "select c.category_name as 'category',
            s.subcategory_name as 'subcategory',
            b.business_name as 'business',
            a.street_number as 'streetNumber',
            a.street_name as 'streetName',
            a.city as 'city',
            a.zip as 'zip',
            a.state as 'state',
            a.geolocation as 'geolocation',
            b.website as 'website',
            b.phone as 'phone',
            h.hours_entry as 'hours' from
            Category c inner join Category_Subcategory cs on c.category_id =cs.fk_category_id
            inner join Subcategory s on cs.fk_subcategory_id = s.subcategory_id
            inner join Business_Subcategory bs on s.subcategory_id = bs.fk_subcategory_id
            inner join Business b on bs.fk_business_id = b.business_id
            inner join Hours h on b.fk_hours_id = h.hours_id inner join Address a on b.fk_address_id = a.address_id";

        $prepared = $this->db->link->prepare($sql);
        $success = $prepared->execute();
        $fetchAll = $prepared->fetchAll();
        $categories = array();
        $subcategories = array();
        $unique_categories = array();
        $unique_subcategories = array();
        $category_objects = array();
        foreach ($fetchAll as $row) {
            $categories[] = $row['category'];
            $subcategories[] = $row['subcategory'];
        }

        $unique_categories = array_unique($categories);

        foreach ($unique_categories as $cat) {
            $category = new Category($cat, $cat);
        }
        foreach ($unique_subcategories as $subcat) {
            $subcategory = new Subcategory($subcat, $subcat);
        }

        //  $this->results[]= $category->jsonSerialize();

    }
}
