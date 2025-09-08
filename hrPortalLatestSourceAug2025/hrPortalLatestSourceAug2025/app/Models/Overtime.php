<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Overtime extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'employee_id','overtime_date','hours','description',
    ];

    public function employee(){
        return $this->belongsTo(Employee::class);
    }
}
