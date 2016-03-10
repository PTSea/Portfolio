<?php
include_once('Database.php');
include_once('Handler.php');
require_once('Business.php');
require_once('Category.php');
require_once('Address.php');
require_once('Hours.php');
require_once('AddressHandler.php');
require_once('HoursHandler.php');
/**
 * Created by PhpStorm.
 * User: kaylafitzsimmons
 * Date: 2/9/16
 * Time: 8:06 PM
 */
class BusinessHandler extends Handler
{
    /**
     * @param $id
     * @return boolean
     */  
    private function businessExist($id)
    {
        $sql = "SELECT * FROM reuse_and_repair_db.Business
        	WHERE reuse_and_repair_db.Business.business_id = ?;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $id);
        $success = $prepared->execute();

        return ($prepared->rowCount() > 0 ? true : false);
    }
    
    /**
     * @param $id
     * @return boolean
     */  
    private function subcategoryExist($id)
    {
        $sql = "SELECT * FROM reuse_and_repair_db.Subcategory
        	WHERE reuse_and_repair_db.Subcategory.subcategory_id = ?;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $id);
        $success = $prepared->execute();

        return ($prepared->rowCount() > 0 ? true : false);
    }
    
    /**
     * @param $object
     * @return string
     */  
    private function getGeolocation($object)
    {
      if ($object['street_number'] == null || $object['street_name'] == null || $object['city'] == null || $object['state'] == null || $object['zip'] == null)
        return null; 
    
      $url = 'http://www.mapquestapi.com/geocoding/v1/address?key=ioALmU4BhdOL4vblJhpuWArDATYl3v0R&inFormat=json&json='.urlencode('{"location":{"street": "'.$object['street_number'].' '.$object['street_name'].'","city":"'.$object['city'].'","state":"'.$object['state'].'","postalCode":"'.$object['zip'].'"}}');
    
      $location_content = file_get_contents($url);
      $json_location_content = json_decode($location_content, true);
      
      $geolocation = $json_location_content['results'][0]['locations'][0]['displayLatLng']['lat'].":".$json_location_content['results'][0]['locations'][0]['displayLatLng']['lng'];
  
      return $geolocation;
    }
        
    /**
     * @return
     */
    public function getAll()
    {
        $sql = "SELECT * FROM reuse_and_repair_db.Business
                LEFT JOIN reuse_and_repair_db.Address
                ON reuse_and_repair_db.Business.fk_address_id = reuse_and_repair_db.Address.address_id
                LEFT JOIN reuse_and_repair_db.Hours
                ON reuse_and_repair_db.Business.fk_hours_id = reuse_and_repair_db.Hours.hours_id
                LEFT JOIN reuse_and_repair_db.Category
                ON reuse_and_repair_db.Business.fk_category_id = reuse_and_repair_db.Category.category_id
                ORDER BY reuse_and_repair_db.Business.business_name;";
        $prepared = $this->db->link->prepare($sql);
        $success = $prepared->execute();
        $all = $prepared->fetchAll();

        foreach ($all as $row) {
          $category = new Category($row['category_id'],$row['category_name']);
          $address = new Address($row['address_id'],$row['street_number'],$row['street_name'],$row['city'],$row['state'],$row['zip'],$row['geolocation']);
          $hours = new Hours($row['hours_id'],$row['hours_entry']);
          // $id, $category, $name, $address, $hours, $website
          $business = new Business($row['business_id'],$category,$row['business_name'],$address,$row['phone'],$hours,$row['website'],$row['description']);
          $this->results[]= $business->jsonSerialize();
        }
        return $this->getJSON();
    }

    /**
     * Get a business by category
     * @param $category
     * @return string
     */
    public function getByCategory($category_id)
    {
        $sql = "SELECT * FROM reuse_and_repair_db.Business
                LEFT JOIN reuse_and_repair_db.Address
                ON reuse_and_repair_db.Business.fk_address_id = reuse_and_repair_db.Address.address_id
                LEFT JOIN reuse_and_repair_db.Hours
                ON reuse_and_repair_db.Business.fk_hours_id = reuse_and_repair_db.Hours.hours_id
                INNER JOIN reuse_and_repair_db.Category
                ON reuse_and_repair_db.Business.fk_category_id = reuse_and_repair_db.Category.category_id
                WHERE reuse_and_repair_db.Business.fk_category_id = ?
                ORDER BY reuse_and_repair_db.Business.business_name;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $category_id);
        $success = $prepared->execute();
        $all = $prepared->fetchAll();

        foreach ($all as $row) {
          $category = new Category($row['category_id'],$row['category_name']);
          $address = new Address($row['address_id'],$row['street_number'],$row['street_name'],$row['city'],$row['state'],$row['zip'],$row['geolocation']);
          $hours = new Hours($row['hours_id'],$row['hours_entry']);
          // $id, $category, $name, $address, $hours, $website
          $business = new Business($row['business_id'],$category,$row['business_name'],$address,$row['phone'],$hours,$row['website'],$row['description']);
          $this->results[]= $business->jsonSerialize();
        }
        return $this->getJSON();
    }
    
    /**
     * Get a business by id
     * @param $id
     * @return string
     */
    public function get($id)
    {
        $sql = "SELECT * FROM reuse_and_repair_db.Business
                LEFT JOIN reuse_and_repair_db.Address
                ON reuse_and_repair_db.Business.fk_address_id = reuse_and_repair_db.Address.address_id
                LEFT JOIN reuse_and_repair_db.Hours
                ON reuse_and_repair_db.Business.fk_hours_id = reuse_and_repair_db.Hours.hours_id
                LEFT JOIN reuse_and_repair_db.Category
                ON reuse_and_repair_db.Business.fk_category_id = reuse_and_repair_db.Category.category_id
                WHERE reuse_and_repair_db.Business.business_id = ?
                ORDER BY reuse_and_repair_db.Business.business_name;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $id);
        $success = $prepared->execute();
        $all = $prepared->fetchAll();

        foreach ($all as $row) {
          $category = new Category($row['category_id'],$row['category_name']);
          $address = new Address($row['address_id'],$row['street_number'],$row['street_name'],$row['city'],$row['state'],$row['zip'],$row['geolocation']);
          $hours = new Hours($row['hours_id'],$row['hours_entry']);
          // $id, $category, $name, $address, $hours, $website
          $business = new Business($row['business_id'],$category,$row['business_name'],$address,$row['phone'],$hours,$row['website'],$row['description']);
          $this->results[]= $business->jsonSerialize();
        }
        return $this->getJSON();
    }

    /**
     * @param $id
     * @return string
     */
    public function delete($id)
    {
        // Check if business exists
        if (!$this->businessExist($id))
          return ['message' => 'Business does not exist', 'status_code' => 404];
           
        $result = $this->get($id);
        $json_result = json_decode($result, true);
        $business_info = $json_result[0];
        
        // Check if business has address
        if($business_info['address']['address_id'] != null)
        {
          $handler = New AddressHandler();
          $handler->delete($business_info['address']['address_id']);
        }
        
        // Check if business has hours
        if($business_info['hours']['hours_id'] != null)
        {
          $handler = New HoursHandler();
          $handler->delete($business_info['hours']['hours_id']);
        } 
        
        // Delete business
        $sql = "DELETE FROM reuse_and_repair_db.Business
          WHERE reuse_and_repair_db.Business.business_id = ?;";
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
        // Check if business exists
        if (!$this->businessExist($object['business_id']))
          return ['message' => 'Business does not exist', 'status_code' => 404];

        $result = $this->get($object['business_id']);
        $json_result = json_decode($result, true);
        $business_info = $json_result[0];

        // Update business info in object
        if ($object['street_number'] != null)
          $business_info['address']['street_number'] = $object['street_number'];
        if ($object['street_name'] != null)
          $business_info['address']['street_name'] = $object['street_name'];
        if ($object['city'] != null)
          $business_info['address']['city'] = $object['city'];
        if ($object['state'] != null)
          $business_info['address']['state'] = $object['state'];
        if ($object['zip'] != null)
          $business_info['address']['zip'] = $object['zip'];
        if ($object['hours_entry'] != null)
          $business_info['hours']['hours_entry'] = $object['hours_entry'];
        if ($object['category_id'] != null)
          $business_info['category']['category_id'] = $object['category_id'];
        if ($object['business_name'] != null)
          $business_info['name'] = $object['business_name'];
        if ($object['phone'] != null)
          $business_info['phone'] = $object['phone'];
        if ($object['description'] != null)
          $business_info['description'] = $object['description'];
        if ($object['website'] != null)
          $business_info['website'] = $object['website'];
          
        // Update business info in object
        if ($object['street_number'] == '')
          $business_info['address']['street_number'] = null;
        if ($object['street_name'] == '')
          $business_info['address']['street_name'] = null;
        if ($object['city'] == '')
          $business_info['address']['city'] = null;
        if ($object['state'] == '')
          $business_info['address']['state'] = null;
        if ($object['zip'] == '')
          $business_info['address']['zip'] = null;
        if ($object['hours_entry'] == '')
          $business_info['hours']['hours_entry'] = null;
        if ($object['category_id'] == '')
          $business_info['category']['category_id'] = null;
        if ($object['business_name'] == '')
          $business_info['name'] = null;
        if ($object['phone'] == '')
          $business_info['phone'] = null;
        if ($object['description'] == '')
          $business_info['description'] = null;
        if ($object['website'] == '')
          $business_info['website'] = null;
            
        // Check if address table needs to be updated
        if ($object['street_number'] != null || $object['street_name'] != null || $object['city'] != null || $object['state'] != null || $object['zip'] != null)
        {
          $business_info['address']['geolocation'] = $this->getGeolocation($business_info['address']);
          
          $handler = New AddressHandler();
          // Check if table exists
          if ($business_info['address']['address_id'] == null)
          {
            // Create address entry
            $handler->add($business_info['address']);
            
            $sql = "SELECT reuse_and_repair_db.Address.address_id FROM reuse_and_repair_db.Address ORDER BY reuse_and_repair_db.Address.address_id DESC LIMIT 1;";
            $prepared = $this->db->link->prepare($sql);
            $success = $prepared->execute();      
            $all = $prepared->fetchAll();
    
            $business_info['address']['address_id'] = $all[0]['address_id'];
            
          }else{
            // Edit address entry
            $handler->update($business_info['address']);
          }
        }

        // Check if hours table needs to be updated
        if ($object['hours_entry'] != null)
        {       
          $handler = New HoursHandler();
          // Check if table exists
          if ($business_info['hours']['hours_id'] == null)
          {
            // Create hours entry
            $handler->add($business_info['hours']);
            
            $sql = "SELECT reuse_and_repair_db.Hours.hours_id FROM reuse_and_repair_db.Hours ORDER BY reuse_and_repair_db.Hours.hours_id DESC LIMIT 1;";
            $prepared = $this->db->link->prepare($sql);
            $success = $prepared->execute();      
            $all = $prepared->fetchAll();
    
            $business_info['hours']['hours_id'] = $all[0]['hours_id'];
          }else{
            // Edit hours entry
            $handler->update($business_info['hours']);
          }
        }

        // Update business
        $sql = "UPDATE reuse_and_repair_db.Business
            SET reuse_and_repair_db.Business.business_name = ?,
            reuse_and_repair_db.Business.fk_category_id = ?,
            reuse_and_repair_db.Business.phone = ?,
            reuse_and_repair_db.Business.description = ?,
            reuse_and_repair_db.Business.website = ?,
            reuse_and_repair_db.Business.fk_address_id = ?,
            reuse_and_repair_db.Business.fk_hours_id = ?
            WHERE reuse_and_repair_db.Business.business_id = ?;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $business_info['name']);
        $prepared->bindParam(2, $business_info['category']['category_id']);
        $prepared->bindParam(3, $business_info['phone']);
        $prepared->bindParam(4, $business_info['description']);
        $prepared->bindParam(5, $business_info['website']);
        $prepared->bindParam(6, $business_info['address']['address_id']);   
        $prepared->bindParam(7, $business_info['hours']['hours_id']);
        $prepared->bindParam(8, $business_info['id']);
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
        if ($object['business_name'] == null || $object['category_id'] == null)
          return ['message' => 'Invalid parameter', 'status_code' => 400];
    
        // Get geolocation
        $object['geolocation'] = $this->getGeolocation($object);
        
        $hasAddress = !($object['street_number'] == null && $object['street_name'] == null && $object['city'] == null && $object['state'] == null && $object['zip'] == null) ? true : false;
        
        $hasHours = !($object['hours_entry'] == null) ? true : false;
        
        // Add address entry
        if($hasAddress)
        {
          $handler = New AddressHandler();
          $handler->add($object);
        }
        
        // Add hours entry
        if($hasHours)
        {
          $handler = New HoursHandler();
          $handler->add($object);
        }
        
        $sql = "INSERT INTO reuse_and_repair_db.Business (fk_category_id, business_name, fk_address_id, phone, description, fk_hours_id, website)
               VALUES (?, ?, ";
        if ($hasAddress)
          $sql = $sql."(SELECT reuse_and_repair_db.Address.address_id FROM reuse_and_repair_db.Address ORDER BY reuse_and_repair_db.Address.address_id DESC LIMIT 1), ";
        else
          $sql = $sql."NULL, ";
        
        $sql = $sql."?, ?, ";
        
        if ($hasHours)
          $sql = $sql."(SELECT reuse_and_repair_db.Hours.hours_id FROM reuse_and_repair_db.Hours ORDER BY reuse_and_repair_db.Hours.hours_id DESC LIMIT 1), ";
        else
          $sql = $sql."NULL, ";
          
        $sql = $sql."?);";

        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $object['category_id']);
        $prepared->bindParam(2, $object['business_name']);
        $prepared->bindParam(3, $object['phone']);
        $prepared->bindParam(4, $object['description']);
        $prepared->bindParam(5, $object['website']);
        $success = $prepared->execute();
       
        if ($success)
            return ['message' => 'Created', 'status_code' => 201];
        else
            return ['message' => 'Fail', 'status_code' => 400];
    }
    
    /**
     * Get a businesses by category_id subcategory_id
     * @param $object
     * @return string
     */
    public function getByCategoryAndSubcategory($object)
    {
        $sql = "SELECT * FROM reuse_and_repair_db.Business
                LEFT JOIN reuse_and_repair_db.Address
                ON reuse_and_repair_db.Business.fk_address_id = reuse_and_repair_db.Address.address_id
                LEFT JOIN reuse_and_repair_db.Hours
                ON reuse_and_repair_db.Business.fk_hours_id = reuse_and_repair_db.Hours.hours_id
                INNER JOIN reuse_and_repair_db.Business_Subcategory
                ON reuse_and_repair_db.Business.business_id = reuse_and_repair_db.Business_Subcategory.fk_business_id
                INNER JOIN reuse_and_repair_db.Category
                ON reuse_and_repair_db.Business.fk_category_id = reuse_and_repair_db.Category.category_id
                WHERE reuse_and_repair_db.Business.fk_category_id = ? AND reuse_and_repair_db.Business_Subcategory.fk_subcategory_id = ?
                ORDER BY reuse_and_repair_db.Business.business_name;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $object['category_id']);
        $prepared->bindParam(2, $object['subcategory_id']);
        $success = $prepared->execute();
        $all = $prepared->fetchAll();

        foreach ($all as $row) {
          $category = new Category($row['category_id'],$row['category_name']);
          $address = new Address($row['address_id'],$row['street_number'],$row['street_name'],$row['city'],$row['state'],$row['zip'],$row['geolocation']);
          $hours = new Hours($row['hours_id'],$row['hours_entry']);
          // $id, $category, $name, $address, $hours, $website
          $business = new Business($row['business_id'],$category,$row['business_name'],$address,$row['phone'],$hours,$row['website']);
          $this->results[]= $business->jsonSerialize();
        }
        return $this->getJSON();
    } 
    
    /**
     * @return string
     */
    public function addSubcategory($object)
    {
        // Check if business exists
        if (!$this->businessExist($object['business_id']))
          return ['message' => 'Business does not exist', 'status_code' => 404];
          
        // Check if subcategory exists
        if (!$this->subcategoryExist($object['subcategory_id']))
          return ['message' => 'Subcategory does not exist', 'status_code' => 404];
                 
        // Add subcategory to business
        $sql = "INSERT INTO reuse_and_repair_db.Business_Subcategory (fk_business_id, fk_subcategory_id)
          VALUES (?, ?);";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $object['business_id']);
        $prepared->bindParam(2, $object['subcategory_id']);
        $success = $prepared->execute();

        if ($success)
          return ['message' => 'Success', 'status_code' => 200];
        else
          return ['message' => 'Fail', 'status_code' => 400];
    }
    
    /**
     * @return string
     */
    public function deleteSubcategory($object)
    {
        // Check if business exists
        if (!$this->businessExist($object['business_id']))
          return ['message' => 'Business does not exist', 'status_code' => 404];
        
        // Check if subcategory exists
        if (!$this->subcategoryExist($object['subcategory_id']))
          return ['message' => 'Subcategory does not exist', 'status_code' => 404];
            
        // Delete subcategory to business
        $sql = "DELETE FROM reuse_and_repair_db.Business_Subcategory
          WHERE reuse_and_repair_db.Business_Subcategory.fk_business_id = ? AND reuse_and_repair_db.Business_Subcategory.fk_subcategory_id = ?;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $object['business_id']);
        $prepared->bindParam(2, $object['subcategory_id']);
        $success = $prepared->execute();

        if ($success)
          return ['message' => 'Success', 'status_code' => 200];
        else
          return ['message' => 'Fail', 'status_code' => 400];
    }
    
    /**
     * @return string
     */
    public function addAllSubcategories($object)
    {
        if ($object['subcategories'] == null)
          return ['message' => 'Invalid parameter', 'status_code' => 400];
          
        // Check if business exists
        if (!$this->businessExist($object['business_id']))
          return ['message' => 'Business does not exist', 'status_code' => 404];
    
        $subcategories = explode(',', $object['subcategories']);

        // Delete all subcategories from business
        $sql = "DELETE FROM reuse_and_repair_db.Business_Subcategory
          WHERE reuse_and_repair_db.Business_Subcategory.fk_business_id = ?;";
        $prepared = $this->db->link->prepare($sql);
        $prepared->bindParam(1, $object['business_id']);
        $success = $prepared->execute();    
        
        // Add new subcategories to business
        foreach ($subcategories as $subcategory) {
          // Add subcategory to business
          $sql = "INSERT INTO reuse_and_repair_db.Business_Subcategory (fk_business_id, fk_subcategory_id)
            VALUES (?, ?);";
          $prepared = $this->db->link->prepare($sql);
          $prepared->bindParam(1, $object['business_id']);
          $prepared->bindParam(2, $subcategory);
          $success = $prepared->execute();        
        }
   
        if ($success)
          return ['message' => 'Success', 'status_code' => 200];
        else
          return ['message' => 'Fail', 'status_code' => 400];
    }
}