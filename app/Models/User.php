<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Laravel\Jetstream\HasProfilePhoto;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Support\Facades\Auth;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    use HasApiTokens;
    use HasFactory;
    use HasRoles;

    protected $fillable = [
        'name',
        'email',
        'user_domain',
        'user_combell_ip',
        'oauth_id',
    ];

    public function records() 
    {
        return $this->hasMany(Record::class, 'user_id');
    }
    
    public function getIp(): string
    {
        $options = $this->configureRequest(method:'get', user: $this);
        
        $record = $this->executeRequest(method: 'get', options: $options);
        
        return $this->extractIp($record);
    }

    public function buildUser(array $data): User
    {
        $userDomainArray = explode('.', $data['userDomain']);

        $this->first_name = $userDomainArray[0];
        $this->last_name = $userDomainArray[1];
        $this->email = $userDomainArray[0] . '.' . $userDomainArray[1] . '@student.kdg.be';
        $this->user_domain = $data['userDomain'];

        return $this;
    }
}
