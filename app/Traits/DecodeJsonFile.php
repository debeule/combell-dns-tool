<?php

namespace App\Traits;

trait DecodeJsonFile
{
    public static function DecodeJsonFile($jsonInput)
    {
        return json_decode($jsonInput->getBody()->getContents(), true);
    }

    public static function extractIp($jsonInput)
    {
        return json_decode($jsonInput->getBody()->getContents(), true)['content'];
    }

    public
     function extractRecordId($jsonInput)
    {
        return json_decode($jsonInput->getBody()->getContents(), true)[0]['id'];
    }
}