<?php

namespace App\Http\Controllers\Admin;

use App\Models\Client;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Haruncpi\LaravelIdGenerator\IdGenerator;

class ClientController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $title="clients";
       // $clients=Client::whereNull('deleted_at')->get();
         // $clients = Client::whereNull('deleted_at')->orderBy('updated_at', 'asc')->get();
            $clients = Client::whereNull('deleted_at')->orderBy('created_at','desc')->get();
             $clients = Client::whereNull('deleted_at')->orderBy('updated_at','desc')->get();
        return view('backend.clients',compact('title','clients'));
       // $clients = Client::whereNull('deleted_at')->orderBy('updated_at', 'desc')->get();
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function lists(){
        $title="clients";
       // $clients=Client::whereNull('deleted_at')->get();
       $clients = Client::whereNull('deleted_at')->orderBy('updated_at', 'asc')->get();
        return view('backend.clients-list',compact('title','clients'));
       // $clients = Client::whereNull('deleted_at')->orderBy('updated_at', 'desc')->get();
    }
    /**
     *
    *
    * @param \Illuminate\Http\Request $request
    * @return \Illuminate\Http\Response
    */
    public function store(Request $request)
    {
        $this->validate($request,[
            'firstname'=>'required',
          //  'lastname'=>'required',
            'email'=>'required|email|unique:clients,email',
            'phone'=>'required|nullable|max:15|unique:clients,phone',
            'avatar'=>'required|file|image|mimes:jpg,jpeg,png,gif',
             'company'=>'required',
             'status'=>'required',
            'start_date' => 'required',
            'project_title' => 'required',
            'project_type' =>'required',
            'project_spoc' =>'required',
            'location'=>'required',
        ]
        ,[
            
         'phone.required' => 'Phone number can not be empty',
            'avatar.required'=>'Please Upload Images',
            'company.required'=>'Comapny name can not be empty'
        ]);
        $imageName = null;
        if($request->avatar != null){
        $imageName = time().'.'.$request->avatar->extension();
        $request->avatar->move(public_path('storage/clients'), $imageName);
        }
          $client = Client::find($request->id);
       // $uuid = IdGenerator::generate(['table' => 'clients','field'=>'uuid', 'length' => 7, 'prefix' =>'CLT-']);
        $client = Client::create([
            //'uuid' =>$uuid,
            'firstname'=>$request->firstname,
            'lastname'=>$request->lastname,
            'email'=>$request->email,
            'phone'=>$request->phone,
            'company'=>$request->company,
            'avatar'=>$imageName,
            
            'status'=>$request->status,
            'start_date' =>$request->start_date,
            'project_title' =>$request->project_title,
            'project_type' =>$request->project_type,
            'project_spoc' =>$request->project_spoc,
            'location'=>$request->location,
        ]);
        return back()->with('success','Client has been added successfully!!!');
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
    */
  public function show($id)
    {
        $title = 'view client';
        $client = Client::where('id','=',$id)->firstOrFail();
        return view('backend.clients-profile',compact(
            'title','client'
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
            'firstname'=>'required',
          //  'lastname'=>'required',
            'email'=>'required',
            'phone'=>'nullable|max:15',
            'avatar'=>'file|image|mimes:jpg,jpeg,png,gif',
             'company'=>'required',
               'status'=>'required',
            'start_date' => 'required',
            'project_title' => 'required',
            'project_type' =>'required',
            'project_spoc' =>'required',
            'location'=>'required',
        ]
        ,[
            
         'phone.required' => 'Phone number can not be empty',
           // 'avatar.required'=>'Please Upload Images',
            'company.required'=>'Company name can not be empty'
        ]);   
        // $imageName = null;
        // if($request->hasFile('avatar')){
        //     $imageName = time().'.'.$request->avatar->extension();
        //     $request->avatar->move(public_path('storage/clients'), $imageName);
        // }
        
         
        if ($request->hasFile('avatar')){
            $imageName = time().'.'.$request->avatar->extension();
            $request->avatar->move(public_path('storage/clients'), $imageName);
        }else{
            $imageName = Null;
        }
        $client = Client::find($request->id);
        $client->update([
            'firstname'=>$request->firstname,
            'lastname'=>$request->lastname,
            'email'=>$request->email,
            'phone'=>$request->phone,
            'company'=>$request->company,
            'avatar'=>$imageName,
            'status'=>$request->status,
            'start_date' =>$request->start_date,
            'project_title' =>$request->project_title,
            'project_type' =>$request->project_type,
            'project_spoc' =>$request->project_spoc,
            'location'=>$request->location,
        ]);
        return
        back()->with('success','Client has been updated successfully!!!');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $client = Client::find($request->id);
        $client->delete();
        return back()->with('success',"Client has been deleted");
    }
}