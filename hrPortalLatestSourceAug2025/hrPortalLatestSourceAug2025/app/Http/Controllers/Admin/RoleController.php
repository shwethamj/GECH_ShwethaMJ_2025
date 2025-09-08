<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Role;

class RoleController extends Controller
{
    public function store(Request $request)
    {
        // Validate the request data
        $validatedData = $request->validate([
            'name' => 'required|max:255',
        ]);

        // Create a new Role instance and save it to the database
        $role = new Role;
        $role->role_name = $request->name;
        $role->save();

        // Redirect back to the page with a success message
        return redirect()->back()->with('success', 'Role created successfully!');
    }
    
    public function index()
    {
        // Retrieve all roles from the database
        $roles = Role::all();

        // Pass the roles to the view
        return view('backend.roles-permissions', compact('roles'));
    }

    public function destroy(Request $request)
    {
        $role = Role::find($request->id);
        $role->delete();
        return back()->with('success',"Role has been deleted successfully!!");
    }

    public function update(Request $request)
    {
        // validate the form data
        $validatedData = $request->validate([
            'id' => 'required|integer',
            'name' => 'required|string',
        ]);

        // find the role record in the database
        $role = Role::findOrFail($validatedData['id']);

        // update the role name
        $role->role_name = $validatedData['name'];
        $role->save();

        // redirect the user back to the previous page with a success message
        return redirect()->back()->with('success', 'Role updated successfully.');
    }
}
