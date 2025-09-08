<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Attendance;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

use Illuminate\Support\Facades\Response;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\AttendanceExport;
use App\Exports\AllAttendanceExport;
use View;

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;



class EmpAttendanceController extends Controller
{
    public function punchClock(Request $request)
    {
        $user = Auth::user();
        $attendance = Attendance::where('user_id', $user->id)
            ->whereDate('attendance_date', today())
            ->first();

        if (!$attendance) {
            $attendance = new Attendance;
            $attendance->user_id = $user->id;
            $attendance->attendance_date = today();
        }

        if (!$attendance->checkin_time) {
            $attendance->checkin_time = Carbon::now();
            $attendance->save();

            // Update checkin status
            $checkin_time = strtotime($attendance->checkin_time);
            $checkin_time = date('H:i', $checkin_time);

            if ($checkin_time < '09:00') {
                $attendance->checkin_status = 'Early';
            } elseif ($checkin_time >= '09:00' && $checkin_time <= '09:30') {
                $attendance->checkin_status = 'On Time';
            } elseif ($checkin_time > '09:30' && $checkin_time <= '09:35') {
                $attendance->checkin_status = 'Bit Late';
            } else {
                $attendance->checkin_status = 'Late';
            }

            $attendance->save();

            return response()->json([
                'success' => true,
                'message' => 'Check-in time recorded.',
                'checkin_time' => $attendance->checkin_time->toDateTimeString(),
                'checkout_time' => null,
            ]);
        } elseif (!$attendance->checkout_time) {
            $attendance->checkout_time = Carbon::now();
            $attendance->save();

            // Update checkout status
            $checkout_time = strtotime($attendance->checkout_time);
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

            $attendance->save();

            return response()->json([
                'success' => true,
                'message' => 'Check-out time recorded.',
                'checkin_time' => null,
                // 'checkout_time' => $attendance->checkout_time ? $attendance->checkout_time->format('H:i') : 'N/A',
                'checkout_time' => $attendance->checkout_time->toDateTimeString(),
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Attendance already checked out.',
                'checkin_time' => null,
                'checkout_time' => null,
            ]);
        }
    }
    public function index()
    {
        $user = Auth::user();
        $attendances = Attendance::where('user_id', $user->id)
            ->whereYear('attendance_date', now()->year)
            ->whereMonth('attendance_date', now()->month)
            ->get();

        foreach ($attendances as $attendance) {
            $attendance['attendance_date'] = Carbon::parse($attendance['attendance_date'])->format('Y-m-d');
            $attendance['checkin_time'] = $attendance->checkin_time ? Carbon::parse($attendance->checkin_time)->format('h:i A') : 'N/A';
            $attendance['checkout_time'] = $attendance->checkout_time ? Carbon::parse($attendance->checkout_time)->format('h:i A') : '-';
        }

        return view('backend.employee-attendance', compact('attendances'));
    }
    public function getCalendarData(Request $request)
    {
        $user_id = $request->get('user_id');
        $data = [];

        // Fetch the data for the selected user
        // Modify the query to fetch data based on your requirements
        $attendances = Attendance::where('user_id', $user_id)
            ->whereYear('attendance_date', now()->year)
            ->whereMonth('attendance_date', now()->month)
            ->get();

        foreach ($attendances as $attendance) {
            $attendance_date = Carbon::parse($attendance['attendance_date'])->format('Y-m-d');
            $data[$attendance_date] = [
                'checkin_time' => $attendance->checkin_time ? Carbon::parse($attendance->checkin_time)->format('h:i A') : 'N/A',
                'checkout_time' => $attendance->checkout_time ? Carbon::parse($attendance->checkout_time)->format('h:i A') : '-'
            ];
        }

        return response()->json(['data' => $data]);
    }

    public function exportAttendance(Request $request)
    {
        $user_id = $request->input('user_id');
        $year = $request->input('year');
        $month = $request->input('month');

        // Fetch the attendance data for the selected user, year, and month.
        $attendances = Attendance::where('user_id', $user_id)
            ->whereYear('attendance_date', $year)
            ->whereMonth('attendance_date', $month)
            ->get();

        // Create an array to store the attendance data in the desired format for Excel export.
        $attendanceData = [];

        foreach ($attendances as $attendance) {
            $attendance_date = Carbon::parse($attendance['attendance_date'])->format('Y-m-d');
            $attendanceData[] = [
                'Date' => $attendance_date,
                'Checkin Time' => $attendance->checkin_time ? Carbon::parse($attendance->checkin_time)->format('h:i A') : 'N/A',
                'Checkout Time' => $attendance->checkout_time ? Carbon::parse($attendance->checkout_time)->format('h:i A') : '-',
            ];
        }

        // Get the user's username based on the user_id.
        $user = User::find($user_id);
        $username = $user->username;

        // Define the filename.
        $filename = "{$username}_Attendance_" . Carbon::create($year, $month)->format('M-Y') . ".xlsx";

        // Create an Excel export using Maatwebsite Excel and set the filename.
        return Excel::download(new AttendanceExport($attendanceData), $filename);
    }

    // public function exportAllAttendance(Request $request)
    // {
    //     $year = $request->input('year');
    //     $month = $request->input('month');

    //     // Fetch attendance data for all users for the selected year and month.
    //     $users = User::all(); // Fetch all users (you may need to adjust this query)

    //     // Create an array to store the attendance data for all users in the desired format for Excel export.
    //     $attendanceData = [];

    //     // Populate $attendanceData with data for all users.

    //     // Get unique dates for the selected month.
    //     $dates = Attendance::whereYear('attendance_date', $year)
    //         ->whereMonth('attendance_date', $month)
    //         ->pluck('attendance_date')
    //         ->unique()
    //         ->map(function ($date) {
    //             return \Carbon\Carbon::parse($date)->format('d-m-Y');
    //         });

    //         \Log::info('Users: ' . json_encode($users));
    //         \Log::info('Attendance Data: ' . json_encode($attendanceData));
    //         \Log::info('Dates: ' . json_encode($dates));

    //     $filename = "Attendance_" . Carbon::create($year, $month)->format('M-Y') . ".xlsx";
    //     // Create an Excel export using Maatwebsite Excel and set the filename.
    //     // return Excel::download(new AllAttendanceExport($attendanceData, $dates), $filename);
    //     return view('exports.all_attendance', [
    //         'attendanceData' => $attendanceData,
    //         'dates' => $dates, // Add this line to pass $dates
    //     ]);
    // }

    public function exportAllAttendance(Request $request)
    {
        $year = $request->input('year');
        $month = $request->input('month');

        // Fetch all users.
        $users = User::all();

        // Create an array to store the attendance data for all users in the desired format for Excel export.
        $attendanceData = [];

        // Loop through all users and fetch their attendance data.
        foreach ($users as $user) {
            $user_id = $user->id;
            
            // Fetch the attendance data for the user, year, and month.
            $attendances = Attendance::where('user_id', $user_id)
                ->whereYear('attendance_date', $year)
                ->whereMonth('attendance_date', $month)
                ->get();

            // Create an array to store the attendance data for this user.
            $userData = [];

            // Populate the attendance data for this user.
            foreach ($attendances as $attendance) {
                $attendance_date = Carbon::parse($attendance['attendance_date'])->format('Y-m-d');
                $userData[$attendance_date] = [
                    'Checkin Time' => $attendance->checkin_time ? Carbon::parse($attendance->checkin_time)->format('h:i A') : 'N/A',
                    'Checkout Time' => $attendance->checkout_time ? Carbon::parse($attendance->checkout_time)->format('h:i A') : '-',
                ];
            }

            // Add this user's attendance data to the main array.
            $attendanceData[$user->username] = $userData;
        }

        // Get unique dates for the selected month with 'Y-m-d' format.
        $dates = Attendance::whereYear('attendance_date', $year)
        ->whereMonth('attendance_date', $month)
        ->pluck('attendance_date')
        ->unique()
        ->map(function ($date) {
            return \Carbon\Carbon::parse($date)->format('Y-m-d'); // Use 'Y-m-d' format here
        });


        // Debugging: Log the data before passing it to the view.
        // \Log::info('Users: ' . json_encode($users));
        // \Log::info('Attendance Data: ' . json_encode($attendanceData));
        // \Log::info('Dates: ' . json_encode($dates));

        // dd($attendanceData);
        
        $filename = "Exmployee-Attendance_" . Carbon::create($year, $month)->format('M-Y') . ".xlsx";
        
        // Debugging: Display the Blade template without Excel export.
        return Excel::download(new AllAttendanceExport($attendanceData, $dates), $filename);
        // return view('exports.all_attendance', [
        //     'attendanceData' => $attendanceData,
        //     'dates' => $dates, // Add this line to pass $dates
        // ]);
    }
}
