<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class EmployeeAdditionalDetail extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'employee_additional_details';

    protected $fillable = ['dob','blood_group','residential_address','permanent_address','aadhaar_no','nationality','religion','marital_status','user_id','emp_id','primary_contact','secondary_contact',];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    
    public function employeeDetail()
    {
        return $this->belongsTo(EmployeeDetail::class, 'emp_id', 'uuid');
    }
}