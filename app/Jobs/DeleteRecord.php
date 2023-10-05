<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use romanzipp\QueueMonitor\Traits\IsMonitored;

use App\Helpers\CombellApi\Tasks;
use App\Models\User;
use App\Models\Record;



class DeleteRecord implements ShouldQueue, shouldBeUnique
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels, IsMonitored;

    public function __construct(
        private array $data,
        private User $user)
    {}

    
    public function uniqueId(): string
    {
        $user = $this->user;
        $data = $this->data;
        
        return $data['recordId'];
    }

    public function handle()
    {
        $data = $this->data;
        $user = $this->user;

        $record = Record::GetRecordByRecordId($data['recordId'])->first();
        $record->Pending(recordId: $data['recordId'])->save();
        
        try 
        {
            $Tasks = new Tasks(data: $data, user: $user);
                
            $Tasks->DeleteRecord();
            
            $record = Record::GetRecordByRecordId(recordId: $data['recordId'])->get()[0];
            
            return $record->delete();
        } 
        catch (\Throwable $th) 
        {
            $record = Record::GetRecordByRecordId($data['recordId'])->first();
            $record->NotPending(recordId: $data['recordId']);
            
            return $record->save();
        }
    }
}