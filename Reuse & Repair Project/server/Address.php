<?php

/**
 * Created by PhpStorm.
 * User: kaylafitzsimmons
 * Date: 2/10/16
 * Time: 10:39 AM
 * @property  address_id
 */
class Address implements JsonSerializable
{

    private $address_id;
    private $street_number;
    private $street_name;
    private $city;
    private $state;
    private $zip;
    private $geolocation;


    /**
     * Address constructor.
     * @param $address_id
     * @param $street_number
     * @param $street_name
     * @param $city
     * @param $state
     * @param $zip
     * @param $geolocation
     */
    public function __construct($address_id, $street_number, $street_name, $city, $state, $zip, $geolocation)
    {
        $this->address_id = $address_id;
        $this->street_number = $street_number;
        $this->street_name = $street_name;
        $this->city = $city;
        $this->state = $state;
        $this->zip = $zip;
        $this->geolocation = $geolocation;
    }

    public function jsonSerialize()
    {
        return [
            'address_id' => $this->address_id,
            'street_number' => $this->street_number,
            'street_name' => $this->street_name,
            'city' => $this->city,
            'state' => $this->state,
            'zip' => $this->zip,
            'geolocation' => $this->geolocation
        ];
    }
    /**
     * @return mixed
     */
    public function getAddressId()
    {
        return $this->address_id;
    }

    /**
     * @param mixed $address_id
     */
    public function setAddressId($address_id)
    {
        $this->address_id = $address_id;
    }

    /**
     * @return mixed
     */
    public function getStreetNumber()
    {
        return $this->street_number;
    }

    /**
     * @param mixed $street_number
     */
    public function setStreetNumber($street_number)
    {
        $this->street_number = $street_number;
    }

    /**
     * @return mixed
     */
    public function getStreetName()
    {
        return $this->street_name;
    }

    /**
     * @param mixed $street_name
     */
    public function setStreetName($street_name)
    {
        $this->street_name = $street_name;
    }

    /**
     * @return mixed
     */
    public function getCity()
    {
        return $this->city;
    }

    /**
     * @param mixed $city
     */
    public function setCity($city)
    {
        $this->city = $city;
    }
    /**
     * @return mixed
     */
    public function getState()
    {
        return $this->state;
    }

    /**
     * @param mixed $state
     */
    public function setState($state)
    {
        $this->state = $state;
    }
    /**
     * @return mixed
     */
    public function getZip()
    {
        return $this->zip;
    }

    /**
     * @param mixed $zip
     */
    public function setZip($zip)
    {
        $this->zip = $zip;
    }

    /**
     * @return mixed
     */
    public function getGeolocation()
    {
        return $this->geolocation;
    }

    /**
     * @param mixed $geolocation
     */
    public function setGeolocation($geolocation)
    {
        $this->geolocation = $geolocation;
    }


}