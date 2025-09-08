@extends('layouts.backend')

@section('styles')	
<!-- Select2 CSS -->
<link rel="stylesheet" href="{{asset('assets/plugins/select2/select2.min.css')}}">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">

<!-- Datatable CSS -->
<link rel="stylesheet" href="{{asset('assets/css/dataTables.bootstrap4.min.css')}}">

<link rel="stylesheet" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
<style>
    div .row > .col-md-12{
      background-color: rgba(255, 213, 0, 0.5);
    }
    .table {
      border-collapse: collapse;
      font-family: sans-serif;
      font-size: 14px;
      width: 100%;
    }
  
    #calendar_table > th {
      background-color: #f2f2f2;
      border: 1px solid #ddd;
      font-weight: bold;
      padding: 8px;
      text-align: center;
    }
  
    .table td {
      background-color: #fff;
      border: 1px solid #ddd;
      height: 90px;
      width: 50px;
      padding: 0;
      text-align: center;
      line-height: 90px;
      transition: all 0.2s ease-in-out;
    }
  
    .table td.today {
      background-color: #ffa600;
    }
  
    .table td:not(:empty):hover {
      background-color: #f5f5f5;
      cursor: pointer;
    }
  
    .table td.blur:not(.clicked) {
      filter: blur(1px);
    }
    .table td.clicked {
      /* background-color: #F08080; */
      /* background-color: rgba(255, 213, 0, 0.5); */
      z-index: 1;
      filter: blur(0);
      /* transform: scale(2); */
      transform: scale(1.4);
      transform-origin: center center;
      position: relative;
    }
  
    .table td.clicked::before {
      content: '';
      position: absolute;
      top: 0;
      right: 0;
      bottom: 0;
      left: 0;
      background-color: rgba(255, 213, 0, 0.5);
      z-index: -1;
      transform: scale(0.75);
      transform-origin: center center;
    }
  
    .table td:not(.today):not(.clicked):hover {
      filter: blur(0px);
      cursor: pointer;
    }
  
    .table td.today {
      filter: blur(0);
    }
    /* style for nav buttons of calendar */
    .calendar-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
        background-color: #a98989;
    }
    
    .calendar-header h2 {
        margin: 0;
    }
    
    .calendar-header button {
        border: none;
        background: none;
        font-size: 20px;
        cursor: pointer;
    }
    .calendar-btn {
        padding: 5px 10px;
        color: #050000;
        background-color: #007bff;
        border-radius: 3px;
        transition: background-color 0.3s ease;
    }
    
    .calendar-btn:hover {
        background-color: #0069d9;
    }
    td > a{
        color: #333333;
    }
    .dataTables_wrapper .dataTables_length,
    .dataTables_wrapper .dataTables_filter{
        margin: 10px;
    }
    .dataTables_wrapper .dataTables_paginate ,
    .dataTables_wrapper .dataTables_info{
        margin: 0 0 20px 10px;
    }

    .custom-table{
        border: 1px solid black;
    }
    table.dataTable thead th {
        border: 1px solid #ddd;
        font-size: 14px;
        font-weight: bold;
        background-color: #9c9191b6;
        padding: 10px;
    }
    .custom-table>tbody> td {
        /* border: 1px solid #ddd; */
        /* font-size: 14px; */
        /* font-weight: bold; */
        /* background-color: #9c9191b6; */
        padding: 0px;
        margin: 0;
    }
    .half-day {
      width: 100vw;
      height: 100vh;
      background-color: #ffff00  !important;
      clip-path: polygon(0 0, 100% 0, 100% 100%);
    }
    .stats-info {
      padding: 10px;
      display: inline-flex;
    }
    .stats-info p {
      font-size: 15px;
      margin-right: 63px;
      margin-bottom: 0px;
    }
    .revoke-btn{
      display: flex;
      align-items: center;
      flex-direction: column;
      line-height: 26px;
    }
    @media only screen and (max-width: 540px){
      .table td {
        height: 50px;
        width: 75px;
        line-height: 50px;
      }
      .table-striped td{
        height: 25px;
        width: 75px;
        line-height: 25px;
      }
    }
    @media only screen and (min-width: 470px) and (max-width: 540px) {
      .stats-list > .stats-info:nth-child(4) p {
        margin-right: 45px !important;
      }
      .stats-list > .stats-info:nth-child(1) p{
        margin-right: 95px !important;
      }
      .stats-list > .stats-info:nth-child(2) p{
        margin-right: 63px !important;
      }
      .stats-list > .stats-info:nth-child(5) p{
        margin-right: 135px !important;
      }
      .stats-list {
         height: auto !important;
         font-size: 16px;
      }
    }
    @media only screen and (min-width: 400px) and (max-width: 515px) {
      .stats-list{
        text-align: center;
      }
      .stats-info p{
        font-size: 20px !important;
      }
      .stats-list > .stats-info:nth-child(4) p {
        margin-right: 67px !important;
      }
      .stats-list > .stats-info:nth-child(1) p{
        margin-right: 95px !important;
      }
      .stats-list > .stats-info:nth-child(2) p{
        margin-right: 92px !important;
      }
      .stats-list > .stats-info:nth-child(5) p{
        margin-right: 151px !important;
      }
      .stats-list > .stats-info:nth-child(3) p{
        margin-right: 43px !important;
      }
      .stats-list {
         height: auto !important;
         font-size: 16px;
      }
    }
</style>
@endsection

@section('page-header')
<div class="row align-items-center">
	<div class="col">
		<h3 class="page-title">Employee Leaves</h3>
		{{-- <ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="{{route('dashboard')}}">Dashboard</a></li>
			<li class="breadcrumb-item active">Leaves</li>
		</ul> --}}
	</div>
</div>
@endsection

@section('content')
<div class="row">
    {{-- <div class="col-md-12" style="padding-top:18px">
        @php
            $today = \Carbon\Carbon::today();
            $year = isset($_GET['year']) ? $_GET['year'] : $today->year;
            $month = isset($_GET['month']) ? $_GET['month'] : $today->month;
            $daysInMonth = \Carbon\Carbon::create($year, $month)->daysInMonth;
            $firstDayOfMonth = \Carbon\Carbon::create($year, $month, 1)->dayOfWeek;
            $prevMonth = \Carbon\Carbon::create($year, $month, 1)->subMonth();
            $nextMonth = \Carbon\Carbon::create($year, $month, 1)->addMonth();
        @endphp
        <div class="calendar-header text-center">
            <button class="calendar-btn" onclick="location.href='?year={{ $prevMonth->year }}&month={{ $prevMonth->month }}'">&lt;</button>
            <h2>{{ $monthName = \Carbon\Carbon::createFromDate($year, $month, 1)->format('F Y') }}</h2>
            <button class="calendar-btn" onclick="location.href='?year={{ $nextMonth->year }}&month={{ $nextMonth->month }}'">&gt;</button>
        </div>
        
        <table id="calendar-table" class="table">
            <thead>
                <tr class="text-center">
                    <th>Sun</th>
                    <th>Mon</th>
                    <th>Tue</th>
                    <th>Wed</th>
                    <th>Thu</th>
                    <th>Fri</th>
                    <th>Sat</th>
                </tr>
            </thead>
            <tbody>
                @for ($row = 0; $row < ceil(($firstDayOfMonth + $daysInMonth) / 7); $row++)
                    <tr class="text-center">
                        @for ($col = 0; $col < 7; $col++)
                            @php
                                $day = $row * 7 + $col - $firstDayOfMonth + 1;
                                if ($day > 0) {
                                    $date = \Carbon\Carbon::create($year, $month, $day);
                                    $data_date = $date->format('Y-m-d');
                                } else {
                                    $data_date = '';
                                }
                                $isSunday = $col == 0; // Sunday is the first column (index 0)
                            @endphp
                            <td
                                @if (isset($date) && $date->isToday()) class="today not-blur" @endif
                                data-date="{{ $data_date }}"
                                onclick="handleClick(this)"
                                data-toggle="modal"
                                data-target="#add_leaves"
                                @if ($isSunday) class="sunday" @endif
                            >
                                {{ isset($day) && $day > 0 && $day <= $daysInMonth ? $day : '' }}
                            </td>
                        @endfor
                    </tr>
                @endfor
            </tbody>            
        </table>  
        </div>
    </div>     --}}
    {{-- <div class="col-md-12" style="padding-top:18px">
      @php
          $today = \Carbon\Carbon::today();
          $year = isset($_GET['year']) ? $_GET['year'] : $today->year;
          $month = isset($_GET['month']) ? $_GET['month'] : $today->month;
          $daysInMonth = \Carbon\Carbon::create($year, $month)->daysInMonth;
          $firstDayOfMonth = \Carbon\Carbon::create($year, $month, 1)->dayOfWeek;
          $prevMonth = \Carbon\Carbon::create($year, $month, 1)->subMonth();
          $nextMonth = \Carbon\Carbon::create($year, $month, 1)->addMonth();

          $holidays = ['2023-04-01', '2023-04-02', '2023-04-09', '2023-04-15', '2023-04-16', '2023-04-23', '2023-04-29', '2023-04-30'];
          $leaves = ['2023-04-28'];
      @endphp
      <div class="calendar-header text-center">
          <button class="calendar-btn" onclick="location.href='?year={{ $prevMonth->year }}&month={{ $prevMonth->month }}'">&lt;</button>
          <h2>{{ $monthName = \Carbon\Carbon::createFromDate($year, $month, 1)->format('F Y') }}</h2>
          <button class="calendar-btn" onclick="location.href='?year={{ $nextMonth->year }}&month={{ $nextMonth->month }}'">&gt;</button>
      </div>
      <table id="calendar-table" class="table">
          <thead>
              <tr class="text-center">
                  <th>Sun</th>
                  <th>Mon</th>
                  <th>Tue</th>
                  <th>Wed</th>
                  <th>Thu</th>
                  <th>Fri</th>
                  <th>Sat</th>
              </tr>
          </thead>
          {{-- <tbody>
              @for ($row = 0; $row < ceil(($firstDayOfMonth + $daysInMonth) / 7); $row++)
                <tr class="text-center">
                  @for ($col = 0; $col < 7; $col++)
                    @php
                      $day = $row * 7 + $col - $firstDayOfMonth + 1;
                      $data_date = '';
                      if ($day > 0) {
                        $date = \Carbon\Carbon::create($year, $month, $day);
                        $data_date = $date->format('Y-m-d');
                      }
                      $isSunday = $col == 0; // Sunday is the first column (index 0)
                    @endphp
                    <td
                      @if (isset($date) && $date->isToday()) class="today not-blur" @endif
                      data-date="{{ $data_date }}"
                      @if ($isSunday) class="sunday" @endif
                      @if ($data_date && !$date->isPast())
                        data-toggle="modal" data-target="#add_leaves"
                      @endif
                    >
                      @if ($day > 0 && $day <= $daysInMonth)
                        @if ($data_date && $date->isPast())
                          <span class="disabled">{{ $day }}</span>
                        @else
                          <a href="#">{{ $day }}</a>
                        @endif
                      @endif
                    </td>
                  @endfor
                </tr>
              @endfor
          </tbody>                   --}}
          {{-- <tbody>
              @for ($row = 0; $row < ceil(($firstDayOfMonth + $daysInMonth) / 7); $row++)
                <tr class="text-center">
                  @for ($col = 0; $col < 7; $col++)
                    @php
                      $day = $row * 7 + $col - $firstDayOfMonth + 1;
                      $data_date = '';
                      if ($day > 0) {
                        $date = \Carbon\Carbon::create($year, $month, $day);
                        $data_date = $date->format('Y-m-d');
                      }
                      $isSunday = $col == 0; // Sunday is the first column (index 0)
                      $isHoliday = in_array($data_date, $holidays); // check if current date is a holiday
                      $isLeave = in_array($data_date, $leaves); // check if current date is a holiday
                    @endphp
                    <td
                      @if (isset($date) && $date->isToday()) class="today not-blur" @endif
                      data-date="{{ $data_date }}"
                      @if ($isSunday) class="sunday" @endif
                      @if ($data_date && !$date->isPast())
                        data-toggle="modal" data-target="#add_leaves"
                      @endif
                      @if ($isHoliday) style="background-color: gray; color: white;" @endif 
                      @if ($isLeave) style="background-color: yellow; color: white;" @endif 
                    >
                      @if ($day > 0 && $day <= $daysInMonth)
                        @if ($data_date && $date->isPast())
                          <span class="disabled">{{ $day }}</span>
                        @else
                          <a href="#">{{ $day }}</a>
                        @endif
                      @endif
                    </td>
                  @endfor
                </tr>
              @endfor
          </tbody>
      </table>  
      </div>
  </div>    --}}
    <div class="col-md-9" style="padding-top:18px; background-color: khaki">
      @php
        $today = \Carbon\Carbon::today();
        $year = isset($_GET['year']) ? $_GET['year'] : $today->year;
        $month = isset($_GET['month']) ? $_GET['month'] : $today->month;
        $daysInMonth = \Carbon\Carbon::create($year, $month)->daysInMonth;
        $firstDayOfMonth = \Carbon\Carbon::create($year, $month, 1)->dayOfWeek;
        $prevMonth = \Carbon\Carbon::create($year, $month, 1)->subMonth();
        $nextMonth = \Carbon\Carbon::create($year, $month, 1)->addMonth();

        // $holidays = ['2023-04-01', '2023-04-02', '2023-04-09', '2023-04-15', '2023-04-16', '2023-04-23', '2023-04-29', '2023-04-30'];
        $holidays = [];
        $HalfDays = [];
        $firstSaturday = false;
        $thirdSaturday = false;
        $fifthSaturday = false;

        for ($day = 1; $day <= $daysInMonth; $day++) {
            $date = \Carbon\Carbon::create($year, $month, $day);
            $dayOfWeek = $date->dayOfWeek;
            if (!$firstSaturday && $dayOfWeek == 6 && $day <= (7 - $firstDayOfMonth)) {
                $firstSaturday = $date->format('Y-m-d');
                $holidays[] = $firstSaturday;
            } elseif (!$thirdSaturday && $dayOfWeek == 6 && $day > (14 - $firstDayOfMonth) && $day <= (21 - $firstDayOfMonth)) {
                $thirdSaturday = $date->format('Y-m-d');
                $holidays[] = $thirdSaturday;
            } elseif (!$fifthSaturday && $dayOfWeek == 6 && $day > (28 - $firstDayOfMonth) && $day <= (35 - $firstDayOfMonth)) {
                $fifthSaturday = $date->format('Y-m-d');
                $holidays[] = $fifthSaturday;
            } elseif ($dayOfWeek == 0) { // add condition to check if it is Sunday
                $holidays[] = $date->format('Y-m-d');
            }
        }

        // $holidays[] = '2023-05-10'; // Add additional holiday
        $holidays = array_merge($holidays, app('App\Http\Controllers\Admin\LeaveRequestController')->getHolidays());

        // $leaves = ['2023-04-28'];
        $leaveRequestController = new App\Http\Controllers\Admin\LeaveRequestController;
        $leaves = $leaveRequestController->getLeaves();
        // $HalfDays = array_merge($HalfDays, app('App\Http\Controllers\Admin\LeaveRequestController')->getHalfDayAttendanceDates());
        $HalfDaysDates = new App\Http\Controllers\Admin\LeaveRequestController;
        $HalfDays = $HalfDaysDates->getHalfDayAttendanceDates();
        // print_r($HalfDays)
      @endphp
      <div class="calendar-header text-center">
          <button class="calendar-btn" onclick="location.href='?year={{ $prevMonth->year }}&month={{ $prevMonth->month }}'">&lt;</button>
          <h2>{{ $monthName = \Carbon\Carbon::createFromDate($year, $month, 1)->format('F Y') }}</h2>
          <button class="calendar-btn" onclick="location.href='?year={{ $nextMonth->year }}&month={{ $nextMonth->month }}'">&gt;</button>
      </div>
      <table id="calendar-table" class="table table-responsive-md">
          <thead>
              <tr class="text-center">
                  <th>Sun</th>
                  <th>Mon</th>
                  <th>Tue</th>
                  <th>Wed</th>
                  <th>Thu</th>
                  <th>Fri</th>
                  <th>Sat</th>
              </tr>
          </thead>
          <tbody>
              @for ($row = 0; $row < ceil(($firstDayOfMonth + $daysInMonth) / 7); $row++)
                  <tr class="text-center">
                    @for ($col = 0; $col < 7; $col++)
                      @php
                          $day = $row * 7 + $col - $firstDayOfMonth + 1;
                          $data_date = '';
                          if ($day > 0) {
                              $date = \Carbon\Carbon::create($year, $month, $day);
                              $data_date = $date->format('Y-m-d');
                          }
                          $isSunday = $col == 0; // Sunday is the first column (index 0)
                          $isHoliday = in_array($data_date, $holidays) && $date->isSameMonth(\Carbon\Carbon::create($year, $month)); // check if current date is a holiday and is in this month
                          $isLeave = in_array($data_date, $leaves) && $date->isSameMonth(\Carbon\Carbon::create($year, $month)); // check if current date is a leave and is in this month

                          $isHalfDay = in_array($data_date, $HalfDays) && $date->isSameMonth(\Carbon\Carbon::create($year, $month)); // check if current date is a half day and is in this month
                      @endphp
                      <td
                          @if (isset($date) && $date->isToday()) class="today not-blur" @endif
                          data-date="{{ $data_date }}"
                          @if ($isSunday) class="sunday" @endif
                          
                          {{-- @if ($data_date && !$date->isPast())
                              data-toggle="modal" data-target="#add_leaves"
                          @endif--}}
                          @if ($data_date && !$date->isPast() && !$isHoliday && !$isLeave)
                            data-toggle="modal" data-target="#add_leaves"
                          @endif
                          @if ($isHoliday) class="holiday" style="background-color: gray; color: white;" data-toggle="" data-target="" @endif 
                          @if ($isLeave) class="leave" style="background-color: yellow; color: white;" data-toggle="" data-target="" @endif 
                          @if ($isHalfDay) class="half-day" @endif 
                      >
                          @if ($day > 0 && $day <= $daysInMonth)
                              @if ($data_date && $date->isPast())
                                  <span class="disabled">{{ $day }}</span>
                              @else
                                  <a href="#">{{ $day }}</a>
                              @endif
                          @endif
                      </td>
                    @endfor
                  </tr>
              @endfor
          </tbody>
      </table>  
    </div>    
    @php
      $leavesLeft = app('App\Http\Controllers\Admin\LeaveRequestController')->getLeavesLeft();
      $leaveDetails = app('App\Http\Controllers\Admin\LeaveRequestController')->getLeaveDetails();
    @endphp
    <div class="col-lg-4 col-sm-6 col-md-3 col-xl-3 d-flex align-items-center" style="background-color: khaki">
      <div class="card att-statistics mx-auto" style="padding: 20px; margin: 30px 0;">
          <div class="card-body">
              <h5 class="card-title">Statistics</h5>
              <div class="stats-list">
                  <div class="stats-info">
                      <p style="margin-right: 70px">Total Leaves </p><strong>{{ $leaveDetails['totalLeavesCount'] }}</strong>
                  </div>
                  <div class="stats-info">
                      <p style="margin-right: 69px">Leaves Taken </p><strong>{{ $leaveDetails['totalLeavesTakenCount'] }}</strong>
                  </div>
                  <div class="stats-info">
                      <p style="margin-right: 57px; text-align:left">Casual Leaves Left</p><strong> {{ $leavesLeft['casualLeavesLeft'] }} </strong>
                  </div>
                  <div class="stats-info">
                      <p style="margin-right: 74px;text-align:left">Sick Leaves Left</p><strong> {{ $leavesLeft['sickLeavesLeft'] }} </strong>
                  </div>
                  <div class="stats-info">
                      <p style="margin-right: 111px;">LOP's </p><strong>90 </strong>
                  </div>
              </div>
          </div>
      </div>  
    </div>    
  {{-- </div> --}}
</div> 
<div class="row">
    <div class="col-lg-12">
        <div class="table-responsive">
			       <table class="table table-striped custom-table mb-0 text-center" id="leavesTable" style="width:99%">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Employee Name</th>
                        <th>Leave Type</th>
                        <th>From Date</th>
                        <th>To Date</th>
                        <th>No. of Days</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody id="leavesTableBody">
                    @foreach ($leaveRequests as $leaveRequest)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $leaveRequest->user->name }}</td>
                            {{-- <td>{{ $leaveRequest->leave_type_id }}</td> --}}
                            <td>{{ $leaveRequest->leaveType->type }}</td>
                            <td>{{ $leaveRequest->from_date }}</td>
                            <td>{{ $leaveRequest->to_date }}</td>
                            <td>{{ $leaveRequest->no_of_days }}</td>
                            {{-- <td>{{ $leaveRequest->status }}<button class="btn btn-danger">Revoke</button></td> --}}
                            <td>
                                <div class="revoke-btn">{{ $leaveRequest->status }}<button class="btn btn-danger revoke_btn" data-modal-target="#revoke_leave" data-leave-id="{{ $leaveRequest->id }}">Revoke</button></div>
                            </td>                            
                        </tr>
                    @endforeach
                </tbody>
            </table>                                              
        </div>
    </div>
</div> 
<div id="add_leaves" class="modal custom-modal fade" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Add Leave</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				{{-- <form action="{{ route('leave-request.store') }}" method="POST"> --}}
        <form action="{{ route('leave-request.store') }}" method="POST">
				  @csrf
				  	<div class="form-group">
              <label for="username">User Name:</label>
              <h4>{{auth()->user()->username}}</h4>
            </div>
            <div class="form-group">
                <label>Leave Type <span class="text-danger">*</span></label><br>
                <select name="leave_type" id="leave_type" class="select" required>
                    <option value="">Select Leave Type</option> <!-- added option to prompt user -->
                    @foreach (\App\Models\LeaveType::get() as $leave_type)
                        <option value="{{$leave_type->id}}">{{$leave_type->type}}</option>
                    @endforeach
                </select>
                <span class="text-danger" id="days_available"></span>
            </div>                    
            {{-- <div class="form-group">
                <label>From <span class="text-danger">*</span></label>
                <div class="cal-icon">
                    <input id="from_date" name="from_date" class="form-control datetimepicker" type="text" disabled required>
                </div>
            </div>          --}}
            <div class="form-group">
                <label>From <span class="text-danger">*</span></label>
                <div class="cal-icon">
                    <input id="from_date" name="from_date" class="form-control datetimepicker" type="text" disabled required>
                    <input type="hidden" name="clicked_date" id="clicked_date" value="">
                </div>
            </div>                               
            <div class="form-group">
					    <label>To <span class="text-danger">*</span></label>
					    <div class="cal-icon">
					    	<input id="to_date" name="to_date" class="form-control datetimepicker" type="text" required>
					    </div>
					  </div>
					  <div class="form-group">
					  	<label>Leave Reason <span class="text-danger">*</span></label>
					  	<textarea name="reason" rows="4" class="form-control" required></textarea>
					  </div>
					  <div class="submit-section">
					  	<button class="btn btn-primary submit-btn" type="submit">Submit</button>
					  </div>
				</form>
			</div>
		</div>
	</div>
</div>
<div id="revoke_leave" class="modal custom-modal fade" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Revoke Leave</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				{{-- <form method="POST" action="{{ route('leave-request.revoke', ['id' => $leaveRequest->id]) }}" data-leave-id="{{ $leaveRequest->id }}">
				    @csrf
				    @method('PUT')
					  <div class="form-group">
					  	<label>Leave Revoke Reason <span class="text-danger">*</span></label>
					  	<textarea name="revoke_reason" rows="4" class="form-control" required></textarea>
					  </div>
					  <div class="submit-section">
					  	<button class="btn btn-primary submit-btn" type="submit">Submit</button>
					  </div>
				</form> --}}
        {{-- <form id="revoke-form" method="POST" action="{{ route('leave-request.revoke') }}" data-leave-id="{{ $leaveRequest->id }}"> --}}
        {{-- <form id="revoke-form" method="POST" action="{{ route('leave-request.revoke', ['id' => $leaveRequest->id]) }}" data-leave-id="{{ $leaveRequest->id }}"> --}}
        <form>
          @csrf
          @method('PUT')
          <div class="form-group">
            <label>Leave Revoke Reason <span class="text-danger">*</span></label>
            <textarea name="revoke_reason" rows="4" class="form-control" required></textarea>
          </div>
          <div class="submit-section">
            <button class="btn btn-primary submit-btn" type="submit">Submit</button>
          </div>
        </form>        
			</div>
		</div>
	</div>
</div>
@endsection

@section('scripts')
<!-- Select2 JS -->
<script src="{{asset('assets/plugins/select2/select2.min.js')}}"></script>
<!-- Datatable JS -->
<script src="{{asset('assets/js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('assets/js/dataTables.bootstrap4.min.js')}}"></script>
{{-- <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script> --}}
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>

<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>

<script>
$('.datetimepicker').datetimepicker({
    format: 'YYYY-MM-DD'
});
</script>
<script>
    // $(document).ready(function() {
        $('#leavesTable').DataTable({
            "pageLength": 10,
            "responsive": true
        });
    // });
</script>
<script>
  $('.revoke_btn').click(function(e) {
  e.preventDefault();
  $('#revoke_leave').modal('show');
});
</script>
{{-- <script>
  // Wait for the DOM to load before running the script
  document.addEventListener('DOMContentLoaded', () => {
    // Get the form element
    const form = document.querySelector('#revoke-form');

    // When the form is submitted, log the ID and revoke reason
    form.addEventListener('submit', (event) => {
      const leaveId = form.dataset.leaveId;
      const revokeReason = form.querySelector('textarea[name="revoke_reason"]').value;
      console.log(`Revoking leave request with ID ${leaveId} and reason "${revokeReason}"`);
    });
  });
</script> --}}
<script>
$(document).ready(function() {
  $('td').each(function() {
    var dataDate = $(this).data('date');
    if (dataDate) {
      var date = moment(dataDate);
      if (date.isBefore(moment().startOf('day'))) {
        $(this).addClass('disabled');
        $(this).removeAttr('data-toggle');
        $(this).removeAttr('data-target');
        $(this).click(function(e) {
          e.preventDefault();
          alert("You cannot select a date in the past.");
        });
      } else if ($(this).hasClass('holiday') || $(this).hasClass('leave') || $(this).hasClass('sunday')) {
        $(this).addClass('disabled');
        $(this).removeAttr('data-toggle');
        $(this).removeAttr('data-target');
        $(this).click(function(e) {
          e.preventDefault();
          alert("This date is already marked as a holiday or leave.");
        });
      } else {
        $(this).addClass('leave-day');
        $(this).attr('data-toggle', 'modal');
        $(this).attr('data-target', '#add_leaves');
        $(this).click(function(e) {
          e.preventDefault();
          var clickedDate = moment($(this).data('date'));
          $('#from_date').val(clickedDate.format("YYYY-MM-DD"));
          $('#to_date').val(clickedDate.format("YYYY-MM-DD"));
          $('#clicked_date').val(clickedDate.format("YYYY-MM-DD"));
          $('#add_leaves').addClass('show');
          $('body').addClass('modal-open');
          $('.modal-backdrop').addClass('show');
        });
      }
    }
  });

  $('.leave-day').click(function(e) {
    e.preventDefault();
    var clickedDate = moment($(this).data('date'));
    $('#from_date').val(clickedDate.format("YYYY-MM-DD"));
    $('#to_date').val(clickedDate.format("YYYY-MM-DD"));
    $('#clicked_date').val(clickedDate.format("YYYY-MM-DD"));
    $('#add_leaves').addClass('show');
    $('body').addClass('modal-open');
    $('.modal-backdrop').addClass('show');
  });
});

    $(document).ready(function () {
        // Initialize the datetimepicker for the "to" field
        $('#to_date').datetimepicker({
            format: 'YYYY-MM-DD'
        });
        // Set the default value of the "from" field to the clicked date
        $('.datetimepicker').on('click', function () {
            var date = $(this).data('date');
            $('#from_date').val(date);
        });
    });
</script>
<script>
$(document).ready(function() {
    $('#leave_type').change(function() {
        var leaveTypeId = $(this).val();
        $.ajax({
            url: '/hrportal/leave-type/' + leaveTypeId + '/days-available',
            type: 'GET',
            success: function(data) {
                $('#days_available').html(data.days_available + ' leaves available');
            }
        });
    });
});
</script>

@endsection

{{-- for jan, april, june, july, august, october,  --}}