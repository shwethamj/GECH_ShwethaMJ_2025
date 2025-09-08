<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ClientMeeting;
use App\Models\EmployeeDetail;
use Illuminate\Support\Facades\Log;


class ClientMeetingController extends Controller
{
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'agenda' => 'required|string|max:255',
            'date' => 'required|date',
            'client_name' => 'required|string|max:255',
            'project_name' => 'required|string|max:255',
            'project_type' => 'required|string|max:255',
            'status' => 'required|string|in:Lead,Prospect,Completed,Cancelled',
            'team.*' => 'nullable|exists:employee_details,id'
        ]);

        $clientMeeting = new ClientMeeting;
        $clientMeeting->agenda = $validatedData['agenda'];
        $clientMeeting->date = $validatedData['date'];
        $clientMeeting->client_name = $validatedData['client_name'];
        $clientMeeting->project_name = $validatedData['project_name'];
        $clientMeeting->project_type = $validatedData['project_type'];
        $clientMeeting->status = $validatedData['status'];

        // Convert the attendees array to a JSON string
        $attendees = json_encode($validatedData['team'] ?? []);
        $clientMeeting->attendees = $attendees;

        $clientMeeting->referred_by = $request->input('referred_by');
        $clientMeeting->action_on_team = $request->input('action_on_team');
        $clientMeeting->action_on_santhosh = $request->input('action_on_santhosh');
        $clientMeeting->save();

        return redirect()->route('clients-leads')->with('success', 'Client meeting created successfully.');
    }

    public function update(Request $request)
    {
        $validatedData = $request->validate([
            'edit_agenda' => 'required|string|max:255',
            'edit_date' => 'required|date',
            'edit_client_name' => 'required|string|max:255',
            'edit_project_name' => 'required|string|max:255',
            'edit_project_type' => 'required|string|max:255',
            'edit_status' => 'required|string|in:Lead,Prospect,Completed,Cancelled',
            'team.*' => 'nullable|exists:employee_details,id'
        ]);
    
        $clientMeeting = ClientMeeting::findOrFail($request->id);
        $clientMeeting->agenda = $validatedData['edit_agenda'];
        $clientMeeting->date = $validatedData['edit_date'];
        $clientMeeting->client_name = $validatedData['edit_client_name'];
        $clientMeeting->project_name = $validatedData['edit_project_name'];
        $clientMeeting->project_type = $validatedData['edit_project_type'];
        $clientMeeting->status = $validatedData['edit_status'];
    
        // Convert the attendees array to a JSON string
        $attendees = json_encode($validatedData['team'] ?? []);
        $clientMeeting->attendees = $attendees;
    
        $clientMeeting->referred_by = $request->input('edit_reffered_by');
        $clientMeeting->action_on_team = $request->input('edit_action_on_team');
        $clientMeeting->action_on_santhosh = $request->input('edit_action_on_santhosh');
        $clientMeeting->save();
        Log::info('Client meeting updated', ['data' => $clientMeeting]);
        return redirect()->route('clients-leads')->with('success', 'Client meeting updated successfully.');
    }

    
    // public function update(Request $request, $id)
    // {
    //     if ($request->isMethod('put')) {
    //         $validatedData = $request->validate([
    //             'edit_agenda' => 'required|string|max:255',
    //             'edit_date' => 'required|date',
    //             'edit_client_name' => 'required|string|max:255',
    //             'edit_project_name' => 'required|string|max:255',
    //             'edit_project_type' => 'required|string|max:255',
    //             'edit_status' => 'required|string|in:Lead,Prospect,Completed,Cancelled',
    //             'team.*' => 'nullable|exists:employee_details,id'
    //         ]);
    
    //         $clientMeeting = ClientMeeting::findOrFail($id);
    //         $clientMeeting->agenda = $validatedData['edit_agenda'];
    //         $clientMeeting->date = $validatedData['edit_date'];
    //         $clientMeeting->client_name = $validatedData['edit_client_name'];
    //         $clientMeeting->project_name = $validatedData['edit_project_name'];
    //         $clientMeeting->project_type = $validatedData['edit_project_type'];
    //         $clientMeeting->status = $validatedData['edit_status'];
    
    //         // Convert the attendees array to a JSON string
    //         $attendees = json_encode($validatedData['team'] ?? []);
    //         $clientMeeting->attendees = $attendees;
    
    //         $clientMeeting->referred_by = $request->input('edit_reffered_by');
    //         $clientMeeting->action_on_team = $request->input('edit_action_on_team');
    //         $clientMeeting->action_on_santhosh = $request->input('edit_action_on_santhosh');
    //         $clientMeeting->save();
    //         Log::info('Client meeting updated', ['data' => $clientMeeting]);
    //         return redirect()->route('clients-leads')->with('success', 'Client meeting updated successfully.');
    //     } else {
    //         $clientMeeting = ClientMeeting::findOrFail($id);
    //         return response()->json($clientMeeting);
    //     }
    // }
    

    // public function showMeetings()
    // {
    //     // Fetch all client meetings from the database
    //     $clientMeetings = ClientMeeting::all();

    //     // Pass the client meetings to the view
    //     return view('backend.clients-leads', compact('clientMeetings'));
    // }
    
    // public function showMeetings()
    // {
    //     // Fetch all client meetings from the database
    //     $clientMeetings = ClientMeeting::with('employeeDetail')->get();

    //     // Pass the client meetings to the view, along with the employee details
    //     return view('backend.clients-leads', compact('clientMeetings'));
    // }
    
    public function showMeetings()
    {
        // Fetch all client meetings from the database
        $clientMeetings = ClientMeeting::with('employeeDetail')->get();

        foreach ($clientMeetings as $meeting) {
            $attendees = json_decode($meeting->attendees);
            
            // Log the first name of each attendee
            foreach ($attendees as $attendeeId) {
                $employeeFirstName = EmployeeDetail::find($attendeeId)->firstname;
                Log::info("Employee First Name: " . $employeeFirstName);
            }
        }

        // Pass the client meetings to the view, along with the employee details
        return view('backend.clients-leads', compact('clientMeetings'));
    }

    public function edit($id)
    {
        $clientMeeting = ClientMeeting::findOrFail($id);
        return response()->json($clientMeeting);
    }

    public function destroy(Request $request)
    {
        $clientMeeting = ClientMeeting::find($request->id);
        $clientMeeting->delete();
        return back()->with('success',"Client meeting deleted successfully");
    }

    // public function showMeetings()
    // {
    //     // Fetch all client meetings from the database along with their associated employee details
    //     $clientMeetings = ClientMeeting::with('employeeDetail')->get();

    //     // Loop through each client meeting
    //     foreach ($clientMeetings as $meeting) {
    //         // Decode the JSON string of attendee IDs into an array
    //         $attendeeIds = json_decode($meeting->attendees);

    //         // Loop through each attendee ID and fetch the corresponding employee detail object
    //         $attendeeNames = [];
    //         foreach ($attendeeIds as $id) {
    //             $employee = EmployeeDetail::find($id);
    //             if ($employee) {
    //                 $attendeeNames[] = $employee->firstName;
    //             }
    //         }

    //         // Log the attendee names to the Laravel log file
    //         Log::info('Attendees for Meeting #' . $meeting->id . ': ' . implode(', ', $attendeeNames));
    //     }

    //     // Pass the client meetings to the view, along with the employee details
    //     return view('backend.clients-leads', compact('clientMeetings'));
    // }

}
