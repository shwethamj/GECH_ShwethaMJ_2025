<?php

namespace App\Http\Controllers\Admin;

use App\Models\Policy;
use App\Models\Department;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PolicyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $title = "Policies";
        $departments = Department::get();
       // $policies = Policy::with('department')->get();
        $policies=Policy::with('department')->whereNull('deleted_at')->orderBy('updated_at','asc')->get();
        return view('backend.policies',compact('title','departments','policies'));
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
            'name'=>'required',
            'description'=>'max:255',
            'department'=>'required',
            'files'=>'mimes:pdf'
        ]);
        $files = array();   
        if($request->hasFile('files')){
            $files = array();   
            foreach($request->files as $file){
                $fileName = time().'.'.$file->getClientOriginalExtension();
                //print_r($fileName);
                $file->move(public_path('storage/policy/'), $fileName);
                array_push($files,$fileName);
            }
        }

        Policy::create([
            'name'=>$request->name,
            'description'=>$request->description,
            'department_id'=>$request->department,
            //'file'=>$request->file,
            'files' => $files,
        ]);
      
       
        return back()->with('success',"Policy has been added successfully!!");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    // public function show(Request $request)
    // {
    //      $title = 'view policy'; 
    //      $request = Policy::where('name','=',$request)->firstOrFail();
    //         return view('backend.projects.show',compact('title','policies'));
        
    // }
    public function show($id)
    {
        $title = 'view policy';
        $policy = Policy::where('id','=',$id)->firstOrFail();
       // $request = Policy::where('name','=',$request)->firstOrFail();
        return view('backend.show',compact(
            'title','policy'
        ));
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
            'name'=>'required',
            'description'=>'max:255',
            'department'=>'required',
            'files'=>'nullable'
        ]);
       // $files = array();
    //    $files = array();   
    //     if($request->hasFile('files')){
    //         $files = array(); 
    //         $index = 0;  
    //         foreach($request->files as $file){
    //              $fileName = time().$index.'.'.$file[$index]->getClientOriginalExtension();
    //             //print_r($fileName);
    //             $file->move(public_path('storage/policy/'), $fileName);
    //             array_push($files,$fileName);
    //             $index++;
    //         }
    //     }

        $policy = Policy::findOrFail($request->id);
        $files = $policy->files;
        if(!empty($request->files)){
            $files = array();
            $index = 0;
            foreach($request->files as $file){
                $fileName = time().$index.'.'.$file[$index]->getClientOriginalExtension();
                $file[$index]->move(public_path('storage/policy/'), $fileName);
                array_push($files,$fileName);
                $index++;
            }
        }

        $policies =  Policy::find($request->id);
        $policies->update([
            'name'=>$request->name,
            'description'=>$request->description,
            'department_id'=>$request->department,
            //'file'=>$request->file,
            'files' => $files,
        ]);
        return back()->with('success',"Policy has been updated successfully!!");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $policy = Policy::find($request->id);
        $policy->delete();
        return back()->with('success',"Policy has been deleted successfully!!");
    }
}
