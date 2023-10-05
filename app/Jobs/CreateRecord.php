<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use romanzipp\QueueMonitor\Traits\IsMonitored;

use App\Helpers\CombellApi\Helper;
use App\Helpers\CombellApi\Tasks;
use App\Models\Record;
use App\Models\User;
use App\Traits\DecodeJsonFile;

class CreateRecord implements ShouldQueue, shouldBeUnique
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels, IsMonitored;
    
    use decodeJsonFile;

    public function __construct(
        private array $data,
        private User $user)
    {}
    
    public function uniqueId(): string
    {
        $user = $this->user;
        
        return $user->id . $this->data['recordName'];
    }

    public function handle()
    {
        $data = $this->data;
        $user = $this->user;        
    
        $Tasks = new Tasks(data: $data, user: $user);

        $Tasks->CreateRecord();

        
        $combellRecord = $Tasks->getRecord();
        $recordId = $this->extractRecordId(jsonInput: $combellRecord);
        $data['recordId'] = $recordId;

        $record = new Record;
        $record->buildRecord(data: $data, user: $user);
        
        return $record->save();
    }
}