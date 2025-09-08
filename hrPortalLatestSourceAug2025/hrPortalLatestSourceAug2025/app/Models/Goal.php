<?php

namespace App\Models;

use App\Models\GoalType;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;


class Goal extends Model
{
    use HasFactory;
     use SoftDeletes;

    protected $fillable = [
        'goal_type_id','subject','target',
        'start_date','end_date','description','status','progress','priority','applied_to',
    ];

    public function goal_type(){
        return $this->belongsTo(GoalType::class);
    }
}
