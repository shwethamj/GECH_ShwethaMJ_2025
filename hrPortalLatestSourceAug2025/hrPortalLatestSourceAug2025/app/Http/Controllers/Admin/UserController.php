<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Support\Facades\Mail;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use App\Notifications\NewUserNotification;
use App\Models\Role;
use App\Models\EmployeeDetail;

use App\Mail\SendUserCredentials;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    // public function index()
    // {
    //     $title = "users";
    //     $users = User::get();
    //     return view('backend.users',compact(
    //         'title','users'
    //     ));
    // }
    public function index()
    {
        $title = "users";
        $users = User::get();
        $roles = Role::with('users')->get();
        $employeeDetail = EmployeeDetail::all();

        return view('backend.users', compact('title', 'users', 'roles', 'employeeDetail'));
    }


    // public function sendEmail()
    // {
    //     $data = [
    //         'subject' => 'Email Subject',
    //         'message' => 'Email Message'
    //     ];

    //     Mail::send('emails.test', $data, function ($message) {
    //         $message->to('recipient@example.com', 'Recipient Name')->subject('Subject');
    //     });

    //     return 'Email was sent successfully.';
    // }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'name' => 'required|max:100',
            'username' => 'required|max:10',
            'email' => 'required|email',
            'password' => 'required|confirmed|max:200|min:5',
            'avatar'=>'nullable|file|image|mimes:jpg,jpeg,png,gif',
            'role'=>'required',
        ]);
        $imageName = null;
        if($request->hasFile('avatar')){
            $imageName = time().'.'.$request->avatar->extension();
            $request->avatar->move(public_path('storage/users'), $imageName);
        }
        $user = User::create([
            'name' => $request->name,
            'username' => $request->username,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'avatar' => $imageName,
            'role' => $request->role,
        ]);
        $user->notify(new NewUserNotification($user));
        return back()->with('success',"New user has been added");
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
     * 
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $this->validate($request,[
            'name' => 'required|max:100',
            'username' => 'required|max:10',
            'email' => 'required|email',
            'password' => 'nullable|confirmed|max:200|min:5',
            'avatar'=>'nullable|file|image|mimes:jpg,jpeg,png,gif',
        ]);
        $user = User::findOrFail($request->id);
        $imageName = $user->avatar;
        if($request->hasFile('avatar')){
            $imageName = time().'.'.$request->avatar->extension();
            $request->avatar->move(public_path('storage/users'), $imageName);
        }
        $password = $user->password;
        if($request->password){
           $password= Hash::make($request->password);
        }
        $user->update([
            'name' => $request->name,
            'username' => $request->username,
            'email' => $request->email,
            'password' => $password,
            'avatar' => $imageName,
            'role' => $request->role,
        ]);
        return back()->with('success',"User has been updated!!!");

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $user = User::findOrFail($request->id);
        $user->delete();
        return back()->with('success',"User has been deleted successfully!!");
    }

    public function sendCredentials(User $user)
    {
        // Send the email
        Mail::to($user->email)->send(new SendUserCredentials($user->username, $user->email, $user->visible_password));

        // You can also store the password in the database or log it, depending on your needs.

        return redirect()->back()->with('success', 'Credentials sent successfully.');
    }
}


