@extends('layouts.backend')

@section('styles')
<!-- Select2 CSS -->
<link rel="stylesheet" href="{{asset('assets/plugins/select2/select2.min.css')}}">
<!-- Datatable CSS -->
<link rel="stylesheet" href="{{asset('assets/css/dataTables.bootstrap4.min.css')}}">
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
<style>
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
</style>
@endsection

@section('page-header')
<div class="row align-items-center">
	<div class="col">
		<h3 class="page-title">Employee Attendance</h3>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="{{route('dashboard')}}">Dashboard</a></li>
			<li class="breadcrumb-item active">Attendance</li>
		</ul>
	</div>
</div>
@endsection

@section('content')
<div class="row">
    <div class="col-md-6">
        <div class="card punch-status">
            <div class="card-body">
                <h5 class="card-title text-center">Date: <small class="text-muted">{{ date('d M Y') }}</small></h5>
                @php
                    $user = Auth::user();
                    $attendance = App\Models\Attendance::where('user_id', $user->id)
                        ->whereDate('attendance_date', today())
                        ->first();
                @endphp
                <div class="punch-det">
                    <h6>Punch In at</h6>
                    <p id="checkin-time">{{ $attendance->checkin_time ?? 'Not checked in yet' }}</p>
                </div>
                <div class="punch-info">
                    <div class="punch-hours">
                        {{-- <span id="total-hours">0.00 hrs</span> --}}
                        <span id="total-hours">0:00:00</span>
                    </div>
                </div>
                <div class="punch-btn-section">
                    <button type="button" class="btn btn-primary punch-btn" id="punch-btn" data-url="{{ route('attendance.punchClock') }}">
                        @if (!$attendance || $attendance->checkout_time)
                            Check-in
                        @else
                            Check-out
                        @endif
                    </button>
                </div>
                <div class="punch-det">
                    <h6>Punch Out at</h6>
                    <p id="checkout-time">{{ $attendance->checkout_time ?? 'Not checked out yet' }}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="card att-statistics">
            <div class="card-body">
                <h5 class="card-title">Statistics</h5>
                <div class="stats-list">
                    <div class="stats-info">
                        <p>Today <strong>3.45 <small>/ 8 hrs</small></strong></p>
                        <div class="progress">
                            <div class="progress-bar bg-primary" role="progressbar" style="width: 31%" aria-valuenow="31" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <div class="stats-info">
                        <p>This Week <strong>28 <small>/ 40 hrs</small></strong></p>
                        <div class="progress">
                            <div class="progress-bar bg-warning" role="progressbar" style="width: 31%" aria-valuenow="31" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <div class="stats-info">
                        <p>This Month <strong>90 <small>/ 160 hrs</small></strong></p>
                        <div class="progress">
                            <div class="progress-bar bg-success" role="progressbar" style="width: 62%" aria-valuenow="62" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <div class="stats-info">
                        <p>Remaining <strong>90 <small>/ 160 hrs</small></strong></p>
                        <div class="progress">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: 62%" aria-valuenow="62" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <div class="stats-info">
                        <p>Overtime <strong>4</strong></p>
                        <div class="progress">
                            <div class="progress-bar bg-info" role="progressbar" style="width: 22%" aria-valuenow="22" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {{-- <div class="col-md-4">
        <div class="card recent-activity">
            <div class="card-body">
                <h5 class="card-title">Today Activity</h5>
                <ul class="res-activity-list">
                    <li>
                        <p class="mb-0">Punch In at</p>
                        <p class="res-activity-time">
                        <i class="fa fa-clock-o"></i>
                        10.00 AM.
                        </p>
                    </li>
                    <li>
                        <p class="mb-0">Punch Out at</p>
                        <p class="res-activity-time">
                        <i class="fa fa-clock-o"></i>
                        11.00 AM.
                        </p>
                    </li>
                    <li>
                        <p class="mb-0">Punch In at</p>
                        <p class="res-activity-time">
                        <i class="fa fa-clock-o"></i>
                        11.15 AM.
                        </p>
                    </li>
                    <li>
                        <p class="mb-0">Punch Out at</p>
                        <p class="res-activity-time">
                        <i class="fa fa-clock-o"></i>
                        1.30 PM.
                        </p>
                    </li>
                    <li>
                        <p class="mb-0">Punch In at</p>
                        <p class="res-activity-time">
                        <i class="fa fa-clock-o"></i>
                        2.00 PM.
                        </p>
                    </li>
                    <li>
                        <p class="mb-0">Punch Out at</p>
                        <p class="res-activity-time">
                        <i class="fa fa-clock-o"></i>
                        7.30 PM.
                        </p>
                    </li>
                </ul>
            </div>
        </div>
    </div> --}}
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="table-responsive">
            <table class="table table-striped custom-table mb-0 text-center" id="attendanceTable">
                <thead>
                    <tr style="background-color: #ca9c9c">
                        <th>#</th>
                        <th>Date </th>
                        <th>Employee Name</th>
                        <th>Check In</th>
                        <th>Check-in Status</th>
                        <th>Check Out</th>
                        <th>Checkout Status</th>
                    </tr>
                </thead>
                <tbody id="attendanceTableBody">
                    @if(isset($attendances))
                        @foreach($attendances as $key => $attendance)
                            <tr>
                                <td>{{ $key+1 }}</td>
                                <td>{{ $attendance->attendance_date }}</td>
                                <td>{{ $attendance->user->name }}</td>
                                <td>{{ $attendance->checkin_time ?? 'N/A' }}</td>
                                <td>{{ $attendance->checkin_status ?? 'N/A' }}</td>
                                <td>{{ $attendance->checkout_time ?? '-' }}</td>
                                <td>{{ $attendance->checkout_status ?? '-' }}</td>
                            </tr>
                        @endforeach
                    @endif
                </tbody>
            </table>                                              
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
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>

<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        $('#punch-btn').click(function() {
            var url = '{{ route("attendance.punchClock") }}';
            var button = $(this);

            $.ajax({
                type: 'POST',
                url: url,
                data: {
                    _token: '{{ csrf_token() }}'
                },
                success: function(response) {
                    if (response.success) {
                        alert(response.message);
                        location.reload();

                        // Update punch-in and punch-out time
                        if (response.checkin_time) {
                            $('#checkin-time').text(response.checkin_time);
                        }
                        if (response.checkout_time) {
                            $('#checkout-time').text(response.checkout_time);
                        }

                        // Update button text based on response
                        if (response.checkin_time && response.checkout_time) {
                            button.text('Check-in');
                        } else if (response.checkin_time) {
                            button.text('Check-out');
                        } else {
                            button.text('Check-in');
                        }
                    } else {
                        alert(response.message);
                    }
                },
                error: function(xhr) {
                    console.log(xhr.responseText);
                }
            });
        });
    });
</script>
<script>
    $(document).ready(function() {
        $('#attendanceTable').DataTable({
            "pageLength": 10
        });
    });
</script>
{{-- <script>
    $(document).ready(function() {
        $('#punch-btn').click(function() {
            var url = '{{ route("attendance.punchClock") }}';
            var button = $(this);

            $.ajax({
                type: 'POST',
                url: url,
                data: {
                    _token: '{{ csrf_token() }}'
                },
                success: function(response) {
                    if (response.success) {
                        alert(response.message);

                        // Update punch-in and punch-out time
                        if (response.checkin_time) {
                            $('#checkin-time').text(response.checkin_time);
                        }
                        if (response.checkout_time) {
                            $('#checkout-time').text(response.checkout_time);
                        }

                        // Update button text based on response
                        if (response.checkin_time && response.checkout_time) {
                            button.text('Check-in');
                        } else if (response.checkin_time) {
                            button.text('Check-out');
                        } else {
                            button.text('Check-in');
                        }

                        // Update attendance data in the table
                        var attendanceRow = '<tr>' +
                                            '<td>' + (response.attendance_id ? response.attendance_id : '') + '</td>' +
                                            '<td>' + response.attendance_date + '</td>' +
                                            '<td>' + response.employee_name + '</td>' +
                                            '<td>' + (response.checkin_time ? response.checkin_time : 'N/A') + '</td>' +
                                            '<td>' + (response.checkin_status ? response.checkin_status : 'N/A') + '</td>' +
                                            '<td>' + (response.checkout_time ? response.checkout_time : '-') + '</td>' +
                                            '<td>' + (response.checkout_status ? response.checkout_status : '-') + '</td>' +
                                          '</tr>';
                        var attendanceTable = $('table.custom-table');
                        var attendanceTableBody = attendanceTable.find('tbody');

                        // Check if attendance row already exists in the table
                        var existingAttendanceRow = attendanceTableBody.find('tr').filter(function() {
                            return $(this).find('td:first').text() === response.attendance_id;
                        });

                        if (existingAttendanceRow.length) {
                            // Update existing attendance row with new data
                            existingAttendanceRow.replaceWith(attendanceRow);
                        } else {
                            // Append new attendance row to table
                            attendanceTableBody.append(attendanceRow);
                        }
                    } else {
                        alert(response.message);
                    }
                },
                error: function(xhr) {
                    console.log(xhr.responseText);
                }
            });
        });
    });
</script> --}}
{{-- <script>
    $(document).ready(function() {
        $('#punch-btn').click(function() {
            var url = '{{ route("attendance.punchClock") }}';
            var button = $(this);

            $.ajax({
                type: 'POST',
                url: url,
                data: {
                    _token: '{{ csrf_token() }}'
                },
                success: function(response) {
                    if (response.success) {
                        alert(response.message);
                    
                        // Find the existing table row for the current date and user
                        var row = $('table tbody tr[data-date="' + response.attendance_date + '"][data-user="' + response.user_id + '"]');

                        // If the row exists, update the check-in/check-out time and status
                        if (row.length) {
                            if (response.checkin_time) {
                                row.find('.checkin-time').text(response.checkin_time);
                            }
                            if (response.checkout_time) {
                                row.find('.checkout-time').text(response.checkout_time);
                            }
                            if (response.checkin_status) {
                                row.find('.checkin-status').text(response.checkin_status);
                            }
                            if (response.checkout_status) {
                                row.find('.checkout-status').text(response.checkout_status);
                            }
                        } else {
                            // If the row does not exist, create a new row
                            var newRow = '<tr data-date="' + response.attendance_date + '" data-user="' + response.user_id + '">' +
                                            '<td>' + ($('table tbody tr').length + 1) + '</td>' +
                                            '<td>' + response.attendance_date + '</td>' +
                                            '<td>' + response.user_name + '</td>' +
                                            '<td class="checkin-time">' + (response.checkin_time || 'N/A') + '</td>' +
                                            '<td class="checkin-status">' + (response.checkin_status || 'N/A') + '</td>' +
                                            '<td class="checkout-time">' + (response.checkout_time || '-') + '</td>' +
                                            '<td class="checkout-status">' + (response.checkout_status || '-') + '</td>' +
                                        '</tr>';
                            
                            $('table tbody').append(newRow);
                        }
                    
                        // Update button text based on response
                        if (response.checkin_time && response.checkout_time) {
                            button.text('Check-in');
                        } else if (response.checkin_time) {
                            button.text('Check-out');
                        } else {
                            button.text('Check-in');
                        }
                    } else {
                        alert(response.message);
                    }
                },
                error: function(xhr) {
                    console.log(xhr.responseText);
                }
            });
        });
    });
</script> --}}
@endsection
