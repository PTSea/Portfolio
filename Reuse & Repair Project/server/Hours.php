<?php

/**
 * Created by PhpStorm.
 * User: kaylafitzsimmons
 * Date: 2/10/16
 * Time: 10:39 AM
 * @property  hours_id
 */
class Hours implements JsonSerializable
{

    private $hours_id;
    private $hours_entry;


    /**
     * Hours constructor.
     * @param $hours_id
     * @param $hours_entry
     */
    public function __construct($hours_id, $hours_entry)
    {
        $this->hours_id = $hours_id;
        $this->hours_entry = $hours_entry;
    }

    public function jsonSerialize()
    {
        return [
            'hours_id' => $this->hours_id,
            'hours_entry' => $this->hours_entry
        ];
    }
    /**
     * @return mixed
     */
    public function getHoursId()
    {
        return $this->hours_id;
    }

    /**
     * @param mixed $hours_id
     */
    public function setHoursId($hours_id)
    {
        $this->hours_id = $hours_id;
    }

    /**
     * @return mixed
     */
    public function getHoursEntry()
    {
        return $this->hours_entry;
    }

    /**
     * @param mixed $hours_entry
     */
    public function setHoursEntry($hours_entry)
    {
        $this->hours_entry = $hours_entry;
    }


}