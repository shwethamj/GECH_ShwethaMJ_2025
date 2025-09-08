<?php

namespace App\Http\Controllers\Admin;

use App\Models\Client;
use App\Models\EmployeeDetail;
use App\Models\Project;
use App\Models\Ticket;
use App\Models\Expense;
use App\Models\LeaveRequest;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DashboardController extends Controller
{
    public function index(){
        $title = 'Dashboard';
        $projects_count =  Project::count();
        $clients_count = Client::count();
        $employee_count = EmployeeDetail::count();
        $OverallTicket_count = Ticket::count();
        $TotalLeave_count = LeaveRequest::count();
        $Total_Expenses = Expense::where('status','Approved')->sum('amount');
        $Earnings = Project::sum('rate');

        $Profit = $Earnings - $Total_Expenses;

        
        $Open_count = Ticket::where('status','Open')->count();
        $Closed_count = Ticket::where('status','Closed')->count();
        $InProgress_count = Ticket::where('status','InProgress')->count();
        $Reopen_count = Ticket::where('status','Reopen')->count();
        $OnHold_count = Ticket::where('status','OnHold')->count();
        $ToDo_count = Ticket::where('status','ToDo')->count();
        $ReadyForDev_count = Ticket::where('status','ReadyForDev')->count();
        $DevelopmentDone_count = Ticket::where('status','DevelopmentDone')->count();
        $InTesting_count = Ticket::where('status','InTesting')->count();

        $PendingLeave_count = LeaveRequest::where('status','pending')->count();
        $ApprovedLeave_count = LeaveRequest::where('status','Approved')->count();
        $DeclinedLeave_count = LeaveRequest::where('status','Rejected')->count();

        $Total_tickets = ($Open_count + $Closed_count + $InProgress_count + $Reopen_count + $OnHold_count + $ToDo_count + $ReadyForDev_count + $DevelopmentDone_count + $InTesting_count)/100 ;
        $ClosedTicket_Percent = ($Total_tickets > 0) ? ($Closed_count/$Total_tickets) : 0;
        $OpenTicket_Percent = ($Total_tickets > 0) ? ($Open_count/$Total_tickets) : 0;
        $InProgress_Percent = ($Total_tickets > 0) ? ($InProgress_count/$Total_tickets) : 0;
        $Reopen_Percent = ($Total_tickets > 0) ? ($Reopen_count/$Total_tickets) : 0;
        $OnHold_Percent = ($Total_tickets > 0) ? ($OnHold_count/$Total_tickets) : 0;
        $ToDo_Percent = ($Total_tickets > 0) ? ($ToDo_count/$Total_tickets) : 0;
        $ReadyForDev_Percent = ($Total_tickets > 0) ? ($ReadyForDev_count/$Total_tickets) : 0;
        $DevelopmentDone_Percent = ($Total_tickets > 0) ? ($DevelopmentDone_count/$Total_tickets) : 0;
        $InTesting_Percent = ($Total_tickets > 0) ? ($InTesting_count/$Total_tickets) : 0;

        $TotalLeaves = ($PendingLeave_count + $ApprovedLeave_count + $DeclinedLeave_count)/100;
        $PendingLeave_Percent = ($TotalLeaves > 0) ? ($PendingLeave_count/$TotalLeaves) : 0;
        $ApprovedLeave_Percent = ($TotalLeaves > 0) ? ($ApprovedLeave_count/$TotalLeaves) : 0;
        $DeclinedLeave_Percent = ($TotalLeaves > 0) ? ($DeclinedLeave_count/$TotalLeaves) : 0;

        $TodaysDate = Carbon::today()->format('d-m-Y');
        $Todays_Date = Carbon::today();
        // $LeaveDate = Leave::
        //  $TodayLeave_count = LeaveRequest::where('from',$Todays_Date)->count() ?? 0;
        //  $TodayLeave_count = Leave::where('from',$Todays_Date)->count();
        //  $TodayLeave = LeaveRequest::where('from',$TodaysDate);

        //  $TodayLeaveEmp = Leave::join('leaves', 'leaves.employee_id', '=', 'employees.id')->get(['employees.firstname']);

        return view('backend.dashboard',compact(
            'title','TodaysDate','DeclinedLeave_Percent','ApprovedLeave_Percent','PendingLeave_Percent','TotalLeaves','projects_count','clients_count','employee_count','Total_tickets','OpenTicket_Percent','ClosedTicket_Percent','Open_count','Closed_count', 'InProgress_count', 'InTesting_count','DevelopmentDone_count','ReadyForDev_count','ToDo_count','OnHold_count','Reopen_count','InTesting_Percent','DevelopmentDone_Percent','ReadyForDev_Percent','ToDo_Percent','OnHold_Percent','Reopen_Percent','InProgress_Percent','OverallTicket_count','Total_Expenses','Earnings','Profit','PendingLeave_count','ApprovedLeave_count','DeclinedLeave_count','TotalLeave_count','TodaysDate'
        ));
    }
}
