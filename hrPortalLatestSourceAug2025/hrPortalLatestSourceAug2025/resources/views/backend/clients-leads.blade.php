@extends('layouts.backend')

@section('styles')
<!-- Select2 CSS -->
<link rel="stylesheet" href="{{asset('assets/plugins/select2/select2.min.css')}}">
<!-- Datatable CSS -->
<link rel="stylesheet" href="{{asset('assets/css/dataTables.bootstrap4.min.css')}}">

<!-- Summernote CSS -->
<link rel="stylesheet" href="{{asset('assets/plugins/summernote/dist/summernote-bs4.css')}}">
@endsection

@section('page-header')
<div class="row align-items-center">
	<div class="col">
		<h3 class="page-title">Client Leads</h3>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="{{route('dashboard')}}">Dashboard</a></li>
			<li class="breadcrumb-item active">Client Leads</li>
		</ul>
	</div>
	<div class="col-auto float-right ml-auto">
		<a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_client_leads"><i class="fa fa-plus"></i> Add Modal</a>
	</div>
</div>
@endsection

@section('content')
    
<div class="row">
    <div class="col-md-12">
        <div class="table-responsive">
            {{-- <table class="table table-striped custom-table datatable">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Agenda</th>
                        <th>Date</th>
                        <th>Client Name</th>
                        <th>Business Name</th>
                        <th>Project Type</th>
                        <th>Status</th>
                        <th>Attendees</th>
                        <th>Referred By</th>
                        <th>Action on Team</th>
                        <th>Action on Santhosh</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table> --}}
            <table class="table table-striped custom-table datatable">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Agenda</th>
                        <th>Date</th>
                        <th>Client Name</th>
                        <th>Business Name</th>
                        <th>Project Type</th>
                        <th>Status</th>
                        <th>Attendees</th>
                        <th>Referred By</th>
                        <th>Action on Team</th>
                        <th>Action on Santhosh</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($clientMeetings as $clientMeeting)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $clientMeeting->agenda }}</td>
                            <td>{{ $clientMeeting->date }}</td>
                            <td>{{ $clientMeeting->client_name }}</td>
                            <td>{{ $clientMeeting->project_name }}</td>
                            <td>{{ $clientMeeting->project_type }}</td>
                            <td>{{ $clientMeeting->status }}</td>
                            <td>
                                @foreach(json_decode($clientMeeting->attendees) as $attendeeId)
                                  @php
                                    $employeeDetail = App\Models\EmployeeDetail::find($attendeeId);
                                  @endphp
                                  <h2 class="table-avatar">
                                    <a href="#" class="avatar" data-toggle="tooltip" title="{{$employeeDetail->firstname.' '.$employeeDetail->lastname}}">
                                      <img height= "42px;" src="{{ !empty($employeeDetail->avatar) ? asset('storage/employee_details/'.$employeeDetail->avatar): asset('assets/img/user.jpg')}}">
                                    </a>
                                    {{-- <a href="#">{{$employeeDetail->firstname.' '.$employeeDetail->lastname}}</a> --}}
                                  </h2>
                                @endforeach
                            </td>  
                            <td>{{ $clientMeeting->referred_by }}</td>
                            <td>{{ $clientMeeting->action_on_team }}</td>
                            <td>{{ $clientMeeting->action_on_santhosh }}</td>
                            {{-- <td>
                                <div class="dropdown dropdown-action">
                                    <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item editbtn" href="#" data-id="{{$clientMeeting->id}}"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                        <a class="dropdown-item deletebtn" href="#"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                    </div>
                                </div>
                            </td> --}}
                            <td class="text-right">
								<div class="dropdown dropdown-action">
									<a href="javascript:void(0)" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
									<div class="dropdown-menu dropdown-menu-right">
										<a data-id="{{$clientMeeting->id}}" class="dropdown-item editbtn" href="javascript:void(0)" data-toggle="modal"><i class="fa fa-pencil m-r-5"></i> Edit</a>
										<a data-id="{{$clientMeeting->id}}" class="dropdown-item deletebtn" href="javascript:void(0)" data-toggle="modal"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
									</div>
								</div>
							</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>            
        </div>
    </div>
</div>

<x-modals.delete :route="'client-meetings.destroy'" :title="'Client Meetings'" />

<!-- /Create Meetings Modal -->
<div id="add_client_leads" class="modal custom-modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Client Meeting</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form enctype="multipart/form-data" method="POST" action="{{ route('client-meetings.store') }}">
                    @csrf
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Agenda</label>
                                <input class="form-control" type="text" name="agenda">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Date</label>
                                <div class="cal-icon">
                                    <input class="form-control datetimepicker" name="date" type="text">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Client Name</label>
                                <input class="form-control" type="text" name="client_name">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Business Name</label>
                                <input class="form-control" type="text" name="project_name">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Project Type</label>
                                <input class="form-control" type="text" name="project_type">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Status</label>
                                <select name="status" class="select form-control" id="status">
                                    <option value="null" disabled selected>Select Status</option>
                                     <option>Lead</option>
                                     <option>Prospect</option>
                                     <option>Completed</option>
                                     <option>Cancelled</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Attendees</label>
                                <select class="select select2" multiple name="team[]">
                                    <option value="null" disabled selected>Select Attendees</option>
                                    @foreach (\App\Models\EmployeeDetail::get() as $employee)
                                        <option value="{{$employee->id}}">{{$employee->firstname.' '.$employee->lastname}} </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Referred By</label>
                                <input name="referred_by" class="form-control" type="text">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Action on Team</label>
                                <textarea name="action_on_team" rows="4" class="form-control" placeholder="Enter your message here"></textarea>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Action on Santhosh</label>
                                <textarea name="action_on_santhosh" rows="4" class="form-control" placeholder="Enter your message here"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="submit-section">
                        <button type="submit" class="btn btn-primary submit-btn">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Edit Meetings Modal -->
<div id="edit_client_leads" class="modal custom-modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Client Meeting</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                {{-- <form enctype="multipart/form-data" action="{{ route('client-meetings.update') }}" method="POST"> --}}
                    <form enctype="multipart/form-data" action="{{ route('client-meetings.update') }}" method="POST">
                {{-- <form enctype="multipart/form-data" data-id="{{$clientMeeting->id}}" id="edit-form"> --}}
                    @csrf
                    @method("PUT")
                    <input type="hidden" name="id" id="edit_id">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Agenda</label>
                                <input class="form-control" type="text" name="edit_agenda">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Date</label>
                                <div class="cal-icon">
                                    <input class="form-control datetimepicker" name="edit_date" type="text">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Client Name</label>
                                <input class="form-control" type="text" name="edit_client_name">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Business Name</label>
                                <input class="form-control" type="text" name="edit_project_name">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Project Type</label>
                                <input class="form-control" type="text" name="edit_project_type">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Status</label>
                                <select name="edit_status" class="select form-control" id="status">
                                    <option value="null" disabled selected>Select Status</option>
                                     <option>Lead</option>
                                     <option>Prospect</option>
                                     <option>Completed</option>
                                     <option>Cancelled</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Attendees</label>
                                <select class="select select2" multiple name="team[]">
                                    <option value="null" disabled selected>Select Attendees</option>
                                    @foreach (\App\Models\EmployeeDetail::get() as $employee)
                                        <option value="{{$employee->id}}">{{$employee->firstname.' '.$employee->lastname}} </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Referred By</label>
                                <input name="edit_reffered_by" class="form-control" type="text">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Action on Team</label>
                                <textarea name="edit_action_on_team" rows="4" class="form-control" placeholder="Enter your message here"></textarea>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Action on Santhosh</label>
                                <textarea name="edit_action_on_santhosh" rows="4" class="form-control" placeholder="Enter your message here"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="submit-section">
                        <button type="submit" class="btn btn-primary submit-btn">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- /Page Content -->
@endsection


@section('scripts')
<!-- Summernote JS -->
<script src="{{asset('assets/plugins/summernote/dist/summernote-bs4.min.js')}}"></script>
<!-- Select2 JS -->
<script src="{{asset('assets/plugins/select2/select2.min.js')}}"></script>
<!-- Datatable JS -->
<script src="{{asset('assets/js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('assets/js/dataTables.bootstrap4.min.js')}}"></script>
{{-- <script>
    // Define the function to open the modal
    function openEditModal() {
        // Get the modal element by ID
        var modal = $('#edit_client_leads');

        // Call the modal method to show it
        modal.modal('show');
    }

    // Attach the function to the click event of the edit button
    $('.editbtn').click(function() {
        openEditModal();
    });
</script> --}}
{{-- <script>
    $('#edit_client_leads').on('show.bs.modal', function(event) {
    var button = $(event.relatedTarget); // Button that triggered the modal
    var id = button.data('id'); // ID of the record to edit

    // Make an AJAX call to fetch the data for the record
    $.ajax({
        url: '/client-meetings/' + id,
        type: 'GET',
        success: function(data) {
            // Set values of form fields using the returned data
            $('#edit_id').val(data.id);
            $('input[name="edit_agenda"]').val(data.agenda);
            $('input[name="edit_date"]').val(data.date);
            $('input[name="edit_client_name"]').val(data.client_name);
            $('input[name="edit_project_name"]').val(data.project_name);
            $('input[name="edit_project_type"]').val(data.project_type);
            $('select[name="edit_status"]').val(data.status).trigger('change');
            $('select[name="team[]"]').val(data.attendees).trigger('change');
            $('input[name="edit_reffered_by"]').val(data.referred_by);
            $('textarea[name="edit_action_on_team"]').val(data.action_on_team);
            $('textarea[name="edit_action_on_santhosh"]').val(data.action_on_santhosh);
        },
        error: function(xhr, status, error) {
            console.log(error); // Log any errors to the console
        }
    });
});
</script> --}}
<script>
	$(document).ready(function (){
		$('.editbtn').on('click',function (){
			$('#edit_client_leads').modal('show');
			var id = $(this).data('id');
            console.log(id);
			  // Make an AJAX call to fetch the data for the record
              $.ajax({
                url: '/hrportal/client-meetings/' + id,
                type: 'GET',
                success: function(data) {
                    // Set values of form fields using the returned data
                    $('#edit_id').val(data.id);
                    $('input[name="edit_agenda"]').val(data.agenda);
                    $('input[name="edit_date"]').val(data.date);
                    $('input[name="edit_client_name"]').val(data.client_name);
                    $('input[name="edit_project_name"]').val(data.project_name);
                    $('input[name="edit_project_type"]').val(data.project_type);
                    $('select[name="edit_status"]').val(data.status).trigger('change');
                    // Parse the attendees JSON string into an array
                    var attendees = JSON.parse(data.attendees);
                    // Select the appropriate options in the multi-select input field
                    $('select[name="team[]"]').val(attendees).trigger('change');
                    $('input[name="edit_reffered_by"]').val(data.referred_by);
                    $('textarea[name="edit_action_on_team"]').val(data.action_on_team);
                    $('textarea[name="edit_action_on_santhosh"]').val(data.action_on_santhosh);
                },
                error: function(xhr, status, error) {
                    console.log(error); // Log any errors to the console
                }
            });
		})
	})
</script>
{{-- <script>
    $('#edit-form').submit(function (event) {
        console.log("Submitting form...");
    event.preventDefault(); // prevent default form submission
    let id = $(this).data('id'); // get the id from the data attribute
    console.log("ID:", id);
    let formData = new FormData(this); // get the form data
    formData.append('_method', 'PUT'); // add the PUT method override

    $.ajax({
        url: '/hrportal/clients-meetings/' + id,
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (response) {
            // handle success response
        },
        error: function (xhr, status, error) {
            // handle error response
        }
    });
});
</script> --}}
@endsection