<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Attendance extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'attendances';

    protected $fillable = ['user_id','checkin_time','checkout_time','checkin_status','checkout_status','attendance_date'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}

