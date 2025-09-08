<?php

namespace App\Http\Controllers\Admin;

use App\Models\Employee;
use App\Models\Department;
use App\Models\Designation;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use Illuminate\Database\Eloquent\SoftDeletes;

class EmployeeController extends Controller
{
    use SoftDeletes;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $title="employees";
        $designations = Designation::get();
        $departments = Department::get();
         // $clients = Client::whereNull('deleted_at')->orderBy('created_at','desc')->get();
        $employees = Employee::with('department','designation')->whereNull('deleted_at')->orderBy('created_at','desc')->get();
           $employees = Employee::with('department','designation')->whereNull('deleted_at')->orderBy('updated_at','desc')->get();
        return view('backend.employees',
        compact('title','designations','departments','employees'));
    }

    /**
    * Display a listing of the resource.
    *
    * @return \Illuminate\Http\Response
    */
   public function list()
   {
       $title="employees";
       $designations = Designation::get();
       $departments = Department::get();
         $employees = Employee::with('department','designation')->whereNull('deleted_at')->orderBy('updated_at','asc')->get();
       //$employees = Employee::with('department','designation')->whereNull('deleted_at')->get();
       return view('backend.employees-list',
       compact('title','designations','departments','employees'));
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
            'firstname'=>'required',
          //  'lastname'=>'required',           //Changes made for Lastname required error
            'email'=>'required|email|unique:employees,email,'.$request->id,
            'phone'=>'required|nullable|max:10|unique:employees,phone,'.$request->id,
            'company'=>'required|max:200',
            'avatar'=>'file|image|mimes:jpg,jpeg,png,gif',
            'department'=>'required',
            'designation'=>'required',
             'join_date'=>'required',
        ],[
            'firstname.required' => 'First Name cannot be empty',
            'lastname.required' => 'Last Name cannot be empty',
            'email.required' => 'Email cannot be empty',
            'email.unique' => 'Email Already exists',
            // 'phone.required' => 'Invalid Phone Number format',
            'join_date.required'=>'Join date cannot be empty',
        ]);
        $imageName = Null;
        if ($request->hasFile('avatar')){
            $imageName = time().'.'.$request->avatar->extension();
            $request->avatar->move(public_path('storage/employees'), $imageName);
        }
        $uuid = IdGenerator::generate(['table' => 'employees','field'=>'uuid', 'length' => 7, 'prefix' =>'EMP-']);
        Employee::create([
            'uuid' =>$uuid,
            'firstname'=>$request->firstname,
            'lastname'=>$request->lastname,
            'email'=>$request->email,
            'phone'=>$request->phone,
            'company'=>$request->company,
            'department_id'=>$request->department,
            'designation_id'=>$request->designation,
            'avatar'=>$imageName,
            'join_date' => $request->join_date,
        ]);
        return back()->with('success',"Employee has been added");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $this->validate($request,[
            'firstname'=>'required',
            //'lastname'=>'required',           //Changes made for Lastname required error
            'email'=>'required|email|unique:employees,email,'.$request->id,
            'phone'=>'required|nullable|max:10|unique:employees,phone,'.$request->id,
            'company'=>'required|max:200',
            'avatar'=>'file|image|mimes:jpg,jpeg,png,gif',
            'department'=>'required',
            'designation'=>'required',
             'join_date'=>'required',
        ],[
            'firstname.required' => 'First Name cannot be empty',
            'lastname.required' => 'Last Name cannot be empty',
            'email.required' => 'Email cannot be empty',
            'email.unique' => 'Email Already exists',
            // 'phone.required' => 'Invalid Phone Number format',
             'join_date.required'=>'Join date cannot br empty',
        ]);
      
        $employee = Employee::find($request->id);
        $employee->firstname = $request->firstname;
        $employee->lastname = $request->lastname;
        $employee->email = $request->email;
        $employee->phone = $request->phone;
        $employee->company = $request->company;
        $employee->department_id = $request->department;
        $employee->designation_id = $request->designation;
        $employee->join_date= $request->join_date;
           if ($request->hasFile('avatar')){
            $imageName = time().'.'.$request->avatar->extension();
            $request->avatar->move(public_path('storage/employees'), $imageName);
            $employee->avatar = $imageName;
        }
        $employee->save();
       
        return back()->with('success',"Employee has been updated");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $employee = Employee::find($request->id);
        $employee->delete();
        return back()->with('success',"Employee has been deleted");
    }
}


// https://stackoverflow.com/questions/40067212/how-to-return-custom-error-message-from-controller-method-validation