<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\EmployeeDetail;
use App\Models\EmployeeAdditionalDetail;
use Illuminate\Http\Request;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Storage;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

use Illuminate\Support\Facades\Log;


class EmployeeDetailController extends Controller
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
    // public function store(Request $request)
    // {
    //     $this->validate($request,[
    //         'firstname' => 'required',
    //         'lastname' => 'required',
    //         'gender' => 'required',
    //         'joining_date' => 'required',
    //         'email' => 'required|email|unique:employee_details,email,'.$request->id,
    //         'phone' => 'nullable|max:10|unique:employee_details,phone,'.$request->id,
    //         'company' => 'required|max:200',
    //         'avatar' => 'file|image|mimes:jpg,jpeg,png,gif',
    //         'department' => 'required',
    //         'designation' => 'required',
    //     ]);

    //     $imageName = null;
    //     if ($request->hasFile('avatar')){
    //         $imageName = time().'.'.$request->avatar->extension();
    //         $request->avatar->move(public_path('storage/employee_details'), $imageName);
    //     }

    //     $uuid = IdGenerator::generate(['table' => 'employee_details', 'field' => 'uuid', 'length' => 7, 'prefix' => 'EMP-']);
    //     $user_id = auth()->user()->id;

    //     $employeeDetail = EmployeeDetail::create([
    //         'uuid' => $uuid,
    //         'user_id' => $user_id,
    //         'firstname' => $request->firstname,
    //         'lastname' => $request->lastname,
    //         'gender' => $request->gender,
    //         'joining_date' => $request->joining_date,
    //         'email' => $request->email,
    //         'phone' => $request->phone,
    //         'company' => $request->company,
    //         'department_id' => $request->department,
    //         'designation_id' => $request->designation,
    //         'avatar' => $imageName,
    //     ]);

    //     return back()->with('success', 'Employee has been added');
    // }
    //Method written for Storing the Details inserted in Modal
    // public function store(Request $request)
    // {
    //     try {
    //         $this->validate($request,[
    //             'firstname' => 'required',
    //             'lastname' => 'required',
    //             'gender' => 'required',
    //             'joining_date' => 'required',
    //             'email' => 'required|email|unique:employee_details,email,'.$request->id,
    //             'phone' => 'nullable|max:10|unique:employee_details,phone,'.$request->id,
    //             'company' => 'required|max:200',
    //             'avatar' => 'file|image|mimes:jpg,jpeg,png,gif',
    //             'department' => 'required',
    //             'designation' => 'required',
    //         ]);

    //         $imageName = null;
    //         if ($request->hasFile('avatar')){
    //             $imageName = time().'.'.$request->avatar->extension();
    //             $request->avatar->move(public_path('storage/employee_details'), $imageName);
    //         }

    //         $uuid = IdGenerator::generate(['table' => 'employee_details', 'field' => 'uuid', 'length' => 7, 'prefix' => 'EMP-']);
    //         $user_id = auth()->user()->id;

    //         $employeeDetail = EmployeeDetail::create([
    //             'uuid' => $uuid,
    //             'user_id' => $user_id,
    //             'firstname' => $request->firstname,
    //             'lastname' => $request->lastname,
    //             'gender' => $request->gender,
    //             'joining_date' => $request->joining_date,
    //             'email' => $request->email,
    //             'phone' => $request->phone,
    //             'company' => $request->company,
    //             'department_id' => $request->department,
    //             'designation_id' => $request->designation,
    //             'avatar' => $imageName,
    //         ]);

    //         return back()->with('success', 'Employee has been added');
            
    //     } catch (QueryException $e) {
    //         $errorCode = $e->errorInfo[1];
    //         if ($errorCode == 1062) {
    //             // Handle the duplicate entry error
    //             return redirect()->back()->withErrors('error', 'Employee details already exist for this user.');
    //         } else {
    //             // Handle other errors
    //             return redirect()->back()->withErrors(['error' => 'Error occurred while saving employee details.'])->withInput();
    //         }
    //     }        
    // }

    public function store(Request $request)
    {
        try {
            $this->validate($request,[
                'firstname' => 'required',
                'lastname' => 'nullable',
                'gender' => 'required',
                'joining_date' => 'required',
                'email' => 'required|email|unique:employee_details,email,'.$request->id,
                'phone' => 'nullable|min:10|unique:employee_details,phone,'.$request->id,
                'company' => 'required|max:200',
                'avatar' => 'file|image|mimes:jpg,jpeg,png,gif',
                'department' => 'required',
                'designation' => 'required',
                'username' => 'required|unique:users',
                'password' => 'required|min:8|confirmed',
                'role' => 'required'
            ]);

            $imageName = null;
            if ($request->hasFile('avatar')){
                $imageName = time().'.'.$request->avatar->extension();
                $request->avatar->move(public_path('storage/employee_details'), $imageName);
            }

            $uuid = IdGenerator::generate(['table' => 'employee_details', 'field' => 'uuid', 'length' => 6, 'prefix' => 'PM-']);
            $user_id = auth()->user()->id;

            $user = User::create([
                'name' => $request->firstname.' '.$request->lastname,
                'email' => $request->email,
                'username' => $request->username,
                'password' => Hash::make($request->password),
                'visible_password' => $request->password,
                'role' => $request->role
            ]);

            $employeeDetail = EmployeeDetail::create([
                'uuid' => $uuid,
                'user_id' => $user->id,
                'firstname' => $request->firstname,
                'lastname' => $request->lastname,
                'gender' => $request->gender,
                'joining_date' => $request->joining_date,
                'email' => $request->email,
                'phone' => $request->phone,
                'company' => $request->company,
                'department_id' => $request->department,
                'designation_id' => $request->designation,
                'avatar' => $imageName,
                'role' => $request->role
            ]);

            // return back()->with('success', 'Employee has been added');
            return redirect()->route('employee-infoProfileHR', ['user_id' => $employeeDetail->user_id])->with('success', 'Employee has been added');


        // } catch (QueryException $e) {
        //     $errorCode = $e->errorInfo[1];
        //     if ($errorCode == 1062) {
        //         // Handle the duplicate entry error
        //         return redirect()->back()->withErrors('error', 'Employee details already exist for this user.');
        //     } else {
        //         // Handle other errors
        //         return redirect()->back()->withErrors(['error' => 'Error occurred while saving employee details.'])->withInput();
        //     }
        // }
            if ($user && $employeeDetail) {
                // Redirect with a success message
                return redirect()->route('employee-infoProfileHR', ['user_id' => $employeeDetail->user_id])
                    ->with('success', 'Employee has been added');
            } else {
                // Log the error
                Log::error('Error occurred while saving employee details.');
    
                // Handle the case where either User or EmployeeDetail creation failed
                return redirect()->back()->withErrors(['error' => 'Error occurred while saving employee details.'])->withInput();
            }
        } catch (QueryException $e) {
            $errorCode = $e->errorInfo[1];
            if ($errorCode == 1062) {
                // Log the duplicate entry error
                Log::error('Duplicate entry error: Employee details already exist for this user.');
    
                // Handle the duplicate entry error
                return redirect()->back()->withErrors(['error' => 'Employee details already exist for this user.']);
            } else {
                // Log other database errors
                Log::error('Database error occurred while saving employee details: ' . $e->getMessage());
    
                // Handle other database errors
                return redirect()->back()->withErrors(['error' => 'Database error occurred while saving employee details.'])->withInput();
            }
        } catch (\Exception $e) {
            // Log other exceptions
            Log::error('An unexpected error occurred: ' . $e->getMessage());
    
            // Handle other exceptions
            return redirect()->back()->withErrors(['error' => $e->getMessage()])->withInput();
        }
    }


    //Method Written for Fetching the Data from DB and to populate in Profile View
    public function viewProfileWithAdditionalInfo($user_id)
    {
        $employeeDetail = EmployeeDetail::where('user_id', $user_id)->first();
        $employeeAdditionalDetail = EmployeeAdditionalDetail::where('user_id', $user_id)->first();

        $primaryName = '';
        $primaryRelationship = '';
        $primaryPhone1 = '';
        $primaryPhone2 = '';

        $secondaryName = '';
        $secondaryRelationship = '';
        $secondaryPhone1 = '';
        $secondaryPhone2 = '';

        $eduInstituteName1 = '';
        $eduDegree1 = '';
        $eduStartDate1 = '';
        $eduEndDate1 = '';
        $eduGrade1 = '';

        $eduInstituteName2 = '';
        $eduDegree2 = '';
        $eduStartDate2 = '';
        $eduEndDate2 = '';
        $eduGrade2 = '';

        $eduInstituteName3 = '';
        $eduDegree3 = '';
        $eduStartDate3 = '';
        $eduEndDate3 = '';
        $eduGrade3 = '';

        $eduInstituteName4 = '';
        $eduDegree4 = '';
        $eduStartDate4 = '';
        $eduEndDate4 = '';      
        $eduGrade4 = '';

        if($employeeDetail && $employeeAdditionalDetail){

        $primaryContact = json_decode($employeeAdditionalDetail->primary_contact, true);
        $secondaryContact = json_decode($employeeAdditionalDetail->secondary_contact, true);

        $eduDetail1 = json_decode($employeeAdditionalDetail->educational_details_1, true);
        $eduDetail2 = json_decode($employeeAdditionalDetail->educational_details_2, true);
        $eduDetail3 = json_decode($employeeAdditionalDetail->educational_details_3, true);
        $eduDetail4 = json_decode($employeeAdditionalDetail->educational_details_4, true);

        $primaryName = $primaryContact['name'] ?? '';
        $primaryRelationship = $primaryContact['relationship'] ?? '';
        $primaryPhone1 = $primaryContact['phone1'] ?? '';
        $primaryPhone2 = $primaryContact['phone2'] ?? '';

        $secondaryName = $secondaryContact['name'] ?? '';
        $secondaryRelationship = $secondaryContact['relationship'] ?? '';
        $secondaryPhone1 = $secondaryContact['phone1'] ?? '';
        $secondaryPhone2 = $secondaryContact['phone2'] ?? '';

        $eduInstituteName1 = $eduDetail1['institution'] ?? '';
        $eduDegree1 = $eduDetail1['qualification'] ?? '';
        $eduStartDate1 = $eduDetail1['start_date'] ?? '';
        $eduEndDate1 = $eduDetail1['end_date'] ?? '';
        $eduGrade1 = $eduDetail1['grade'] ?? '';

        $eduInstituteName2 = $eduDetail2['institution'] ?? '';
        $eduDegree2 = $eduDetail2['qualification'] ?? '';
        $eduStartDate2 = $eduDetail2['start_date'] ?? '';
        $eduEndDate2 = $eduDetail2['end_date'] ?? '';
        $eduGrade2 = $eduDetail2['grade'] ?? '';

        $eduInstituteName3 = $eduDetail3['institution'] ?? '';
        $eduDegree3 = $eduDetail3['qualification'] ?? '';
        $eduStartDate3 = $eduDetail3['start_date'] ?? '';
        $eduEndDate3 = $eduDetail3['end_date'] ?? '';
        $eduGrade3 = $eduDetail3['grade'] ?? '';

        $eduInstituteName4 = $eduDetail4['institution'] ?? '';
        $eduDegree4 = $eduDetail4['qualification'] ?? '';
        $eduStartDate4 = $eduDetail4['start_date'] ?? '';
        $eduEndDate4 = $eduDetail4['end_date'] ?? '';
        $eduGrade4 = $eduDetail4['grade'] ?? '';
        }

        $userDetails = $this->editUserData($user_id);

        return view('backend.employee-infoEmp', compact('employeeDetail', 'employeeAdditionalDetail', 'primaryName', 'primaryRelationship', 'primaryPhone1', 'primaryPhone2', 'secondaryName', 'secondaryRelationship', 'secondaryPhone1', 'secondaryPhone2', 'eduInstituteName1', 'eduDegree1', 'eduStartDate1', 'eduEndDate1', 'eduInstituteName2', 'eduDegree2', 'eduStartDate2', 'eduEndDate2', 'eduInstituteName3', 'eduDegree3', 'eduStartDate3', 'eduEndDate3', 'eduInstituteName4', 'eduDegree4', 'eduStartDate4', 'eduEndDate4','userDetails','eduGrade1','eduGrade2','eduGrade3','eduGrade4'));
    }

    public function viewProfileWithAdditionalInfoForHR($user_id)
    {
        $employeeDetail = EmployeeDetail::where('user_id', $user_id)->first();
        $employeeAdditionalDetail = EmployeeAdditionalDetail::where('user_id', $user_id)->first();

        $primaryName = '';
        $primaryRelationship = '';
        $primaryPhone1 = '';
        $primaryPhone2 = '';

        $secondaryName = '';
        $secondaryRelationship = '';
        $secondaryPhone1 = '';
        $secondaryPhone2 = '';

        $eduInstituteName1 = '';
        $eduDegree1 = '';
        $eduStartDate1 = '';
        $eduEndDate1 = '';
        $eduGrade1 = '';

        $eduInstituteName2 = '';
        $eduDegree2 = '';
        $eduStartDate2 = '';
        $eduEndDate2 = '';
        $eduGrade2 = '';

        $eduInstituteName3 = '';
        $eduDegree3 = '';
        $eduStartDate3 = '';
        $eduEndDate3 = '';
        $eduGrade3 = '';

        $eduInstituteName4 = '';
        $eduDegree4 = '';
        $eduStartDate4 = '';
        $eduEndDate4 = '';  
        $eduGrade4 = '';    

        if($employeeDetail && $employeeAdditionalDetail){

        $primaryContact = json_decode($employeeAdditionalDetail->primary_contact, true);
        $secondaryContact = json_decode($employeeAdditionalDetail->secondary_contact, true);

        $eduDetail1 = json_decode($employeeAdditionalDetail->educational_details_1, true);
        $eduDetail2 = json_decode($employeeAdditionalDetail->educational_details_2, true);
        $eduDetail3 = json_decode($employeeAdditionalDetail->educational_details_3, true);
        $eduDetail4 = json_decode($employeeAdditionalDetail->educational_details_4, true);

        $primaryName = $primaryContact['name'] ?? '';
        $primaryRelationship = $primaryContact['relationship'] ?? '';
        $primaryPhone1 = $primaryContact['phone1'] ?? '';
        $primaryPhone2 = $primaryContact['phone2'] ?? '';

        $secondaryName = $secondaryContact['name'] ?? '';
        $secondaryRelationship = $secondaryContact['relationship'] ?? '';
        $secondaryPhone1 = $secondaryContact['phone1'] ?? '';
        $secondaryPhone2 = $secondaryContact['phone2'] ?? '';

        $eduInstituteName1 = $eduDetail1['institution'] ?? '';
        $eduDegree1 = $eduDetail1['qualification'] ?? '';
        $eduStartDate1 = $eduDetail1['start_date'] ?? '';
        $eduEndDate1 = $eduDetail1['end_date'] ?? '';
        $eduGrade1 = $eduDetail1['grade'] ?? '';

        $eduInstituteName2 = $eduDetail2['institution'] ?? '';
        $eduDegree2 = $eduDetail2['qualification'] ?? '';
        $eduStartDate2 = $eduDetail2['start_date'] ?? '';
        $eduEndDate2 = $eduDetail2['end_date'] ?? '';
        $eduGrade2 = $eduDetail2['grade'] ?? '';

        $eduInstituteName3 = $eduDetail3['institution'] ?? '';
        $eduDegree3 = $eduDetail3['qualification'] ?? '';
        $eduStartDate3 = $eduDetail3['start_date'] ?? '';
        $eduEndDate3 = $eduDetail3['end_date'] ?? '';
        $eduGrade3 = $eduDetail3['grade'] ?? '';

        $eduInstituteName4 = $eduDetail4['institution'] ?? '';
        $eduDegree4 = $eduDetail4['qualification'] ?? '';
        $eduStartDate4 = $eduDetail4['start_date'] ?? '';
        $eduEndDate4 = $eduDetail4['end_date'] ?? '';
        $eduGrade4 = $eduDetail4['grade'] ?? '';
    }

        // $user = $this->editUserData($user_id);
        $userDetails = $this->editUserData($user_id);

        return view('backend.employee-infoHR', compact('employeeDetail', 'employeeAdditionalDetail', 'primaryName', 'primaryRelationship', 'primaryPhone1', 'primaryPhone2', 'secondaryName', 'secondaryRelationship', 'secondaryPhone1', 'secondaryPhone2', 'eduInstituteName1', 'eduDegree1', 'eduStartDate1', 'eduEndDate1', 'eduInstituteName2', 'eduDegree2', 'eduStartDate2', 'eduEndDate2', 'eduInstituteName3', 'eduDegree3', 'eduStartDate3', 'eduEndDate3', 'eduInstituteName4', 'eduDegree4', 'eduStartDate4', 'eduEndDate4', 'userDetails','eduGrade1','eduGrade2','eduGrade3','eduGrade4'));
    }

    public function viewEmployeeInfoForGridView()
    {
        $employeeDetail = EmployeeDetail::all();
        // $employeeAdditionalDetail = EmployeeAdditionalDetail::where('user_id', $user_id)->first();

        return view('backend.employees', compact('employeeDetail'));
    }

    public function viewEmployeeInfoForListView()
    {
        $employeeDetail = EmployeeDetail::all();
        // $employeeAdditionalDetail = EmployeeAdditionalDetail::where('user_id', $user_id)->first();

        return view('backend.employees-list', compact('employeeDetail'));
    }

    public function viewEmployeeInfoForUsersBlade()
    {
        $employeeDetail = EmployeeDetail::all();
        // $employeeAdditionalDetail = EmployeeAdditionalDetail::where('user_id', $user_id)->first();

        return view('backend.users', compact('employeeDetail'));
    }

    // public function update(Request $request, $id)
    // {
    //     try {
    //         $this->validate($request,[
    //             'firstname' => 'required',
    //             'lastname' => 'required',
    //             'gender' => 'required',
    //             'joining_date' => 'required',
    //             'email' => 'required|email|unique:employee_details,email,'.$id,
    //             'phone' => 'nullable|max:10|unique:employee_details,phone,'.$id,
    //             'company' => 'required|max:200',
    //             'avatar' => 'nullable|file|image|mimes:jpg,jpeg,png,gif',
    //             'department' => 'required',
    //             'designation' => 'required',
    //         ]);

    //         $employeeDetail = EmployeeDetail::findOrFail($id);

    //         $imageName = $employeeDetail->avatar;
    //         if ($request->hasFile('avatar')){
    //             // If a new avatar is uploaded, delete the old one
    //             if ($imageName) {
    //                 Storage::delete('public/employee_details/' . $imageName);
    //             }

    //             $imageName = time().'.'.$request->avatar->extension();
    //             $request->avatar->storeAs('public/employee_details', $imageName);
    //         }

    //         $employeeDetail->firstname = $request->firstname;
    //         $employeeDetail->lastname = $request->lastname;
    //         $employeeDetail->gender = $request->gender;
    //         $employeeDetail->joining_date = $request->joining_date;
    //         $employeeDetail->email = $request->email;
    //         $employeeDetail->phone = $request->phone;
    //         $employeeDetail->company = $request->company;
    //         $employeeDetail->department_id = $request->department;
    //         $employeeDetail->designation_id = $request->designation;
    //         $employeeDetail->avatar = $imageName;
    //         $employeeDetail->save();

    //         return back()->with('success', 'Employee details have been updated');

    //     } catch (QueryException $e) {
    //         $errorCode = $e->errorInfo[1];
    //         if ($errorCode == 1062) {
    //             // Handle the duplicate entry error
    //             return redirect()->back()->withErrors('error', 'Employee details already exist for this user.');
    //         } else {
    //             // Handle other errors
    //             return redirect()->back()->withErrors(['error' => 'Error occurred while updating employee details.'])->withInput();
    //         }
    //     }
    // }

    public function updateBasicData(Request $request)
    {
        // Validate the form data
        $validatedData = $request->validate([
            'email' => 'required|email',
            'phone' => 'required|min:10',
            'avatar' => 'image|max:2048', // Maximum file size of 2MB
            'emp_id' => 'required',
        ]);

        // Get the authenticated user's EmployeeDetail record
        $employee = EmployeeDetail::byUserId(Auth::id());

        // Update the fields with the form data
        $employee->email = $validatedData['email'];
        $employee->phone = $validatedData['phone'];

        $user = User::where('id', $validatedData['emp_id'])->first();

        $user->update([
            'email' => $validatedData['email']
        ]);


        // Handle file upload for the profile picture, if any
        // if ($request->hasFile('avatar')) {
        //     // Delete the old avatar file if it exists
        //     if ($employee->avatar) {
        //         Storage::delete('public/employee_details/' . $employee->avatar);
        //     }
            
        //     // Upload the new avatar file and update the avatar field
        //     $avatar = $request->file('avatar');
        //     $avatar_path = $avatar->store('public/employee_details');
        //     $employee->avatar = basename($avatar_path);
        // }
        // if ($request->hasFile('avatar')) {

        //     // Delete the old avatar file if it exists
        //     if ($employee->avatar) {
        //         File::delete(public_path('storage/employee_details/' . $employee->avatar));
        //     }
        
        //     // Upload the new avatar file and update the avatar field
        //     $avatar = $request->file('avatar');
        //     $imageName = time().'.'.$avatar->extension();
        //     $avatar->move(public_path('storage/employee_details'), $imageName);
        //     $employee->avatar = $imageName;
        // }        
        if ($request->hasFile('avatar')) {
            // Delete the old avatar file if it exists
            if ($employee->avatar) {
                Storage::delete('storage/employee_details/' . $employee->avatar);
            }
            // Upload the new avatar file and update the avatar field
            $avatar = $request->file('avatar');
            $imageName = time().'.'.$avatar->getClientOriginalExtension();
            $avatar->move(public_path('storage/employee_details'), $imageName);
            $employee->avatar = $imageName;
        }        

        // Save the updated record
        $employee->save();

        // Redirect back to the profile page
        return redirect()->back();
    }

    //method created for updating basic details for HR view
    // public function updateHRBasicData(Request $request)
    // {
    //     // Validate the form data
    //     $validatedData = $request->validate([
    //         'firstname' => 'required',
    //         'lastname' => 'required',
    //         'gender' => 'required',
    //         'joining_date' => 'required',
    //         'email' => 'required|email',
    //         'phone' => 'required|numeric',
    //         'company' => 'required|max:200',
    //         'department' => 'required',
    //         'designation' => 'required',
    //         'avatar' => 'image|max:2048', // Maximum file size of 2MB
    //     ]);

    //     // Get the authenticated user's EmployeeDetail record
    //     $employee = EmployeeDetail::byUserId(Auth::id());
        

    //     // Update the fields with the form data
    //     $employee->firstname = $validatedData['firstname'];
    //     $employee->lastname = $validatedData['lastname'];
    //     $employee->gender = $validatedData['gender'];
    //     $employee->joining_date = $validatedData['joining_date'];
    //     $employee->email = $validatedData['email'];
    //     $employee->phone = $validatedData['phone'];
    //     $employee->company = $validatedData['company'];
    //     $employee->department_id = $validatedData['department'];
    //     $employee->designation_id = $validatedData['designation'];
        
    //     if ($request->hasFile('avatar')) {
    //         // Delete the old avatar file if it exists
    //         if ($employee->avatar) {
    //             Storage::delete('storage/employee_details/' . $employee->avatar);
    //         }
    //         // Upload the new avatar file and update the avatar field
    //         $avatar = $request->file('avatar');
    //         $imageName = time().'.'.$avatar->getClientOriginalExtension();
    //         $avatar->move(public_path('storage/employee_details'), $imageName);
    //         $employee->avatar = $imageName;
    //     }        

    //     // Save the updated record
    //     $employee->save();

    //     // Redirect back to the profile page
    //     return redirect()->back();
    // }

    public function updateHRBasicData(Request $request)
{
    // Validate the form data
    $validatedData = $request->validate([
        'firstname' => 'required',
        'lastname' => 'nullable',
        'gender' => 'required',
        'joining_date' => 'required',
        'email' => 'required|email',
        'phone' => 'required|min:10',
        'company' => 'required|max:200',
        'department' => 'required',
        'designation' => 'required',
        'avatar' => 'image|max:2048', // Maximum file size of 2MB
        'username' => 'required',
        'password' => 'required',
        'role' => 'required',
        'emp_id' => 'required',
        'emp-id' => 'required'
    ]);

    // Get the authenticated user's EmployeeDetail record
    // $employee = EmployeeDetail::byUserId(Auth::id());
    

    $employee = EmployeeDetail::byUserId($validatedData['emp_id']);

    
    // Update the fields with the form data
    $employee->firstname = $validatedData['firstname'];
    $employee->lastname = $validatedData['lastname'];
    $employee->gender = $validatedData['gender'];
    $employee->joining_date = $validatedData['joining_date'];
    $employee->email = $validatedData['email'];
    $employee->phone = $validatedData['phone'];
    $employee->company = $validatedData['company'];
    $employee->department_id = $validatedData['department'];
    $employee->designation_id = $validatedData['designation'];
    $employee->role = $validatedData['role'];
    $employee->uuid = $validatedData['emp-id'];


    if ($request->hasFile('avatar')) {
        // Delete the old avatar file if it exists
        if ($employee->avatar) {
            Storage::delete('storage/employee_details/' . $employee->avatar);
        }
        // Upload the new avatar file and update the avatar field
        $avatar = $request->file('avatar');
        $imageName = time().'.'.$avatar->getClientOriginalExtension();
        $avatar->move(public_path('storage/employee_details'), $imageName);
        $employee->avatar = $imageName;
    }        

    // Save the updated EmployeeDetail record
    $employee->save();

    // Update the authenticated user's fields with the form data
    //$user = Auth::user();
    $user = User::where('id', $validatedData['emp_id'])->first();
    // $user->update([
    //     'name' => $validatedData['firstname'] . ' ' . $validatedData['lastname'],
    //     'email' => $validatedData['email'],
    //     'username' => $validatedData['username'],
    //     'password' => $validatedData['password'],
    //     'visible_password' => $validatedData['password'],
    //     'role' => $validatedData['role']
    // ]);
    $user->update([
        'name' => $validatedData['firstname'] . ' ' . $validatedData['lastname'],
        'email' => $validatedData['email'],
        'username' => $validatedData['username'],
        'password' => password_hash($validatedData['password'], PASSWORD_DEFAULT),
        'visible_password' => $validatedData['password'],
        'role' => $validatedData['role']
    ]);


    // Redirect back to the profile page
    return redirect()->back();
}


    // public function editUserData($userId)
    // {
    //     // Debug: print the value of $userId to the console
    //     Log::info("User ID: " . $userId);

    //     // Get the User record by ID
    //     $user = User::find($userId);
    //     Log::info("Username: " . $user->username);
    //     // Debug: print the value of $user to the console
    //     // dd($user);
    
    //     // Pass the user data to the view
    //     return view('backend.employee-infoHR', ['user' => $user]);
    // }
    public function editUserData($userId)
    {
        // Debug: print the value of $userId to the console
        Log::info("User ID: " . $userId);

        // Get the User record by ID
        $userDetails = User::find($userId);

        // Debug: print the value of $userDetails to the console
        // dd($userDetails);
        
        // Pass the user data to the view
        // return view('backend.employee-infoHR', ['userDetails' => $userDetails]);
        // return ['userDetails' => $userDetails];
        return collect(['userDetails' => $userDetails])->first();
    }

    
    /**
     * Display the specified resource.
     *
     * @param  \App\Models\EmployeeDetail  $employeeDetail
     * @return \Illuminate\Http\Response
     */
    public function show(EmployeeDetail $employeeDetail)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\EmployeeDetail  $employeeDetail
     * @return \Illuminate\Http\Response
     */
    public function edit(EmployeeDetail $employeeDetail)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\EmployeeDetail  $employeeDetail
     * @return \Illuminate\Http\Response
     */
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\EmployeeDetail  $employeeDetail
     * @return \Illuminate\Http\Response
     */
    public function destroy(EmployeeDetail $employeeDetail)
    {
        //
    }
}





// 8050577898  -- New number_format
// change bg-color