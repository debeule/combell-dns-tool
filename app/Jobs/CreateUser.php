<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use romanzipp\QueueMonitor\Traits\IsMonitored;

use App\Helpers\CombellApi\Helper;
use App\Helpers\CombellApi\Tasks;
use App\Models\User;

class CreateUser implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels, IsMonitored;

    public function __construct(
        private array $data)
    {}
    
    public function handle()
    {
        $Tasks = new Tasks(data: $this->data);
        
        $Tasks->CreateUser();
        
        $user = new User;
        $user->BuildUser(data: $this->data);
        
        return $user->save();
    }
}
