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
		<h3 class="page-title">Projects</h3>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="{{route('dashboard')}}">Dashboard</a></li>
			<li class="breadcrumb-item active">projects</li>
		</ul>
	</div>
	<div class="col-auto float-right ml-auto">
		<a href="#" class="btn add-btn" data-toggle="modal" data-target="#create_project"><i class="fa fa-plus"></i> Add Project</a>
		<div class="view-icons">
			<a href="{{route('projects')}}" class="grid-view btn btn-link {{route_is('projects') ? 'active' : '' }}"><i class="fa fa-th"></i></a>
			<a href="{{route('project-list')}}" class="list-view btn btn-link {{route_is('project-list') ? 'active' : '' }}" class=><i class="fa fa-bars"></i></a>
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
                        <th>Project</th>
                        <th>Client</th>
                        <th>Leader</th>
                        <th>Team Members</th>
                        <th>Deadline</th>
                        <th>Priority</th>
                        
                        <th class="text-end">Action</th>
                    </tr>
                </thead>
                <tbody>
                @if (auth()->user()->role == 2 || auth()->user()->role == 1)
                    @php
						$count = 1;
					@endphp
                    @foreach ($projects as $project)  
                    <tr>
                         <td>{{$count}}</td>
                        <td>
                            <a href="{{route('project.show',$project->name)}}">{{$project->name}}</a>
                        </td>
                       
                        <td>
                            <!--<ul class="team-members">-->
                            <h2 class="table-avatar">
                                @php
                                    $leader = $project->client;
                                @endphp
                                <!--<li>-->
                                    <a href="#" class="avatar" data-toggle="tooltip" title="{{$leader->firstname.' '.$leader->lastname}}">
                                        <img alt="avatar"  src="{{ !empty($leader->avatar) ? asset('storage/clients/'.$leader->avatar): asset('assets/img/user.jpg')}}">
                                    </a>
                                    <a href="#">{{$leader->firstname.' '.$leader->lastname}}</a>
                                <!--</li>-->
                            <!--</ul>-->
                            </h2>
                        </td>
                        
                        <td>
                            <h2 class="table-avatar">
                                @php
                                    $leader = $project->employee($project->leader);
                                @endphp
                                <a href="#" class="avatar" data-toggle="tooltip" title="{{$leader->firstname.' '.$leader->lastname}}">
                                    <img src="{{ !empty($leader->avatar) ? asset('storage/employee_details/'.$leader->avatar): asset('assets/img/user.jpg')}}">
                                </a>
                                <a href="#">{{$leader->firstname.' '.$leader->lastname}}</a>
                            </h2>
                        </td>
                        
                        <td>
                           @if(is_array($project->team))
                            @foreach($project->team as $team_member)
                              @php
                                $employee = \App\Models\EmployeeDetail::find($team_member);
                              @endphp
                              <h2 class="table-avatar">
                                <a href="#" class="avatar" data-toggle="tooltip" title="{{$employee->firstname.' '.$employee->lastname}}">
                                  <img src="{{ !empty($employee->avatar) ? asset('storage/employee_details/'.$employee->avatar): asset('assets/img/user.jpg')}}">
                                </a>
                                <!--<a href="#">{{$employee->firstname.' '.$employee->lastname}}</a>-->
                              </h2>
                            @endforeach
                           @endif
                        </td>

                        
                        <!--<td>{{date_format(date_create($project->end_date),"D M, Y")}}</td>-->
                        <td>{{date_format(date_create($project->end_date),"j F Y")}}</td>
                        <td>
                            {{$project->priority}}
                        </td>
                        
                       
                        <td class="text-end">
                            <div class="dropdown dropdown-action">
                                <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item editbtn" href="javascript:void(0)" data-id="{{$project->id}}" data-name="{{$project->name}}" 
                                        data-client="{{($project->client_id)}}" data-start="{{$project->start_date}}" data-end="{{$project->end_date}}"
                                        data-rate="{{$project->rate}}" data-rtype="{{$project->rate_type}}" data-priority="{{$project->priority}}" 
                                        data-leader="{{$project->leader}}" data-team="{{json_encode($project->team)}}" 
                                        data-description="{{$project->description}}" data-progress="{{$project->progress}}"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                    <a class="dropdown-item deletebtn" href="javascript:void(0)" data-id="{{$project->id}}"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    	@php
						$count++;
					@endphp
                    @endforeach
                @endif
                @if (auth()->user()->role == 3)
                    @php
						$count = 1;
                        $projects = app('App\Http\Controllers\Admin\ProjectController')->userProjects();
					@endphp
                    @foreach ($projects as $project)  
                    <tr>
                         <td>{{$count}}</td>
                        <td>
                            <a href="{{route('project.show',$project->name)}}">{{$project->name}}</a>
                        </td>
                       
                        <td>
                            <!--<ul class="team-members">-->
                            <h2 class="table-avatar">
                                @php
                                    $leader = $project->client;
                                @endphp
                                <!--<li>-->
                                    <a href="#" class="avatar" data-toggle="tooltip" title="{{$leader->firstname.' '.$leader->lastname}}">
                                        <img alt="avatar"  src="{{ !empty($leader->avatar) ? asset('storage/clients/'.$leader->avatar): asset('assets/img/user.jpg')}}">
                                    </a>
                                    <a href="#">{{$leader->firstname.' '.$leader->lastname}}</a>
                                <!--</li>-->
                            <!--</ul>-->
                            </h2>
                        </td>
                        
                        <td>
                            <h2 class="table-avatar">
                                @php
                                    $leader = $project->employee($project->leader);
                                @endphp
                                <a href="#" class="avatar" data-toggle="tooltip" title="{{$leader->firstname.' '.$leader->lastname}}">
                                    <img src="{{ !empty($leader->avatar) ? asset('storage/employee_details/'.$leader->avatar): asset('assets/img/user.jpg')}}">
                                </a>
                                <a href="#">{{$leader->firstname.' '.$leader->lastname}}</a>
                            </h2>
                        </td>
                        
                        <td>
                           @if(is_array($project->team))
                            @foreach($project->team as $team_member)
                              @php
                                $employee = \App\Models\EmployeeDetail::find($team_member);
                              @endphp
                              <h2 class="table-avatar">
                                <a href="#" class="avatar" data-toggle="tooltip" title="{{$employee->firstname.' '.$employee->lastname}}">
                                  <img src="{{ !empty($employee->avatar) ? asset('storage/employee_details/'.$employee->avatar): asset('assets/img/user.jpg')}}">
                                </a>
                                <!--<a href="#">{{$employee->firstname.' '.$employee->lastname}}</a>-->
                              </h2>
                            @endforeach
                           @endif
                        </td>

                        
                        <!--<td>{{date_format(date_create($project->end_date),"D M, Y")}}</td>-->
                        <td>{{date_format(date_create($project->end_date),"j F Y")}}</td>
                        <td>
                            {{$project->priority}}
                        </td>
                        
                       
                        <td class="text-end">
                            <div class="dropdown dropdown-action">
                                <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item editbtn" href="javascript:void(0)" data-id="{{$project->id}}" data-name="{{$project->name}}" 
                                        data-client="{{($project->client_id)}}" data-start="{{$project->start_date}}" data-end="{{$project->end_date}}"
                                        data-rate="{{$project->rate}}" data-rtype="{{$project->rate_type}}" data-priority="{{$project->priority}}" 
                                        data-leader="{{$project->leader}}" data-team="{{json_encode($project->team)}}" 
                                        data-description="{{$project->description}}" data-progress="{{$project->progress}}"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                    <a class="dropdown-item deletebtn" href="javascript:void(0)" data-id="{{$project->id}}"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    	@php
						$count++;
					@endphp
                    @endforeach
                @endif
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
<!-- /Page Content -->

<x-modals.popup />
<x-modals.delete route="projects" title="Project" />
@endsection


@section('scripts')
<!-- Summernote JS -->
<script src="{{asset('assets/plugins/summernote/dist/summernote-bs4.min.js')}}"></script>
<!-- Select2 JS -->
<script src="{{asset('assets/plugins/select2/select2.min.js')}}"></script>
<!-- Datatable JS -->
<script src="{{asset('assets/js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('assets/js/dataTables.bootstrap4.min.js')}}"></script>
<script>
    //$(document).ready(function(){
        $('.table').on('click','.editbtn',(function(){
            var id = $(this).data('id');
            var name = $(this).data('name');
            var client = $(this).data('client');
            var startdate = $(this).data('start');
            var enddate = $(this).data('end');
            var rate = $(this).data('rate');
            var rate_type = $(this).data('rtype');
            var priority = $(this).data('priority');
            var leader = $(this).data('leader');
            var team  = $(this).data('team');
            var description = $(this).data('description');
            var progress = $(this).data('progress');
            $('#edit_project').modal('show');
            $('#edit_id').val(id);
            $('#edit_name').val(name);
            $('#edit_client').val(client).trigger('change');
            $('#edit_startdate').val(startdate);
            $('#edit_enddate').val(enddate);
            $('#edit_rate').val(rate);
            $('#edit_ratetype').val(rate_type).trigger('change');
            $('#edit_priority').val(priority).trigger('change');
            $('#edit_leader').val(leader).trigger('change');
            $('#edit_team').val(team).trigger('change');
            $('#edit_description').summernote('code', description);
            $('#edit_progress').val(progress);
            $('#progress_result').html("Progress Value: " + progress);
            $('#edit_progress').change(function(){
                $('#progress_result').html("Progress Value: " + $(this).val());
            });
        }));
   // });
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