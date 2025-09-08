@extends('layouts.backend')

@section('styles')	
<!-- Datatable CSS -->
<link rel="stylesheet" href="{{asset('assets/css/dataTables.bootstrap4.min.css')}}">
@endsection


@section('page-header')
<div class="row align-items-center">
	<div class="col">
		<h3 class="page-title">Jobs</h3>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="{{route('dashboard')}}">Dashboard</a></li>
			<li class="breadcrumb-item active">Jobs</li>
		</ul>
	</div>
	<div class="col-auto float-right ml-auto">
		<a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_job"><i class="fa fa-plus"></i> Add Job</a>
	</div>
</div>
@endsection

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="table-responsive">
			<table class="table table-striped custom-table mb-0" id="datatable">
				<thead>
					<tr>
					     <th>#</th>
						<th>Job Title</th>
						<th>Department</th>
						<th>Start Date</th>
						<th>Expire Date</th>
						<th class="text-center">Job Type</th>
						<th class="text-center">Status</th>
						<th class="text-right">Actions</th>
					</tr>
				</thead>
				<tbody>
				      @php
						$count = 1;
					@endphp
					@if(!empty($jobs->count()))
                    @foreach ($jobs as $job)
                        <tr>
                            <td>{{$count}}</td>
                            <td><a target="_blank" href="{{route('job-view',$job)}}">{{$job->title}}</a></td>
                            <td>{{$job->department->name}}</td>
                            <td>{{date_format(date_create($job->start_date),"d M, Y")}}</td>
                            <td>{{date_format(date_create($job->expire_date),"d M, Y")}}</td>
                            <td class="text-center">
                                {{$job->type}}
                            </td>
                            <td class="text-center">
                                {{$job->status}}
                            </td>
                            <td class="text-right">
                                <div class="dropdown dropdown-action">
                                    <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                    <div class="dropdown-menu dropdown-menu-right">
                                         <!--<a class="dropdown-item" href="#"><i class="fa fa-download m-r-5"></i> Download</a> -->
                                         <a class="dropdown-item editbtn" href="#" data-toggle="modal" data-target="#edit_job" data-id="{{$job->id}}" data-title="{{$job->title}}"  data-department="{{$job->department->id}}" data-location="{{$job->location}}" data-vacancies="{{$job->vacancies}}" data-experience="{{$job->experience}}"
										  data-age="{{$job->age}}" data-salary_from="{{$job->salary_from}}" data-salary_to="{{$job->salary_to}}"
										  data-type="{{$job->type}}" data-status="{{$job->status}}" data-start_date="{{$job->start_date}}" data-expire_date="{{$job->expire_date}}" data-description="{{$job->description}}"><i class="fa fa-pencil m-r-5"></i> Edit</a> 
                                    <a class="dropdown-item deletebtn" href="javascript:void(0)" data-id="{{$job->id}}"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        	@php
						$count++;
					@endphp
                    @endforeach
                    {{-- <x-modals.delete :route="'job.destroy'" :title="'jobs'" /> --}}
                @endif   
			
				</tbody>
			</table>
		</div>
	</div>
</div>

<!-- Add Job Modal -->
<div id="add_job" class="modal custom-modal fade" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Add Job</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="post" action="{{route('jobs')}}">
					@csrf
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Job Title  <span class="text-danger">*</span></label>
								<input class="form-control" name="title" type="text">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Department  <span class="text-danger">*</span></label>
								<select class="select form-control" name="department_id">
								       <option value="null" disabled selected>Select Department</option>
									@if(!empty($departments->count()))
										@foreach ($departments as $department)
											<option value="{{$department->id}}">{{$department->name}}</option>
										@endforeach
									@endif
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Job Location  <span class="text-danger">*</span></label>
								<input class="form-control" name="location" type="text">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>No of Vacancies  <span class="text-danger">*</span></label>
								<input class="form-control" name="vacancies" type="text">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Experience  <span class="text-danger">*</span></label>
								<input class="form-control" name="experience" type="text">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Age</label>
								<input class="form-control" name="age" type="text">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Salary From</label>
								<input type="text" name="salary_from" class="form-control">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Salary To</label>
								<input type="text" name="salary_to" class="form-control">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Job Type  <span class="text-danger">*</span></label>
								<select name="type" class="select form-control">
								      <option value="null" disabled selected>Select Job Type</option>
									<option>Full Time</option>
									<option>Part Time</option>
									<option>Internship</option>
									<option>Temporary</option>
									<option>Remote</option>
									<option>Others</option>
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Status  <span class="text-danger">*</span></label>
								<select name="status" class="select form-control">
								   <option value="null" disabled selected>Select Status</option>
									<option>Open</option>
									<option>Closed</option>
									<option>Cancelled</option>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Start Date <span class="text-danger">*</span></label>
								<input type="date" name="start_date" class="form-control datetimepicker">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Expired Date <span class="text-danger">*</span></label>
								<input type="date" name="expire_date" class="form-control datetimepicker">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
                               <div class="form-group">
                                <label>Description <span class="text-danger">*</span></label>
                                <textarea class="form-control summernote" name="description"></textarea>
                            </div>
						</div>
					</div>
					<div class="submit-section">
						<button class="btn btn-primary submit-btn">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- /Add Job Modal -->

<!-- Edit Job Modal -->
<div id="edit_job" class="modal custom-modal fade" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<button type="button" class="close" data-dismiss="modal">&times;</button>
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Edit Job</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="POST" action="{{route('jobs')}}">
					@csrf
					@method("PUT")
					<div class="row">
						 <input name="id" id="edit_id" hidden>
						<div class="col-md-6">
							<div class="form-group">
								<label>Job Title  <span class="text-danger">*</span></label>
								<input class="form-control" name="title" type="text" id="edit_title">
							</div>
						</div>
						 <div class="col-md-6">
							<div class="form-group">
								<label>Department  <span class="text-danger">*</span></label>
								<select class="select form-control" name="department" id="edit_department" value="{{$department->id}}">
						           <option value="null" disabled selected>Select Department</option>
									 @foreach (\App\Models\Department::get() as $department)
						 <option value="{{$department->id}}">{{$department->name}}</option>
						 @endforeach 
								</select>
							</div>
						</div> 
						
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Job Location <span class="text-danger">*</span></label>
								<input class="form-control" name="location" type="text" id="edit_location">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>No of Vacancies <span class="text-danger">*</span></label>
								<input class="form-control" name="vacancies" type="text" id="edit_vacancies">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Experience <span class="text-danger">*</span></label>
								<input class="form-control" name="experience" type="text" id="edit_experience">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Age</label>
								<input class="form-control" name="age" type="text" id="edit_age">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Salary From </label>
								<input type="text" name="salary_from" class="form-control" id="edit_salary_from">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Salary To</label>
								<input type="text" name="salary_to" class="form-control" id="edit_salary_to">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Job Type <span class="text-danger">*</span></label>
								<select name="type" class="select form-control edit_type" id="edit_type">
								        <option value="null" disabled selected>Select Job Type</option>
									<option>Full Time</option>
									<option>Part Time</option>
									<option>Internship</option>
									<option>Temporary</option>
									<option>Remote</option>
									<option>Others</option>
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Status <span class="text-danger">*</span></label>
								<select name="status" class="select form-control" id="edit_status">
								     <option value="null" disabled selected>Select Status</option>
									<option>Open</option>
									<option>Closed</option>
									<option>Cancelled</option>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
						
							
							<div class="form-group">
								<label>Start Date <span class="text-danger">*</span></label>
								<input type="date" name="start_date" class="form-control datetimepicker"  id="edit_start_date">
							</div>
							
						</div>
						<div class="col-md-6">
							<!--<div class="form-group">-->
							<!--	<label>Expired Date</label>-->
							<!--	<input type="text" name="expire_date" class="form-control datetimepicker" id="edit_expire_date">-->
							<!--</div>-->
							
							<div class="form-group">
								<label>Expired Date <span class="text-danger">*</span></label>
								<input type="date" name="expire_date" class="form-control datetimepicker"  id="edit_expire_date">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>Description <span class="text-danger">*</span></label>
								<textarea class="form-control" id="edit_description" name="description"></textarea>
							</div>
						</div>
					</div>
					<div class="submit-section">
						<button class="btn btn-primary submit-btn">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- /Edit Job Modal -->

<x-modals.delete :route="'jobs'" :title="'Job'" />
@endsection

@section('scripts')
	<!-- Datatable JS -->
	<script src="{{asset('assets/js/jquery.dataTables.min.js')}}"></script>
	<script src="{{asset('assets/js/dataTables.bootstrap4.min.js')}}"></script>
	<script>
	var options = {
		filebrowserImageBrowseUrl: '/laravel-filemanager?type=Images',
		filebrowserImageUploadUrl: '/laravel-filemanager/upload?type=Images&_token=',
		filebrowserBrowseUrl: '/laravel-filemanager?type=Files',
		filebrowserUploadUrl: '/laravel-filemanager/upload?type=Files&_token='
	};
	CKEDITOR.replace('my-editor', options);
	</script>
	<script>
	
	</script>
<script>
		//$(document).ready(function (){
			$('.editbtn').on('click',function (){
				$('#edit_job').modal('show');
				var id = $(this).data('id');
				var title = $(this).data('title');
				var department = $(this).data('department');
				var location= $(this).data('location');
				var vacancies= $(this).data('vacancies');
				var experience= $(this).data('experience');
				var age= $(this).data('age');
				var salary_from= $(this).data('salary_from');
				var salary_to=  $(this).data('salary_to');
				var type = $(this).data('type');
				var status = $(this).data('status')

				var experience = $(this).data('experience');
				var start_date = $(this).data('start_date');
				var expire_date = $(this).data('expire_date');
				var description = $(this).data('description');

				$('#edit_id').val(id);
				$('#edit_title').val(title);
				$("#edit_department").val(department).change();
				$('#edit_location').val(location);
				$('#edit_vacancies').val(vacancies);
				$('#edit_experience').val(experience);
				$('#edit_age').val(age);
				$('#edit_salary_from').val(salary_from);
				$('#edit_salary_to').val(salary_to);
				$('#edit_type').val(type);
				$('#edit_status').val(status);
				$('#edit_start_date').val(start_date);
				$('#edit_expire_date').val(expire_date);
				$('#edit_description').val(description); 

			});
		//})
	</script>
	<script>
//$(document).ready(function() {
	// Datatables initialization
	
        $('#datatable').DataTable({
             "bFilter": true,
			order:[[0,'desc']],
        });
 
	</script>
@endsection
