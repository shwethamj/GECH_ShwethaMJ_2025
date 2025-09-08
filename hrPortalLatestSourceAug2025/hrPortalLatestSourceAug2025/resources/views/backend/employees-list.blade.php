@extends('layouts.backend')

@section('styles')	
<!-- Datatable CSS -->
<link rel="stylesheet" href="assets/css/dataTables.bootstrap4.min.css">
@endsection

@section('page-header')
<div class="row align-items-center">
	<div class="col">
		<h3 class="page-title">Employee</h3>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="{{route('dashboard')}}">Dashboard</a></li>
			<li class="breadcrumb-item active">Employee</li>
		</ul>
	</div>
	<div class="col-auto float-right ml-auto">
		{{-- <a href="javascript:void(0)" class="btn add-btn" data-toggle="modal" data-target="#add_employee"><i class="fa fa-plus"></i> Add Employee</a> --}}
		<div class="view-icons">
			<a href="{{route('employees')}}" class="grid-view btn btn-link {{route_is(['employees','employees-list']) ? 'active' : ''}}"><i class="fa fa-th"></i></a>
			<a href="{{route('employees-list')}}" class="list-view btn btn-link {{route_is(['employees','employees-list']) ? 'active' : '' }}"><i class="fa fa-bars"></i></a>
		</div>
	</div>
</div>
@endsection

@section('content')

<div class="row">
	<div class="col-md-12">
		<div class="table-responsive">
			<table class="table table-striped custom-table datatable">
				<thead>
					<tr>
						<th>Employee ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Mobile</th>
						<th class="text-nowrap">Join Date</th>
						<th>Designation</th>
					</tr>
				</thead>
				<tbody>
					@foreach ($employeeDetail as $employee)
					<tr>
						<td><a href="{{route('employee-infoProfileHR', ['user_id' => $employee->id])}}" style="color: #333333; text-decoration: none;">{{$employee->uuid}}</td></a>
						<td>
							<h2 class="table-avatar">
								<a href="{{route('employee-infoProfileHR', ['user_id' => $employee->id])}}" class="avatar"><img class="avatar" alt="avatar" src="@if(!empty($employee->avatar)) {{asset('storage/employee_details/'.$employee->avatar)}} @else assets/img/profiles/default.jpg @endif"></a>
								<a href="{{route('employee-infoProfileHR', ['user_id' => $employee->id])}}">{{$employee->firstname}} {{$employee->lastname}}</a>
							</h2>
						</td>
						<td>{{$employee->email}}</td>
						<td>{{$employee->phone}}</td>
						<td>{{date_format(date_create($employee->date_created),"d M,Y")}}</td>
						<td>
							{{$employee->designation->name}}
						</td>
					</tr>
					@endforeach
				</tbody>
			</table>
		</div>
	</div>
</div>

<!-- Add Employee Modal -->
<div id="add_employee" class="modal custom-modal fade" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Add Employee</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="POST" action="{{route('employee.add')}}" enctype="multipart/form-data">
					@csrf
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">First Name <span class="text-danger">*</span></label>
								<input class="form-control" name="firstname" type="text">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Last Name</label>
								<input class="form-control" name="lastname" type="text">
							</div>
						</div>
						
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Email <span class="text-danger">*</span></label>
								<input class="form-control" name="email" type="email">
							</div>
						</div>
						
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Phone </label>
								<input class="form-control" name="phone" type="text">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Company</label>
								<input type="text" class="form-control" name="company">
							</div>
						</div>
						{{-- <div class="col-md-6">
							<div class="form-group">
								<label>Department <span class="text-danger">*</span></label><br>
								<select name="department" selected="selected" id="edit_department" class="select form-control" >
									<option>Select Department</option>
									@foreach ($departments as $department)
										<option value="{{$department->id}}"
											@if($department->id == $employee->department_id)
												selected
											@endif
										>{{$department->name}}</option>
									@endforeach
								</select>								
							</div>
						</div> --}}
						{{-- <div class="col-md-6">
							<div class="form-group">
								<label>Designation <span class="text-danger">*</span></label><br>
								<select name="designation" selected="selected" id="edit_designation" class="select form-control" >
									<option>Select Designation</option>
									@foreach ($designations as $designation)
										<option value="{{$designation->id}}"
											@if($designation->id == $employee->designation_id)
												selected
											@endif
										>{{$designation->name}}</option>
									@endforeach
								</select>
							</div>
						</div> --}}
						<div class="col-md-6">
							<div class="form-group">
								<label class="col-form-label">Employee Picture<span class="text-danger">*</span></label>
								<input class="form-control floating" name="avatar" type="file">
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
<!-- /Add Employee Modal -->

<!-- Edit Employee Modal -->
<div id="edit_employee" class="modal custom-modal fade" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Edit Employee</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="POST" action="{{route('employee.update')}}" enctype="multipart/form-data">
					@csrf
					@method('PUT')
					<div class="row">
						<input type="hidden" name="id" id="edit_id">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">First Name <span class="text-danger">*</span></label>
								<input class="form-control edit_firstname" name="firstname" type="text">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Last Name</label>
								<input class="form-control edit_lastname" name="lastname" type="text">
							</div>
						</div>
						
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Email <span class="text-danger">*</span></label>
								<input class="form-control edit_email" name="email" type="email">
							</div>
						</div>
						
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Phone </label>
								<input class="form-control edit_phone" name="phone" type="text">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Company</label>
								<input type="text" class="form-control edit_company" name="company">
							</div>
						</div>
						{{-- <div class="col-md-6">
							<div class="form-group">
								<label>Department <span class="text-danger">*</span></label><br>
								<select class="select form-control" selected="selected" name="department" id="edit_department" value="{{$department->id}}">
									<option value="" disabled>-</option>
									@foreach (\App\Models\Department::get() as $department)
									<option value="{{$department->id}}">{{$department->name}}</option>
									@endforeach 
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Designation <span class="text-danger">*</span></label><br>
								<select name="designation" name="designation" class="select form-control" id="edit_designation" value="{{$designation->id}}" >
									@foreach (\App\Models\Designation::get() as $designation)
							 		<option value="{{$designation->id}}">{{$designation->name}}</option>
							 		@endforeach 
								</select>
							</div>
						</div> --}}
						<div class="col-md-6">
							<div class="form-group">
								<label class="col-form-label">Employee Picture<span class="text-danger">*</span></label>
								<input class="form-control floating edit_avatar" name="avatar" type="file">
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
<!-- /Edit Employee Modal -->
@endsection

@section('scripts')
<!-- Datatable JS -->
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/dataTables.bootstrap4.min.js"></script>
<script>
	$(document).ready(function (){
		$('.editbtn').on('click',function (){
			$('#edit_employee').modal('show');
			var id = $(this).data('id');
			var firstname = $(this).data('firstname');
			var lastname = $(this).data('lastname');
			var email = $(this).data('email');
			var phone = $(this).data('phone');
			var avatar = $(this).data('avatar');
			var company = $(this).data('company');
			var designation = $(this).data('designation');
			var department = $(this).data('department');
			$('#edit_id').val(id);
			$('.edit_firstname').val(firstname);
			$('.edit_lastname').val(lastname);
			$('.edit_email').val(email);
			$('.edit_phone').val(phone);
			$('.edit_company').val(company);
			$('#edit_designation').val(designation).change();
			$('#edit_department').val(department).change();
			$('.edit_avatar').attr('src',avatar);
		})
	})
</script>
@endsection
