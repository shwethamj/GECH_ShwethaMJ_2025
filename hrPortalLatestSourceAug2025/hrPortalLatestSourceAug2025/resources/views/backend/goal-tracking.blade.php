@extends('layouts.backend')


@section('styles')	
<!-- Datatable CSS -->
<link rel="stylesheet" href="{{asset('assets/css/dataTables.bootstrap4.min.css')}}">
@endsection


@section('page-header')
<div class="row align-items-center">
	<div class="col">
		<h3 class="page-title">Goal Tracking</h3>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="{{route('dashboard')}}">Dashboard</a></li>
			<li class="breadcrumb-item active">Goal Tracking</li>
		</ul>
	</div>
	<div class="col-auto float-right ml-auto">
		<a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_goal"><i class="fa fa-plus"></i> Add New</a>
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
						<th>Goal Type</th>
						<th>Subject</th>
						<th>Target Achievement</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th>Description </th>
						<th>Status </th>
						<th>Progress </th>
						<th class="text-right">Action</th>
					</tr>
				</thead>
				<tbody>
				    @php
						$count = 1;
					@endphp
					@foreach ($goals as $goal)
						@if(!empty($goal->goal_type))
							<tr>
							     <td>{{$count}}</td>
								<td>{{$goal->goal_type->type}}</td>
								<td>{{$goal->subject}}</td>
								<td>{{$goal->target}}</td>
								<td>
								{{date_format(date_create($goal->start_date),"d M Y")}}
								</td>
								<td>	{{date_format(date_create($goal->end_date),"d M Y")}}</td>
								<td>{{$goal->description}}</td>
								<td>
									<i class="fa fa-dot-circle-o @if($goal->status == "Active") text-success @else text-danger @endif"></i> {{$goal->status}}
								</td>
								<td>
									<p class="mb-1">Completed {{$goal->progress}} %</p>
									<div class="progress" style="height:5px">
										<div class="progress-bar bg-primary progress-sm" style="width: {{$goal->progress}}%;height:10px;"></div>
									</div>
								</td>
								
								<td class="text-right">
									<div class="dropdown dropdown-action">
										<a href="javascript:void(0)" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
										<div class="dropdown-menu dropdown-menu-right">
											<a data-id="{{$goal->id}}" data-subject="{{$goal->subject}}" data-type="{{$goal->goal_type->id}}" 
												data-target="{{$goal->target}}" data-start="{{$goal->start_date}}"
												 data-end="{{$goal->end_date}}" data-status="{{$goal->status}}"
												  data-progress="{{$goal->progress}}" data-description="{{$goal->description}}" data-priority="{{$goal->priority}}"
												  data-applied_to="{{$goal->applied_to}}" class="dropdown-item editbtn" href="javascript:void(0)" data-toggle="modal"><i class="fa fa-pencil m-r-5"></i> Edit</a>
											<a data-id="{{$goal->id}}" class="dropdown-item deletebtn" href="javascript:void(0)" data-toggle="modal" ><i class="fa fa-trash-o m-r-5"></i> Delete</a>
										</div>
									</div>
								</td>
							</tr>
							@php
						$count++;
					@endphp
					
						@endif						
					@endforeach
				</tbody>
			</table>
		</div>
	</div>
</div>

<!-- Add Goal Modal -->
<div id="add_goal" class="modal custom-modal fade" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Add Goal Tracking</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="post" action="{{route('goal-tracking')}}">
					@csrf
					<div class="row">
						<!-- <div class="col-sm-12">
							<div class="form-group">
								<label class="col-form-label">Goal Type</label>
								<select name="goal_type" class="select">
									@foreach ($goal_types as $type)
										<option value="{{$type->id}}">{{$type->type}}</option>
									@endforeach
								</select>
							</div>
						</div> -->
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Subject  <span class="text-danger">*</span></label>
								<input name="subject" class="form-control" type="text">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Target Achievement  <span class="text-danger">*</span></label>
								<input name="target" class="form-control" type="text">
							</div>
						</div>
						
						<div class="col-sm-6">
							<div class="form-group">
								<label>Start Date <span class="text-danger">*</span></label>
								<div class="">
									<input name="start_date" class="form-control datetimepicker" type="date">
							</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>End Date <span class="text-danger">*</span></label>
								<div class="">
									<input name="end_date" class="form-control datetimepicker" type="date"></div>
							</div>
						</div>
						 <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Priority <span class="text-danger">*</span></label>
                                    <select class="select form-control" value="null" name="priority">
                                           <option value="Priority" disabled selected>Select Priority</option>
                                        <option>High</option>
                                        <option>Medium</option>
                                        <option>Low</option>
                                    </select>
                                </div>
                            </div>
                       
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Applied To <span class="text-danger">*</span></label>
                                    <select class="select form-control" name="applied_to" placeholder="Select">
                                           <option value="null" disabled selected>Select Employees</option>
                                        @foreach (\App\Models\Employee::get() as $employee)
                                            <option value="{{$employee->id}}">{{$employee->firstname.' '.$employee->lastname}} </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                     
                      
                           
                            <!--<div class="col-sm-12">-->
                            <!--    <div class="form-group">-->
                            <!--        <label>Applied To <span class="text-danger">*</span></label>-->
                            <!--        <select class="select select2 form-control" multiple name="team[]">-->
                            <!--              <option value="Employee" disabled selected>Select Employee</option>-->
                            <!--            @foreach (\App\Models\Employee::get() as $employee)-->
                            <!--                <option value="{{$employee->id}}">{{$employee->firstname.' '.$employee->lastname}} </option>-->
                            <!--            @endforeach-->
                            <!--        </select>-->
                            <!--    </div>-->
                            <!--</div>-->
                        
                     
                     
                     
                        
						<div class="col-sm-12">
							<div class="form-group">
								<label>Description</label>
								<textarea class="form-control" name="description" rows="4"></textarea>
							</div>
						</div>
						
							<!--<div class="row">-->
       <!--                     <div class="col-sm-12">-->
       <!--                         <div class="form-group">-->
       <!--                             <label>Add Team <span class="text-danger">*</span></label>-->
       <!--                             <select class="select select2 form-control" multiple name="team[]">-->
       <!--                                   <option value="Employee" disabled selected>Select Employee</option>-->
       <!--                                 @foreach (\App\Models\Employee::get() as $employee)-->
       <!--                                     <option value="{{$employee->id}}">{{$employee->firstname.' '.$employee->lastname}} </option>-->
       <!--                                 @endforeach-->
       <!--                             </select>-->
       <!--                         </div>-->
       <!--                     </div>-->
       <!--                 </div>-->
       
                        <!--  <div class="row">-->
                        <!--    <div class="col-sm-12">-->
                        <!--        <div class="form-group">-->
                        <!--            <label>Project Leader <span class="text-danger">*</span></label>-->
                        <!--            <select class="select2 form-control" name="leader" placeholder="Select">-->
                        <!--                   <option value="leader" disabled selected>Select Project Leader</option>-->
                        <!--                @foreach (\App\Models\Employee::get() as $employee)-->
                        <!--                    <option value="{{$employee->id}}">{{$employee->firstname.' '.$employee->lastname}} </option>-->
                        <!--                @endforeach-->
                        <!--            </select>-->
                        <!--        </div>-->
                        <!--    </div>-->
                        <!--</div>-->
                        
						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-form-label">Status </label>
								<select name="status" class="form-control select">
								     <option value="Active">Select Status</option>
									<option>Active</option>
									<option>Inactive</option>
								</select>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-form-label">Goal Type <span class="text-danger">*</span></label>
								<select name="goal_type" class="select form-control">
							    <option value="null" disabled selected>Select Goal Type</option>
									@foreach ($goal_types as $type)
										<option value="{{$type->id}}">{{$type->type}}</option>
									@endforeach
								</select>
							</div>
						</div>
						
					</div>
					<!--<div>-->
					 <!--<input type="reset" value="Reset">-->
					<!-- <input class="btn btn-primary" type="reset" value="Reset">-->
					<!-- </div>-->
					<div class="submit-section">
						<button type="submit" class="btn btn-primary submit-btn">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- /Add Goal Modal -->

<!-- Edit Goal Modal -->
<div id="edit_goal" class="modal custom-modal fade" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Edit Goal Tracking</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="post" action="{{route('goal-tracking')}}">
					@csrf
					@method("PUT")
					<div class="row">
						<input type="hidden" id="edit_id" name="id">
						<!-- <div class="col-sm-12">
							<div class="form-group">
								<label class="col-form-label">Goal Type</label>
								<select name="goal_type" class="select edit_type">
									@foreach ($goal_types as $type)
										<option value="{{$type->id}}">{{$type->type}}</option>
									@endforeach
								</select>
							</div>
						</div> -->
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Subject  <span class="text-danger">*</span></label>
								<input class="form-control edit_subject" name="subject" type="text">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Target Achievement  <span class="text-danger">*</span></label>
								<input class="form-control edit_target" name="target" type="text">
							</div>
						</div>
						
						<div class="col-sm-6">
							<div class="form-group">
								<label>Start Date <span class="text-danger">*</span></label>
								<div class="cal-icon"><input class="form-control datetimepicker edit_start" name="start_date" type="date"></div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>End Date <span class="text-danger">*</span></label>
								<div class="cal-icon"><input class="form-control datetimepicker edit_end" name="end_date" type="date"></div>
							</div>
						</div>
						
						 <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Priority <span class="text-danger">*</span></label>
                                    <select class="select form-control" value="null" name="priority" id="edit_priority">
                                           <option value="Priority" disabled selected>Select Priority</option>
                                        <option>High</option>
                                        <option>Medium</option>
                                        <option>Low</option>
                                    </select>
                                </div>
                            </div>
                            
                            
                              <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Applied To <span class="text-danger">*</span></label>
                                    <select class="select form-control" name="applied_to" placeholder="Select" id="edit_applied_to">
                                           <option value="null" disabled selected>Select Employees</option>
                                        @foreach (\App\Models\Employee::get() as $employee)
                                            <option value="{{$employee->id}}">{{$employee->firstname.' '.$employee->lastname}} </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
						<div class="col-sm-12 mb-3">
							<div class="form-group">
								<label for="customRange">Progress  <span class="text-danger">*</span></label>
								<input type="range" name="progress" class="form-control-range custom-range" id="customRange">
								<div class="mt-2" id="result">Progress Value: <b></b></div>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label>Description</label>
								<textarea class="form-control edit_description" name="description" rows="4"></textarea>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-form-label">Status</label>
								<select id="edit_status" class="select form-control" name="status" selected="selected">
								     <option value="Active">Select Status</option>
									<option>Active</option>
									<option>Inactive</option>
								</select>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label class="col-form-label">Goal Type  <span class="text-danger">*</span></label>
								<select name="goal_type" class="select form-control edit_type">
								      <option value="null" disabled selected>Select Goal Type</option>
									@foreach ($goal_types as $type)
										<option value="{{$type->id}}">{{$type->type}}</option>
									@endforeach
								</select>
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
<!-- /Edit Goal Modal -->

<x-modals.delete :route="'goal-tracking'" :title="'Goal Track'" />

@endsection

@section('scripts')
	<!-- Datatable JS -->
	<script src="{{asset('assets/js/jquery.dataTables.min.js')}}"></script>
	<script src="{{asset('assets/js/dataTables.bootstrap4.min.js')}}"></script>
	<script>
		$(document).ready(function(){
			$('.table').on('click','.editbtn',function(){
				$('#edit_goal').modal('show');
				var id = $(this).data('id');
				var type = $(this).data('type');
				var subject = $(this).data('subject');
				var target = $(this).data('target');
				var start = $(this).data('start');
				var end = $(this).data('end');
				var description = $(this).data('description');
				var status = $(this).data('status');
				var progress = $(this).data('progress');
				var priority= $(this).data('priority');
                var applied_to= $(this).data('applied_to');
  
				$('#edit_id').val(id);
				$(".edit_type option[value='"+ type +"']").attr("selected", "selected");
				$('.edit_type').val(type).change();
				$('.edit_subject').val(subject);
				$('.edit_target').val(target);
				$('.edit_start').val(start);
				$('.edit_end').val(end);
				$("#edit_status option[value='"+ status +"']").attr("selected", "selected");
				$('#edit_status').val(status).change();
				$('.edit_description').val(description);
				$('#customRange').val(progress);
			//	$('#edit_priority').val(progress);
			//	$("#edit_priority option[value='"+ priority +"']").attr("selected", "selected");
				   $("#edit_priority").val(priority).change();
				   	$('#edit_applied_to').val(applied_to).change();
			
				
			});
			
			// Read value on change
			$("#customRange").change(function(){
				$("#result b").html($(this).val());
			});
		});
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