<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\EmployeeAdditionalDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Log;



class EmployeeAdditionalDetailController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    //working method for storing the data in db without emp_id
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'dob' => 'required',
            'blood_group' => 'required',
            'res_address' => 'required',
            'per_address' => 'required',
            'aadhaar' => 'required|min:12',
            'nationality' => 'required',
            'religion' => 'required',
            'marital_status' => 'required',
            'emp_id' => 'required',
        ]);

        // Get the authenticated user's ID
        // $userId = auth()->id();
        $userId = $validatedData['emp_id'];

        // Check if the user already has an EmployeeAdditionalDetail record
        $employeeAdditionalDetail = EmployeeAdditionalDetail::where('user_id', $userId)->first();

        if ($employeeAdditionalDetail) {
            // Update the existing record with the new details
            $employeeAdditionalDetail->update([
                'dob' => $validatedData['dob'],
                'blood_group' => $validatedData['blood_group'],
                'residential_address' => $validatedData['res_address'],
                'permanent_address' => $validatedData['per_address'],
                'aadhaar_no' => $validatedData['aadhaar'],
                'nationality' => $validatedData['nationality'],
                'religion' => $validatedData['religion'],
                'marital_status' => $validatedData['marital_status'],
                'user_id' => $userId,
            ]);

            return back()->with('success', 'Employee Additional details updated successfully');
        } else {
            // Create a new EmployeeAdditionalDetail record
            EmployeeAdditionalDetail::create([
                'dob' => $validatedData['dob'],
                'blood_group' => $validatedData['blood_group'],
                'residential_address' => $validatedData['res_address'],
                'permanent_address' => $validatedData['per_address'],
                'aadhaar_no' => $validatedData['aadhaar'],
                'nationality' => $validatedData['nationality'],
                'religion' => $validatedData['religion'],
                'marital_status' => $validatedData['marital_status'],
                'user_id' => $userId,
            ]);

            return back()->with('success', 'Employee Additional details added successfully');
        }
    }
    
    //method created for storing Emergency contact details in JSON format
    public function updateEmergencyContacts(Request $request)
    {
        // Get the user ID of the authenticated user
        // $user_id = auth()->user()->id;
        $validatedData = $request->validate([
            'emp_id' => 'required',
        ]);

        $user_id = $validatedData['emp_id'];


        // Get the employee additional details for the user
        $employee_additional_details = EmployeeAdditionalDetail::where('user_id', $user_id)->first();

        if ($employee_additional_details) {
            // If the employee additional details exist, update the primary_contact and secondary_contact fields

            $employee_additional_details->primary_contact = [
                'name' => $request->input('primary_contact.name'),
                'relationship' => $request->input('primary_contact.relationship'),
                'phone1' => $request->input('primary_contact.phone1'),
                'phone2' => $request->input('primary_contact.phone2'),
            ];

            $employee_additional_details->secondary_contact = [
                'name' => $request->input('secondary_contact.name'),
                'relationship' => $request->input('secondary_contact.relationship'),
                'phone1' => $request->input('secondary_contact.phone1'),
                'phone2' => $request->input('secondary_contact.phone2'),
            ];

            // Save the changes to the employee additional details
            $employee_additional_details->save();

            // return response()->json(['message' => 'Emergency contacts updated successfully.']);
            return back()->with('success', 'Emergency contacts updated successfully.');
        } else {
            // If the employee additional details don't exist, return an error response
            return response()->json(['error' => 'Employee additional details not found for user.'], 404);
        }
    }

    // public function updateBankDetails(Request $request)
    // {
    //     // $user_id = auth()->user()->id;
    //     $validatedData = $request->validate([
    //         'emp_id' => 'required',
    //     ]);
        
    //     $user_id = $validatedData['emp_id'];

    //     // Get the employee additional details for the user
    //     $employee_additional_details = EmployeeAdditionalDetail::where('user_id', $user_id)->first();

    //     if ($employee_additional_details) {
    //         // If the employee additional details exist, update the bank details
    //         $employee_additional_details->bank_name = $request->input('bank_name');
    //         $employee_additional_details->branch_name = $request->input('branch_name');
    //         $employee_additional_details->bank_ac_number = $request->input('bank_ac_number');
    //         $employee_additional_details->bank_ifsc = $request->input('bank_ifsc');
    //         $employee_additional_details->pan_number = $request->input('pan_number');
    //         $employee_additional_details->save();
    //         return redirect()->back()->with('success', 'Bank details updated successfully.');
    //     }
    // }
    public function updateBankDetails(Request $request)
    {
        // $user_id = auth()->user()->id;
        $validatedData = $request->validate([
            'emp_id' => 'required',
            'bank_name' => 'required',
            'branch_name' => 'required',
            'bank_ac_number' => 'required|numeric',
            'bank_ifsc' => 'required',
            'pan_number' => 'required',
        ]);
        
        $user_id = $validatedData['emp_id'];

        // Get the employee additional details for the user
        $employee_additional_details = EmployeeAdditionalDetail::where('user_id', $user_id)->first();

        if ($employee_additional_details) {
            // If the employee additional details exist, update the bank details
            $employee_additional_details->bank_name = $validatedData['bank_name'];
            $employee_additional_details->branch_name = $validatedData['branch_name'];
            $employee_additional_details->bank_ac_number = $validatedData['bank_ac_number'];
            $employee_additional_details->bank_ifsc = $validatedData['bank_ifsc'];
            $employee_additional_details->pan_number = $validatedData['pan_number'];
            $employee_additional_details->save();
            return redirect()->back()->with('success', 'Bank details updated successfully.');
        }
    }
    //method created to store the education details in different JSON objects
    // public function updateEducationDetails(Request $request)
    // {
    //     // Get the user ID of the authenticated user
    //     $user_id = auth()->user()->id;

    //     // Get the employee additional details for the user
    //     $employee_additional_details = EmployeeAdditionalDetail::where('user_id', $user_id)->first();

    //     if ($employee_additional_details) {
    //         // If the employee additional details exist, update the educational_details_x columns

    //         // Get the education details from the request payload
    //         $education_details = $request->input('education_details');

    //         // Check if the education details are valid JSON
    //         if (!is_array($education_details)) {
    //             return response()->json(['error' => 'Invalid education details.'], 400);
    //         }

    //         // Store the education details in the respective columns
    //         $i = 1;
    //         foreach ($education_details as $detail) {
    //             $column_name = 'educational_details_' . $i;
    //             $employee_additional_details->$column_name = json_encode($detail);
    //             $i++;
    //             if ($i > 4) {
    //                 break; // We can only store up to 4 education details
    //             }
    //         }

    //         // Save the changes to the employee additional details
    //         $employee_additional_details->save();

    //         return back()->with('success', 'Education details updated successfully.');
    //         // return redirect()->back()->with('success', 'Education details updated successfully.');
    //     } else {
    //         // If the employee additional details don't exist, return an error response
    //         return response()->json(['error' => 'Employee additional details not found for user.'], 404);
    //     }
    // }

    // public function updateEducationDetails(Request $request)
    // {
    //     // Get the authenticated user ID from the request payload
    //     $user_id = $request->user()->id;

    //     // Retrieve the existing employee additional details for this user, or create a new one if it doesn't exist yet
    //     $employee_additional_details = EmployeeAdditionalDetail::firstOrNew(['user_id' => $user_id]);

    //     // Get the education details from the request payload and validate them
    //     $education_details = $request->input('education_details');

    //     $validator = Validator::make($education_details, [
    //         '*.level' => 'required',
    //         '*.institution' => 'required',
    //         '*.qualification' => 'required',
    //         '*.start_date' => 'required|date',
    //         '*.end_date' => 'required|date',
    //         '*.grade' => 'required',
    //     ]);

    //     if ($validator->fails()) {
    //         return response()->json(['error' => $validator->errors()], 400);
    //     }

    //     // Store the education details in the respective columns
    //     $educational_details_1 = [];
    //     $educational_details_2 = [];
    //     $educational_details_3 = [];
    //     $educational_details_4 = [];

    //     foreach ($education_details as $detail) {
    //         switch ($detail['level']) {
    //             case 'SSLC/10th':
    //                 $educational_details_1[] = $detail;
    //                 break;
    //             case 'PUC/12th/Diploma':
    //                 $educational_details_2[] = $detail;
    //                 break;
    //             case 'UG':
    //                 $educational_details_3[] = $detail;
    //                 break;
    //             case 'PG':
    //                 $educational_details_4[] = $detail;
    //                 break;
    //         }
    //     }

    //     $employee_additional_details->educational_details_1 = json_encode($educational_details_1);
    //     $employee_additional_details->educational_details_2 = json_encode($educational_details_2);
    //     $employee_additional_details->educational_details_3 = json_encode($educational_details_3);
    //     $employee_additional_details->educational_details_4 = json_encode($educational_details_4);

    //     $employee_additional_details->save();

    //     // Return a success response
    //     return response()->json(['success' => 'Education details saved successfully.']);
    // }

    // public function updateEducationDetails(Request $request)
    // {
    //     $employeeAdditionalDetail = new EmployeeAdditionalDetail();
    
    //     // Store SSLC/10th information
    //     $sslcDetails = [
    //         'level' => 'SSLC/10th',
    //         'institution' => $request->input('education_details.0.institution'),
    //         'qualification' => $request->input('education_details.0.qualification'),
    //         'start_date' => $request->input('education_details.0.start_date'),
    //         'end_date' => $request->input('education_details.0.end_date'),
    //         'grade' => $request->input('education_details.0.grade')
    //     ];
    //     $employeeAdditionalDetail->educational_details_1 = json_encode($sslcDetails);
    
    //     // Store PUC/12th/Diploma information
    //     $pucDetails = [
    //         'level' => 'PUC/12th/Diploma',
    //         'institution' => $request->input('education_details.1.institution'),
    //         'qualification' => $request->input('education_details.1.qualification'),
    //         'start_date' => $request->input('education_details.1.start_date'),
    //         'end_date' => $request->input('education_details.1.end_date'),
    //         'grade' => $request->input('education_details.1.grade')
    //     ];
    //     $employeeAdditionalDetail->educational_details_2 = json_encode($pucDetails);
    
    //     // Store UG information
    //     $ugDetails = [
    //         'level' => 'UG',
    //         'institution' => $request->input('education_details.2.institution'),
    //         'qualification' => $request->input('education_details.2.qualification'),
    //         'start_date' => $request->input('education_details.2.start_date'),
    //         'end_date' => $request->input('education_details.2.end_date'),
    //         'grade' => $request->input('education_details.2.grade')
    //     ];
    //     $employeeAdditionalDetail->educational_details_3 = json_encode($ugDetails);
    
    //     // Store PG information
    //     $pgDetails = [
    //         'level' => 'PG',
    //         'institution' => $request->input('education_details.3.institution'),
    //         'qualification' => $request->input('education_details.3.qualification'),
    //         'start_date' => $request->input('education_details.3.start_date'),
    //         'end_date' => $request->input('education_details.3.end_date'),
    //         'grade' => $request->input('education_details.3.grade')
    //     ];
    //     $employeeAdditionalDetail->educational_details_4 = json_encode($pgDetails);
    
    //     $employeeAdditionalDetail->save();
    
    //     return redirect()->back()->with('success', 'Education details added successfully.');
    // }
    
//     public function updateEducationDetails(Request $request)
// {
//     $user_id = auth()->id();

//     // Check if there is already an EmployeeAdditionalDetail record for the authenticated user
//     $employeeAdditionalDetail = EmployeeAdditionalDetail::where('user_id', $user_id)->exists() ? 
//                                 EmployeeAdditionalDetail::where('user_id', $user_id)->first() : 
//                                 new EmployeeAdditionalDetail();

//     // Store SSLC/10th information
//     $sslcDetails = [
//         'level' => 'SSLC/10th',
//         'institution' => $request->input('education_details.0.institution'),
//         'qualification' => $request->input('education_details.0.qualification'),
//         'start_date' => $request->input('education_details.0.start_date'),
//         'end_date' => $request->input('education_details.0.end_date'),
//         'grade' => $request->input('education_details.0.grade')
//     ];
//     $employeeAdditionalDetail->educational_details_1 = json_encode($sslcDetails);

//     // Store PUC/12th/Diploma information
//     $pucDetails = [
//         'level' => 'PUC/12th/Diploma',
//         'institution' => $request->input('education_details.1.institution'),
//         'qualification' => $request->input('education_details.1.qualification'),
//         'start_date' => $request->input('education_details.1.start_date'),
//         'end_date' => $request->input('education_details.1.end_date'),
//         'grade' => $request->input('education_details.1.grade')
//     ];
//     $employeeAdditionalDetail->educational_details_2 = json_encode($pucDetails);

//     // Store UG information
//     $ugDetails = [
//         'level' => 'UG',
//         'institution' => $request->input('education_details.2.institution'),
//         'qualification' => $request->input('education_details.2.qualification'),
//         'start_date' => $request->input('education_details.2.start_date'),
//         'end_date' => $request->input('education_details.2.end_date'),
//         'grade' => $request->input('education_details.2.grade')
//     ];
//     $employeeAdditionalDetail->educational_details_3 = json_encode($ugDetails);

//     // Store PG information
//     $pgDetails = [
//         'level' => 'PG',
//         'institution' => $request->input('education_details.3.institution'),
//         'qualification' => $request->input('education_details.3.qualification'),
//         'start_date' => $request->input('education_details.3.start_date'),
//         'end_date' => $request->input('education_details.3.end_date'),
//         'grade' => $request->input('education_details.3.grade')
//     ];
//     $employeeAdditionalDetail->educational_details_4 = json_encode($pgDetails);

//     // Set the user ID and save the changes
//     $employeeAdditionalDetail->user_id = $user_id;
//     $employeeAdditionalDetail->save();

//     return redirect()->back()->with('success', 'Education details added successfully.');
// }


    // public function updateEducationDetails(Request $request)
    // {
    //     // Get the authenticated user ID
    //     $user_id = auth()->user()->id;
    
    //     // Check if the user already has education details in the database
    //     $employee_additional_details = EmployeeAdditionalDetail::where('user_id', $user_id)->first();
    
    //     // Create an instance of EmployeeAdditionalDetail
    //     $employeeAdditionalDetail = new EmployeeAdditionalDetail();
    //     $employeeAdditionalDetail->user_id = $user_id;
    
    //     // Store SSLC/10th information
    //     $sslcDetails = [
    //         'level' => 'SSLC/10th',
    //         'institution' => $request->input('education_details.0.institution'),
    //         'qualification' => $request->input('education_details.0.qualification'),
    //         'start_date' => $request->input('education_details.0.start_date'),
    //         'end_date' => $request->input('education_details.0.end_date'),
    //         'grade' => $request->input('education_details.0.grade')
    //     ];
    
    //     // Store PUC/12th/Diploma information
    //     $pucDetails = [
    //         'level' => 'PUC/12th/Diploma',
    //         'institution' => $request->input('education_details.1.institution'),
    //         'qualification' => $request->input('education_details.1.qualification'),
    //         'start_date' => $request->input('education_details.1.start_date'),
    //         'end_date' => $request->input('education_details.1.end_date'),
    //         'grade' => $request->input('education_details.1.grade')
    //     ];
    
    //     // Store UG information
    //     $ugDetails = [
    //         'level' => 'UG',
    //         'institution' => $request->input('education_details.2.institution'),
    //         'qualification' => $request->input('education_details.2.qualification'),
    //         'start_date' => $request->input('education_details.2.start_date'),
    //         'end_date' => $request->input('education_details.2.end_date'),
    //         'grade' => $request->input('education_details.2.grade')
    //     ];
    
    //     // Store PG information
    //     $pgDetails = [
    //         'level' => 'PG',
    //         'institution' => $request->input('education_details.3.institution'),
    //         'qualification' => $request->input('education_details.3.qualification'),
    //         'start_date' => $request->input('education_details.3.start_date'),
    //         'end_date' => $request->input('education_details.3.end_date'),
    //         'grade' => $request->input('education_details.3.grade')
    //     ];
    
    //     // Update or create the education details for the user
    //     if ($employee_additional_details) {
    //         // Update existing record
    //         $employee_additional_details->update([
    //             'educational_details_1' => json_encode($sslcDetails),
    //             'educational_details_2' => json_encode($pucDetails),
    //             'educational_details_3' => json_encode($ugDetails),
    //             'educational_details_4' => json_encode($pgDetails)
    //         ]);
    //     } else {
    //         // Create new record
    //         $employeeAdditionalDetail->educational_details_1 = json_encode($sslcDetails);
    //         $employeeAdditionalDetail->educational_details_2 = json_encode($pucDetails);
    //         $employeeAdditionalDetail->educational_details_3 = json_encode($ugDetails);
    //         $employeeAdditionalDetail->educational_details_4 = json_encode($pgDetails);
    //         $employeeAdditionalDetail->save();
    //     }
    
    //     // Redirect back with a success message
    //     return redirect()->back()->with('success', 'Education details added successfully.');
    // }
    
    public function updateEducationDetails(Request $request)
    {
        // $user_id = auth()->id();
        $validatedData = $request->validate([
            'emp_id' => 'required',
        ]);
        
        $user_id = $validatedData['emp_id'];

        // Check if there is already an EmployeeAdditionalDetail record for the authenticated user
        $employeeAdditionalDetail = EmployeeAdditionalDetail::where('user_id', $user_id)->exists() ? 
                                    EmployeeAdditionalDetail::where('user_id', $user_id)->first() : 
                                    new EmployeeAdditionalDetail();

        // Store SSLC/10th information
        $sslcDetails = [
            'level' => 'SSLC/10th',
            'institution' => $request->input('education_details.0.institution'),
            'qualification' => $request->input('education_details.0.qualification'),
            'start_date' => $request->input('education_details.0.start_date'),
            'end_date' => $request->input('education_details.0.end_date'),
            'grade' => $request->input('education_details.0.grade')
        ];

        $employeeAdditionalDetail->educational_details_1 = json_encode($sslcDetails);

        // Store PUC/12th/Diploma information
        $pucDetails = [
            'level' => 'PUC/12th/Diploma',
            'institution' => $request->input('education_details.1.institution'),
            'qualification' => $request->input('education_details.1.qualification'),
            'start_date' => $request->input('education_details.1.start_date'),
            'end_date' => $request->input('education_details.1.end_date'),
            'grade' => $request->input('education_details.1.grade')
        ];

        $employeeAdditionalDetail->educational_details_2 = json_encode($pucDetails);

        // Store UG information
        $ugDetails = [
            'level' => 'UG',
            'institution' => $request->input('education_details.2.institution'),
            'qualification' => $request->input('education_details.2.qualification'),
            'start_date' => $request->input('education_details.2.start_date'),
            'end_date' => $request->input('education_details.2.end_date'),
            'grade' => $request->input('education_details.2.grade')
        ];

        $employeeAdditionalDetail->educational_details_3 = json_encode($ugDetails);

        // Store PG information
        $pgDetails = [
            'level' => 'PG',
            'institution' => $request->input('education_details.3.institution'),
            'qualification' => $request->input('education_details.3.qualification'),
            'start_date' => $request->input('education_details.3.start_date'),
            'end_date' => $request->input('education_details.3.end_date'),
            'grade' => $request->input('education_details.3.grade')
        ];

        $employeeAdditionalDetail->educational_details_4 = json_encode($pgDetails);

        // Set the user ID and save the changes
        $employeeAdditionalDetail->user_id = $user_id;
        $employeeAdditionalDetail->save();

        return redirect()->back()->with('success', 'Education details updated successfully.');
    }




    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\EmployeeAdditionalDetail  $employeeAdditionalDetail
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, EmployeeAdditionalDetail $employeeAdditionalDetail)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\EmployeeAdditionalDetail  $employeeAdditionalDetail
     * @return \Illuminate\Http\Response
     */
    public function destroy(EmployeeAdditionalDetail $employeeAdditionalDetail)
    {
        //
    }
}
