<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Models\EmployeeAttendance;
use App\Http\Controllers\Controller;
use App\Settings\AttendanceSettings;
use App\Notifications\NewCheckinNotification;
use Illuminate\Validation\Rule;
use Carbon\Carbon;

class EmployeeAttendanceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $title = 'Employee Attendance';
        $attendances = EmployeeAttendance::latest()->get();
        foreach ($attendances as $attendance) {
            $checkin = strtotime($attendance->checkin);
            $checkin_time = date('H:i', $checkin);

            if ($checkin_time < '09:00') {
                $attendance->checkin_status = 'Early';
            } elseif ($checkin_time >= '09:00' && $checkin_time <= '09:35') {
                $attendance->checkin_status = 'On Time';
            } elseif ($checkin_time > '09:35' && $checkin_time <= '09:45') {
                $attendance->checkin_status = 'Bit Late';
            } else {
                $attendance->checkin_status = 'Late';
            }

            if ($attendance->checkout) {
                $checkout_time = strtotime($attendance->checkout);
                $checkout_time = date('H:i', $checkout_time);

                if ($checkout_time < '13:30') {
                    $attendance->checkout_status = 'Half Day';
                } elseif ($checkout_time < '18:30') {
                    $attendance->checkout_status = 'Early';
                } elseif ($checkout_time < '18:45') {
                    $attendance->checkout_status = 'On Time';
                } else {
                    $attendance->checkout_status = 'Over Time';
                }
            }
        }
        return view('backend.attendance', compact(
            'title', 'attendances'
        ));
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'employee' => 'required',
            'checkin' => 'required',
        ]);
        $settings = new AttendanceSettings();
        $checkin = strtotime($request->checkin);
        $checkin_time = date('H:i', $checkin);

        if($checkin_time < "09:00"){
            $checkin_status = "Early";
        } elseif ($checkin_time >= "09:00" && $checkin_time <= "09:35") {
            $checkin_status = "On Time";
        } elseif ($checkin_time > "09:35" && $checkin_time <= "09:45") {
            $checkin_status = "Bit Late";
        } else {
            $checkin_status = "Late";
        }

        if ($request->checkout) {
            $checkout_time = date("H:i:s", strtotime($request->checkout));

            if ($checkout_time < '13:30:00') {
                $checkout_status = 'Half Day';
            } elseif ($checkout_time < '18:30:00') {
                $checkout_status = 'Early';
            } elseif ($checkout_time < '18:45:00') {
                $checkout_status = 'On Time';
            } else {
                $checkout_status = 'Over Time';
            }
        } else {
            $checkout_status = null;
        }
        EmployeeAttendance::create([
            'employee_id' => $request->employee,
            'checkin' => $request->checkin,
            'checkout' => $request->checkout,
            'status' => $checkin_status,
            'checkout_status' => $checkout_status,
        ]);
    
        $notification = notify('employee attendance has been created');
        return back()->with($notification);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * 
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $this->validate($request,[
            'employee' => 'required',
            // 'checkin' => 'required',
        ]);
        $settings = new AttendanceSettings();
        $checkin = strtotime($request->checkin);
        $checkin_time = date('H:i', $checkin);

        if($checkin_time < "09:00"){
            $checkin_status = "Early";
        } elseif ($checkin_time >= "09:00" && $checkin_time <= "09:35") {
            $checkin_status = "On Time";
        } elseif ($checkin_time > "09:35" && $checkin_time <= "09:45") {
            $checkin_status = "Bit Late";
        } else {
            $checkin_status = "Late";
        }

        if ($request->checkout) {
            $checkout_time = date("H:i:s", strtotime($request->checkout));

            if ($checkout_time < '13:30:00') {
                $checkout_status = 'Half Day';
            } elseif ($checkout_time < '18:30:00') {
                $checkout_status = 'Early';
            } elseif ($checkout_time < '18:45:00') {
                $checkout_status = 'On Time';
            } else {
                $checkout_status = 'Over Time';
            }
        } else {
            $checkout_status = null;
        }
        
        $attendance = EmployeeAttendance::findOrFail($request->id);
        $attendance->update([
            'employee_id' => $request->employee,
            'checkin' => $request->checkin,
            'checkout' => $request->checkout,
            'status' => $checkin_status,
            'checkout_status' => $checkout_status,
        ]);
        $notification = notify('employee attendance has been updated');
        return back()->with($notification);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        EmployeeAttendance::findOrFail($request->id)->delete();
        $notification = notify('employee attendance has been deleted');
        return back()->with($notification);
    }
}