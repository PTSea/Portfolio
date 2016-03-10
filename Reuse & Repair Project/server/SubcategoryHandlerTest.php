<?php

/**
 * Created by PhpStorm.
 * User: kaylafitzsimmons
 * Date: 2/9/16
 * Time: 11:28 AM
 */
class CategoryHandlerTest extends PHPUnit_Framework_TestCase
{


    function testGetAllCategories(){
        $handler = new CategoryHandler();
        $db = new Database();
        $sql =  "SELECT * FROM Category";

        // this is a logic error
        foreach ($db->query($sql) as $row) {
            $idx=0;
            $this->assertEquals($row['id'],$handler->results[$idx]['id']);
            $this->assertEquals($row['category_name'],$handler->results[$idx]['category_name']);
            $idx++;
        }

    }

}
