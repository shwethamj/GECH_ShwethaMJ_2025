@extends('layouts.backend')

@section('styles')	
<!-- Datatable CSS -->
<link rel="stylesheet" href="{{asset('assets/css/dataTables.bootstrap4.min.css')}}">
@endsection

@section('page-header')
<div class="row align-items-center">
	<div class="col">
		<h3 class="page-title">Clients</h3>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="{{route('dashboard')}}">Dashboard</a></li>
			<li class="breadcrumb-item active">Clients</li>
		</ul>
	</div>
	<div class="col-auto float-right ml-auto">
		<a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_client"><i class="fa fa-plus"></i> Add Client</a>
		<div class="view-icons">
			<a href="{{route('clients')}}" class="grid-view btn btn-link {{route_is('clients') ? 'active' : '' }}"><i class="fa fa-th"></i></a>
			<a href="{{route('clients-list')}}" class="list-view btn btn-link {{route_is('clients-list') ? 'active' : '' }}"><i class="fa fa-bars"></i></a>
		</div>
	</div>
</div>
@endsection

@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="table-responsive">
			<table class="table table-striped custom-table" id="datatable">
				<thead>
					<tr>
					    <th>#</th>
						<th>Contact Person</th>
					    <th>Company Name</th>
						<th>Client ID</th>
						<th>Email</th>
						<th>Mobile</th>
						<th class="text-right">Action</th>
					</tr>
				</thead>
				<tbody>
				     @php
						$count = 1;
					@endphp
					@if (!empty($clients->count()))
						@foreach ($clients as $client)
						<tr>
						    <td>{{$count}}</td>
						    <td><a href="{{route('clients-profile', ['client_id' => $client->id])}}" class="avatar" data-toggle="tooltip" title="{{$client->firstname.' '.$client->lastname}}">
                                    <img src="{{ !empty($client->avatar) ? asset('storage/clients/'.$client->avatar): asset('assets/img/user.jpg')}}">
                                </a>{{$client->firstname.' '.$client->lastname}}</td>
							<td>
								<h2 class="table-avatar">
									<!-- <a href="client-profile.html" class="avatar"><img src="assets/img/profiles/avatar-19.jpg" alt=""></a> -->
									<!-- <a href="client-profile.html">Global Technologies</a> -->
									<a href="">{{$client->company}}</a>
									
								</h2>
							</td>
							<td>CLT-{{$client->id}}</td>
							<td>{{$client->email}}</td>
							<td>{{$client->phone}}</td>
							
							<td class="text-right">
								<div class="dropdown dropdown-action">
									<a href="javascript:void(0)" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
									<div class="dropdown-menu dropdown-menu-right">
										<a data-id="{{$client->id}}" data-firstname="{{$client->firstname}}" data-lastname="{{$client->lastname}}" data-email="{{$client->email}}" data-phone="{{$client->phone}}" data-avatar="{{$client->avatar}}" data-company="{{$client->company}}" 
										data-status="{{$client->status}}"  data-start_date="{{$client->start_date}}" data-project_title="{{$client->project_title}}" data-project_type="{{$client->project_type}}" data-project_spoc="{{$client->project_spoc}}" data-location="{{$client->location}}"
                                        data-avatar="{{$client->avatar}}"
				class="dropdown-item editbtn" href="javascript:void(0)" data-toggle="modal"><i class="fa fa-pencil m-r-5"></i> Edit</a>
										<a data-id="{{$client->id}}" class="dropdown-item deletebtn" href="javascript:void(0)" data-toggle="modal"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
									</div>
								</div>
							</td>
						</tr>
							@php
						$count++;
					@endphp
						@endforeach
						<x-modals.delete :route="'client.destroy'" :title="'Client'" />
						<!-- Edit Client Modal -->
						<div id="edit_client" class="modal custom-modal fade" role="dialog">
							<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Edit Client</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form method="POST" enctype="multipart/form-data" action="{{route('client.update')}}">
											@csrf
											@method("PUT")
											<div class="row">
												<input type="hidden" id="edit_id" name="id">
												<div class="col-md-6">
													<div class="form-group">
														<label class="col-form-label">First Name <span class="text-danger">*</span></label>
														<input class="form-control edit_firstname" name="firstname" type="text">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="col-form-label">Last Name</label>
														<input class="form-control edit_lastname" name="lastname" type="text">
													</div>
												</div>
												
												<div class="col-md-6">
													<div class="form-group">
														<label class="col-form-label">Email <span class="text-danger">*</span></label>
														<input class="form-control floating edit_email" name="email" type="email">
													</div>
												</div>
												
												<div class="col-md-6">  
													<div class="form-group">
														<label class="col-form-label">Client Picture<span class="text-danger">*</span></label>
														<input class="form-control floating" name="avatar" type="file" id="edit_avatar">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="col-form-label">Phone </label>
														<input class="form-control edit_phone" name="phone" type="text">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="col-form-label">Company Name</label>
														<input class="form-control edit_company" name="company" type="text">
													</div>
												</div>
												<div class="col-sm-6">
                                <div class="form-group">
                                    <label>Start Date <span class="text-danger">*</span></label>
                                    <div class="col-form-label">
                                        <input class="form-control edit_start_date"  type="date" name="start_date">
                                    </div>
                                </div>
                            </div>
                            
                            	<div class="col-md-6">
							<div class="form-group">
								<label>Status  <span class="text-danger">*</span></label>
								<!--<select name="status" class="select form-control" id="edit_status">-->
								<!--   <option value="Lead" disabled selected>Select Status</option>-->
								<!--	<option>Lead</option>-->
								<!--	<option>Prospect</option>-->
								<!--	<option>Completed</option>-->
								<!--	<option>Cancelled</option>-->
								<!--</select>-->
								<select name="status" class="select form-control" id="edit_status">
								   <option value="null" disabled selected>Select Status</option>
									<option>Lead</option>
									<option>Prospect</option>
									<option>Completed</option>
									<option>Cancelled</option>
								</select>
							</div>
						</div>
						
						
							<div class="col-md-6">
							<div class="form-group">
								<label class="col-form-label">Project Title <span class="text-danger">*</span></label>
								<input class="form-control" name="project_title" type="text" id="edit_project_title">
							</div>
						</div>
						
							<div class="col-md-6">
						<div class="form-group">
								<label>Project Type  <span class="text-danger">*</span></label>
								<select name="project_type" class="select form-control" id="edit_project_type">
								   <option value="null" disabled selected>Select Project Type</option>
									<option>ERP</option>
									<option>Android application</option>
									<option>Websites</option>
									<option>Ecommmerce</option>
								</select>
							</div>
						</div>
						
						<!--	<div class="col-md-6">-->
						<!--	<div class="form-group">-->
						<!--		<label class="col-form-label">Project Spoc <span class="text-danger">*</span></label>-->
						<!--		<input class="form-control" name="project_spoc" type="text">-->
						<!--	</div>-->
						<!--</div>-->
						
						
							<div class="col-md-6">
						<div class="form-group">
								<label>Project Spoc  <span class="text-danger">*</span></label>
								<select name="project_spoc" class="select form-control" id="edit_project_spoc">
								   <option value="null" disabled selected>Select Project Spoc</option>
					    			  @foreach (\App\Models\EmployeeDetail::get() as $employee)
                            			  <option value="{{ $employee->id }}"> {{ $employee->firstname . ' ' . $employee->lastname }} </option>
                        	    	  @endforeach
								</select>
							</div>
						</div>
						
						
						<div class="col-md-6">
							<div class="form-group">
								<label>Location  <span class="text-danger">*</span></label>
								<select name="location" class="select form-control" id="edit_location">
								   <option value="null" disabled selected>Select Location</option>
									<option>Bangalore</option>
									<option>Mangalore</option>
									<option>Chennai</option>
									<!--<option>Ecommmerce</option>-->
								</select>
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
						<!-- /Edit Client Modal -->
					@endif					
				</tbody>
			</table>
		</div>
	</div>
</div>

<!-- Add Client Modal -->
<div id="add_client" class="modal custom-modal fade" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Add Client</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="POST" enctype="multipart/form-data" action="{{route('client.add')}}">
					@csrf
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="col-form-label">First Name <span class="text-danger">*</span></label>
								<input class="form-control" name="firstname" type="text">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="col-form-label">Last Name</label>
								<input class="form-control" name="lastname" type="text">
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="form-group">
								<label class="col-form-label">Email <span class="text-danger">*</span></label>
								<input class="form-control floating" name="email" type="email">
							</div>
						</div>
						
						<div class="col-md-6">  
							<div class="form-group">
								<label class="col-form-label">Client Picture<span class="text-danger">*</span></label>
								<input class="form-control floating" name="avatar" type="file">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="col-form-label">Phone </label>
								<input class="form-control" name="phone" type="text">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="col-form-label">Company Name</label>
								<input class="form-control" name="company" type="text">
							</div>
						</div>

						<div class="col-sm-6">
                                <div class="form-group">
                                    <label>Start Date <span class="text-danger">*</span></label>
                                    <div class="">
                                        <input class="form-control" type="date" name="start_date">
                                    </div>
                                </div>
                            </div>
                            
                            	<div class="col-md-6">
							<div class="form-group">
								<label>Status  <span class="text-danger">*</span></label>
								<select name="status" class="select form-control">
								   <option value="Lead" disabled selected>Select Status</option>
									<option>Lead</option>
									<option>Prospect</option>
									<option>Completed</option>
									<option>Cancelled</option>
								</select>
							</div>
						</div>
						
						
							<div class="col-md-6">
							<div class="form-group">
								<label class="col-form-label">Project Title <span class="text-danger">*</span></label>
								<input class="form-control" name="project_title" type="text">
							</div>
						</div>
						
							<div class="col-md-6">
						<div class="form-group">
								<label>Project Type  <span class="text-danger">*</span></label>
								<select name="project_type" class="select form-control">
								   <option value="null" disabled selected>Select Project Type</option>
									<option>ERP</option>
									<option>Android application</option>
									<option>Websites</option>
									<option>Ecommmerce</option>
								</select>
							</div>
						</div>
						
						<!--	<div class="col-md-6">-->
						<!--	<div class="form-group">-->
						<!--		<label class="col-form-label">Project Spoc <span class="text-danger">*</span></label>-->
						<!--		<input class="form-control" name="project_spoc" type="text">-->
						<!--	</div>-->
						<!--</div>-->
						
						
							<div class="col-md-6">
						<div class="form-group">
								<label>Project Spoc  <span class="text-danger">*</span></label>
								<select name="project_spoc" class="select form-control">
								   <option value="null" disabled selected>Select Project Spoc</option>
								    @foreach (\App\Models\EmployeeDetail::get() as $employee)
                        			  <option value="{{ $employee->id }}"> {{ $employee->firstname . ' ' . $employee->lastname }} </option>
                        			@endforeach
								</select>
							</div>
						</div>
						
						
						<div class="col-md-6">
							<div class="form-group">
								<label>Location  <span class="text-danger">*</span></label>
								<select name="location" class="select form-control">
								   <option value="null" disabled selected>Select Location</option>
									<option>Bangalore</option>
									<option>Mangalore</option>
									<option>Chennai</option>
									<!--<option>Ecommmerce</option>-->
								</select>
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
<!-- /Add Client Modal -->
@endsection

@section('scripts')
<!-- Datatable JS -->
<script src="{{asset('assets/js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('assets/js/dataTables.bootstrap4.min.js')}}"></script>
<!-- <script>
	$(document).ready(function (){
		$('.editbtn').on('click',function (){
			$('#edit_client').modal('show');
			var id = $(this).data('id');
			var firstname = $(this).data('firstname');
			var lastname = $(this).data('lastname');
			var email = $(this).data('email');
			var phone = $(this).data('phone');
			var avatar = $(this).data('avatar');
			var company = $(this).data('company');

			$('#edit_id').val(id);
			$('.edit_firstname').val(firstname);
			$('.edit_lastname').val(lastname);
			$('.edit_email').val(email);
			$('.edit_phone').val(phone);
			$('.edit_avatar').val(avatar);
			$('.edit_company').val(company);
		})
	})
</script> -->

<script>
	$(document).ready(function (){
		$('.editbtn').on('click',function (){
			$('#edit_client').modal('show');
			var id = $(this).data('id');
			var firstname = $(this).data('firstname');
			var lastname = $(this).data('lastname');
			var email = $(this).data('email');
			var phone = $(this).data('phone');
			//var avatar = $(this).data('avatar');
			var company = $(this).data('company');
			var start_date= $(this).data('start_date');
			 var status= $(this).data('status');
 			//var start_date= $(this).data('start_date');
			 var project_title= $(this).data('project_title');
			var project_type= $(this).data('project_type');
			var project_spoc= $(this).data('project_spoc');
			var location= $(this).data('location');
			var avatar = $(this).data('avatar');
			
			
			$('#edit_id').val(id);
			$('.edit_firstname').val(firstname);
			$('.edit_lastname').val(lastname);
			$('.edit_email').val(email);
			$('.edit_phone').val(phone);
			$('.edit_company').val(company);
		//	$('.edit_avatar').val(avatar);
			$('#edit_avatar').attr('src',avatar);
			
			$('.edit_start_date').val(start_date);
			//$('#edit_status').val(status).change();
		$('#edit_status').val(status).attr('selected');
// // 			$('#edit_start_date').val(start_date);
			$('#edit_project_title').val(project_title);
			$("#edit_project_type").val(project_type).change();
			$("#edit_project_spoc").val(project_spoc).change();
			$('#edit_location').val(location);
			
		})
	})
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


