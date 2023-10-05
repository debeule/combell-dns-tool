<?php

namespace App\Helpers\CombellApi;

use App\Models\User;
use Illuminate\Support\Facades\Config;

class ConfiguratorOptions
{
    public function getAll(): array
    {
        return [
            'take' => '99999',
        ];
    }

    public function getOne(): array
    {
        return [
            'record_name' => $this->data['recordName'] . '.' . $this->user->user_domain,
            'take' => '1',
        ];
    }

    public function recordsPost(): array
    {
        return [
            'type' => $this->data['recordType'],
            'record_name' => $this->data['recordName'] . '.' . $this->user->user_domain,
            'content' => $this->data['recordType'] == 'A' ? $this->user->user_combell_ip : $this->data['content'],
            'ttl' => config('combell.api.ttl'),
        ];
    }
    
    public function recordsGetOne(): array
    {
        return [
            'record_name' => $this->data['recordName'] . '.' . $this->user->user_domain,
            'take' => '1',
            ];
    }

    public function usersPost(): array
    {
        return [
            'identifier' => $this->data['userDomain'] . '.' . config('combell.api.domain'),
            'servicepack_id' => intval($this->data['servicePack']),
            'ftp_password' => '123456abcdefg',
        ];
    }

    public function delete(): array
    {
        return [];
    }
}