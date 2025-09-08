@extends('layouts.backend')

@section('styles')	
<!-- Select2 CSS -->
<link rel="stylesheet" href="{{asset('assets/plugins/select2/select2.min.css')}}">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- Datatable CSS -->
<link rel="stylesheet" href="{{asset('assets/css/dataTables.bootstrap4.min.css')}}">
<style>
	.submit-section.center {
		display: flex;
		justify-content: center;
		align-items: center;
		margin-top: 20px;
	}
	/* .profile-img {
        display: flex;
        justify-content: center;
        align-items: center;
    } */
	.profile {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
	}

	.profile-img-wrap {
	margin-top: 25px;
	}

	.profile-view .profile-basic{
		margin-left: 0;
	}

	.profile-info {
	display: flex;
	flex-direction: column;
	margin-top: 155px; 
	align-items: center;
	justify-content: center;
	}
	@media only screen and (min-width: 380px) and (max-width: 440px) {
                .profile-info {
                    margin-top: 25px;
                    margin-bottom:50px;
                }
            }
</style>
@endsection

@section('page-header')
<div class="row align-items-center">
	<div class="col">
		<h3 class="page-title">Employee Profile</h3>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="{{route('dashboard')}}">Dashboard</a></li>
			<li class="breadcrumb-item active">Employee Profile</li>
		</ul>
	</div>
	<div class="col-auto float-right ml-auto">
		<a href="javascript:void(0)" class="btn add-btn" data-toggle="modal" data-target="#add_employee"><i class="fa fa-plus"></i> Add Employee</a>
	</div>
</div>
@endsection

@section('content')
<div class="row mb-2">
	<div class="col-3">
		<!--{{-- <select class="form-control" name="user">-->
		<!--	<option value="null" selected>Select User</option>-->
		<!--	@foreach (\App\Models\User::get() as $user)-->
		<!--		<option value="{{ $user->id }}"> {{ $user->username }} </option>-->
		<!--	@endforeach-->
		<!--</select> --}}-->
		<!--{{-- <select class="form-control" name="user" id="user-dropdown">-->
		<!--	<option value="null" selected>Select Employee</option>-->
		<!--	@foreach (\App\Models\User::get() as $user)-->
		<!--	  <option value="{{ $user->id }}"> {{ $user->username }} </option>-->
		<!--	@endforeach-->
		<!--</select> --}}-->
		<select class="form-control" name="user" id="user-dropdown" style="width:auto">
			<option value="null" selected>Select Employee</option>
			@foreach (\App\Models\EmployeeDetail::get() as $employee)
			  <option value="{{ $employee->id }}"> {{ $employee->firstname . ' ' . $employee->lastname }} </option>
			@endforeach
		</select>	 
	</div>
</div>
<div class="row">
    <div class="col-md-12">
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
						<form method="POST" action="{{ route('employee-infoHR.store') }}" enctype="multipart/form-data">	
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
										<label class="col-form-label">Gender<span class="text-danger">*</span></label>
										<select class="form-control" name="gender">
											<option value="">Select Gender</option>
											<option value="Male">Male</option>
											<option value="Female">Female</option>
											<option value="Female">Trans</option>
											<option value="Female">Non-Conforming</option>
										</select>										
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Date of Joining<span class="text-danger">*</span></label>
										<div class="cal-icon">
											<input id="joining_date" name="joining_date" class="form-control datetimepicker" type="text">
										</div>
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
										<label class="col-form-label">Phone <span class="text-danger">*</span></label>
										<input class="form-control" name="phone" type="text">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Company <span class="text-danger">*</span></label>
										<input type="text" class="form-control" name="company">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label>Department <span class="text-danger">*</span></label><br>
										<select class="form-control" name="department">
											<option>Select Department</option>
											@foreach (\App\Models\Department::get() as $department)
												<option value="{{$department->id}}">{{$department->name}}</option>
											@endforeach
										</select>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label>Designation <span class="text-danger">*</span></label><br>
										<select name="designation" class="form-control">
											<option>Select Designation</option>
											@foreach (\App\Models\Designation::get() as $designation)
												<option value="{{$designation->id}}">{{$designation->name}}</option>
											@endforeach
										</select>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Employee Picture<span class="text-danger">*</span></label>
										<input class="form-control floating" name="avatar" type="file">
									</div>
								</div>
							</div>
							<hr>
							<div class="modal-header" style="margin-bottom: 35px">
								<h5 class="modal-title text-center">Assign Role to the Employee</h5>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label>Role</label>
										<select class="form-control" name="role" id="role-dropdown">
											<option value="null" selected>Select Role</option>
											@foreach (\App\Models\Role::get() as $role)
											<option value="{{ $role->id }}"> {{ $role->role_name }} </option>
											@endforeach
										</select>
									</div>
								</div>	
								<div class="col-sm-6">
									<div class="form-group">
										<label>Username <span class="text-danger">*</span></label>
										<input class="form-control" name="username" type="text">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label for="password">Password</label>
										<input type="password" name="password" id="password" class="form-control">
										<i class="fa fa-eye password-toggle"></i>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label for="password_confirmation">Confirm Password</label>
										<input type="password" name="password_confirmation" id="password_confirmation" class="form-control">
										<i class="fa fa-eye password-toggle"></i>
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
    </div>
</div>

{{-- Newly added content --}}
<div class="row" id="profile-view">
	<div class="col-md-12">
		<div class="card mb-0">
			<div class="card-body">
				<div class="row">
					<div class="col-md-12">
						<div class="profile-view">
							{{-- <div class="profile-img-wrap">
								<div class="profile-img">
									<img alt="Image Not found" src="{{ asset('storage/employee_details/' . ($employeeDetail->avatar ?? '')) }}">
								</div>
							</div> --}}
							{{-- <div class="profile-img-wrap">
								<div class="profile-img">
									<img alt="Image Not found" src="{{ asset('storage/employee_details/' . ($employeeDetail->avatar ?? '')) }}" style="max-width: 100%; max-height: 100%;">
								</div>
							</div>													 --}}							  
							<div class="profile-basic">
								<div class="row">
									<div class="col-md-6">
										{{-- <div class="profile-info-left"> --}}
											{{-- <h3 class="user-name m-t-0 mb-0">{{ $employeeDetail->firstname ?? ''}} {{ $employeeDetail->lastname ?? ''}}</h3> --}}
											{{-- <h6 class="text-muted">{{$department}}</h6> --}}
											{{-- <small class="text-muted">{{ $employeeDetail->designation->name ?? ''}}</small> --}}
											{{-- <div class="staff-id">Employee ID : {{$uuid}}</div>
											<div class="small doj text-muted">Date of Join : {{$joining_date}}</div> --}}
										{{-- </div> --}}
										<div class="profile">
											<div class="profile-img-wrap">
											  <div class="profile-img">
												<img alt="Image Not found" src="{{ asset('storage/employee_details/' . ($employeeDetail->avatar ?? '')) }}" style="max-width: 100%; max-height: 100%;">
											  </div>
											</div>
											<div class="profile-info">
											  <h3 class="user-name">{{ $employeeDetail->firstname ?? ''}} {{ $employeeDetail->lastname ?? ''}}</h3>
											  <small class="text-muted">{{ $employeeDetail->designation->name ?? ''}}</small>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<ul class="personal-info">
											<!--<li>-->
											<!--	<div class="title" style="width:auto;">Employee ID</div>-->
											<!--	<div class="text">{{ $employeeDetail->uuid ?? '-'}}</div>-->
											<!--</li>-->
											<!--<li>-->
											<!--	<div class="title" style="width:auto;">Department</div>-->
											<!--	<div class="text">{{ $employeeDetail->department->name ?? '-'}}</div>-->
											<!--</li>-->
											<!--<li>-->
											<!--	<div class="title" style="width:auto;">Designation</div>-->
											<!--	<div class="text">{{ $employeeDetail->designation->name ?? '-'}}</div>-->
											<!--</li>-->
											<!--<li>-->
											<!--	<div class="title" style="width:auto;">Gender</div>-->
											<!--	<div class="text">{{ $employeeDetail->gender ?? '-'}}</div>-->
											<!--</li>-->
											<!--<li>-->
											<!--	<div class="title" style="width:auto;">Phone</div>-->
											<!--	<div class="text">{{ $employeeDetail->phone ?? '-'}}</div>-->
											<!--</li>-->
											<!--<li>-->
											<!--	<div class="title" style="width:auto;">Email</div>-->
											<!--	<div class="text">{{ $employeeDetail->email ?? '-'}}</div>-->
											<!--</li>-->
											<!--<li>-->
											<!--	<div class="title" style="width:auto;">Joined Date</div>-->
											<!--	<div class="text">{{ $employeeDetail->joining_date ?? '-'}}</div>-->
											<!--</li>-->
											<li>
                                                <div class="title" style="width:auto;">Employee ID :</div>
                                                <div class="text">{{ $employeeDetail->uuid ?? '-'}}</div>
                                            </li>
                                            <li>
                                                <div class="title" style="width:auto;">Department:</div>
                                                <div class="text" style="padding-left:6px;">{{ $employeeDetail->department->name ?? '-'}}</div>
                                            </li>
                                            <li>
                                                <div class="title" style="width:auto;">Designation:</div>
                                                <div class="text" style="padding-left:6.5px;">{{ $employeeDetail->designation->name ?? '-'}}</div>
                                            </li>
                                            <li>
                                                <div class="title" style="width:auto;">Gender:</div>
                                                <div class="text" style="padding-left:36.5px;">{{ $employeeDetail->gender ?? '-'}}</div>
                                            </li>
                                            <li>
                                                <div class="title" style="width:auto;">Phone:</div>
                                                <div class="text" style="padding-left:44px;">{{ $employeeDetail->phone ?? '-'}}</div>
                                            </li>
                                            <li>
                                                <div class="title" style="width:auto;">Email:</div>
                                                <div class="text" style="padding-left:50px;">{{ $employeeDetail->email ?? '-'}}</div>
                                            </li>
                                            <li>
                                                <div class="title" style="width:auto;">Joined Date:</div>
                                                <div class="text" style="padding-left:5px;">{{ $employeeDetail->joining_date ?? '-'}}</div>
                                            </li>
										</ul>
									</div>
								</div>
							</div>
							<div class="pro-edit">
								<a data-target="#profile_info" data-toggle="modal" class="edit-icon" href="#"><i
										class="fa fa-pencil"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="tab-content">
			<div id="emp_profile" class="pro-overview tab-pane fade show active">
				<div class="row">
					<div class="col-md-6 d-flex">
						<div class="card profile-box flex-fill">
							<div class="card-body">
								<h3 class="card-title">Personal Informations
									<a data-target="#profile_info_modal" data-toggle="modal" class="edit-icon"
										href="#"><i class="fa fa-pencil"></i></a>
								</h3>
								<ul class="personal-info">
									<li>
										<div class="title">DOB</div>
										<div class="text">{{ $employeeAdditionalDetail->dob  ?? "-"}}</div> 
									</li>
									<li>
										<div class="title">Blood Group</div>
										<div class="text">{{ $employeeAdditionalDetail->blood_group  ?? "-"}}</div> 
									</li>
									<li>
										<div class="title">Residential Address</div>
										<div class="text">{{ $employeeAdditionalDetail->residential_address  ?? "-" }}</div> 
									</li>
									<li>
										<div class="title">Permanent Address</div>
										<div class="text">{{ $employeeAdditionalDetail->permanent_address  ?? "-"}}</div> 
									</li>
									<li>
										<div class="title">Aadhaar No.</div>
										<div class="text">{{ $employeeAdditionalDetail->aadhaar_no  ?? "-"}}</div> 
									</li>
									<li>
										<div class="title">Nationality</div>
										<div class="text">{{ $employeeAdditionalDetail->nationality  ?? "-"}}</div> 
									</li>
									<li>
										<div class="title">Religion</div>
										<div class="text">{{ $employeeAdditionalDetail->religion  ?? "-"}}</div> 
									</li>
									<li>
										<div class="title">Marital status</div>
										<div class="text">{{ $employeeAdditionalDetail->marital_status  ?? "-"}}</div> 
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-6 d-flex">
						<div class="card profile-box flex-fill">
							<div class="card-body">
								<h3 class="card-title">Emergency Contact
									<a data-target="#emergency_contact_modal" data-toggle="modal" class="edit-icon"
										href="#"><i class="fa fa-pencil"></i></a>
								</h3>
								<h5 class="section-title">Primary</h5>
								<ul class="personal-info">
									<li>
										<div class="title">Name</div>
										<div class="text">{{ $primaryName  ?? '-'}}</div>
									</li>
									<li>
										<div class="title">Relationship</div>
										<div class="text">{{ $primaryRelationship  ?? '-'}}</div>
									</li>
									<li>
										<div class="title">Phone </div>
										<div class="text">{{ $primaryPhone1  ?? '-'}}<br>{{ $primaryPhone2  ?? '-'}}</div>
									</li>
								</ul>
								<hr>
								<h5 class="section-title">Secondary</h5>
								<ul class="personal-info">
									<li>
										<div class="title">Name</div>
										<div class="text">{{$secondaryName ?? '-'}} </div>
									</li>
									<li>
										<div class="title">Relationship</div>
										<div class="text">{{$secondaryRelationship  ?? '-'}}</div>
									</li>
									<li>
										<div class="title">Phone </div>
										<div class="text">{{$secondaryPhone1  ?? '-'}}<br>{{$secondaryPhone2  ?? '-'}}</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 d-flex">
						<div class="card profile-box flex-fill">
							<div class="card-body">
								<h3 class="card-title">Education Informations
									<a data-target="#education_info" data-toggle="modal" class="edit-icon"
										href="#"><i class="fa fa-pencil"></i></a>
								</h3>
								<div class="experience-box">
                                    <ul class="experience-list">
                                        <li>
                                            <div class="experience-user">
                                                <div class="before-circle"></div>
                                            </div>
                                            <div class="experience-content">
                                                <div class="timeline-content">
                                                    <a href="#/" class="name">{{ $eduInstituteName1  ?? '-'}}</a>
                                                    <div>{{ $eduDegree1  ?? '-'}}&emsp; - &emsp;{{ $eduGrade1  ?? '-'}}</div>
                                                    <span class="time">{{ $eduStartDate1  ?? '-'}} - {{ $eduEndDate1  ?? '-'}}</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="experience-user">
                                                <div class="before-circle"></div>
                                            </div>
                                            <div class="experience-content">
                                                <div class="timeline-content">
                                                    <a href="#/" class="name">{{ $eduInstituteName2  ?? '-'}}</a>
                                                    <div>{{ $eduDegree2  ?? '-'}}&emsp; - &emsp;{{ $eduGrade2  ?? '-'}}</div>
                                                    <span class="time">{{ $eduStartDate2  ?? '-'}} - {{ $eduEndDate2  ?? '-'}}</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="experience-user">
                                                <div class="before-circle"></div>
                                            </div>
                                            <div class="experience-content">
                                                <div class="timeline-content">
                                                    <a href="#/" class="name">{{ $eduInstituteName3  ?? '-'}}</a>
                                                    <div>{{ $eduDegree3  ?? '-'}}&emsp; - &emsp;{{ $eduGrade3  ?? '-'}}</div>
                                                    <span class="time">{{ $eduStartDate3  ?? '-'}} - {{ $eduEndDate3  ?? '-'}}</span>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="experience-user">
                                                <div class="before-circle"></div>
                                            </div>
                                            <div class="experience-content">
                                                <div class="timeline-content">
                                                    <a href="#/" class="name">{{ $eduInstituteName4  ?? '-'}}</a>
                                                    <div>{{ $eduDegree4  ?? '-'}}&emsp; - &emsp;{{ $eduGrade4  ?? '-'}}</div>
                                                    <span class="time">{{ $eduStartDate4  ?? '-'}} - {{ $eduEndDate4  ?? '-'}}</span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
							</div>
						</div>
					</div>
					<div class="col-md-6 d-flex">
						<div class="card profile-box flex-fill">
							<div class="card-body">
								<h3 class="card-title">Bank information
									<a data-target="#bank_info_modal" data-toggle="modal" class="edit-icon"
										href="#"><i class="fa fa-pencil"></i></a>
								</h3>
								<ul class="personal-info">
									<li>
										<div class="title">Bank name</div>
										<div class="text">{{ $employeeAdditionalDetail->bank_name  ?? "-"}}</div>
									</li>
									<li>
										<div class="title">Branch name</div>
										<div class="text">{{ $employeeAdditionalDetail->branch_name  ?? "-"}}</div>
									</li>
									<li>
										<div class="title">Bank account No.</div>
										<div class="text">{{ $employeeAdditionalDetail->bank_ac_number  ?? "-"}}</div>
									</li>
									<li>
										<div class="title">IFSC Code</div>
										<div class="text">{{ $employeeAdditionalDetail->bank_ifsc  ?? "-"}}</div>
									</li>
									<li>
										<div class="title">PAN No</div>
										<div class="text">{{ $employeeAdditionalDetail->pan_number  ?? "-"}}</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div id="profile_info" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Edit Basic Details</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						{{-- <form> --}}
						{{-- <form method="POST" action="{{ route('employee-infoHR.updateBasicData') }}" enctype="multipart/form-data"> --}}
						<form method="POST" action="{{ route('employee-infoHR.updateBasicDataHR') }}" enctype="multipart/form-data">
							@csrf
							@method('PUT')
							<div class="row">
								<div class="col-sm-12">
									<div class="profile-img-wrap edit-img">
										<img id="avatar-preview" class="inline-block" src="{{ asset('storage/employee_details/' . ($employeeDetail->avatar ?? '')) }}" alt="user">
										<div class="fileupload btn">
											<span class="btn-text">edit</span>
											<input class="upload" name="avatar" type="file">
										</div>
									</div>
								</div>  
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">First Name <span class="text-danger">*</span></label>
										<input class="form-control" name="firstname" type="text" value="{{ $employeeDetail->firstname ?? ''}}">
										<input id="emp_id" name="emp_id" class="form-control" value="{{$userDetails['id']}}" type="hidden">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Last Name</label>
										<input class="form-control" name="lastname" type="text" value="{{ $employeeDetail->lastname ?? ''}}">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Email <span class="text-danger">*</span></label>
										<input class="form-control" name="email" type="email" value="{{ $employeeDetail->email  ?? " "}}">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Phone <span class="text-danger">*</span></label>
										<input class="form-control" name="phone" type="text" value="{{ $employeeDetail->phone  ?? " "}}">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Gender<span class="text-danger">*</span></label>
										<select class="form-control" name="gender">
											<option value="">Select Gender</option>
											{{-- <option value="Male">Male</option>
											<option value="Female">Female</option> --}}
											{{-- <option value="Male" {{ $employeeDetail->gender == 'Male' ? 'selected' : '' }}>Male</option>
      										<option value="Female" {{ $employeeDetail->gender == 'Female' ? 'selected' : '' }}>Female</option> --}}
											  {{-- <option value="Male" {{ $employeeDetail->gender == 'Male' ?? '' ? 'selected' : '' }}>Male</option>
											  <option value="Female" {{ $employeeDetail->gender == 'Female' ?? '' ? 'selected' : '' }}>Female</option> --}}
											  @if ($employeeDetail)
												<option value="Male" {{ $employeeDetail->gender == 'Male' ?? '' ? 'selected' : '' }}>Male</option>
												<option value="Female" {{ $employeeDetail->gender == 'Female' ?? '' ? 'selected' : '' }}>Female</option>
											    <option value="Trans" {{ $employeeDetail->gender == 'Trans' ?? '' ? 'selected' : '' }}>Trans</option>
											    <option value="Non-Conforming" {{ $employeeDetail->gender == 'Non-Conforming' ?? '' ? 'selected' : '' }}>Non-Conforming</option>
											  @endif
										</select>										
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Company <span class="text-danger">*</span></label>
										<input type="text" class="form-control" name="company" value="{{ $employeeDetail->company ?? ''}}">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label>Department <span class="text-danger">*</span></label><br>
										<select class="form-control" name="department">
											<option>Select Department</option>
											@foreach (\App\Models\Department::get() as $department)
												{{-- <option value="{{$department->id}}" @if($department->id == $employeeDetail->department_id) selected @endif>{{$department->name}}</option> --}}
												<option value="{{$department->id}}" @if($department->id == ($employeeDetail->department_id ?? 0)) selected @endif>{{$department->name}}</option>
												{{-- <option value="{{$department->id}}" @if($department->id ?? '' == $employeeDetail->department_id ?? '') selected @endif>{{$department->name}}</option> --}}
											@endforeach
										</select>
									</div>									
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label>Designation <span class="text-danger">*</span></label><br>
										<select name="designation" class="form-control">
											<option>Select Designation</option>
											@foreach (\App\Models\Designation::get() as $designation)
												{{-- <option value="{{$designation->id}}" @if($designation->id == $employeeDetail->designation_id) selected @endif>{{$designation->name}}</option> --}}
												<option value="{{$designation->id}}" @if($designation->id == ($employeeDetail->designation_id ?? 0)) selected @endif>{{$designation->name}}</option>
												{{-- <option value="{{$designation->id}}" @if($designation->id ?? '' == $employeeDetail->designation_id) selected @endif>{{$designation->name}}</option> --}}
											@endforeach
										</select>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Date of Joining<span class="text-danger">*</span></label>
										<div class="cal-icon">
											<input id="joining_date" name="joining_date" class="form-control datetimepicker" type="text" value="{{ $employeeDetail->joining_date ?? ''}}">
										</div>
									</div>
								</div> 
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Employee ID<span class="text-danger">*</span></label>
										<input id="emp-id" name="emp-id" class="form-control" type="text" value="{{ $employeeDetail->uuid ?? ''}}">
									</div>
								</div> 
							</div>
							<hr>
							<div class="modal-header" style="margin-bottom: 35px">
								<h5 class="modal-title text-center">Edit Details</h5>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label>Role</label>
										<select class="form-control" name="role" id="role-dropdown">
											<option value="null" selected>Select Role</option>
											@foreach (\App\Models\Role::get() as $role)
											{{-- <option value="{{ $role->id }}"> {{ $role->role_name }} </option> --}}
											<option value="{{ $role->id }}" @if ($userDetails['role'] == $role->id) selected @endif> {{ $role->role_name }} </option>
											@endforeach
										</select>
									</div>
								</div>	
								<div class="col-sm-6">
									<div class="form-group"
										<label>Username <span class="text-danger">*</span></label>
										{{-- <input class="form-control" name="username" type="text" value="{{ $userDetails->username }}"> --}}
										<input class="form-control" name="username" type="text" value="{{ $userDetails['username'] }}">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label for="password">Password</label>
										<input type="password" name="password" id="password" class="form-control" value="{{ $userDetails['visible_password'] }}">
										<i class="fa fa-eye password-toggle"></i>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label for="password_confirmation">Confirm Password</label>
										<input type="password" name="password_confirmation" id="password_confirmation" class="form-control" value="{{ $userDetails['visible_password'] }}">
										<i class="fa fa-eye password-toggle"></i>
									</div>
								</div>
								<div class="col-sm-12 text-center">
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Submit</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div id="profile_info_modal" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Personal Information</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form method="POST" action="{{ route('employee-info.additional-details.store') }}">
							@csrf
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Date of Birth<span
												class="text-danger">*</span></label>
										<div class="cal-icon">
											<input id="dob" name="dob" class="form-control datetimepicker" value="{{$employeeAdditionalDetail->dob  ?? " "}}" type="text">
											<input id="emp_id" name="emp_id" class="form-control" value="{{$userDetails['id']}}" type="hidden">
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Blood Group <span
												class="text-danger">*</span></label>
										<input class="form-control" id="blood_group" name="blood_group" value="{{ $employeeAdditionalDetail->blood_group  ?? " "}}" type="text">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Residential Address <span
												class="text-danger">*</span></label>
										<textarea rows="4" class="form-control" id="res_address" name="res_address">{{ $employeeAdditionalDetail->residential_address  ?? "" }}</textarea>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Permanent Address <span
												class="text-danger">*</span></label>
										<textarea rows="4" class="form-control" name="per_address" id="per_address">{{ $employeeAdditionalDetail->permanent_address  ?? ""}}</textarea>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Aadhaar Number <span class="text-danger">*</span></label>
										<input class="form-control" name="aadhaar" id="aadhaar" value="{{ $employeeAdditionalDetail->aadhaar_no  ?? " "}}" type="text">
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Nationality <span class="text-danger">*</span></label>
										<input class="form-control" name="nationality" id="nationality" value="{{ $employeeAdditionalDetail->nationality  ?? " "}}" type="text">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Religion <span
												class="text-danger">*</span></label>
										<input type="text" class="form-control" name="religion" value="{{ $employeeAdditionalDetail->religion  ?? " "}}"  id="religion">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="col-form-label">Marital Status <span
												class="text-danger">*</span></label>
										<input type="text" class="form-control" name="marital_status" value="{{ $employeeAdditionalDetail->marital_status  ?? " "}}">
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
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div id="emergency_contact_modal" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Emergency Contact Information</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="{{ route('employee-info.emergency-contact.store') }}" method="POST">
						@csrf
							<div class="card">
								<div class="card-body">
									<h3 class="card-title">Primary Contact</h3>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Name <span class="text-danger">*</span></label>
												<input name="primary_contact[name]" value="{{ $primaryName ?? ''}}" type="text" class="form-control" required>
												<input id="emp_id" name="emp_id" class="form-control" value="{{$userDetails['id']}}" type="hidden">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Relationship <span class="text-danger">*</span></label>
												<input name="primary_contact[relationship]" value="{{ $primaryRelationship ?? ''}}" class="form-control" type="text" required>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Phone 1<span class="text-danger">*</span></label>
												<input name="primary_contact[phone1]" value="{{ $primaryPhone1  ?? ''}}" class="form-control" type="text" required>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Phone 2<span class="text-danger">*</span></label>
												<input name="primary_contact[phone2]" value="{{ $primaryPhone2  ?? ''}}" class="form-control" type="text" required>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-body">
									<h3 class="card-title">Secondary Contact</h3>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Name</label>
												<input name="secondary_contact[name]" value="{{ $secondaryName  ?? ''}}" type="text" class="form-control">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Relationship</label>
												<input name="secondary_contact[relationship]" value="{{ $secondaryRelationship  ?? ''}}" class="form-control" type="text">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Phone 1</label>
												<input name="secondary_contact[phone1]" value="{{ $secondaryPhone1  ?? ''}}" class="form-control" type="text">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Phone 2</label>
												<input name="secondary_contact[phone2]" value="{{ $secondaryPhone2  ?? ''}}" class="form-control" type="text">
											</div>
										</div>
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
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div id="bank_info_modal" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Bank Information</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form method="POST" action="{{ route('employee-info.bank-details.store') }}">
							@csrf
							<div class="card">
								<div class="card-body">
									{{-- <h3 class="card-title">Primary Contact</h3> --}}
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Bank Name <span class="text-danger">*</span></label>
												<input type="text" name="bank_name" id="bank_name" value="{{ $employeeAdditionalDetail->bank_name  ?? " "}}" class="form-control" required>
												<input id="emp_id" name="emp_id" class="form-control" value="{{$userDetails['id']}}" type="hidden">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Branch Name <span class="text-danger">*</span></label>
												<input type="text" name="branch_name" id="branch_name" value="{{ $employeeAdditionalDetail->branch_name  ?? " "}}" class="form-control" required>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Bank A/C Number <span class="text-danger">*</span></label>
												<input class="form-control" name="bank_ac_number" value="{{ $employeeAdditionalDetail->bank_ac_number  ?? " "}}" id="bank_ac_number" type="text" required>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>IFSC Code <span class="text-danger">*</span></label>
												<input class="form-control" name="bank_ifsc" id="bank_ifsc" value="{{ $employeeAdditionalDetail->bank_ifsc  ?? " "}}" type="text" required>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>PAN Number <span class="text-danger">*</span></label>
												<input class="form-control" name="pan_number" id="pan_number" value="{{ $employeeAdditionalDetail->pan_number  ?? " "}}" type="text" required>
											</div>
										</div>
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
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div id="education_info" class="modal custom-modal fade" role="dialog">
			<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title"> Education Informations </h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
                        {{-- <form> --}}
                        <form method="POST" action="{{ route('employee-info.education-details.store') }}">
                        @csrf
                            <div class="form-scroll">
                                <div class="card">
                                    <div class="card-body">
										<h3 class="card-title">Education Information (SSLC/10ᵗʰ Std)</h3>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													<input type="hidden" name="education_details[0][level]" value="SSLC/10th">
													{{-- <input type="text" name="institution_name" class="form-control floating"> --}}
													<input type="text" name="education_details[0][institution]" id="sslc_institution" class="form-control floating" value="{{ $eduInstituteName1  ?? ''}}" required>
													<label for="sslc_institution" class="focus-label">Institution</label>
        											<input id="emp_id" name="emp_id" class="form-control" value="{{$userDetails['id']}}" type="hidden">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													{{-- <input type="text" name="qualification" class="form-control floating"> --}}
													<input type="text" name="education_details[0][qualification]" id="sslc_qualification" class="form-control floating" value="{{ $eduDegree1  ?? ''}}" required>
													<label for="sslc_qualification" class="focus-label">Education Board</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													<div class="cal-icon">
														{{-- <input type="text" name="start_date" class="form-control floating datetimepicker"> --}}
														<input type="text" name="education_details[0][start_date]" id="sslc_start_date" class="form-control floating datetimepicker" value="{{ $eduStartDate1  ?? ''}}" required>
													</div>
													<label for="sslc_start_date" class="focus-label">Starting Date</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													<div class="cal-icon">
														{{-- <input type="text" name="end_date" class="form-control floating datetimepicker"> --}}
														<input type="text" name="education_details[0][end_date]" id="sslc_end_date" class="form-control floating datetimepicker" value="{{ $eduEndDate1  ?? ''}}" required>
													</div>
													<label for="sslc_end_date" class="focus-label">Complete Date</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													{{-- <input type="text" name="grade" class="form-control floating"> --}}
													<input type="text" name="education_details[0][grade]" id="sslc_grade" class="form-control floating" value="{{ $eduGrade1  ?? ''}}" required>
													<label for="sslc_grade" class="focus-label">Percentage/CGPA</label>
												</div>
											</div>
										</div>
										<hr>
										<h3 class="card-title">Education Information (PUC/12ᵗʰ Std/Diploma)</h3>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													<input type="hidden" name="education_details[1][level]" value="PUC/12th/Diploma">
													{{-- <input type="text" name="institution_name" class="form-control floating"> --}}
													<input type="text" name="education_details[1][institution]" id="puc_institution" class="form-control floating" value="{{ $eduInstituteName2  ?? ''}}" required>
													<label for="puc_institution" class="focus-label">Institution</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													{{-- <input type="text" name="qualification" class="form-control floating"> --}}
													<input type="text" name="education_details[1][qualification]" id="puc_qualification" class="form-control floating" value="{{ $eduDegree2  ?? ''}}" required>
													<label for="puc_qualification" class="focus-label">University(Mention Stream)</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													<div class="cal-icon">
														{{-- <input type="text" name="start_date" class="form-control floating datetimepicker"> --}}
														<input type="text" name="education_details[1][start_date]" id="puc_start_date" class="form-control floating datetimepicker" value="{{ $eduStartDate2  ?? ''}}" required>
													</div>
													<label for="puc_start_date" class="focus-label">Starting Date</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													<div class="cal-icon">
														{{-- <input type="text" name="end_date" class="form-control floating datetimepicker"> --}}
														<input type="text" name="education_details[1][end_date]" id="puc_end_date" class="form-control floating datetimepicker" value="{{ $eduEndDate2  ?? ''}}" required>
													</div>
													<label for="puc_end_date" class="focus-label">Complete Date</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													{{-- <input type="text" name="grade" class="form-control floating"> --}}
													<input type="text" name="education_details[1][grade]" id="puc_grade" class="form-control floating" value="{{ $eduGrade2  ?? ''}}" required>
													<label for="puc_grade" class="focus-label">Percentage/CGPA</label>
												</div>
											</div>
										</div>
										<hr>
										<h3 class="card-title">Education Information (UG) </h3>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													<input type="hidden" name="education_details[2][level]" value="UG">
													{{-- <input type="text" name="institution_name" class="form-control floating"> --}}
													<input type="text" name="education_details[2][institution]" id="ug_institution" class="form-control floating" value="{{ $eduInstituteName3  ?? ''}}" required>
													<label for="ug_institution" class="focus-label">Institution</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													{{-- <input type="text" name="qualification" class="form-control floating"> --}}
													<input type="text" name="education_details[2][qualification]" id="ug_qualification" class="form-control floating" value="{{ $eduDegree3  ?? ''}}" required>
													<label for="ug_qualification" class="focus-label">University(Mention Branch)</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													<div class="cal-icon">
														{{-- <input type="text" name="start_date" class="form-control floating datetimepicker"> --}}
														<input type="text" name="education_details[2][start_date]" id="ug_start_date" class="form-control floating datetimepicker" value="{{ $eduStartDate3  ?? ''}}" required>
													</div>
													<label for="ug_start_date" class="focus-label">Starting Date</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													<div class="cal-icon">
														{{-- <input type="text" name="end_date" class="form-control floating datetimepicker"> --}}
														<input type="text" name="education_details[2][end_date]" id="ug_end_date" class="form-control floating datetimepicker" value="{{ $eduEndDate3  ?? ''}}" required>
													</div>
													<label for="ug_end_date" class="focus-label">Complete Date</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													{{-- <input type="text" name="grade" class="form-control floating"> --}}
													<input type="text" name="education_details[2][grade]" id="ug_grade" class="form-control floating" value="{{ $eduGrade3  ?? ''}}" required>
													<label for="ug_grade" class="focus-label">Percentage/CGPA</label>
												</div>
											</div>
										</div>
										<hr>
										<h3 class="card-title">Education Information (PG) </h3>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													<input type="hidden" name="education_details[3][level]" value="PG">
													{{-- <input type="text" name="institution_name" class="form-control floating"> --}}
													<input type="text" name="education_details[3][institution]" id="pg_institution" class="form-control floating" value="{{ $eduInstituteName4  ?? ''}}">
													<label for="pg_institution" class="focus-label">Institution</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													{{-- <input type="text" name="qualification" class="form-control floating"> --}}
													<input type="text" name="education_details[3][qualification]" id="pg_qualification" class="form-control floating" value="{{ $eduDegree4  ?? ''}}">
													<label for="pg_qualification" class="focus-label">University(Mention Specialization/Branch)</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													<div class="cal-icon">
														{{-- <input type="text" name="start_date" class="form-control floating datetimepicker"> --}}
														<input type="text" name="education_details[3][start_date]" id="pg_start_date" class="form-control floating datetimepicker" value="{{ $eduStartDate4  ?? ''}}">
													</div>
													<label for="pg_start_date" class="focus-label">Starting Date</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													<div class="cal-icon">
														{{-- <input type="text" name="end_date" class="form-control floating datetimepicker"> --}}
														<input type="text" name="education_details[3][end_date]" id="pg_end_date" class="form-control floating datetimepicker" value="{{ $eduEndDate4  ?? ''}}">
													</div>
													<label for="pg_end_date" class="focus-label">Complete Date</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group form-focus focused">
													{{-- <input type="text" name="grade" class="form-control floating"> --}}
													<input type="text" name="education_details[3][grade]" id="pg_grade" class="form-control floating" value="{{ $eduGrade4  ?? ''}}">
													<label for="pg_grade" class="focus-label">Percentage/CGPA</label>
												</div>
											</div>
										</div>
									</div>
                                </div>
                            </div>
                            <div class="submit-section">
                                <button class="btn btn-primary submit-edu-btn">Submit</button>
                            </div>
                        </form>
                    </div>
				</div>
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
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>
<script>
	$('.datetimepicker').datetimepicker({
		format: 'YYYY-MM-DD'
	});
</script>
{{-- script written for previewing the image on upload --}}
{{-- <script>
	// Get the file input element
const avatarInput = document.querySelector('input[name="avatar"]');

// Add a change event listener to the file input element
avatarInput.addEventListener('change', function() {
	// Get the selected file
	const file = avatarInput.files[0];

	// Create a file reader object
	const reader = new FileReader();

	// Add a load event listener to the file reader object
	reader.addEventListener('load', function() {
		// Get the preview image element
		const previewImage = document.querySelector('#avatar-preview');

		// Set the preview image source to the data URL of the uploaded file
		previewImage.src = reader.result;
	});

	// Read the selected file as a data URL
	reader.readAsDataURL(file);
});
</script>   --}}
<script>
	// Get the file input element
const avatarInput = document.querySelector('input[name="avatar"]');

// Add a change event listener to the file input element
avatarInput.addEventListener('change', function() {
	// Get the selected file
	const file = avatarInput.files[0];

	// Create a file reader object
	const reader = new FileReader();

	// Add a load event listener to the file reader object
	reader.addEventListener('load', function() {
		// Get the preview image element
		const previewImage = document.querySelector('#avatar-preview');

		// Set the preview image source to the data URL of the uploaded file
		previewImage.src = reader.result;
	});

	// Read the selected file as a data URL
	reader.readAsDataURL(file);
});
</script>  
{{-- //Perfectly storing data in JSON format in db to respective columns --}}
{{-- <script>
$(document).ready(function(){
	var max_fields = 4; //maximum input boxes allowed
	var wrapper = $(".form-scroll"); //Fields wrapper
	var x = 1; //initial text box count
	var data = JSON.parse(localStorage.getItem('form_data')) || []; // initialize empty array to store form data from local storage
	$(document).on('click', '.add-more', function(e){ 
		e.preventDefault();
		if(x < max_fields){ //max input box allowed
			x++; //text box increment
			var new_wrapper = $('<div class="card-body"></div>');
			new_wrapper.html($(this).closest('.card-body').html());
			$(this).hide();
			$(this).closest('.card-body').after(new_wrapper);
			if(x > 2) {
				$(this).closest('.card-body').prev().find('.add-more').show();
			}
		}
		if(x == max_fields) {
			wrapper.find('.card-body:last .add-more').hide();
		}
		if (x >= 2) {
			wrapper.find('.card-body:first .add-more').hide();
		}
		if (x == max_fields) {
			wrapper.find('.add-more').hide();
		}
	});
	$(document).on("click",".delete-icon", function(e){ 
		e.preventDefault(); 
		$(this).closest('.card-body').remove(); 
		x--;
		var current_wrapper = $(this).closest('.card-body');
		var index = current_wrapper.index();
		current_wrapper.prev().find('.add-more').show();
		if(x < max_fields) {
			wrapper.find('.card-body:last .add-more').show();
		}
		if (x < 2) {
			wrapper.find('.card-body:first .add-more').show();
		}
		if (x >= 3) {
			wrapper.find('.add-more').eq(index - 1).hide();
		}
	});
	
	// Submit button click event listener
	$(document).on('click', '.submit-btn', function(e){
		e.preventDefault();
		
		// Loop through each card-body and extract form data
		wrapper.find('.card-body').each(function(index) {
			var institution_name = $(this).find('input[name="institution_name"]').val();
			var qualification = $(this).find('input[name="qualification"]').val();
			var start_date = $(this).find('input[name="start_date"]').val();
			var end_date = $(this).find('input[name="end_date"]').val();
			var grade = $(this).find('input[name="grade"]').val();
			
			// Check if there is an existing JSON object at the current index
			if (data[index]) {
				// Update the values of the existing JSON object
				data[index].institution_name = institution_name;
				data[index].qualification = qualification;
				data[index].start_date = start_date;
				data[index].end_date = end_date;
				data[index].grade = grade;
			} else {
				// Create a new JSON object and add it to the array
				var obj = {
					"institution_name": institution_name,
					"qualification": qualification,
					"start_date": start_date,
					"end_date": end_date,
					"grade": grade
				};
				data.push(obj);
			}
		});
		
		$.ajax({
			type: "POST",
			url: "{{ route('employee-info.education-details.store') }}",
			data: {
				"_token": "{{ csrf_token() }}",
				"education_details": data
			},
			success: function(response){
				console.log(response);
				// Show success message to user
				alert("Education details updated successfully.");

				// $('#education_info').modal('hide');
				// $('#education_info').hide();
				// $('#education_info').remove();
				location.reload();

			},
			error: function(xhr, status, error){
				console.log(xhr);
				console.log(status);
				console.log(error);
				// Show error message to user
				alert("Error updating education details.");
			}
		});
		
		// Store form data in local storage
		localStorage.setItem('form_data', JSON.stringify(data));
		
		// Print JSON array to console
		console.log(data);
	});
}); 
</script> --}}
{{-- Perfectly working with Datepicker issue resolved as well and storing the data in JSON format. --}}
{{-- <script>
$(document).ready(function(){
	var max_fields = 4; //maximum input boxes allowed
	var wrapper = $(".form-scroll"); //Fields wrapper
	var x = 1; //initial text box count
	var data = JSON.parse(localStorage.getItem('form_data')) || []; // initialize empty array to store form data from local storage
	$(document).on('click', '.add-more', function(e){ 
		e.preventDefault();
		if(x < max_fields){ //max input box allowed
			x++; //text box increment
			var new_wrapper = $('<div class="card-body"></div>');
			new_wrapper.html($(this).closest('.card-body').html());
			new_wrapper.find('.datetimepicker').datetimepicker({format: 'YYYY-MM-DD'}); // add datepicker with format to the new wrapper
			$(this).hide();
			$(this).closest('.card-body').after(new_wrapper);
			if(x > 2) {
				$(this).closest('.card-body').prev().find('.add-more').show();
			}
		}
		if(x == max_fields) {
			wrapper.find('.card-body:last .add-more').hide();
		}
		if (x >= 2) {
			wrapper.find('.card-body:first .add-more').hide();
		}
		if (x == max_fields) {
			wrapper.find('.add-more').hide();
		}
	});
	$(document).on("click",".delete-icon", function(e){ 
		e.preventDefault(); 
		$(this).closest('.card-body').remove(); 
		x--;
		var current_wrapper = $(this).closest('.card-body');
		var index = current_wrapper.index();
		current_wrapper.prev().find('.add-more').show();
		if(x < max_fields) {
			wrapper.find('.card-body:last .add-more').show();
		}
		if (x < 2) {
			wrapper.find('.card-body:first .add-more').show();
		}
		if (x >= 3) {
			wrapper.find('.add-more').eq(index - 1).hide();
		}
	});
	// initialize the datepicker for the original card_body
	$('.datetimepicker').datetimepicker({format: 'YYYY-MM-DD'});

	$(document).on('click', '.submit-btn', function(e){
		e.preventDefault();
		
		// Loop through each card-body and extract form data
		wrapper.find('.card-body').each(function(index) {
			var institution_name = $(this).find('input[name="institution_name"]').val();
			var qualification = $(this).find('input[name="qualification"]').val();
			var start_date = $(this).find('input[name="start_date"]').val();
			var end_date = $(this).find('input[name="end_date"]').val();
			var grade = $(this).find('input[name="grade"]').val();
			
			// Check if there is an existing JSON object at the current index
			if (data[index]) {
				// Update the values of the existing JSON object
				data[index].institution_name = institution_name;
				data[index].qualification = qualification;
				data[index].start_date = start_date;
				data[index].end_date = end_date;
				data[index].grade = grade;
			} else {
				// Create a new JSON object and add it to the array
				var obj = {
					"institution_name": institution_name,
					"qualification": qualification,
					"start_date": start_date,
					"end_date": end_date,
					"grade": grade
				};
				data.push(obj);
			}
		});
		
		$.ajax({
			type: "POST",
			url: "{{ route('employee-info.education-details.store') }}",
			data: {
				"_token": "{{ csrf_token() }}",
				"education_details": data
			},
			success: function(response){
				console.log(response);
				// Show success message to user
				alert("Education details updated successfully.");

				// $('#education_info').modal('hide');
				// $('#education_info').hide();
				// $('#education_info').remove();
				location.reload();

			},
			error: function(xhr, status, error){
				console.log(xhr);
				console.log(status);
				console.log(error);
				// Show error message to user
				alert("Error updating education details.");
			}
		});
		
		// Store form data in local storage
		localStorage.setItem('form_data', JSON.stringify(data));
		
		// Print JSON array to console
		console.log(data);
	});
}); 
</script> --}}

{{-- //Working with loaction.reload --}}
{{-- <script>
	document.getElementById("user-dropdown").addEventListener("change", function() {
	  var userId = this.value;
	  if (userId !== "null") {
		var url = "/employee-info/HR/" + userId;
		window.history.pushState(null, null, url);
		location.reload();
	  }
	});
</script> --}}
{{-- <script>
	document.getElementById("user-dropdown").addEventListener("change", function() {
	  var userId = this.value;
	  if (userId !== "null") {
		localStorage.setItem('selectedUserId', userId); // store the selected value in localStorage
		var url = "/employee-info/HR/" + userId;
		window.history.pushState(null, null, url);
		location.reload();
	  }
	});

	// Retrieve the stored value from localStorage when the page loads
	window.onload = function() {
		var selectedUserId = localStorage.getItem('selectedUserId');
		if (selectedUserId) {
			document.getElementById("user-dropdown").value = selectedUserId;
		}
	}
</script> --}}
<script>
    var employeeId = "<?php echo $employeeDetail->id ?>"; // get the employee ID from $employeeDetail object
    document.getElementById("user-dropdown").addEventListener("change", function() {
        if (this.value !== "null") {
            localStorage.setItem('selectedEmployeeId', this.value);
            var url = "/hrportal/employee-info/HR/" + this.value;
            window.history.pushState(null, null, url);
            location.reload();
        }
    });

    // Retrieve the stored value from localStorage when the page loads
    // window.onload = function() {
    //     var selectedEmployeeId = localStorage.getItem('selectedEmployeeId');
    //     if (selectedEmployeeId) {
    //         document.getElementById("user-dropdown").value = selectedEmployeeId;
    //     } else {
    //         localStorage.setItem('selectedEmployeeId', employeeId); // set the default selected value to the current employee ID
    //         document.getElementById("user-dropdown").value = employeeId;
    //     }
    // }
</script>


<script>
	$('.password-toggle').click(function() {
	let input = $(this).prev('input');
		if (input.attr('type') === 'password') {
		input.attr('type', 'text');
		$(this).addClass('fa-eye-slash').removeClass('fa-eye');
		} else {
		input.attr('type', 'password');
		$(this).addClass('fa-eye').removeClass('fa-eye-slash');
		}
	});
</script>
<style>
	.fa-eye, .fa-eye-slash {
		float: right;
		margin-right: 10px;
		margin-top: -30px;
		position: relative;
		z-index: 2;
	}
</style>

{{-- //Working without location.reload function but UI is weirdly changing --}}
{{-- <script>
document.getElementById("user-dropdown").addEventListener("change", function() {
	var userId = this.value;
	if (userId !== "null") {
	  var url = "/employee-info/HR/" + userId;
	  
	  // Make an AJAX request to the server
	  var xhr = new XMLHttpRequest();
	  xhr.open("GET", url);
	  xhr.onload = function() {
		if (xhr.status === 200) {
		  // Update the page content
		  var response = xhr.responseText;
		  document.getElementById("profile-view").innerHTML = response;
		} else {
		  alert("Error: " + xhr.statusText);
		}
	  };
	  xhr.send();
	  
	  // Update the URL without reloading the page
	  window.history.pushState(null, null, url);
	}
  });
</script> --}}
@endsection