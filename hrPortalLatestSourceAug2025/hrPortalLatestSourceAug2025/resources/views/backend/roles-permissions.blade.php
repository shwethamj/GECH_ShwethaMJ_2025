@extends('layouts.backend')

@section('styles')
<!-- Datatable CSS -->
<link rel="stylesheet" href="{{asset('assets/css/dataTables.bootstrap4.min.css')}}">
@endsection
@section('page-header')
<div class="row align-items-center">
    <div class="col">
        <h3 class="page-title">Roles</h3>
        <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Dashboard</a></li>
            <li class="breadcrumb-item active">Roles</li>
        </ul>
    </div>
    <div class="col-auto float-right ml-auto">
        <a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_role"><i class="fa fa-plus"></i> Add Role</a>
    </div>
</div>
@endsection

@section('content')
<div class="row">
    <div class="col-md-12">
        <div>
            <table class="table table-striped custom-table mb-0 datatable">
                <thead>
                    <tr>
                        <th style="width: 30px;">#</th>
                        <th>Role Name</th>
                        <th class="text-right">Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($roles as $role)
                    <tr>
                        <td>{{ $role->id }}</td>
                        <td>{{ $role->role_name }}</td>
                        <td class="text-right">
                            <div class="dropdown dropdown-action">
                                <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<a data-id="{{$role->id}}" data-name="{{ $role->role_name }}" class="dropdown-item editbtn" href="#" data-toggle="modal"><i class="fa fa-pencil m-r-5"></i> Edit</a>
									<a data-id="{{$role->id}}" class="dropdown-item deletebtn" href="#" data-toggle="modal" ><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    @endforeach
					<x-modals.delete :route="'roles.destroy'" :title="'Role'" />
                </tbody>
            </table>
        </div>
    </div>
</div>
<div id="add_role" class="modal custom-modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Role</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                {{-- <form> --}}
                <form method="POST" action="{{ route('roles.store') }}">
                    @csrf
                    <div class="form-group">
                        <label>Role Name <span class="text-danger">*</span></label>
                        <input class="form-control" name="name" type="text">
                    </div>
                    <div class="submit-section">
                        <button type="submit" class="btn btn-primary submit-btn">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div id="edit_role" class="modal custom-modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Role</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                {{-- <form> --}}
                <form action="{{ route('roles.edit') }}" method="POST">
                    @csrf
                    @method('PUT')
                    <div class="form-group">
					    <input id="edit_id" type="hidden" name="id">
                        <label>Role Name <span class="text-danger">*</span></label>
                        <input class="form-control edit_name" name="name" type="text">
                    </div>
                    <div class="submit-section">
                        <button type="submit" class="btn btn-primary submit-btn">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@section('scripts')
<!-- Datatable JS -->
<script src="{{asset('assets/js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('assets/js/dataTables.bootstrap4.min.js')}}"></script>
<script>
	$(document).ready(function (){
		
		$('.editbtn').on('click',function (){
			$('#edit_role').modal('show');

			var id = $(this).data('id');
			var name = $(this).data('name');
            
            $('#edit_id').val(id);
			$('.edit_name').val(name);
		});
	});
</script>
@endsection
