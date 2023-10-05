<?php

namespace App\Helpers\CombellApi;

use App\Models\User;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Str;
use App\Helpers\CombellApi\Configurator;

class Execute extends Configurator
{
    public function __construct(
        protected string $method,
        protected array $data = [],
        protected User $user = new User,
        protected string $endPoint = 'records')
    {}

    public function executeRequest()
    { 
        $config = $this->configureRequest();
        
        $method = $config['method'];
        
        return $this->retrieveCLient()->$method($config['url'], [$config['type'] => $config['options']]);
    }
}