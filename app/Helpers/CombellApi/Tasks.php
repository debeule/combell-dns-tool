<?php

namespace App\Helpers\CombellApi;

use App\Helpers\CombellApi\Execute;
use App\Models\User;

class Tasks 
{
    public function __construct(
        private array $data = [],
        private User $user = new User)
    {}

    public function GetRecord()
    {
        $execute = new Execute(
            method: 'getOne',
            data: $this->data,
            user: $this->user
        );

        return $execute->executeRequest();
    }

    public function GetAllRecords()
    {
        $execute = new Execute(
            method: 'getAll',
            data: $this->data,
            user: $this->user
        );
        return $execute->executeRequest();
    }

    public function CreateRecord()
    {
        $execute = new Execute(
            method: 'post', 
            data: $this->data, 
            user: $this->user
        );
        
        return $execute->executeRequest();
    }

    public function DeleteRecord()
    {
        $execute = new Execute(
            method: 'delete',
            data: $this->data,
            user: $this->user
        );

        return $execute->executeRequest();
    }

    public function GetAllUsers()
    {
        $execute = new Execute(
            method: 'getAll',
            data: $this->data,
            user: $this->user,
            endPoint: 'users'
        );

        return $execute->executeRequest();
    }

    public function CreateUser()
    {
        $execute = new Execute(
            method: 'post',
            data: $this->data,
            endPoint: 'users'
        );

        return $execute->executeRequest();
    }
}