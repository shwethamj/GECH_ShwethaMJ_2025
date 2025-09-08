<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class ClientMeeting extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'client_meetings';

    protected $fillable = [
        'agenda', 'date', 'client_name', 'project_name', 'project_type', 'status',
        'attendees', 'referred_by', 'action_on_team', 'action_on_santhosh', 'employee_detail_id'
    ];

    public function employeeDetail()
    {
        return $this->belongsTo(EmployeeDetail::class);
    }
}
