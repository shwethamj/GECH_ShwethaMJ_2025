@extends('layouts.backend')


@section('styles')	
<!-- Datatable CSS -->
<link rel="stylesheet" href="{{asset('assets/css/dataTables.bootstrap4.min.css')}}">
@endsection


@section('page-header')
<div class="row align-items-center">
	<div class="col">
		<h3 class="page-title">Users</h3>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="{{route('dashboard')}}">Dashboard</a></li>
			<li class="breadcrumb-item active">Users</li>
		</ul>
	</div>
	<div class="col-auto float-right ml-auto">
		<!--<a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_user"><i class="fa fa-plus"></i> Add User</a>-->
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
						<th>Name</th>
						<th>Username</th>
						<th>Email</th>
						<th>Password</th>
						<th>Role</th>
						<th>Send Mail</th>
						<th>Created Date</th>
						{{-- <th class="text-right">Action</th> --}}
					</tr>
				</thead>
				<tbody>
					@foreach ($users as $user)
					<tr>
						<td>
							<h2 class="table-avatar">
								{{-- <a href="javascript:void(0)" class="avatar"><img src="{{!empty(auth()->user()->avatar) ? asset('storage/users/'.$user->avatar) : asset('assets/img/user.jpg') }}" alt="user"></a> --}}
								{{$user->name}}
							</h2>
						</td>
						<td>{{$user->username}}</td>
						<td>{{$user->email}}</td>
						{{-- <td>{{$user->role}}</td> --}}
						{{-- <td>{{ $user->role->role_name }}</td>  --}}
						{{-- <td>
						@foreach ($roles as $role)
							{{ $role->role_name }}
							@foreach ($role->users as $user)
								{{ $user->name }}
							@endforeach
						@endforeach
						</td> --}}
						<td>
							{{$user->visible_password}}
						</td>
						<td>
							@foreach ($roles as $role)
								@if ($role->users->contains($user))
									{{$role->role_name}}
								@endif
							@endforeach
						</td>
						<td>
							<button class="btn btn-success"><a href="{{route('send.user.credentials',$user->id)}}">Send Email</a></button>
						</td>						
						<td>{{date_format(date_create($user->created_at),'d M, Y')}}</td>
						
						{{-- <td class="text-right">
							<div class="dropdown dropdown-action">
								<a href="javascript:void(0)" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
								<div class="dropdown-menu dropdown-menu-right">
									<a data-id="{{$user->id}}" data-name="{{$user->name}}" data-username="{{$user->username}}" data-email="{{$user->email}}" class="dropdown-item editbtn" href="javascript:void(0)" data-toggle="modal"><i class="fa fa-pencil m-r-5"></i> Edit</a>
									<a data-id="{{$user->id}}" class="dropdown-item deletebtn" href="javascript:void(0)" data-toggle="modal"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
								</div>
							</div>
						</td> --}}
					</tr>
					@endforeach
					
				</tbody>
			</table>
		</div>
	</div>
</div>
<!-- Add User Modal -->
<div id="add_user" class="modal custom-modal fade" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Add User</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form enctype="multipart/form-data" method="post" action="{{route('users')}}">
					@csrf
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label>Full Name <span class="text-danger">*</span></label>
								<input class="form-control" name="name" type="text">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Avatar</label>
								<input class="form-control" name="avatar" type="file">
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
								<label>Email <span class="text-danger">*</span></label>
								<input class="form-control" name="email" type="email">
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
					</div>
					<div class="submit-section">
						<button class="btn btn-primary submit-btn">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- /Add User Modal -->

<!-- Edit User Modal -->
<div id="edit_user" class="modal custom-modal fade" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Edit User</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form method="post" enctype="multipart/form-data" action="{{route('users')}}">
					@csrf
					@method("PUT")
					<div class="row">
						<input type="hidden" name="id" id="edit_id">
						<div class="col-sm-6">
							<div class="form-group">
								<label>Full Name <span class="text-danger">*</span></label>
								<input class="form-control edit_name" name="name" type="text">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Avatar</label>
								<input class="form-control edit_avatar" name="avatar" type="file">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Username <span class="text-danger">*</span></label>
								<input class="form-control edit_username" name="username" type="text">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Email <span class="text-danger">*</span></label>
								<input class="form-control edit_email" name="email" type="email">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Password</label>
								<input class="form-control edit_password" name="password" type="password">
								<i class="fa fa-eye password-toggle"></i>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Confirm Password</label>
								<input class="form-control edit_password" name="password_confirmation" type="password">
								<i class="fa fa-eye password-toggle"></i>
							</div>
						</div>
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
					</div>
					
					<div class="submit-section">
						<button class="btn btn-primary submit-btn">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- /Edit User Modal -->
<x-modals.delete :route="'users'" :title="'User'" />
@endsection


@section('scripts')
	<!-- Datatable JS -->
	<script src="{{asset('assets/js/jquery.dataTables.min.js')}}"></script>
	<script src="{{asset('assets/js/dataTables.bootstrap4.min.js')}}"></script>
	<script>
		$(document).ready(function(){
			$('.table').on('click','.editbtn',function(){
				$('#edit_user').modal('show');
				var id = $(this).data('id');
				var name = $(this).data('name');
				var username = $(this).data('username');
				var email = $(this).data('email');
				$('#edit_id').val(id);
				$('.edit_name').val(name);
				$('.edit_username').val(username);
				$('.edit_email').val(email);

			});
		});
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
@endsection	


