<?php
    require Database.php;
/**
 * Created by PhpStorm.
 * User: kaylafitzsimmons
 * Date: 2/9/16
 * Time: 10:58 AM
 */
class DatabaseTest extends PHPUnit_Framework_TestCase
{
    public function testConnection(){
        $db = new Database();

        $this->assertNotEquals(NULL, $db->link);
    }
}
