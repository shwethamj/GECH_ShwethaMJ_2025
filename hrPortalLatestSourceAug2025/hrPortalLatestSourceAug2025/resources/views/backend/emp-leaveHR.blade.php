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
        padding: 0px;
        margin: 0;
    }
    .btn-group {
        display: flex;
        gap: 5px;
    }
    .toast {
    position: fixed;
    top: 70px;
    right: 0;
    z-index: 1;
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
    <div class="col-lg-12">
        <div class="table-responsive">
			<table class="table table-striped custom-table mb-0 text-center" id="leavesTable" style="width:100%">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Employee Name</th>
                        <th>Leave Type</th>
                        <th>From Date</th>
                        <th>To Date</th>
                        <th>Reason</th>
                        <th>No. of Days</th>
                        <th>Status</th>
                    </tr>
                </thead>
                {{-- <tbody id="leavesTableBody">
                    @foreach ($leaveRequests as $leaveRequest)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $leaveRequest->user->name }}</td>
                            <td>{{ $leaveRequest->leaveType->type }}</td>
                            <td>{{ $leaveRequest->from_date }}</td>
                            <td>{{ $leaveRequest->to_date }}</td>
                            <td>{{ $leaveRequest->no_of_days }}</td>
                            <td id="status-{{ $loop->index }}">
                                <div class="btn-group">
                                    @if($leaveRequest->status == 'Approved')
                                        <button type="button" class="btn btn-success rounded-pill active">Approve</button>
                                        <button type="button" class="btn btn-secondary rounded-pill hide-on-click btn-danger">Reject</button>
                                    @elseif($leaveRequest->status == 'Rejected')
                                        <button type="button" class="btn btn-secondary rounded-pill hide-on-click btn-success">Approve</button>
                                        <button type="button" class="btn btn-danger rounded-pill active">Reject</button>
                                    @else
                                        <button type="button" class="btn btn-secondary rounded-pill hide-on-click btn-success">Approve</button>
                                        <button type="button" class="btn btn-secondary rounded-pill hide-on-click btn-danger">Reject</button>
                                    @endif
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody> --}}
                <tbody id="leavesTableBody">
                    @foreach ($leaveRequests as $leaveRequest)
                        <tr data-id="{{ $leaveRequest->id }}">
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $leaveRequest->user->name }}</td>
                            <td>{{ $leaveRequest->leaveType->type }}</td>
                            <td>{{ $leaveRequest->from_date }}</td>
                            <td>{{ $leaveRequest->to_date }}</td>
                            <td>{{ $leaveRequest->reason }}</td>
                            <td>{{ $leaveRequest->no_of_days }}</td>
                            <td id="status-{{ $loop->index }}">
                                <div class="btn-group">
                                    @if($leaveRequest->status == 'Approved')
                                        <button type="button" class="btn btn-success rounded-pill active">Approved</button>
                                     
                                    @elseif($leaveRequest->status == 'Rejected')
                                       
                                        <button type="button" class="btn btn-danger rounded-pill active">Rejected</button>
                                    @else
                                        <button type="button" class="btn btn-secondary leave-request-btn rounded-pill hide-on-click btn-success">Approve</button>
                                        <button type="button" class="btn btn-secondary leave-request-btn rounded-pill hide-on-click btn-danger">Reject</button>
                                    @endif
                                </div>
                            </td>
                        </tr>
                    @endforeach
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>

<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        $('#leavesTable').DataTable({
            "pageLength": 10
        });
    });
</script>
{{-- Script written for toggling and storing the updated status in DB --}}
<script>
$(document).ready(function() {
    // Attach click event listener to pills
    $('.leave-request-btn').on('click', function() {
        // Get the current button's status
        var currentStatus = $(this).text().trim();

        // If current button is already active, don't do anything
        if ($(this).hasClass('btn-large')) {
            return;
        }

        // Set the clicked button as active and show its
        $(this).addClass('btn-large').removeClass('hide-on-click');

        // Hide all other buttons in the same row
        $(this).siblings('.btn').removeClass('btn-large').addClass('hide-on-click');

        // Update the status in the cell
        var statusCell = $(this).closest('td');
        var newStatus = (currentStatus == 'Approve' ? 'Approved' : 'Rejected');
        statusCell.empty().append('<span class="btn active btn-' + (currentStatus == 'Approve' ? 'success' : 'danger') + ' rounded-pill">' + newStatus + '</span>');

        // Store the status in local storage
        var row = statusCell.closest('tr');
        var index = row.index();
        var key = 'status-' + index;
        localStorage.setItem(key, newStatus);

        // Send AJAX request to update status in database
        var leaveId = row.data('id');
        updateLeaveStatus(leaveId, newStatus);
    });

    // Load stored statuses on page load
    $('td[id^="status-"]').each(function() {
        var row = $(this).closest('tr');
        var index = row.index();
        var key = 'status-' + index;
        var status = localStorage.getItem(key);
        if (status) {
            var btn = $(this).find('.btn:contains(' + status + ')');
            if (btn.length) {
                btn.click();
            }
        }
    });
});

function updateLeaveStatus(leaveId, newStatus) {
    console.log("Leave Request ID: " + leaveId);
    console.log("New Status: " + newStatus);
    $.ajax({
        // url: '/leave-requests/' + leaveId,
        url: '/hrportal/leave-requests/' + leaveId,
        method: 'PUT',
        data: {
            _token: $('meta[name="csrf-token"]').attr('content'),
            status: newStatus
        },
        success: function(response) {
            console.log(response);
            // location.reload();
        },
        error: function(xhr) {
            console.log(xhr.responseText);
            // location.reload();
        }
    });
}
</script>
@endsection