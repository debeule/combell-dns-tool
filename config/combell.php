<?php

return [
    'api' => [
        'key' => env('COMBELL_API_KEY'),
        'secret' => env('COMBELL_API_SECRET'),
        'recordsUrl' => 'v2/dns/nxtmediatech.eu/records/',
        'usersUrl' => '/v2/accounts/',
        'ttl' => 3600,
        'baseUri' => 'https://api.combell.com',
        'domain' => 'nxtmediatech.eu',
    ],

    'servicepacks' => [
        'kdgStudent' => '14491',
        'webNinja' => '34146',
    ],

    'admins' => [
            'sam.serrien',
            
    ],

    'validation' => [
        'regexRecordName' => '/^([a-zA-Z0-9][a-zA-Z0-9-_]*\.)*[a-zA-Z0-9]*[a-zA-Z0-9-_]*[[a-zA-Z0-9]+$/',
        'regexCnameDestination' => '/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/',
        'recordTypes' => 'A,CNAME,TXT',
    ]
];