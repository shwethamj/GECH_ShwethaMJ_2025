<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProvidentFund extends Model
{
    use HasFactory;
     use SoftDeletes;

    protected $fillable = [
        'employee_id','type',
        'employee_share_amount',
        'org_share_amount','employee_share_percent',
        'org_share_percent','description','salary',
    ];

    public function employee(){
        return $this->belongsTo(Employee::class);
    }
}
