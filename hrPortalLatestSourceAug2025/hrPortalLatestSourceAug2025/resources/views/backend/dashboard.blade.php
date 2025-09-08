@extends('layouts.backend')

@section('styles')
    <!-- Chart CSS -->
	<link rel="stylesheet" href="assets/plugins/morris/morris.css">
@endsection

@section('page-header')
@if (auth()->user()->role == 2 || auth()->user()->role == 1)
    <div class="row">
        <div class="col-sm-12">
            <h3 class="page-title">Welcome {{auth()->user()->username}}!</h3>
            <ul class="breadcrumb">
                <li class="breadcrumb-item active">Dashboard</li>
            </ul>
        </div>
    </div>
@endif
@if (auth()->user()->role == 3)
    <div class="row">
        <div class="col-sm-12">
            <!--<h3 class="page-title">Welcome {{auth()->user()->username}}!</h3>-->
            <ul class="breadcrumb">
                <li class="breadcrumb-item active">Dashboard</li>
            </ul>
        </div>
    </div>
@endif
@endsection

@section('content')
    @if (auth()->user()->role == 2 || auth()->user()->role == 1)
<div class="row">
    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
        <div class="card dash-widget">
            <div class="card-body">
                <span class="dash-widget-icon"><i class="fa fa-cubes"></i></span>
                <div class="dash-widget-info">
                    <h3>{{$projects_count}}</h3>
                    <span>Projects</span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
        <div class="card dash-widget">
            <div class="card-body">
                <span class="dash-widget-icon"><i class="fa fa-users"></i></span>
                <div class="dash-widget-info">
                    <h3>{{$clients_count}}</h3>
                    <span>Clients</span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
        <div class="card dash-widget">
            <div class="card-body">
                <span class="dash-widget-icon"><i class="fa fa-diamond"></i></span>
                <div class="dash-widget-info">
                    <h3>0</h3>
                    <span>Tasks</span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
        <div class="card dash-widget">
            <div class="card-body">
                <span class="dash-widget-icon"><i class="fa fa-user"></i></span>
                <div class="dash-widget-info">
                    <h3>{{$employee_count}}</h3>
                    <span>Employees</span>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-6 text-center">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title">Total Revenue</h3>
                        <div id="bar-charts"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 text-center">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title">Sales Overview</h3>
                        <div id="line-charts"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="card-group m-b-30">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-3">
                        <div>
                            <span class="d-block">New Employees</span>
                        </div>
                        <div>
                            <!--<span class="text-success">+10%</span>-->
                        </div>
                    </div>
                    <h3 class="mb-3">{{$employee_count}}</h3>
                    <div class="progress mb-2" style="height: 5px;">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 70%;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <!--<p class="mb-0">Overall Employees </p>-->
                </div>
            </div>
        
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-3">
                        <div>
                            <span class="d-block">Earnings</span>
                        </div>
                        <div>
                            <!--<span class="text-success">+12.5%</span>-->
                        </div>
                    </div>
                    <h3 class="mb-3">&#8377;{{$Earnings}}</h3>
                    <div class="progress mb-2" style="height: 5px;">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 70%;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <!--<p class="mb-0">Previous Month <span class="text-muted">&#8377;1,15,852</span></p>-->
                </div>
            </div>
        
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-3">
                        <div>
                            <span class="d-block">Expenses</span>
                        </div>
                        <div>
                            <!--<span class="text-danger">-2.8%</span>-->
                        </div>
                    </div>
                    <h3 class="mb-3">&#8377;{{$Total_Expenses}}</h3>
                    <div class="progress mb-2" style="height: 5px;">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 70%;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <!--<p class="mb-0">Previous Month <span class="text-muted">&#8377;7,500</span></p>-->
                </div>
            </div>
        
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-3">
                        <div>
                            <span class="d-block">Profit</span>
                        </div>
                        <div>
                            <!--<span class="text-danger">-75%</span>-->
                        </div>
                    </div>
                    <h3 class="mb-3">&#8377;{{$Profit}}</h3>
                    <div class="progress mb-2" style="height: 5px;">
                        <div class="progress-bar bg-primary" role="progressbar" style="width: 70%;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <!--<p class="mb-0">Previous Month <span class="text-muted">&#8377;1,42,000</span></p>-->
                </div>
            </div>
        </div>
    </div>	
</div>

<!-- Statistics Widget -->
<div class="row">
    <div class="col-md-12 col-lg-12 col-xl-4 d-flex">
        <div class="card flex-fill dash-statistics">
            <div class="card-body">
                <h5 class="card-title">Statistics</h5>
                <div class="stats-list">
                    <div class="stats-info">
                        <p>Open Tickets <strong>{{$Open_count}} <small>/ {{$OverallTicket_count}}</small></strong></p> 
                        <div class="progress">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: {{$OpenTicket_Percent}}%" aria-valuenow="{{$Open_count}}" aria-valuemin="0" aria-valuemax="{{$OverallTicket_count}}"></div>        
                        </div>
                    </div>
                    <div class="stats-info">
                        <p>Closed Tickets <strong>{{$Closed_count}} <small>/ {{$OverallTicket_count}}</small></strong></p>
                        <div class="progress">
                            <div class="progress-bar bg-info" role="progressbar" style="width: {{$ClosedTicket_Percent}}%" aria-valuenow="{{$Closed_count}}" aria-valuemin="0" aria-valuemax="{{$OverallTicket_count}}"></div>    
                        </div>
                    </div>
                    <div class="stats-info">
                        <p>In Progress Tickets <strong>{{$InProgress_count}} <small>/ {{$OverallTicket_count}}</small></strong></p>
                        <div class="progress">
                            <div class="progress-bar bg-success" role="progressbar" style="width: {{$InProgress_Percent}}%" aria-valuenow="{{$InProgress_count}}" aria-valuemin="0" aria-valuemax="{{$OverallTicket_count}}"></div>
                        </div>
                    </div>
                    <div class="stats-info">
                        <p>Re-Open Tickets <strong>{{$Reopen_count}} <small>/ {{$OverallTicket_count}}</small></strong></p> 
                        <div class="progress">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: {{$Reopen_Percent}}%" aria-valuenow="{{$Reopen_count}}" aria-valuemin="0" aria-valuemax="{{$OverallTicket_count}}"></div>        
                        </div>
                    </div>
                    <div class="stats-info">
                        <p>On-Hold Tickets <strong>{{$OnHold_count}} <small>/ {{$OverallTicket_count}}</small></strong></p>
                        <div class="progress">
                            <div class="progress-bar bg-info" role="progressbar" style="width: {{$OnHold_Percent}}%" aria-valuenow="{{$OnHold_count}}" aria-valuemin="0" aria-valuemax="{{$OverallTicket_count}}"></div>    
                        </div>
                    </div>
                    <div class="stats-info">
                        <p>To-Do Tickets <strong>{{$ToDo_count}} <small>/ {{$OverallTicket_count}}</small></strong></p>
                        <div class="progress">
                            <div class="progress-bar bg-info" role="progressbar" style="width: {{$ToDo_Percent}}%" aria-valuenow="{{$ToDo_count}}" aria-valuemin="0" aria-valuemax="{{$OverallTicket_count}}"></div>    
                        </div>
                    </div>
                    <div class="stats-info">
                        <p>Ready for Development Tickets <strong>{{$ReadyForDev_count}} <small>/ {{$OverallTicket_count}}</small></strong></p>
                        <div class="progress">
                            <div class="progress-bar bg-info" role="progressbar" style="width: {{$ReadyForDev_Percent}}%" aria-valuenow="{{$ReadyForDev_count}}" aria-valuemin="0" aria-valuemax="{{$OverallTicket_count}}"></div>    
                        </div>
                    </div>
                    <div class="stats-info">
                        <p>Development Done Tickets <strong>{{$DevelopmentDone_count}} <small>/ {{$OverallTicket_count}}</small></strong></p>
                        <div class="progress">
                            <div class="progress-bar bg-info" role="progressbar" style="width: {{$DevelopmentDone_Percent}}%" aria-valuenow="{{$DevelopmentDone_count}}" aria-valuemin="0" aria-valuemax="{{$OverallTicket_count}}"></div>    
                        </div>
                    </div>
                    <div class="stats-info">
                        <p>In Testing Tickets <strong>{{$InTesting_count}} <small>/ {{$OverallTicket_count}}</small></strong></p>
                        <div class="progress">
                            <div class="progress-bar bg-info" role="progressbar" style="width: {{$InTesting_Percent}}%" aria-valuenow="{{$InTesting_count}}" aria-valuemin="0" aria-valuemax="{{$OverallTicket_count}}"></div>    
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-md-12 col-lg-6 col-xl-4 d-flex">
        <div class="card flex-fill">
            <div class="card-body">
                <h4 class="card-title">Task Statistics</h4>
                <div class="statistics">
                    <div class="row">
                        <div class="col-md-6 col-6 text-center">
                            <div class="stats-box mb-4">
                                <p>Total Tasks</p>
                                <h3>385</h3>
                            </div>
                        </div>
                        <div class="col-md-6 col-6 text-center">
                            <div class="stats-box mb-4">
                                <p>Overdue Tasks</p>
                                <h3>19</h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="progress mb-4">
                    <div class="progress-bar bg-purple" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">30%</div>
                    <div class="progress-bar bg-warning" role="progressbar" style="width: 22%" aria-valuenow="18" aria-valuemin="0" aria-valuemax="100">22%</div>
                    <div class="progress-bar bg-success" role="progressbar" style="width: 24%" aria-valuenow="12" aria-valuemin="0" aria-valuemax="100">24%</div>
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 26%" aria-valuenow="14" aria-valuemin="0" aria-valuemax="100">21%</div>
                    <div class="progress-bar bg-info" role="progressbar" style="width: 10%" aria-valuenow="14" aria-valuemin="0" aria-valuemax="100">10%</div>
                </div>
                <div>
                    <p><i class="fa fa-dot-circle-o text-purple mr-2"></i>Completed Tasks <span class="float-right">166</span></p>
                    <p><i class="fa fa-dot-circle-o text-warning mr-2"></i>Inprogress Tasks <span class="float-right">115</span></p>
                    <p><i class="fa fa-dot-circle-o text-success mr-2"></i>On Hold Tasks <span class="float-right">31</span></p>
                    <p><i class="fa fa-dot-circle-o text-danger mr-2"></i>Pending Tasks <span class="float-right">47</span></p>
                    <p class="mb-0"><i class="fa fa-dot-circle-o text-info mr-2"></i>Review Tasks <span class="float-right">5</span></p>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-md-12 col-lg-6 col-xl-4 d-flex">
        <div class="card flex-fill">
            <div class="card-body">
                <h4 class="card-title">Leave Statistics <span class="badge bg-inverse-danger ml-2"></span></h4>
                <div class="stats-list">
                    <div class="stats-info">
                        <p>Approved Leaves <strong>{{$ApprovedLeave_count}} <small>/ {{$TotalLeave_count}}</small></strong></p>
                        <div class="progress">
                            <div class="progress-bar bg-success" role="progressbar" style="width: {{$ApprovedLeave_Percent}}%" aria-valuenow="{{$InTesting_count}}" aria-valuemin="0" aria-valuemax="{{$OverallTicket_count}}"></div>    
                        </div>
                    </div>
                    <div class="stats-info">
                        <p>Pending Leaves <strong>{{$PendingLeave_count}} <small>/ {{$TotalLeave_count}}</small></strong></p>
                        <div class="progress">
                            <div class="progress-bar bg-info" role="progressbar" style="width: {{$PendingLeave_Percent}}%" aria-valuenow="{{$InTesting_count}}" aria-valuemin="0" aria-valuemax="{{$OverallTicket_count}}"></div>    
                        </div>
                    </div>
                    <div class="stats-info">
                        <p>Declined Leaves <strong>{{$DeclinedLeave_count}} <small>/ {{$TotalLeave_count}}</small></strong></p>
                        <div class="progress">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: {{$DeclinedLeave_Percent}}%" aria-valuenow="{{$InTesting_count}}" aria-valuemin="0" aria-valuemax="{{$OverallTicket_count}}"></div>    
                        </div>
                    </div>
                </div>
                <h4 class="card-title">Today Absent <span class="badge bg-inverse-danger ml-2">0</span></h4>
                <div class="leave-info-box">
                    <div class="media align-items-center">
                        <a href="profile.html" class="avatar"><img alt="" src="assets/img/user.jpg"></a>
                        <div class="media-body">
                            <div class="text-sm my-0">Ashoka</div>
                        </div>
                    </div>
                    <div class="row align-items-center mt-3">
                        <div class="col-6">
                            <h6 class="mb-0">{{$TodaysDate}}</h6>
                            <span class="text-sm text-muted">Leave Date</span>
                        </div>
                        <div class="col-6 text-right">
                            <span class="badge bg-inverse-danger">Pending</span>
                        </div>
                    </div>
                </div>
                <div class="leave-info-box">
                    <div class="media align-items-center">
                        <a href="profile.html" class="avatar"><img alt="" src="assets/img/user.jpg"></a>
                        <div class="media-body">
                            <div class="text-sm my-0">Martin Lewis</div>
                        </div>
                    </div>
                    <div class="row align-items-center mt-3">
                        <div class="col-6">
                            <h6 class="mb-0">{{$TodaysDate}}</h6>
                            <span class="text-sm text-muted">Leave Date</span>
                        </div>
                        <div class="col-6 text-right">
                            <span class="badge bg-inverse-success">Approved</span>
                        </div>
                    </div>
                </div>
                <div class="load-more text-center">
                    <a class="text-dark" href="javascript:void(0);">Load More</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endif
<!-- /Statistics Widget -->
    @if (auth()->user()->role == 3)
        @php
            $leaveDetails = app('App\Http\Controllers\Admin\LeaveRequestController')->getLeaveDetails();
            $projectCount = app('App\Http\Controllers\Admin\ProjectController')->projectCount();
        @endphp
        <div class="content container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="welcome-box">
                        <div class="welcome-img">
                            <img alt
                                src="{{ asset('storage/employee_details/' . ($employeeDetail->avatar ?? '')) }}" />
                        </div>
                        <div class="welcome-det">
                            <h3>Welcome {{ auth()->user()->username }}!</h3>
                            <p>{{ date('l, d F Y') }}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-md-8">
                    <section class="dash-section">
                        <h1 class="dash-sec-title">Today</h1>
                        <div class="dash-sec-content">
                            <div class="dash-info-list">
                                <a href="#" class="dash-card text-danger">
                                    <div class="dash-card-container">
                                        <div class="dash-card-icon">
                                            <i class="fa fa-hourglass-o"></i>
                                        </div>
                                        <div class="dash-card-content">
                                            <p>Richard Miles is off sick today</p>
                                        </div>
                                        <div class="dash-card-avatars">
                                            <div class="e-avatar">
                                                <img src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-09.jpg"
                                                    alt />
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="dash-info-list">
                                <a href="#" class="dash-card">
                                    <div class="dash-card-container">
                                        <div class="dash-card-icon">
                                            <i class="fa fa-suitcase"></i>
                                        </div>
                                        <div class="dash-card-content">
                                            <p>You are away today</p>
                                        </div>
                                        <div class="dash-card-avatars">
                                            <div class="e-avatar">
                                                <img src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-02.jpg"
                                                    alt />
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="dash-info-list">
                                <a href="#" class="dash-card">
                                    <div class="dash-card-container">
                                        <div class="dash-card-icon">
                                            <i class="fa fa-building-o"></i>
                                        </div>
                                        <div class="dash-card-content">
                                            <p>You are working from home today</p>
                                        </div>
                                        <div class="dash-card-avatars">
                                            <div class="e-avatar">
                                                <img src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-02.jpg"
                                                    alt />
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </section>
                    <section class="dash-section">
                        <h1 class="dash-sec-title">Tomorrow</h1>
                        <div class="dash-sec-content">
                            <div class="dash-info-list">
                                <div class="dash-card">
                                    <div class="dash-card-container">
                                        <div class="dash-card-icon">
                                            <i class="fa fa-suitcase"></i>
                                        </div>
                                        <div class="dash-card-content">
                                            <p>2 people will be away tomorrow</p>
                                        </div>
                                        <div class="dash-card-avatars">
                                            <a href="#" class="e-avatar"><img
                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-04.jpg"
                                                    alt /></a>
                                            <a href="#" class="e-avatar"><img
                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-08.jpg"
                                                    alt /></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="dash-section">
                        <h1 class="dash-sec-title">Next seven days</h1>
                        <div class="dash-sec-content">
                            <div class="dash-info-list">
                                <div class="dash-card">
                                    <div class="dash-card-container">
                                        <div class="dash-card-icon">
                                            <i class="fa fa-suitcase"></i>
                                        </div>
                                        <div class="dash-card-content">
                                            <p>2 people are going to be away</p>
                                        </div>
                                        <div class="dash-card-avatars">
                                            <a href="#" class="e-avatar"><img
                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-05.jpg"
                                                    alt /></a>
                                            <a href="#" class="e-avatar"><img
                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-07.jpg"
                                                    alt /></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="dash-info-list">
                                <div class="dash-card">
                                    <div class="dash-card-container">
                                        <div class="dash-card-icon">
                                            <i class="fa fa-user-plus"></i>
                                        </div>
                                        <div class="dash-card-content">
                                            <p>Your first day is going to be on Thursday</p>
                                        </div>
                                        <div class="dash-card-avatars">
                                            <div class="e-avatar">
                                                <img src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-02.jpg"
                                                    alt />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="dash-info-list">
                                <a href class="dash-card">
                                    <div class="dash-card-container">
                                        <div class="dash-card-icon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <div class="dash-card-content">
                                            <p>It's Spring Bank Holiday on Monday</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="dash-sidebar">
                        <section>
                            <h5 class="dash-title">Projects</h5>
                            <div class="card">
                                <div class="card-body">
                                    <div class="time-list">
                                        <div class="dash-stats-list">
                                            <h4>71</h4>
                                            <p>Total Tasks</p>
                                        </div>
                                        <div class="dash-stats-list">
                                            <h4>14</h4>
                                            <p>Pending Tasks</p>
                                        </div>
                                    </div>
                                    <div class="request-btn">
                                        <div class="dash-stats-list">
                                            <h4>{{$projectCount}}</h4>
                                            <p>Total Projects</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section>
                            <h5 class="dash-title">Your Leave</h5>
                            <div class="card">
                                <div class="card-body">
                                    <div class="time-list">
                                        <div class="dash-stats-list">
                                            <h4>{{ $leaveDetails['totalLeavesTakenCount'] }}</h4>
                                            <p>Leave Taken</p>
                                        </div>
                                        <div class="dash-stats-list">
                                            <h4>{{ $leaveDetails['totalLeavesCount'] }}</h4>
                                            <p>Total Leaves</p>
                                        </div>
                                    </div>
                                    <div class="request-btn">
                                        <a class="btn btn-primary" href="{{route('leave-request.store')}}">Apply Leave</a>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section>
                            <h5 class="dash-title">Your time off allowance</h5>
                            <div class="card">
                                <div class="card-body">
                                    <div class="time-list">
                                        <div class="dash-stats-list">
                                            <h4>5.0 Hours</h4>
                                            <p>Approved</p>
                                        </div>
                                        <div class="dash-stats-list">
                                            <h4>15 Hours</h4>
                                            <p>Remaining</p>
                                        </div>
                                    </div>
                                    <div class="request-btn">
                                        <a class="btn btn-primary" href="#">Apply Time Off</a>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section>
                            <h5 class="dash-title">Upcoming Holiday</h5>
                            <div class="card">
                                <div class="card-body text-center">
                                    <h4 class="holiday-title mb-0">
                                        Mon 20 May 2019 - Ramzan
                                    </h4>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    @endif
@endsection
@section('scripts')
<!-- Chart JS -->
<script src="assets/plugins/morris/morris.min.js"></script>
<script src="assets/plugins/raphael/raphael.min.js"></script>
<script src="assets/js/chart.js"></script>
@endsection