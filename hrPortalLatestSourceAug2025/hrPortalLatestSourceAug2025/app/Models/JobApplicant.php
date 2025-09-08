<?php

namespace App\Models;

use App\Models\Job;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class JobApplicant extends Model
{
     use HasFactory,SoftDeletes;
    
    protected $fillable = [
        'name','email','cv','message'
    ];

    public function Job(){
        return $this->belongsTo(Job::class);
    }

   
}
