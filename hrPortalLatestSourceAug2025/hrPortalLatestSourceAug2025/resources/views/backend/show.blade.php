@extends('layouts.backend')

@section('styles')
<!-- Select2 CSS -->
<link rel="stylesheet" href="{{asset('assets/plugins/select2/select2.min.css')}}">
  
@endsection

@section('page-header')
<div class="row align-items-center">
	<div class="col">
		<h3 class="page-title">{{ucwords($title)}}</h3>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="{{route('dashboard')}}">Dashboard</a></li>
			<li class="breadcrumb-item active">View Policy</li>
		</ul>
	</div>
	{{-- <div class="col-auto float-right ml-auto">
		<a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_modal"><i class="fa fa-plus"></i> Add Modal</a>
	</div> --}}
</div>
@endsection


@section('content')
      <div class="row">
            <div class="col-lg-8 col-xl-9">
                
                <div class="card">
                    <div class="card-body">
                        <div class="project-title">
                            <h5 class="card-title">
                            {{$policy->name}}
                            </h5>
                            <br>
                            <p>
                            {{$policy->description}}
                            </p>
                        </div>
                    </div>
                </div>
                <div class="card mb-0">
                    <div class="card-body">
                        <h5 class="card-title m-b-20">Uploaded files</h5>
                        <ul class="files-list">
                        @if (!empty($policy->files)) 
                        @foreach ($policy->files as $file) 
                            <li>
                                <div class="files-cont">
                                    <div class="file-type">
                                        <span class="files-icon"><i class="fa fa-file-o"></i></span>
                                    </div>
                                    <div class="files-info row">
                                        <div class="col-lg-10">
                                            <span class="file-name text-ellipsis">
                                            <a href="#">{{$file}}</a></span>
                                            <div class="file-size">Size: {{is_file(asset('storage/policy/'.$file)) ? \Storage::size(public_path('storage/policy/'.$file)):''}}</div>
                                        </div>
                                        <div class="col-lg-2">
                                            <button class="btn btn-primary">
                                                <a class="text-dark" href="{{!empty($file) ? asset('storage/policy/'.$file): '#'}}" download>Download</a>
                                            </button>
                                        </div>
                                    </div>
                                    {{-- <ul class="files-action">
                                        <li class="dropdown dropdown-action">
                                            <a href="" class="dropdown-toggle btn btn-link" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_horiz</i></a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                 <a class="dropdown-item" href="{{!empty($file) ? asset('storage/policy/'.$file): '#'}}">Download</a>
                                            </div>
                                        </li>
                                    </ul> --}}
                                </div>
                            </li>
                        @endforeach
                        @endif
                        </ul>
                    </div>
                    {{-- <div class="card-body p-2 mt-1" style="max-height:200px;"> --}}
                        {{-- <div>
                            <embed src="{{ !empty($file) ? asset('storage/policy/'.$file) : '' }}" width="100%" height="500px" />
                        </div> --}}
                        <div class="mx-5">
                            <iframe src="{{ !empty($file) ? asset('storage/policy/'.$file) : '' }}" width="98%" height="500px"></iframe>
                        </div>
                        
                    {{-- </div> --}}
                </div>
            </div>
            <div class="col-lg-4 col-xl-3">
                <div class="card">
                    <div class="card-body">
                        <h6 class="card-title m-b-15 text-center">Policy details</h6>
                        <table class="table table-striped table-border">
                            <tbody>
                                <tr>
                                    <td>Policy Name:</td>
                                    <td class="text-end">{{$policy->name}}</td>
                                </tr>
                                <tr>
                                    <td>Department:</td>
                                    <td class="text-end">{{$policy->department->name}}</td>
                                </tr>
                                <tr>
                                    <td>Created On:</td>
                                    <td class="text-end">{{date_format(date_create($policy->created_at),"d M Y")}}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
                                   
@endsection


@section('scripts')
<!-- Select2 JS -->
<script src="{{asset('assets/plugins/select2/select2.min.js')}}"></script>

@endsection