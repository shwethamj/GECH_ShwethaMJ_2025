<?php

namespace App\Http\Controllers\Admin;

use App\Models\Holiday;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\HolidayRequest;

class HolidayController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $title = "holidays";
       // $holidays = Holiday::get();
            $holidays = Holiday::whereNull('deleted_at')->orderBy('updated_at','asc')->get();
        return view('backend.holidays',compact('title','holidays'));
    }

    public function completed(Request $request,Holiday $holiday){
    //    $holiday = Holiday::find($request->id);
       $holiday->update([
           'completed'=>1,
       ]);
       return back()->with('success',"Holiday marked as complete");
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(HolidayRequest $request)
    {
        //  $this->validate($request,[
        //     'name'=>'required',
        //     'holiday_date'=>'required|nullable|max:10|unique:holiday_date,'.$request->id,
           
        // ],[
        //     'name.required' => ' Name cannot be empty',
          
            // 'holiday_date.unique' => 'Holiday date Already exists',
            // 'phone.required' => 'Invalid Phone Number format',
            
        //]);
        Holiday::create($request->all());
        return back()->with('success',"Holiday Has Been Successfully added.");
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
        $holiday = Holiday::find($request->id);
        $holiday->update([
            'name'=>$request->name,
            'holiday_date'=>$request->holiday_date,
        ]);
        return back()->with('success',"Holiday has been updated successfully!!");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $holiday = Holiday::find($request->id);
        $holiday->delete();
        return back()->with('success',"Holiday has been deleted successfully!!");
    }
}
