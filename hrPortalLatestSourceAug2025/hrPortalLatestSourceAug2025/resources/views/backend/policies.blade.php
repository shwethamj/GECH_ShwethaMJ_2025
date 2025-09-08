@extends('layouts.backend')

@section('styles')
    <!-- Datatable CSS -->
    <link rel="stylesheet" href="{{asset('assets/css/dataTables.bootstrap4.min.css')}}">
    <!-- Select2 CSS -->
    <link rel="stylesheet" href="{{asset('assets/plugins/select2/select2.min.css')}}">

@endsection

@section('page-header')
<div class="row align-items-center">
    <div class="col">
        <h3 class="page-title">Policies</h3>
        <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Dashboard</a></li>
            <li class="breadcrumb-item active">Policies</li>
        </ul>
    </div>
    <div class="col-auto float-right ml-auto">
        <a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_policy"><i class="fa fa-plus"></i> Add Policy</a>
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
                        <th>Policy Name </th>
                        <th>Department </th>
                        <!-- <th>Description </th> -->
                        <th>Created </th>
                        <th class="text-right">Action</th>
                    </tr>
                </thead>
                <tbody>
                      @php
						$count = 1;
					@endphp
                    @if(!empty($policies->count()))
                        @foreach ($policies as $policy)
                            <tr>
                                 <td>{{$count}}</td>
                                <td><a href="{{route('policy-show', ['policy_id' => $policy->id])}}">{{$policy->name}}</a></td>
                                <td>{{$policy->department->name}}</td>
                                <!-- <td>{{$policy->description}}</td> -->
                                <td>{{date_format(date_create($policy->created_at),"d M Y")}}</td>
                                <td class="text-right">
                                    <div class="dropdown dropdown-action">
                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                        <div class="dropdown-menu dropdown-menu-right">
                              <!-- <a class="dropdown-item" href="#"><i class="fa fa-download m-r-5"></i> Download</a> -->
                                            <a class="dropdown-item editbtn" href="#" data-toggle="modal" data-target="#edit_policy"  data-id="{{$policy->id}}" data-name="{{$policy->name}}" 
                                             data-description="{{$policy->description}}"  data-department="{{$policy->department->id}}"
                                             @if (!empty($policy->files)) 
                                         @foreach ($policy->files as $file) 
                                         data-files="{{$file}}" 
                                         @endforeach
                                        @endif
                                              > 
                                              <i class="fa fa-pencil m-r-5"></i> Edit</a>
                                            <a data-id="{{$policy->id}}" class="dropdown-item deletebtn" href="#" data-toggle="modal" ><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                        </div>
                                    </div>
                                </td>
                            </tr> 
                            		@php
						$count++;
					@endphp
					
                        @endforeach
                        <x-modals.delete :route="'policy.destroy'" :title="'policy'" />
                    @endif
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Add Policy Modal -->
<div id="add_policy" class="modal custom-modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Policy</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{route('policies')}}" method="POST" enctype="multipart/form-data"
                >
                    @csrf
                    <div class="form-group">
                        <label>Policy Name <span class="text-danger">*</span></label>
                        <input class="form-control" name="name" type="text">
                    </div>
                    <div class="form-group">
                        <label>Description <span class="text-danger">*</span></label>
                        <textarea name="description" class="form-control" rows="4"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Department</label>
                        <select name="department" class="select form-control">
                         <option>Select Department</option>
                        @foreach (\App\Models\Department::get() as $department)
                                <option value="{{$department->id}}">{{$department->name}}</option>
                            @endforeach
                          
                        </select>
                    </div>
                    <!-- <div class="form-group">
                        <label>Upload Policy <span class="text-danger">*</span></label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="policy_upload">
                            <label class="custom-file-label" for="policy_upload">Choose file</label>
                        </div>
                    </div> -->
                    <div class="form-group">
                                <label>Upload Files</label>
                                <input class="form-control" name="files" type="file" accept="application/pdf" required>
                              
                            </div>
                    <div class="submit-section">
                        <button class="btn btn-primary submit-btn">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- /Add Policy Modal -->

<!-- Edit Policy Modal -->
<div id="edit_policy" class="modal custom-modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Policy</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            <form action="{{route('policies')}}" method="post" enctype="multipart/form-data">
            @csrf
                    @method("PUT")
                    <div class="form-group">
                    <input type="hidden" name="id" id="edit_id">
                        <label>Policy Name <span class="text-danger">*</span></label>
                        <input class="form-control" type="text" value="Leave Policy" id="edit_name" name="name">
                    </div>
                    <div class="form-group">
                        <label>Description <span class="text-danger" >*</span></label>
                        <textarea class="form-control" id="edit_description" name="description" rows="4"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Department</label>
                        <select class="select form-control" selected="selected" name="department" id="edit_department" value="{{$department->id}}">
                        <option value="" disabled>Select Department</option>
                        @foreach (\App\Models\Department::get() as $department)
						 <option value="{{$department->id}}">{{$department->name}}</option>
						 @endforeach 
                        </select>
                    </div>                 
                           <div class="form-group">
                                <label>Upload Files</label>
                                <input class="form-control" name="files[]" type="file" value="" >
                                <div class="card-body p-2 mt-1" style="max-height:200px;">
                                 <embed src="#toolbar=0" width= "100%" height= "180px" id="edit_files">
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
<!-- /Edit Policy Modal -->

@endsection

 @section('scripts')
    <!-- Select2 JS-->
    <!--<script src="{{asset('assets/plugins/select2/select2.min.js')}}"></script>-->
    <!-- Datatable JS -->-->
    <script src="{{asset('assets/js/jquery.dataTables.min.js')}}"></script>
    <script src="{{asset('assets/js/dataTables.bootstrap4.min.js')}}"></script>
    <script>

  //  $(document).ready(function (){  
        // edit holiday 
        $('.editbtn').on('click',function (){
            $('#edit_policy').modal('show');
            var id = $(this).data('id');
            var name = $(this).data('name');
            var description = $(this).data('description');
            var department = $(this).data('department');
            var files = $(this).data('files');
            
            
            console.log(department);
            $('#edit_id').val(id);
            $('#edit_name').val(name);
            $('#edit_description').text(description);
           $("#edit_department").val(department).change();
            // $("#edit_files").val($files).change();
            //  $('#edit_files').val(files);
            $('#edit_files').attr('src','storage/policy/'+files);
			
        });
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