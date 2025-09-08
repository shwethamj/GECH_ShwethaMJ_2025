<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Ticket extends Model
{
    use HasFactory;
    use SoftDeletes;
    

    protected $fillable = [
        'subject','uuid','employee_id',
        'client_id','priority','cc','followers',
        'files','description','status'
    ];

    protected $casts = [
        'followers' => 'array',
        'files' => 'array',
    ];

    public function employee(){
        // return $this->belongsTo(Employee::class);
        return $this->belongsTo(EmployeeDetail::class);
    }

    public function client(){
        return $this->belongsTo(Client::class);
    }
}
