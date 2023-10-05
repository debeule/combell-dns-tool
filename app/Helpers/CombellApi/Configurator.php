<?php

namespace App\Helpers\CombellApi;

use Illuminate\Support\Facades\Config;
use Illuminate\Support\Str;
use App\Helpers\CombellApi\ConfiguratorOptions;

class Configurator extends configuratorOptions
{
    public function configureRequest()
    {
        return [
            'method' => in_array($this->method, ['getAll', 'getOne']) ? 'get' : $this->method,
            'url' => $this->configureRequestUrl(),
            'type' => $this->configureRequestType(),
            'options' => $this->configureRequestOptions(),
        ];
    }

    public function configureRequestUrl()
    {
        $recordId = $this->method == 'delete' ? $this->data['recordId'] : '';

        return config('combell.api.' . $this->endPoint . 'Url') . $recordId;
    }

    public function configureRequestType(): string
    {
        return str_contains($this->method, 'get') ? 'query' : 'json'; 
    }
    
    public function configureRequestOptions(): array
    {
        $functionName = in_array($this->method, ['get', 'post'])
        ? Str::camel($this->endPoint . '_' . $this->method)
        : $this->method;
        
        return $this->$functionName();
    }
            
    public function retrieveClient()
    {
        return new \Combell\Client([
            'debug' => config('app.debug') ? fopen('php://stderr', 'w') : 'false',
            'base_uri' => config('combell.api.baseUri'),
            'combell_api_key' => config('combell.api.key'),
            'combell_api_secret' => config('combell.api.secret'),
        ]);
    }
}
