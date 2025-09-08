<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\OvertimeController;
use App\Http\Controllers\Admin\GoalController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Admin\AssetController;
use App\Http\Controllers\Admin\TaxesController;
use App\Http\Controllers\Auth\LogoutController;
use App\Http\Controllers\Admin\ClientController;
use App\Http\Controllers\Admin\PolicyController;
use App\Http\Controllers\Admin\TicketController;
use App\Http\Controllers\Frontend\JobController;
use App\Http\Controllers\Admin\BackupsController;
use App\Http\Controllers\Admin\ContactController;
use App\Http\Controllers\Admin\ExpenseController;
use App\Http\Controllers\Admin\HolidayController;
use App\Http\Controllers\Admin\ProjectController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Admin\ActivityController;
use App\Http\Controllers\Admin\EmployeeController;
use App\Http\Controllers\Admin\GoalTypeController;
use App\Http\Controllers\Admin\SettingsController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\LeaveTypeController;
use App\Http\Controllers\Admin\DepartmentController;
use App\Http\Controllers\Admin\DesignationController;
use App\Http\Controllers\Admin\FileManagerController;
use App\Http\Controllers\Admin\UserProfileController;
use App\Http\Controllers\Admin\EmployeeLeaveController;
use App\Http\Controllers\Admin\ProvidentFundController;
use App\Http\Controllers\Auth\ForgotPasswordController;
use App\Http\Controllers\Admin\ChangePasswordController;
use App\Http\Controllers\Frontend\JobApplicationController;
use App\Http\Controllers\Admin\EmployeeAttendanceController;
use App\Http\Controllers\Admin\InvoiceController;
use App\Http\Controllers\Admin\JobController as BackendJobController;
use App\Http\Controllers\Admin\EmpAttendanceController;
use App\Http\Controllers\Admin\LeaveRequestController;
use App\Models\Attendance;
use App\Models\LeaveType;
use App\Http\Controllers\Admin\EmployeeDetailController;
use App\Http\Controllers\Admin\EmployeeAdditionalDetailController;
use Illuminate\Http\Request;
use App\Models\EmployeeAdditionalDetail;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\ClientMeetingController;

use App\Http\Controllers\CacheController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::group(['middleware'=>['guest']], function (){
    Route::get('register',[RegisterController::class,'index'])->name('register');
    Route::post('register',[RegisterController::class,'store']);
    Route::get('login',[LoginController::class,'index'])->name('login');
    Route::post('login',[LoginController::class,'login']);

    Route::get('forgot-password',[ForgotPasswordController::class,'index'])->name('forgot-password');
    Route::post('forgot-password',[ForgotPasswordController::class,'reset']);

    Route::get('reset-password/{token}', [ResetPasswordController::class, 'index'])->name('reset-password');
    Route::post('reset-password', [ResetPasswordController::class, 'update']);

});

Route::get('job-list',[JobController::class,'index'])->name('job-list');
Route::get('job-view/{job}',[JobController::class,'show'])->name('job-view');
Route::post('apply',[JobApplicationController::class,'store'])->name('apply-job');


Route::group(['middleware'=>['auth']], function (){
    
    Route::get('dashboard',[DashboardController::class,'index'])->name('dashboard');
    Route::post('logout',[LogoutController::class,'index'])->name('logout');

    //apps routes
    
    Route::get('contacts',[ContactController::class,'index'])->name('contacts');
    Route::post('contacts',[ContactController::class,'store']);
    Route::put('contacts',[ContactController::class,'update']);
    Route::delete('contacts',[ContactController::class,'destroy'])->name('contact.destroy');
    Route::get('file-manager',[FileManagerController::class,'index'])->name('filemanager');

    Route::get('holidays',[HolidayController::class,'index'])->name('holidays');
    Route::post('holidays',[HolidayController::class,'store']);
    Route::post('holidays/{holiday}',[HolidayController::class,'completed'])->name('completed');
    Route::put('holidays',[HolidayController::class,'update']);
    Route::delete('holidays',[HolidayController::class,'destroy'])->name('holiday.destroy');


    Route::get('departments',[DepartmentController::class,'index'])->name('departments');
    Route::post('departments',[DepartmentController::class,'store']);
    Route::put('departments',[DepartmentController::class,'update']);
    Route::delete('departments',[DepartmentController::class,'destroy'])->name('department.destroy');

    Route::get('designations',[DesignationController::class,'index'])->name('designations');
    Route::put('designations',[DesignationController::class,'update']);
    Route::post('designations',[DesignationController::class,'store']);
    Route::delete('designations',[DesignationController::class,'destroy'])->name('designation.destroy');

    // settings routes 
    Route::get('settings/theme',[SettingsController::class,'index'])->name('settings.theme');
    Route::post('settings/theme',[SettingsController::class,'updateTheme']);
    Route::get('settings/company',[SettingsController::class,'company'])->name('settings.company');
    Route::post('settings/company',[SettingsController::class,'updateCompany']);
    Route::get('settings/invoice',[SettingsController::class,'invoice'])->name('settings.invoice');
    Route::post('settings/invoice',[SettingsController::class,'updateInvoice']);
    Route::get('settings/attendance',[SettingsController::class,'attendance'])->name('settings.attendance');
    Route::post('settings/attendance',[SettingsController::class,'updateAttendance']);
    Route::get('change-password',[ChangePasswordController::class,'index'])->name('change-password');
    Route::post('change-password',[ChangePasswordController::class,'update']);

    Route::get('leave-type',[LeaveTypeController::class,'index'])->name('leave-type');
    Route::post('leave-type',[LeaveTypeController::class,'store']);
    Route::delete('leave-type',[LeaveTypeController::class,'destroy'])->name('leave-type.destroy');
    Route::put('leave-type',[LeaveTypeController::class,'update']);

    Route::get('policies',[PolicyController::class,'index'])->name('policies');
    Route::post('policies',[PolicyController::class,'store']);
    Route::delete('policies',[PolicyController::class,'destroy'])->name('policy.destroy');

    Route::get('/policies/{policy_id}', [PolicyController::class, 'show'])->name('policy-show');

    Route::resource('invoices',InvoiceController::class)->except('destroy');
    Route::delete('invoices',[InvoiceController::class,'destroy'])->name('invoices.destroy');

    Route::get('expenses',[ExpenseController::class,'index'])->name('expenses');
    Route::post('expenses',[ExpenseController::class,'store']);
    Route::put('expenses',[ExpenseController::class,'update']);
    Route::delete('expenses',[ExpenseController::class,'destroy']);

    Route::get('provident-fund',[ProvidentFundController::class,'index'])->name('provident-fund');
    Route::post('provident-fund',[ProvidentFundController::class,'store']);
    Route::put('provident-fund',[ProvidentFundController::class,'update']);
    Route::delete('provident-fund',[ProvidentFundController::class,'destroy']);

    Route::get('taxes',[TaxesController::class,'index'])->name('taxes');
    Route::post('taxes',[TaxesController::class,'store']);
    Route::put('taxes',[TaxesController::class,'update']);
    Route::delete('taxes',[TaxesController::class,'destroy']);

    Route::get('clients',[ClientController::class,'index'])->name('clients');
    // Route::get('clients',[ClientController::class,'index'])->name('clients.show');
    Route::post('clients',[ClientController::class,'store'])->name('client.add');
    Route::put('clients',[ClientController::class,'update'])->name('client.update');
    Route::delete('clients',[ClientController::class,'destroy'])->name('client.destroy');
    Route::get('clients-list',[ClientController::class,'lists'])->name('clients-list');
    
    // Route::view('/clients-profile', 'backend.clients-profile')->name('clients-profile');
    Route::get('/clients/{client_id}', [App\Http\Controllers\Admin\ClientController::class, 'show'])->name('clients-profile');


    
    Route::get('/clients-leads', [ClientMeetingController::class, 'showMeetings'])->name('clients-leads');
    Route::post('/client-meetings', [ClientMeetingController::class, 'store'])->name('client-meetings.store');
    Route::put('/clients-meetings', [ClientMeetingController::class, 'update'])->name('client-meetings.update');
    Route::get('/client-meetings/{id}', [ClientMeetingController::class, 'edit'])->name('client-meetings.edit');
    Route::delete('/clients-meetings/delete', [ClientMeetingController::class, 'destroy'])->name('client-meetings.destroy');


    // Route::get('employees',[EmployeeController::class,'index'])->name('employees');
    Route::get('employees',[EmployeeDetailController::class,'viewEmployeeInfoForGridView'])->name('employees');
    Route::post('employees',[EmployeeController::class,'store'])->name('employee.add');
    Route::get('employees-list',[EmployeeDetailController::class,'viewEmployeeInfoForListView'])->name('employees-list');
    Route::put('employees',[EmployeeController::class,'update'])->name('employee.update');
    Route::delete('employees',[EmployeeController::class,'destroy'])->name('employee.destroy');

    //route created for employee-info
    // Route::view('/employee-info/HR', 'backend.employee-infoHR')->name('employee-infoHR');
    Route::post('/employee-info/HR/store', [App\Http\Controllers\Admin\EmployeeDetailController::class, 'store'])->name('employee-infoHR.store');

    //route created for storing the values in db
    Route::view('/employee-info/Emp', 'backend.employee-infoEmp')->name('employee-infoEmp');
    
    //route created for fetching the data from db to populate that in profile_view
    // Route::get('/employee-info/Emp/{user_id}', [App\Http\Controllers\Admin\EmployeeDetailController::class, 'viewProfile'])->name('employee-infoEmp');
    
    //route created for updating the basic details in emp_profile_view
    Route::put('/employee-info/updateBasicData', [App\Http\Controllers\Admin\EmployeeDetailController::class, 'updateBasicData'])->name('employee-infoHR.updateBasicData');

    //route created for updating the complete basic details for hr view
    Route::put('/employee-info/updateBasicDataHR', [App\Http\Controllers\Admin\EmployeeDetailController::class, 'updateHRBasicData'])->name('employee-infoHR.updateBasicDataHR');
    
    //route created for both update and create functionality for personal details block
    Route::post('/employee-info/Emp/additional-details', [App\Http\Controllers\Admin\EmployeeAdditionalDetailController::class, 'store'])->name('employee-info.additional-details.store');

    //route created for storing the emergency contact details in JSON format
    Route::post('/employee-info/Emp/emergency-contact', [App\Http\Controllers\Admin\EmployeeAdditionalDetailController::class, 'updateEmergencyContacts'])->name('employee-info.emergency-contact.store');

    //route created for storing the bank details
    Route::post('/employee-info/Emp/bank-details', [App\Http\Controllers\Admin\EmployeeAdditionalDetailController::class, 'updateBankDetails'])->name('employee-info.bank-details.store');

    //route created for storing the education details in JSON format
    Route::post('/employee-info/Emp/education-details', [App\Http\Controllers\Admin\EmployeeAdditionalDetailController::class, 'updateEducationDetails'])->name('employee-info.education-details.store');
    
    //route created for populating personal details data to view
    // Route::get('/employee-info/Emp/additional-info/{user_id}', [App\Http\Controllers\Admin\EmployeeAdditionalDetailController::class, 'additionalProfileView'])->name('employee-additional-infoEmp');

    //route created to test whether both the details are fetched from 2 different tables and populating it to same route and view file
    Route::get('/employee-info/Emp/{user_id}', [App\Http\Controllers\Admin\EmployeeDetailController::class, 'viewProfileWithAdditionalInfo'])->name('employee-infoEmp');
    Route::get('/employee-info/HR/{user_id}', [App\Http\Controllers\Admin\EmployeeDetailController::class, 'viewProfileWithAdditionalInfoForHR'])->name('employee-infoProfileHR');


    Route::get('employees/attendance',[EmployeeAttendanceController::class,'index'])->name('employees.attendance');
    Route::post('employees/attendance',[EmployeeAttendanceController::class,'store']);
    Route::put('employees/attendance',[EmployeeAttendanceController::class,'update']);
    Route::delete('employees/attendance',[EmployeeAttendanceController::class,'destroy']);

    Route::get('/employee-attendance', function () {
        $user = Auth::user();
        $attendance = Attendance::where('user_id', $user->id)->whereDate('attendance_date', today())->first();
        return view('backend.employee-attendance', compact('attendance'));
    })->name('employee_attendance');    

    Route::post('/attendance/punch-clock', [EmpAttendanceController::class, 'punchClock'])->name('attendance.punchClock');

    Route::get('/export-attendance', [EmpAttendanceController::class, 'exportAttendance'])->name('export.attendance');
    
    Route::get('/export-all-attendance', [EmpAttendanceController::class, 'exportAllAttendance'])->name('export.all.attendance');

    //Route added for New page HR attendance 
    Route::get('/hr-attendance', function () {
        $users = \App\Models\User::get();
        return view('backend.hr-attendance', compact('users'));
    })->name('hr_attendance');

    // Route::get('/export-attendance', [ExportAttendanceController::class, 'index'])->name('export.attendance');

    // Route::get('/attendance/fetch', [AttendanceController::class, 'fetchAttendance'])->name('attendance.fetch');
    // Route::get('/attendance/fetch', [EmpAttendanceController::class, 'attendanceData'])->name('attendance.fetch');
    Route::get('/calendar/data', [EmpAttendanceController::class, 'getCalendarData'])->name('emp.calendar.data');
    
    Route::get('tickets',[TicketController::class,'index'])->name('tickets');
    Route::get('tickets/show/{subject}',[TicketController::class,'show'])->name('ticket-view');
    Route::post('tickets',[TicketController::class,'store']);
    Route::put('tickets',[TicketController::class,'update']);
    Route::delete('tickets',[TicketController::class,'destroy']);

    Route::get('overtime',[OvertimeController::class,'index'])->name('overtime');
    Route::post('overtime',[OvertimeController::class,'store']);
    Route::put('overtime',[OvertimeController::class,'update']);
    Route::delete('overtime',[OvertimeController::class,'destroy']);

    Route::get('projects',[ProjectController::class,'index'])->name('projects');
    Route::get('projects/show/{name}',[ProjectController::class,'show'])->name('project.show');
    Route::post('projects',[ProjectController::class,'store']);
    Route::put('projects',[ProjectController::class,'update']);
    Route::delete('projects',[ProjectController::class,'destroy']);
    Route::get('project-list',[ProjectController::class,'list'])->name('project-list');
    Route::get('leads',[ProjectController::class,'leads'])->name('leads');

    Route::resource('tasks', 'TaskController');
    // Route::view('/tasks', 'backend.projects.tasks')->name('tasks');
    
    Route::get('employee-leave',[EmployeeLeaveController::class,'index'])->name('employee-leave');
    Route::post('employee-leave',[EmployeeLeaveController::class,'store']);
    Route::put('employee-leave',[EmployeeLeaveController::class,'update']);
    Route::delete('employee-leave',[EmployeeLeaveController::class,'destroy'])->name('leave.destroy');

    Route::get('/emp-leave', function () {
        return view('backend.emp-leave');
    })->name('emp_leave');

    //route created for Roles Master table
    // Route::view('/roles', 'backend.roles-permissions')->name('roles-master');
    //route created for storing roles in db
    Route::post('/roles',[RoleController::class,'store'])->name('roles.store');
    //route created for fetching roles from db
    Route::get('/roles', [RoleController::class, 'index'])->name('roles-master');
    //route created for deleting the role
    Route::delete('/roles', [RoleController::class, 'destroy'])->name('roles.destroy');

    // Route::get('/roles',[RoleController::class,'index'])->name('roles.edit');
    Route::put('/roles',[RoleController::class,'update'])->name('roles.edit');

    Route::get('/get-user-role/{userId}', [UserController::class, 'getUserRole']);  //Newly added route


    //route created to show the available number of leaves.
    // Route::get('/leave-type/{id}/days-available', function ($id) {
    //     $leaveType = LeaveType::find($id);
    //     $daysAvailable = $leaveType ? $leaveType->days : 0;
    
    //     return response()->json(['days_available' => $daysAvailable]);
    // });
    // Route::get('/leave-type/{id}/days-available', [\App\Http\Controllers\LeaveRequestController::class, 'getDaysAvailable']);
    Route::get('/leave-type/{id}/days-available', [\App\Http\Controllers\Admin\LeaveRequestController::class, 'getDaysAvailable']);

    //route created for storing data for leave request
    Route::post('/leave-request', [LeaveRequestController::class, 'store'])->name('leave-request.store');
    Route::get('/leave-request/success', function () {
        return view('backend.emp-leave')->with('success', 'Leave request submitted successfully.');
    })->name('leave-request.success');

    // Route::view('/leave-requests', 'backend.emp-leave')->name('leave_request');

    //route created for listing the leave requests in table
    // Route::get('/leave-request', [LeaveRequestController::class, 'index'])->name('leave-request.index');
    Route::get('/leave-request', [LeaveRequestController::class, 'showLeaveRequests'])->name('leave-request.index');
    Route::get('/leave-request/HR', [LeaveRequestController::class, 'showLeaveRequestsForHR'])->name('leave-request.indexHR');

    // Route::post('/leave-request/update-status', [LeaveRequestController::class, 'updateStatus'])->name('leave-request.updateStatus');
    Route::post('/leave-requests/{leaveRequest}/update-status', [LeaveRequestController::class, 'updateStatus'])->name('leave-request.update-status');
    // Route::put('/leaves/{id}', 'LeaveRequestController@updateStatus');
    // Route::put('/leaves/{id}', [LeaveRequestController::class, 'updateStatus']);
    Route::put('/leave-requests/{id}', [LeaveRequestController::class, 'update'])->name('leave-requests.update');

    Route::put('/leave-request/revoke-leave', [LeaveRequestController::class, 'updateRevokeReason'])->name('leave-request.revoke');


    Route::get('jobs',[BackendJobController::class,'index'])->name('jobs');
    Route::post('jobs',[BackendJobController::class,'store']);
    Route::get('job-applicants',[BackendJobController::class,'applicants'])->name('job-applicants');
    Route::post('download-cv',[BackendJobController::class,'downloadCv'])->name('download-cv');

    Route::get('goal-type',[GoalTypeController::class,'index'])->name('goal-type');
    Route::post('goal-type',[GoalTypeController::class,'store']);
    Route::put('goal-type',[GoalTypeController::class,'update']);
    Route::delete('goal-type',[GoalTypeController::class,'destroy']);

    Route::get('goal-tracking',[GoalController::class,'index'])->name('goal-tracking');
    Route::post('goal-tracking',[GoalController::class,'store']);
    Route::put('goal-tracking',[GoalController::class,'update']);
    Route::delete('goal-tracking',[GoalController::class,'destroy']);

    Route::get('asset',[AssetController::class,'index'])->name('assets');
    Route::post('asset',[AssetController::class,'store']);
    Route::put('asset',[AssetController::class,'update']);
    Route::delete('asset',[AssetController::class,'destroy']);

    Route::get('users',[UserController::class,'index'])->name("users");
    Route::post('users',[UserController::class,'store']);
    Route::put('users',[UserController::class,'update']);
    Route::delete('users',[UserController::class,'destroy']);

    Route::get('/send-user-credentials/{user}', [UserController::class,'sendCredentials'])->name('send.user.credentials');

    Route::get('profile',[UserProfileController::class,'index'])->name('profile');
    Route::post('profile',[UserProfileController::class,'update']);

    Route::get('activity',[ActivityController::class,'index'])->name('activity');
    Route::get('clear-activity',[ActivityController::class,'markAsRead'])->name('clear-all');

    Route::get('backups',[BackupsController::class,'index'])->name('backups');


});

Route::get('',function (){
    return redirect()->route('dashboard');
});


Route::get('/cache', [CacheController::class, 'cache'])->name('cache');
Route::get('/cache_clear', [CacheController::class, 'clearCache'])->name('cache.clear');
