<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class EmployeeDetail extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = ['uuid','user_id','firstname','lastname','gender','joining_date','email','phone','company','department_id','designation_id','avatar','role'];

    public function department()
    {
        return $this->belongsTo(Department::class);
    }

    public function designation()
    {
        return $this->belongsTo(Designation::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    
    public function role()
    {
        return $this->belongsTo(Role::class, 'role', 'id');
    }

    public function scopeByUserId($query, $user_id)
    {
        return $query->where('user_id', $user_id)->first();
    }

    public static function byUserId($user_id)
    {
        return self::where('user_id', $user_id)->first();
    }
}