@extends('layouts.backend')

@section('styles')
<!-- Select2 CSS -->
<link rel="stylesheet" href="{{asset('assets/plugins/select2/select2.min.css')}}">
<!-- Datatable CSS -->
<link rel="stylesheet" href="{{asset('assets/css/dataTables.bootstrap4.min.css')}}">
@endsection

@section('page-header')
<div class="row align-items-center">
	<div class="col">
		<h3 class="page-title">{{$policy->name}}</h3>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="{{route('dashboard')}}">Dashboard</a></li>
			<li class="breadcrumb-item active">View policy</li>
		</ul>
	</div>
	
</div>
@endsection


@section('content')
     <div class="row">
            <div class="col-lg-8 col-xl-9">
                <div class="card">
                    <div class="card-body">
                        <div class="project-title">
                            <h5 class="card-title">{{$policy->name}}</h5>
                        </div>
                        <p>
                            {!! $policy->description !!} 
                        </p>
                    </div>
                </div>
               
                 {{-- <div class="card">
                    <div class="card-body">
                        <h5 class="card-title m-b-20">Uploaded files and Images</h5>
                        <!-- <div class="row"> -->
                        <ul class="files-list">
                            @if (!empty($policy->files))
                                
                            @foreach ($policy->files as $file)
                            @php
                                $imageExtensions = ['jpg', 'jpeg', 'gif', 'png', 'bmp', 'svg', 'svgz', 'cgm', 'djv', 'djvu', 'ico', 'ief','jpe', 'pbm', 'pgm', 'pnm', 'ppm', 'ras', 'rgb', 'tif', 'tiff', 'wbmp', 'xbm', 'xpm', 'xwd','pdf'];
                                $explodeImage = explode('.', asset('storage/policy/'.$policy->files.''));
                                $extension = end($explodeImage);
                            @endphp 
                                @if (in_array($extension, $imageExtensions))  
                                <!-- <div class="col-md-3 col-sm-4 col-lg-4 col-xl-3">
                                    <div class="uploaded-box">
                                        <div class="uploaded-img">
                                        <a class="dropdown-item" href="{{!empty($file) ? asset('storage/policy/'.$project->name.'/'.$file): '#'}}">Download</a>
                                            <img src="{{ asset('storage/projects/'.$project->name.'/'.$file) }}" class="img-fluid" alt="">
                                        </div>
                                        <div class="uploaded-img-name">
                                            {{$file}}
                                        </div>
                                    </div>
                                </div> -->
                                <li>
                                        <div class="files-cont">
                                            <div class="file-type">
                                                <span class="files-icon"><i class="fa fa-file-o"></i></span>
                                            </div>
                                            <div class="files-info">
                                                <span class="file-name text-ellipsis">
                                                <a href="#">{{$file}}</a></span>
                                                <div class="file-size">{{is_file(asset('storage/projects/'.$project->name.'/'.$file)) ? \Storage::size(public_path('storage/projects/'.$project->name.'/'.$file)): ''}}</div>
                                            </div>
                                            <ul class="files-action">
                                                                    <li class="dropdown dropdown-action">
                                                                        <a href="" class="dropdown-toggle btn btn-link" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_horiz</i></a>
                                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                             <a class="dropdown-item" href="{{!empty($file) ? asset('storage/projects/'.$project->name.'/'.$file): '#'}}"  download>Download</a>
                                                                            <!--<a class="dropdown-item" href="{{url('/storage/policy/'.$file)}}">Download</a>-->
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                        </div>
                                    </li> 
                                @endif
                            @endforeach

                            @endif                            
                        <ul>
                        
                    </div>
                </div>  --}}
            </div>
            <div class="col-lg-4 col-xl-3">
                <div class="card">
                    <div class="card-body">
                        <h6 class="card-title m-b-15">Policy details</h6>
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
    </div>
@endsection


@section('scripts')
<!-- Select2 JS -->
<script src="{{asset('assets/plugins/select2/select2.min.js')}}"></script>
<!-- Datatable JS -->
<script src="{{asset('assets/js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('assets/js/dataTables.bootstrap4.min.js')}}"></script>
@endsection