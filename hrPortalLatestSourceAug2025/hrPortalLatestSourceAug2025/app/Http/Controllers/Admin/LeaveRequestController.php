<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\LeaveRequest;
use Carbon\Carbon;
use App\Models\LeaveType;
use App\Models\Holiday;
use App\Models\Attendance;
use Illuminate\Support\Facades\Log;


class LeaveRequestController extends Controller
{
    //Working copy of method 
    // public function store(Request $request)
    // {
    //     // validate the request data
    //     $validatedData = $request->validate([
    //         'leave_type' => 'required',
    //         // 'from_date' => 'required|date',
    //         'to_date' => 'required|date',
    //         'reason' => 'required',
    //         // add any other validation rules as needed
    //     ]);

    //     // get the leave type
    //     $leaveType = LeaveType::find($request->input('leave_type'));

    //     // get the user's existing leave request for the same leave type, if any
    //     $existingLeaveRequest = LeaveRequest::where('user_id', auth()->user()->id)
    //         ->where('leave_type_id', $request->input('leave_type'))
    //         ->whereIn('status', ['approved', 'pending'])
    //         ->orderBy('created_at', 'desc')
    //         ->first();

    //     // calculate the number of days requested
    //     $fromDate = Carbon::createFromFormat('Y-m-d', $request->input('clicked_date'));
    //     $toDate = Carbon::createFromFormat('Y-m-d', $request->input('to_date'))->addDays(1); // Add 1 day to the to date
    //     $noOfDays = $toDate->diffInDays($fromDate);

    //     // calculate the leaves left based on the existing leave request, if any
    //     $leavesLeft = $leaveType->days - $noOfDays;
    //     if ($existingLeaveRequest) {
    //         $leavesLeft = $existingLeaveRequest->leaves_left - $noOfDays;
    //     }
    //     if ($leavesLeft < 0) {
    //         $leavesLeft = 0;
    //     }        
    //     // create a new LeaveRequest model instance
    //     $leaveRequest = new LeaveRequest();
    //     $leaveRequest->user_id = auth()->user()->id; // set the user ID from the authenticated user
    //     $leaveRequest->leave_type_id = $request->input('leave_type');
    //     $leaveRequest->from_date = $request->input('clicked_date');
    //     $leaveRequest->to_date = $request->input('to_date');
    //     $leaveRequest->reason = $request->input('reason');
    //     $leaveRequest->leaves_left = $leavesLeft;
    //     $leaveRequest->status = 'pending';
    //     $leaveRequest->no_of_days = $noOfDays;
    //     $leaveRequest->save();

    //     // redirect to the desired view with a success message
    //     // return view('backend.emp-leave')->with('success', 'Leave request submitted successfully.');
    //     return redirect()->route('leave-request.success')->with('success', 'Leave request submitted successfully.');
    // }
    // public function store(Request $request)
    // {
    //     // validate the request data
    //     $validatedData = $request->validate([
    //         'leave_type' => 'required',
    //         'to_date' => 'required|date',
    //         'reason' => 'required',
    //         // add any other validation rules as needed
    //     ]);

    //     // get the leave type
    //     $leaveType = LeaveType::find($request->input('leave_type'));

    //     // get the user's existing leave request for the same leave type, if any
    //     $existingLeaveRequest = LeaveRequest::where('user_id', auth()->user()->id)
    //         ->where('leave_type_id', $request->input('leave_type'))
    //         ->whereIn('status', ['approved', 'pending'])
    //         ->orderBy('created_at', 'desc')
    //         ->first();

    //     // calculate the number of days requested
    //     $fromDate = Carbon::createFromFormat('Y-m-d', $request->input('clicked_date'));
    //     $toDate = Carbon::createFromFormat('Y-m-d', $request->input('to_date'))->addDays(1); // Add 1 day to the to date
    //     $noOfDays = $toDate->diffInDays($fromDate);

    //     // calculate the leaves left based on the existing leave request, if any
    //     $leavesLeft = $leaveType->days - $noOfDays;
    //     if ($existingLeaveRequest) {
    //         $leavesLeft = $existingLeaveRequest->leaves_left - $noOfDays;
    //     }

    //     // check if the leaves left count is greater than 0
    //     // if ($leavesLeft <= -1) {
    //     //     return redirect()->back()->with('error', 'You have 0 leaves left! You can\'t apply for a leave request.');
    //     // }
    //         if ($leavesLeft < 0) {
    //             return redirect()->back()->with('error', 'You have 0 leaves left! You can\'t apply for a leave request.');
    //         }
    //     // create a new LeaveRequest model instance
    //     $leaveRequest = new LeaveRequest();
    //     $leaveRequest->user_id = auth()->user()->id; // set the user ID from the authenticated user
    //     $leaveRequest->leave_type_id = $request->input('leave_type');
    //     $leaveRequest->from_date = $request->input('clicked_date');
    //     $leaveRequest->to_date = $request->input('to_date');
    //     $leaveRequest->reason = $request->input('reason');
    //     $leaveRequest->leaves_left = $leavesLeft;
    //     $leaveRequest->status = 'pending';
    //     $leaveRequest->no_of_days = $noOfDays;
    //     $leaveRequest->save();

    //     // redirect to the desired view with a success message
    //     return redirect()->route('leave-request.success')->with('success', 'Leave request submitted successfully.');
    // }
    // Working copy of the method
    // public function store(Request $request)
    // {
    //     // validate the request data
    //     $validatedData = $request->validate([
    //         'leave_type' => 'required',
    //         'to_date' => 'required|date',
    //         'reason' => 'required',
    //         // add any other validation rules as needed
    //     ]);

    //     // get the leave type
    //     $leaveType = LeaveType::find($request->input('leave_type'));

    //     // get the user's existing leave request for the same leave type, if any
    //     $existingLeaveRequest = LeaveRequest::where('user_id', auth()->user()->id)
    //         ->where('leave_type_id', $request->input('leave_type'))
    //         ->whereIn('status', ['approved', 'pending'])
    //         ->orderBy('created_at', 'desc')
    //         ->first();

    //     // calculate the number of days requested
    //     $fromDate = Carbon::createFromFormat('Y-m-d', $request->input('clicked_date'));
    //     $toDate = Carbon::createFromFormat('Y-m-d', $request->input('to_date'))->addDays(1); // Add 1 day to the to date
    //     $noOfDays = $toDate->diffInDays($fromDate);

    //     // calculate the leaves left based on the existing leave request, if any
    //     $leavesLeft = $leaveType->days - $noOfDays;
    //     if ($existingLeaveRequest) {
    //         $leavesLeft = $existingLeaveRequest->leaves_left - $noOfDays;
    //     }

    //     // check if the leaves left count is greater than or equal to 0
    //     if ($leavesLeft < 0) {
    //         // return redirect()->back()->with('error', 'You have 0 leaves left! You can\'t apply for a leave request.');
    //         return redirect()->back()->withInput()->withErrors(['error' => 'You have 0 leaves left! You can\'t apply for a leave request.']);
    //     }

    //     // create a new LeaveRequest model instance and save it to the database
    //     $leaveRequest = new LeaveRequest();
    //     $leaveRequest->user_id = auth()->user()->id; // set the user ID from the authenticated user
    //     $leaveRequest->leave_type_id = $request->input('leave_type');
    //     $leaveRequest->from_date = $request->input('clicked_date');
    //     $leaveRequest->to_date = $request->input('to_date');
    //     $leaveRequest->reason = $request->input('reason');
    //     $leaveRequest->leaves_left = $leavesLeft;
    //     $leaveRequest->status = 'pending';
    //     $leaveRequest->no_of_days = $noOfDays;

    //     if (!$leaveRequest->save()) {
    //         return redirect()->back()->with('error', 'Failed to save leave request. Please try again.');
    //     }

    //     // redirect to the desired view with a success message
    //     return redirect()->route('leave-request.store')->with('success', 'Leave request submitted successfully.');
    // }

    // public function store(Request $request)
    // {
    //     // validate the request data
    //     $validatedData = $request->validate([
    //         'leave_type' => 'required',
    //         'to_date' => 'required|date',
    //         'reason' => 'required',
    //         // add any other validation rules as needed
    //     ]);
    
    //     // get the leave type
    //     $leaveType = LeaveType::find($request->input('leave_type'));
    
    //     // check if the selected leave type is "Unpaid Leave"
    //     if ($leaveType->name === 'Unpaid Leave') {
    //         // calculate the number of days requested
    //         $fromDate = Carbon::createFromFormat('Y-m-d', $request->input('clicked_date'));
    //         $toDate = Carbon::createFromFormat('Y-m-d', $request->input('to_date'))->addDays(1); // Add 1 day to the to date
    //         $noOfDays = $toDate->diffInDays($fromDate);
    
    //         // create a new LeaveRequest model instance and save it to the database
    //         $leaveRequest = new LeaveRequest();
    //         $leaveRequest->user_id = auth()->user()->id; // set the user ID from the authenticated user
    //         $leaveRequest->leave_type_id = $request->input('leave_type');
    //         $leaveRequest->from_date = $request->input('clicked_date');
    //         $leaveRequest->to_date = $request->input('to_date');
    //         $leaveRequest->reason = $request->input('reason');
    //         $leaveRequest->leaves_left = null;
    //         $leaveRequest->status = 'pending';
    //         $leaveRequest->no_of_days = $noOfDays;
    
    //         if (!$leaveRequest->save()) {
    //             return redirect()->back()->with('error', 'Failed to save leave request. Please try again.');
    //         }
    
    //         // redirect to the desired view with a success message
    //         return redirect()->route('leave-request.store')->with('success', 'Leave request submitted successfully.');
    //     } else {
    //         // get the user's existing leave request for the same leave type, if any
    //         $existingLeaveRequest = LeaveRequest::where('user_id', auth()->user()->id)
    //             ->where('leave_type_id', $request->input('leave_type'))
    //             ->whereIn('status', ['approved', 'pending'])
    //             ->orderBy('created_at', 'desc')
    //             ->first();
    
    //         // calculate the number of days requested
    //         $fromDate = Carbon::createFromFormat('Y-m-d', $request->input('clicked_date'));
    //         $toDate = Carbon::createFromFormat('Y-m-d', $request->input('to_date'))->addDays(1); // Add 1 day to the to date
    //         $noOfDays = $toDate->diffInDays($fromDate);
    
    //         // calculate the leaves left based on the existing leave request, if any
    //         $leavesLeft = $leaveType->days - $noOfDays;
    //         if ($existingLeaveRequest) {
    //             $leavesLeft = $existingLeaveRequest->leaves_left - $noOfDays;
    //         }
    
    //         // check if the leaves left count is greater than or equal to 0
    //         if ($leavesLeft < 0) {
    //             return redirect()->back()->withInput()->withErrors(['error' => 'You have 0 leaves left! You can\'t apply for a leave request.']);
    //         }
    
    //         // create a new LeaveRequest model instance and save it to the database
    //         $leaveRequest = new LeaveRequest();
    //         $leaveRequest->user_id = auth()->user()->id; // set the user ID from the authenticated user
    //         $leaveRequest->leave_type_id = $request->input('leave_type');
    //         $leaveRequest->from_date = $request->input('clicked_date');
    //         $leaveRequest->to_date = $request->input('to_date');
    //         $leaveRequest->reason = $request->input('reason');
    //         $leaveRequest->leaves_left = $leavesLeft;
    //         $leaveRequest->status = 'pending';
    //         $leaveRequest->no_of_days = $noOfDays;
    
    //         if (!$leaveRequest->save()) {
    //             return redirect()->back()->with('error', 'Failed to save leave request. Please try again.');
    //         }
    
    //         // redirect to the desired view with a success message
    //         return redirect()->route('leave-request.store')->with('success', 'Leave request submitted successfully.');
    //     }
    // }

    public function store(Request $request)
{
    // validate the request data
    $validatedData = $request->validate([
        'leave_type' => 'required',
        'to_date' => 'required|date',
        'reason' => 'required',
        // add any other validation rules as needed
    ]);

    // get the leave type
    $leaveType = LeaveType::find($request->input('leave_type'));

    // calculate the number of days requested
    $fromDate = Carbon::createFromFormat('Y-m-d', $request->input('clicked_date'));
    $toDate = Carbon::createFromFormat('Y-m-d', $request->input('to_date'))->addDays(1); // Add 1 day to the to date
    $noOfDays = $toDate->diffInDays($fromDate);

    // check if the selected leave type is "Unpaid Leave"
    if ($leaveType->type === 'Unpaid Leave - LOP') {
        // create a new LeaveRequest model instance and save it to the database
        $leaveRequest = new LeaveRequest();
        $leaveRequest->user_id = auth()->user()->id; // set the user ID from the authenticated user
        $leaveRequest->leave_type_id = $request->input('leave_type');
        $leaveRequest->from_date = $request->input('clicked_date');
        $leaveRequest->to_date = $request->input('to_date');
        $leaveRequest->reason = $request->input('reason');
        $leaveRequest->leaves_left = null;
        $leaveRequest->status = 'pending';
        // $leaveRequest->no_of_days = 0; // set number of days to 0 for unpaid leave
        $leaveRequest->no_of_days = $noOfDays; // set number of days to 0 for unpaid leave

        if (!$leaveRequest->save()) {
            return redirect()->back()->with('error', 'Failed to save leave request. Please try again.');
        }

        // redirect to the desired view with a success message
        return redirect()->route('leave-request.store')->with('success', 'Leave request submitted successfully.');
    } else {
        // get the user's existing leave request for the same leave type, if any
        $existingLeaveRequest = LeaveRequest::where('user_id', auth()->user()->id)
            ->where('leave_type_id', $request->input('leave_type'))
            ->whereIn('status', ['approved', 'pending'])
            ->orderBy('created_at', 'desc')
            ->first();

        // calculate the number of days requested
        // $fromDate = Carbon::createFromFormat('Y-m-d', $request->input('clicked_date'));
        // $toDate = Carbon::createFromFormat('Y-m-d', $request->input('to_date'))->addDays(1); // Add 1 day to the to date
        // $noOfDays = $toDate->diffInDays($fromDate);

        // calculate the leaves left based on the existing leave request, if any
        $leavesLeft = $leaveType->days - $noOfDays;
        if ($existingLeaveRequest) {
            $leavesLeft = $existingLeaveRequest->leaves_left - $noOfDays;
        }

        // check if the leaves left count is greater than or equal to 0
        if ($leavesLeft < 0) {
            return redirect()->back()->withInput()->withErrors(['error' => 'You have 0 leaves left in this Leave type! You can apply for Unpaid leave.']);
        }

        // create a new LeaveRequest model instance and save it to the database
        $leaveRequest = new LeaveRequest();
        $leaveRequest->user_id = auth()->user()->id; // set the user ID from the authenticated user
        $leaveRequest->leave_type_id = $request->input('leave_type');
        $leaveRequest->from_date = $request->input('clicked_date');
        $leaveRequest->to_date = $request->input('to_date');
        $leaveRequest->reason = $request->input('reason');
        $leaveRequest->leaves_left = $leavesLeft;
        $leaveRequest->status = 'pending';
        $leaveRequest->no_of_days = $noOfDays;

        if (!$leaveRequest->save()) {
            return redirect()->back()->with('error', 'Failed to save leave request. Please try again.');
        }

        // redirect to the desired view with a success message
        return redirect()->route('leave-request.store')->with('success', 'Leave request submitted successfully.');
    }
}

    //method created for storing the revoke reason to the same id of previous leave request
    public function updateRevokeReason(Request $request)
    {
        // Get the leave ID and revoke reason from the form
        $leaveId = $request->input('leave_id');
        $revokeReason = $request->input('revoke_reason');

        // Update the LeaveRequest model with the new revoke reason
        $leaveRequest = LeaveRequest::find($leaveId);
        $leaveRequest->revoke_reason = $revokeReason;
        $leaveRequest->revoke_status = 1; 
        $leaveRequest->save();

        // Redirect back to the leave requests page with a success message
        return redirect()->back()->with('success', 'Leave Revoke request submitted successfully.');
    }
    //method created for showing the leaves left for all the leave types
    // public function getDaysAvailable($id)
    // {
    //     $leaveType = LeaveType::find($id);
    
    //     $existingLeaveRequest = LeaveRequest::where('user_id', auth()->user()->id)
    //         ->where('leave_type_id', $id)
    //         ->whereIn('status', ['approved', 'pending'])
    //         ->orderBy('created_at', 'desc')
    //         ->first();
    
    //     $daysAvailable = $leaveType ? $leaveType->days : 0;
    //     if ($existingLeaveRequest) {
    //         $daysAvailable = $existingLeaveRequest->leaves_left;
    //     }

    //     return response()->json(['days_available' => $daysAvailable]);
    // }

    public function getDaysAvailable($id)
{
    $leaveType = LeaveType::find($id);

    $existingLeaveRequest = LeaveRequest::where('user_id', auth()->user()->id)
        ->where('leave_type_id', $id)
        ->whereIn('status', ['approved', 'pending'])
        ->orderBy('created_at', 'desc')
        ->first();

    $daysAvailable = null; // initialize as null
    if ($leaveType) {
        $daysAvailable = $leaveType->days; // set to limit if it exists
    }
    if ($existingLeaveRequest) {
        $daysAvailable = $existingLeaveRequest->leaves_left;
    }

    return response()->json(['days_available' => $daysAvailable]);
}


    //method created for fetching the count of leaves taken of different leave types
    public function getLeavesLeft() {
        $leaveTypes = LeaveType::all();
        $leavesLeft = [];
        $casualLeavesLeft = 0;
        $sickLeavesLeft = 0;
    
        foreach ($leaveTypes as $leaveType) {
            $existingLeaveRequest = LeaveRequest::where('user_id', auth()->user()->id)
                ->where('leave_type_id', $leaveType->id)
                ->whereIn('status', ['approved', 'pending'])
                ->orderBy('created_at', 'desc')
                ->first();
    
            $daysAvailable = $leaveType->days;
            if ($existingLeaveRequest) {
                $daysAvailable = $existingLeaveRequest->leaves_left;
            }
    
            // add these lines to store the leave counts in separate variables
            if ($leaveType->type === 'Casual Leave') {
                $casualLeavesLeft = $daysAvailable;
            } elseif ($leaveType->type === 'Sick Leave') {
                $sickLeavesLeft = $daysAvailable;
            }
    
            $leavesLeft[$leaveType->name] = $daysAvailable;
        }
        Log::info('Casual Leaves Left: '.$casualLeavesLeft);
        Log::info('Sick Leaves Left: '.$sickLeavesLeft);
        // return an array with both variables
        return [
            'casualLeavesLeft' => $casualLeavesLeft,
            'sickLeavesLeft' => $sickLeavesLeft,
        ];
    }   

    public function getLeaveDetails() {
        $leaveTypes = LeaveType::all();
        $leaveDetails = [];
        $totalLeaves = 0;
        $totalLeavesTaken = 0;
    
        foreach ($leaveTypes as $leaveType) {
            $existingLeaveRequest = LeaveRequest::where('user_id', auth()->user()->id)
                ->where('leave_type_id', $leaveType->id)
                ->whereIn('status', ['approved', 'pending'])
                ->orderBy('created_at', 'desc')
                ->first();
    
            $daysAvailable = $leaveType->days;
            if ($existingLeaveRequest) {
                $daysAvailable = $existingLeaveRequest->leaves_left;
            }
    
            $totalLeaves += $leaveType->days;
            $totalLeavesTaken += $leaveType->days - $daysAvailable;
    
            $leaveDetails[$leaveType->name] = $daysAvailable;
        }
    
        return [
            'totalLeavesCount' => $totalLeaves,
            'totalLeavesTakenCount' => $totalLeavesTaken,
            'leaveDetails' => $leaveDetails,
        ];
    }

    // method created for fetching the count of unpaid leaves/LOP
    public function getTotalLOPCount()
    {
        $unpaidLeaveType = LeaveType::where('type', 'Unpaid Leave - LOP')->first();
        $userUnpaidLeaves = LeaveRequest::where('user_id', auth()->user()->id)
            ->where('leave_type_id', $unpaidLeaveType->id)
            ->whereIn('status', ['approved', 'pending'])
            ->sum('no_of_days');
        
        return $userUnpaidLeaves;
    }

    
    //method created for fetching the holidays from Holiday Model to populate it in calendar view
    public function getHolidays() {
        $holidays = Holiday::pluck('holiday_date')->toArray();
        return $holidays;
    }
    //method created for fetching the leaves from LeaveRequest Model to populate it in calendar view
    // public function getLeaves() {
    //     $user_id = auth()->user()->id;
    //     $leaveRequests = LeaveRequest::where('user_id', $user_id)->get();
    //     $leaves = [];
    
    //     foreach ($leaveRequests as $leave) {
    //         $fromDate = Carbon::createFromFormat('Y-m-d', $leave->from_date);
    //         $toDate = Carbon::createFromFormat('Y-m-d', $leave->to_date);
    //         $days = $toDate->diffInDays($fromDate) + 1;
    
    //         for ($i = 0; $i < $days; $i++) {
    //             $leaves[] = $fromDate->copy()->addDays($i)->format('Y-m-d');
    //         }
    //     }
    //     return $leaves;
    // }
    // public function getLeaves() {
    //     $user_id = auth()->user()->id;
    //     $leaves = LeaveRequest::where('user_id', $user_id)
    //                           ->pluck('from_date', 'to_date')
    //                           ->flatMap(function ($fromDate, $toDate) {
    //                               $dates = [];
    //                               $days = Carbon::parse($fromDate)->diffInDays(Carbon::parse($toDate)) + 1;
    
    //                               for ($i = 0; $i < $days; $i++) {
    //                                   $dates[] = Carbon::parse($fromDate)->addDays($i)->format('Y-m-d');
    //                               }
    
    //                               return $dates;
    //                           })
    //                           ->toArray();
    
    //     return $leaves;
    // }
    public function getLeaves() {
        $user_id = auth()->user()->id;
        $leaves = LeaveRequest::where('user_id', $user_id)
                              ->where('status', '!=', 'Rejected')
                              ->pluck('from_date', 'to_date')
                              ->flatMap(function ($fromDate, $toDate) {
                                  $dates = [];
                                  $days = Carbon::parse($fromDate)->diffInDays(Carbon::parse($toDate)) + 1;
    
                                  for ($i = 0; $i < $days; $i++) {
                                      $dates[] = Carbon::parse($fromDate)->addDays($i)->format('Y-m-d');
                                  }
    
                                  return $dates;
                              })
                              ->toArray();
    
        return $leaves;
    }    

    // public function getHalfDayAttendanceDates() {
    //     $halfDayAttendanceDates = Attendance::where('checkout_status', 'Half Day')->pluck('attendance_date')->toArray();
    //     return $halfDayAttendanceDates;
    // }

    // public function getHalfDayAttendanceDates() {
    //     $halfDayAttendanceDates = Attendance::where('checkout_status', 'Half Day')->pluck('attendance_date')->toArray();
    //     $HalfDays = [];
    //     foreach($halfDayAttendanceDates as $date) {
    //         $HalfDays[] = $date;
    //     }
    //     return $HalfDays;
    // }
    public function getHalfDayAttendanceDates() {
        $userId = auth()->id(); // Get the ID of the authenticated user
        $halfDayAttendanceDates = Attendance::where('user_id', $userId)
                                             ->where('checkout_status', 'Half Day')
                                             ->pluck('attendance_date')
                                             ->toArray();
        $HalfDays = [];
        foreach($halfDayAttendanceDates as $date) {
            $HalfDays[] = $date;
        }
        return $HalfDays;
    }
    
    
    
    // public function index()
    // {
    //     // Fetch the user's leave requests
    //     $leaveRequests = LeaveRequest::where('user_id', auth()->user()->id)
    //         ->orderBy('created_at', 'desc')
    //         ->get();

    //     // Render the emp-leave view with the leave requests
    //     return view('backend.emp-leave', [
    //         'leaveRequests' => $leaveRequests,
    //     ]);
    // }
    //Working method for listing leaves in data-table
    // public function showLeaveRequests()
    // {
    //     $leaveRequests = LeaveRequest::where('user_id', auth()->user()->id)
    //         ->orderBy('created_at', 'asc')
    //         ->with('leaveType')
    //         ->get();

    //     return view('backend.emp-leave', ['leaveRequests' => $leaveRequests]);
    // }
    public function showLeaveRequests()
    {
        $leaveRequests = LeaveRequest::where('user_id', auth()->user()->id)
            ->orderBy('created_at', 'asc')
            ->with('leaveType')
            ->get();

        return view('backend.emp-leave')
            ->with('leaveRequests', $leaveRequests);
    }
    public function showLeaveRequestsForHR()
    {
        $leaveRequests = LeaveRequest::
            orderBy('created_at', 'desc')
            ->with('leaveType')
            ->get();

        return view('backend.emp-leaveHR')
            ->with('leaveRequests', $leaveRequests);
    }

    // public function updateStatus(Request $request)
    // {
    //     $requestId = $request->input('request_id');
    //     $status = $request->input('status');

    //     $leaveRequest = LeaveRequest::findOrFail($requestId);
    //     $leaveRequest->status = $status;
    //     $leaveRequest->save();

    //     return response()->json([
    //         'status' => 'success',
    //         'message' => 'Leave request status updated successfully.'
    //     ]);
    // }

    // public function updateStatus($id)
    // {
    //     $leaveRequest = LeaveRequest::findOrFail($id);
    //     $leaveRequest->status = request('status');
    //     $leaveRequest->save();
    //     return response()->json(['success' => true]);
    // }
    // public function updateStatus($id)
    // {
    //     try {
    //         $leaveRequest = LeaveRequest::findOrFail($id);
    //         $leaveRequest->status = request('status');
    //         $leaveRequest->save();
    //         return response()->json(['success' => true]);
    //     } catch (\Throwable $th) {
    //         return response()->json(['success' => false, 'error' => $th->getMessage()]);
    //     }
    // }

//     public function updateStatus($id)
// {
//     Log::debug("Received updateStatus request for id=$id");

//     $leaveRequest = LeaveRequest::findOrFail($id);
//     Log::debug("Found LeaveRequest with id=$id");

//     $leaveRequest->status = request('status');
//     $leaveRequest->save();
//     Log::debug("Updated status for LeaveRequest with id=$id");

//     return response()->json(['success' => true]);
// }

// public function updateStatus($leave_id)
// {
//     // Retrieve the LeaveRequest instance corresponding to the given id from the database
//     $leaveRequest = LeaveRequest::findOrFail($leave_id);

//     // Set the new status
//     $leaveRequest->status = request('status');

//     // Save the updated LeaveRequest instance to the database
//     $leaveRequest->save();

//     // Return a success response
//     return response()->json(['success' => true]);
// }
// public function updateStatus(Request $request, $id)
// {
//     // Update status in database
//     $leaveRequest = LeaveRequest::find($id);
//     $leaveRequest->status = $request->status;
//     $leaveRequest->save();

//     return response()->json(['success' => true]);
// }
// public function updateStatus(Request $request, $id)
// {
//     $leaveRequest = LeaveRequest::find($id);
//     if (!$leaveRequest) {
//         return response()->json(['error' => 'Leave request not found'], 404);
//     }
    
//     $newStatus = $request->input('status');
//     if (!in_array($newStatus, ['Approved', 'Rejected'])) {
//         return response()->json(['error' => 'Invalid status'], 400);
//     }
    
//     $leaveRequest->status = $newStatus;
//     $leaveRequest->save();
    
//     return response()->json(['message' => 'Leave request status updated'], 200);
// }

// public function update(Request $request, $id)
// {
//     $leaveRequest = LeaveRequest::findOrFail($id);
//     $leaveRequest->status = $request->status;
//     $leaveRequest->save();
//     return response()->json([
//         'message' => 'Leave request status updated successfully.'
//     ]);
// }

// public function update(Request $request, $id)
// {
//     $leaveRequest = LeaveRequest::findOrFail($id);
//     $leaveRequest->status = $request->status;
//     $leaveRequest->save();
    
//     // Retrieve the updated leave request with the status
//     $leaveRequest = LeaveRequest::with('user', 'leaveType')->findOrFail($id);

//     return view('leave_requests.show', [
//         'leaveRequest' => $leaveRequest,
//     ])->with('success', 'Leave request status updated successfully.');
// }


    public function update(Request $request, $id)
    {
        $leaveRequest = LeaveRequest::findOrFail($id);
        $leaveRequest->status = $request->status;
        $leaveRequest->save();

        // Fetch the updated record from the database
        $leaveRequest = LeaveRequest::findOrFail($id);

        return view('leave-requests.show', [
            'leaveRequest' => $leaveRequest
        ])->with('success', 'Leave request status updated successfully.');
    }

    // public function updateRevokeStatus(Request $request, $id)
    // {
    //     $leaveRequest = LeaveRequest::findOrFail($id);

    //     if ($leaveRequest->status === 'Revoke(Pending)') {
    //         $newStatus = $request->status;
    //         $revokeApproved = null;

    //         if ($newStatus === 'Revoke(Approved)') {
    //             $revokeApproved = 1;
    //             $leaveRequest->status = 'Revoke(Approved)';
    //         } else if ($newStatus === 'Revoke(Rejected)') {
    //             $revokeApproved = 0;
    //             $leaveRequest->status = 'Revoke(Rejected)';
    //         }

    //         $leaveRequest->revoke_approved = $revokeApproved;
    //         $leaveRequest->save();
            
    //         // Fetch the updated record from the database
    //         $leaveRequest = LeaveRequest::findOrFail($id);
            
    //         return redirect()->route('leave-requests.show', ['leave_request' => $leaveRequest])
    //                         ->with('success', 'Revoke request status updated successfully.');
    //     } else {
    //         abort(403, 'Access denied');
    //     }
    // }

    // public function handleAction(Request $request, $id, $action)
    // {
    //     if ($action == 'revoke') {
    //         return $this->revoke($request, $id);
    //     } else {
    //         return $this->update($request, $id);
    //     }
    // }

    public function revoke(Request $request, $id)
    {
        $leaveRequest = LeaveRequest::findOrFail($id);

        // Check if leave request is already revoked
        if ($leaveRequest->status == 'Revoked (Approved)' || $leaveRequest->status == 'Revoked (Rejected)') {
            return redirect()->back()->with('error', 'Leave request is already revoked.');
        }

        // Update leave request status based on input
        switch ($request->revoke_status) {
            case 'Approved':
                $leaveRequest->status = 'Revoked (Approved)';
                $leaveRequest->revoke_approved = 1; // Set revoke_approved to 1
                break;
            case 'Rejected':
                $leaveRequest->status = 'Revoked (Rejected)';
                $leaveRequest->revoke_approved = 0; // Set revoke_approved to 0
                break;
            default:
                return redirect()->back()->with('error', 'Invalid revoke status.');
        }
        $leaveRequest->save();

        // Fetch the updated record from the database
        $leaveRequest = LeaveRequest::findOrFail($id);

        return view('leave-requests.show', [
            'leaveRequest' => $leaveRequest
        ])->with('success', 'Leave request revoke status updated successfully.');
    }



// public function update(Request $request, $id)
// {
//     $leaveRequest = LeaveRequest::findOrFail($id);
//     $leaveRequest->status = $request->status;
//     $leaveRequest->save();

//     // Fetch the updated record from the database
//     $leaveRequest = LeaveRequest::findOrFail($id);

//     // return view('leave-requests.show', [
//     //     'leaveRequest' => $leaveRequest,
//     //     'status' => $leaveRequest->status // Pass the updated status to the view
//     // ])->with('success', 'Leave request status updated successfully.');
//     return view('backend.emp-leaveHR')->with('status', $status);

// }


}