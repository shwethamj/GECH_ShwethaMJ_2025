<?php

namespace App\Models;

use App\Models\Department;
use App\Models\Designation;
use Illuminate\Database\Eloquent\Model;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;


class Employee extends Model
{
    use HasFactory;

    protected $fillable = [
        'firstname','lastname','uuid',
        'email','phone',
        'department_id','designation_id','company','avatar','join_date',
    ];


    public function department(){
        return $this->belongsTo(Department::class);
    }

    public function designation(){
        return $this->belongsTo(Designation::class);
    }

    use SoftDeletes;

    protected $dates = ['deleted_at'];
    
}

