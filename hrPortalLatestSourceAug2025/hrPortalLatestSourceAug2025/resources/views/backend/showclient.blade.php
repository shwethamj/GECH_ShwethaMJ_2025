@extends('layouts.backend')

@section('styles')
<!-- Select2 CSS -->
<link rel="stylesheet" href="{{asset('assets/plugins/select2/select2.min.css')}}">
  
@endsection

@section('page-header')
<div class="row align-items-center">
	<div class="col">
		<h3 class="page-title"></h3>
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="{{route('dashboard')}}">Dashboard</a></li>
			<li class="breadcrumb-item active">View Client</li>
		</ul>
	</div>

</div>
@endsection

@section('content')

<div class="card mb-0">
<div class="card-body">
<div class="row">
<div class="col-md-12">
<div class="profile-view">
<div class="profile-img-wrap">
<div class="profile-img">
<a href="#">
<img src="@if(!empty($client->avatar)) {{asset('storage/clients/'.$client->avatar)}} @else assets/img/profiles/default.jpg @endif" alt="">
</a>
</div>
</div>
<div class="profile-basic">
<div class="row">
<div class="col-md-5">
<div class="profile-info-left">
<h3 class="user-name m-t-0">{{$client->company}}</h3>
<!-- <h5 class="company-role m-t-0 mb-0">{{$client->firstname}}</h5> -->
<div>
<span class="title"> Client Name:</span>
<span class="text"><a href="#">{{$client->firstname}}</a></span>
</div>
<br>
<!-- <small class="text-muted">CEO</small> -->
<!-- <div class="staff-id">Project Title : {{$client->project_title}}</div> -->
<!-- <div class="staff-msg"><a href="https://smarthr.dreamguystech.com/php/template/chat.php" class="btn btn-custom">Send Message</a></div> -->
<div>
<span class="title">Email:</span>
<span class="text"><a href="#"><span class="__cf_email__" data-cfemail="4d2f2c3f3f342e38292c0d28352c203d2128632e2220">{{$client->email}}</span></a></span>
</div>
<br>
<div>
<span class="title">Phone:</span>
<span class="text"><a href="#">{{$client->phone}}</a></span>
</div>
<!-- <div>
<span class="title">Email:</span>
<span class="text"><a href="#"><span class="__cf_email__" data-cfemail="4d2f2c3f3f342e38292c0d28352c203d2128632e2220">{{$client->email}}</span></a></span>
</div> -->
</div>
</div>
<div class="col-md-7">
<ul class="personal-info">
<li>
<span class="title">Project Title:</span>
<span class="text"><a href="#">{{$client->project_title}}</a></span>
</li>
<!-- <li>
<span class="title">Email:</span>
<span class="text"><a href="#"><span class="__cf_email__" data-cfemail="4d2f2c3f3f342e38292c0d28352c203d2128632e2220">{{$client->email}}</span></a></span>
</li> -->
<li>
<span class="title">Project Type:</span>
<span class="text">{{$client->project_type}}</span>
</li>
<li>
<span class="title">Project Spoc</span>
<span class="text">{{$client->project_spoc}}</span>
</li>
<li>
<span class="title">Location:</span>
<span class="text">{{$client->location}}</span>
</li>

<li>
<span class="title">Start Date:</span>
<span class="text">{{$client->start_date}}</span>
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


<br>

      <!-- <div class="row">
            <div class="col-lg-8 col-xl-9">
                
                                  <div class="card mb-0">
                                        <div class="card-body">
                                            <h5 class="card-title m-b-20">Uploaded files</h5>
                                            <ul class="files-list">
                                                    
                                          @if (!empty($client->cv)) 
                                          @foreach ($client as $clients)
                                  
                                                        <li>
                                                            <div class="files-cont">
                                                                <div class="file-type">
                                                                    <span class="files-icon"><i class="fa fa-file-o"></i></span>
                                                                </div>
                                                                <div class="files-info">
                                                                    <span class="file-name text-ellipsis">
                                                                    <a href="#">{{$clients}}</a></span>
                                                                    <div class="file-size">Size: {{is_file(asset('storage/clients/'.$clients)) ? \Storage::size(public_path('storage/clients/'.$clients)):''}}</div>
                                                                </div>
                                                                <ul class="files-action">
                                                                    <li class="dropdown dropdown-action">
                                                                        <a href="" class="dropdown-toggle btn btn-link" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_horiz</i></a>
                                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                              <a class="dropdown-item" href="{{!empty($clients) ? asset('storage/clients/'.$clients): '#'}}">Download</a> 
                                                                            <!-- <a class="dropdown-item" href="{{url('/storage/cv/'.$appliedjob)}}" download>Download</a> -->
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </li>
                                                    @endforeach
                                                    @endif
                                            </ul>
                                        </div>
                                    </div> -->
            </div>
        </div>
                                   
@endsection


@section('scripts')
<!-- Select2 JS -->
<script src="{{asset('assets/plugins/select2/select2.min.js')}}"></script>

@endsection
