<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Builder;

use App\Models\User;

class Record extends Model
{
    use HasFactory;

    public function buildRecord(array $data, User $user): Record
    {
        $this->record_id = $data['recordId'] == null ? $data['recordId'] : $data['recordId'];
        $this->type = $data['recordType'];
        $this->record_name = $data['recordName'];
        $this->content = $data['recordType'] == 'A' ? $user->userCombellIp : $data['content'];
        $this->user_id = $user->id;

        return $this;
    }

    public function scopeGetRecordByRecordId(Builder $query, string $recordId): Builder
    {
        return $query->where('record_id', $recordId);
    }

    public function Pending(string $recordId): Record
    {
        $this->is_pending = true;
        return $this;
    }

    public function NotPending(string $recordId): Record
    {
        $this->is_pending = false;
        return $this;
    }

    public function scopeGetUserRecords($query, string $userId)
    {
        return $query->where('user_id', $userId);
    }

    public function scopeRecordExists($query, string $recordName, string $content = null)
    {
        return $query->where('record_name', $recordName)
        ->where('user_id', Auth::User()->id)
        ->where('content', $content);
    }
}
