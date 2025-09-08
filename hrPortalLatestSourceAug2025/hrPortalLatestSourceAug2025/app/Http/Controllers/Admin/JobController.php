<?php

namespace App\Http\Controllers\Admin;

use App\Models\Job;
use App\Models\Department;
use App\Models\JobApplicant;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class JobController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $title = "jobs";
        $departments = Department::get();
       // $jobs = Job::with('department')->get();
          $jobs=Job::with('department')->whereNull('deleted_at')->orderBy('updated_at','asc')->get();
        return view('backend.jobs',compact(
            'title','jobs','departments'
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
            'title'=>'required',
            'department_id'=>'required',
            'location'=>'required',
            'vacancies'=>'required',
            'experience'=>'required',
            'age'=>'nullable',
            'salary_from'=>'nullable',
            'salary_to'=>'nullable',
            'type'=>'required',
            'status'=>'required',
            'start_date'=>'required',
            'expire_date'=>'required',
            'description'=>'required',
        ]);
        Job::create($request->all());
        return back()->with('success',"Job has been added Posted!!");
    }

    public function applicants(){
        $title = 'Job Applicants';
        $applicants = JobApplicant::with('Job')->latest()->get();
        return view('backend.job-applicants',compact(
            'title','applicants'
        ));
    }

    public function downloadCv(Request $request){
        $pathToFile = public_path('storage/cv/'. $request->cv);
        return response()->download($pathToFile)->with('success',"Applicant cv has been downloaded");
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
            'title'=>'required',
            'department'=>'required',
            'location'=>'required',
            'vacancies'=>'required',
            'experience'=>'required',
            'age'=>'nullable',
            'salary_from'=>'nullable',
            'salary_to'=>'nullable',
            'type'=>'required',
            'status'=>'required',
            'start_date'=>'required',
            'expire_date'=>'required',
            'description'=>'required',
        ]);
        //Job::update($request->all());
        $job = Job::findOrFail($request->id);
        $job->update([
            'title' => $request->title,
            'department' => $request->department,
            'location' => $request->location,
            'vacancies' => $request->vacancies,
            'experience' => $request->experience,
            'age' => $request->age,
            'salary_from' => $request->salary_from,
            'salary_to' => $request->salary_to,
            'type' => $request->type,
            'status' => $request->status,
            'start_date' => $request->start_date,
            'expire_date' => $request->expire_date,
            'description' => $request->description,
        ]);
        return back()->with('success',"Job has been Updated!!");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    // public function destroy(Request $request)
    // {
    //     Job::findOrFail($request->id)->delete();
    //     $notification = notify('job has been deleted');
    //     return back()->with($notification);
    // }
      public function destroy(Request $request)
    {
        $job = Job::find($request->id);
        $job->delete();
        return back()->with('success',"Job has been deleted successfully!!");
    }
}
