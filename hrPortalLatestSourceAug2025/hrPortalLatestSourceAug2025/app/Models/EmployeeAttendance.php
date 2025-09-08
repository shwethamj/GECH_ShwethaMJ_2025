<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class EmployeeAttendance extends Model
{
    use HasFactory;
    use SoftDeletes;


    protected $fillable = [
        'employee_id','checkin','checkout','status','checkout_status'
    ];

    public function employee(){
        return $this->belongsTo(Employee::class);
    }
}
