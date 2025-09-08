@extends('layouts.backend')

@section('styles')
    <!-- Select2 CSS -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/select2/select2.min.css') }}">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">

    <!-- Datatable CSS -->
    <link rel="stylesheet" href="{{ asset('assets/css/dataTables.bootstrap4.min.css') }}">
    <style>
        
    </style>
@endsection

@section('page-header')
    <div class="row align-items-center">
        <div class="col">
            <h3 class="page-title">Client Profile</h3>
            <ul class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item active">Client Profile</li>
            </ul>
        </div>
    </div>
@endsection

@section('content')
        <div class="card mb-0">
            <div class="card-body" >
                <div class="row">
                    <div class="col-md-12">
                        <div class="profile-view">
                            <!--<div class="profile-img-wrap">-->
                            <!--    <div class="profile-img">-->
                            <!--        <a href>-->
                                        <!--<img alt="" src="@if(!empty($client->avatar)) {{asset('storage/clients/'.$client->avatar)}} @else assets/img/profiles/default.jpg @endif">-->
                            <!--        </a>-->
                            <!--    </div>-->
                            <!--</div>-->
                            <div class="profile-basic">
                                <div class="row">
                                    <div class="col-md-5 d-flex align-items-center">
                                        <div class="profile-img-wrap" style="margin-right: 20px;">
                                            <div class="profile-img">
                                                <a href="#">
                                                    <img alt="" src="@if(!empty($client->avatar)) {{asset('storage/clients/'.$client->avatar)}} @else assets/img/profiles/default.jpg @endif">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="profile-info d-flex flex-column" style="margin-left:130px">
                                            <h3 class="user-name m-0">{{$client->firstname}} {{$client->lastname}}</h3>
                                            <h5 class="company-role m-0">{{$client->company}}</h5>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <ul class="personal-info">
                                            <li>
                                                <span class="title">Company Name:</span>
                                                <span class="text">{{$client->company}}</span>
                                            </li>
                                            <li>
                                                <span class="title">Project Title:</span>
                                                <span class="text">{{$client->project_title}}</span>
                                            </li>
                                            <li>
                                                <span class="title">Project Type:</span>
                                                <span class="text">{{$client->project_type}}</span>
                                            </li>
                                            <li>
                                                <span class="title">Phone:</span>
                                                <span class="text">{{$client->phone}}</span>
                                            </li>
                                            <li>
                                                <span class="title">Email:</span>
                                                <span class="text">{{$client->email}}</span>
                                            </li>
                                            <li>
                                                <span class="title">Project Status:</span>
                                                <span class="text">{{$client->status}}</span>
                                            </li>
                                            <li>
                                                <span class="title">Location:</span>
                                                <span class="text">{{$client->location}}</span>
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
        <!--<div class="row">-->
        <!--    <div class="col-lg-12">-->
        <!--        <div class="tab-content profile-tab-content">-->
        <!--            <div id="myprojects" class="tab-pane fade show active">-->
        <!--                <div class="row">-->
        <!--                    <div class="col-lg-4 col-sm-6 col-md-4 col-xl-3">-->
        <!--                        <div class="card">-->
        <!--                            <div class="card-body">-->
        <!--                                <div class="dropdown profile-action">-->
        <!--                                    <a href="#" class="action-icon dropdown-toggle" data-bs-toggle="dropdown"-->
        <!--                                        aria-expanded="false"><i class="material-icons">more_vert</i></a>-->
        <!--                                    <div class="dropdown-menu dropdown-menu-right">-->
        <!--                                        <a class="dropdown-item" href="#" data-bs-toggle="modal"-->
        <!--                                            data-bs-target="#edit_project"><i class="fa fa-pencil m-r-5"></i>-->
        <!--                                            Edit</a>-->
        <!--                                        <a class="dropdown-item" href="#" data-bs-toggle="modal"-->
        <!--                                            data-bs-target="#delete_project"><i class="fa fa-trash-o m-r-5"></i>-->
        <!--                                            Delete</a>-->
        <!--                                    </div>-->
        <!--                                </div>-->
        <!--                                <h4 class="project-title">-->
        <!--                                    <a href="https://smarthr.dreamguystech.com/php/template/project-view.php">Office-->
        <!--                                        Management</a>-->
        <!--                                </h4>-->
        <!--                                <small class="block text-ellipsis m-b-15">-->
        <!--                                    <span class="text-xs">1</span>-->
        <!--                                    <span class="text-muted">open tasks, </span>-->
        <!--                                    <span class="text-xs">9</span>-->
        <!--                                    <span class="text-muted">tasks completed</span>-->
        <!--                                </small>-->
        <!--                                <p class="text-muted">-->
        <!--                                    Lorem Ipsum is simply dummy text of the printing and-->
        <!--                                    typesetting industry. When an unknown printer took a-->
        <!--                                    galley of type and scrambled it...-->
        <!--                                </p>-->
        <!--                                <div class="pro-deadline m-b-15">-->
        <!--                                    <div class="sub-title">Deadline:</div>-->
        <!--                                    <div class="text-muted">17 Apr 2019</div>-->
        <!--                                </div>-->
        <!--                                <div class="project-members m-b-15">-->
        <!--                                    <div>Project Leader :</div>-->
        <!--                                    <ul class="team-members">-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="Jeffery Lalor"><img-->
        <!--                                                    alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-16.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                    </ul>-->
        <!--                                </div>-->
        <!--                                <div class="project-members m-b-15">-->
        <!--                                    <div>Team :</div>-->
        <!--                                    <ul class="team-members">-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="John Doe"><img alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-02.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="Richard Miles"><img-->
        <!--                                                    alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-09.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="John Smith"><img-->
        <!--                                                    alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-10.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="Mike Litorus"><img-->
        <!--                                                    alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-05.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                        <li class="dropdown avatar-dropdown">-->
        <!--                                            <a href="#" class="all-users dropdown-toggle"-->
        <!--                                                data-bs-toggle="dropdown" aria-expanded="false">+15</a>-->
        <!--                                            <div class="dropdown-menu dropdown-menu-right">-->
        <!--                                                <div class="avatar-group">-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-02.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-09.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-10.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-05.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-11.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-12.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-13.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-01.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-16.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                </div>-->
        <!--                                                <div class="avatar-pagination">-->
        <!--                                                    <ul class="pagination">-->
        <!--                                                        <li class="page-item">-->
        <!--                                                            <a class="page-link" href="#"-->
        <!--                                                                aria-label="Previous">-->
        <!--                                                                <span aria-hidden="true">«</span>-->
        <!--                                                                <span class="visually-hidden">Previous</span>-->
        <!--                                                            </a>-->
        <!--                                                        </li>-->
        <!--                                                        <li class="page-item">-->
        <!--                                                            <a class="page-link" href="#">1</a>-->
        <!--                                                        </li>-->
        <!--                                                        <li class="page-item">-->
        <!--                                                            <a class="page-link" href="#">2</a>-->
        <!--                                                        </li>-->
        <!--                                                        <li class="page-item">-->
        <!--                                                            <a class="page-link" href="#"-->
        <!--                                                                aria-label="Next">-->
        <!--                                                                <span aria-hidden="true">»</span>-->
        <!--                                                                <span class="visually-hidden">Next</span>-->
        <!--                                                            </a>-->
        <!--                                                        </li>-->
        <!--                                                    </ul>-->
        <!--                                                </div>-->
        <!--                                            </div>-->
        <!--                                        </li>-->
        <!--                                    </ul>-->
        <!--                                </div>-->
        <!--                                <p class="m-b-5">-->
        <!--                                    Progress-->
        <!--                                    <span class="text-success float-end">40%</span>-->
        <!--                                </p>-->
        <!--                                <div class="progress progress-xs mb-0">-->
        <!--                                    <div class="progress-bar bg-success" role="progressbar"-->
        <!--                                        data-bs-toggle="tooltip" title="40%" style="width: 40%"></div>-->
        <!--                                </div>-->
        <!--                            </div>-->
        <!--                        </div>-->
        <!--                    </div>-->
        <!--                    <div class="col-lg-4 col-sm-6 col-md-4 col-xl-3">-->
        <!--                        <div class="card">-->
        <!--                            <div class="card-body">-->
        <!--                                <div class="dropdown profile-action">-->
        <!--                                    <a href="#" class="action-icon dropdown-toggle"-->
        <!--                                        data-bs-toggle="dropdown" aria-expanded="false"><i-->
        <!--                                            class="material-icons">more_vert</i></a>-->
        <!--                                    <div class="dropdown-menu dropdown-menu-right">-->
        <!--                                        <a class="dropdown-item" href="#" data-bs-toggle="modal"-->
        <!--                                            data-bs-target="#edit_project"><i class="fa fa-pencil m-r-5"></i>-->
        <!--                                            Edit</a>-->
        <!--                                        <a class="dropdown-item" href="#" data-bs-toggle="modal"-->
        <!--                                            data-bs-target="#delete_project"><i class="fa fa-trash-o m-r-5"></i>-->
        <!--                                            Delete</a>-->
        <!--                                    </div>-->
        <!--                                </div>-->
        <!--                                <h4 class="project-title">-->
        <!--                                    <a href="https://smarthr.dreamguystech.com/php/template/project-view.php">Project-->
        <!--                                        Management</a>-->
        <!--                                </h4>-->
        <!--                                <small class="block text-ellipsis m-b-15">-->
        <!--                                    <span class="text-xs">2</span>-->
        <!--                                    <span class="text-muted">open tasks, </span>-->
        <!--                                    <span class="text-xs">5</span>-->
        <!--                                    <span class="text-muted">tasks completed</span>-->
        <!--                                </small>-->
        <!--                                <p class="text-muted">-->
        <!--                                    Lorem Ipsum is simply dummy text of the printing and-->
        <!--                                    typesetting industry. When an unknown printer took a-->
        <!--                                    galley of type and scrambled it...-->
        <!--                                </p>-->
        <!--                                <div class="pro-deadline m-b-15">-->
        <!--                                    <div class="sub-title">Deadline:</div>-->
        <!--                                    <div class="text-muted">17 Apr 2019</div>-->
        <!--                                </div>-->
        <!--                                <div class="project-members m-b-15">-->
        <!--                                    <div>Project Leader :</div>-->
        <!--                                    <ul class="team-members">-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="Jeffery Lalor"><img-->
        <!--                                                    alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-16.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                    </ul>-->
        <!--                                </div>-->
        <!--                                <div class="project-members m-b-15">-->
        <!--                                    <div>Team :</div>-->
        <!--                                    <ul class="team-members">-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="John Doe"><img alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-02.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="Richard Miles"><img-->
        <!--                                                    alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-09.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="John Smith"><img-->
        <!--                                                    alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-10.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="Mike Litorus"><img-->
        <!--                                                    alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-05.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                        <li class="dropdown avatar-dropdown">-->
        <!--                                            <a href="#" class="all-users dropdown-toggle"-->
        <!--                                                data-bs-toggle="dropdown" aria-expanded="false">+15</a>-->
        <!--                                            <div class="dropdown-menu dropdown-menu-right">-->
        <!--                                                <div class="avatar-group">-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-02.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-09.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-10.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-05.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-11.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-12.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-13.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-01.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-16.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                </div>-->
        <!--                                                <div class="avatar-pagination">-->
        <!--                                                    <ul class="pagination">-->
        <!--                                                        <li class="page-item">-->
        <!--                                                            <a class="page-link" href="#"-->
        <!--                                                                aria-label="Previous">-->
        <!--                                                                <span aria-hidden="true">«</span>-->
        <!--                                                                <span class="visually-hidden">Previous</span>-->
        <!--                                                            </a>-->
        <!--                                                        </li>-->
        <!--                                                        <li class="page-item">-->
        <!--                                                            <a class="page-link" href="#">1</a>-->
        <!--                                                        </li>-->
        <!--                                                        <li class="page-item">-->
        <!--                                                            <a class="page-link" href="#">2</a>-->
        <!--                                                        </li>-->
        <!--                                                        <li class="page-item">-->
        <!--                                                            <a class="page-link" href="#"-->
        <!--                                                                aria-label="Next">-->
        <!--                                                                <span aria-hidden="true">»</span>-->
        <!--                                                                <span class="visually-hidden">Next</span>-->
        <!--                                                            </a>-->
        <!--                                                        </li>-->
        <!--                                                    </ul>-->
        <!--                                                </div>-->
        <!--                                            </div>-->
        <!--                                        </li>-->
        <!--                                    </ul>-->
        <!--                                </div>-->
        <!--                                <p class="m-b-5">-->
        <!--                                    Progress-->
        <!--                                    <span class="text-success float-end">40%</span>-->
        <!--                                </p>-->
        <!--                                <div class="progress progress-xs mb-0">-->
        <!--                                    <div class="progress-bar bg-success" role="progressbar"-->
        <!--                                        data-bs-toggle="tooltip" title="40%" style="width: 40%"></div>-->
        <!--                                </div>-->
        <!--                            </div>-->
        <!--                        </div>-->
        <!--                    </div>-->
        <!--                    <div class="col-lg-4 col-sm-6 col-md-4 col-xl-3">-->
        <!--                        <div class="card">-->
        <!--                            <div class="card-body">-->
        <!--                                <div class="dropdown profile-action">-->
        <!--                                    <a href="#" class="action-icon dropdown-toggle"-->
        <!--                                        data-bs-toggle="dropdown" aria-expanded="false"><i-->
        <!--                                            class="material-icons">more_vert</i></a>-->
        <!--                                    <div class="dropdown-menu dropdown-menu-right">-->
        <!--                                        <a class="dropdown-item" href="#" data-bs-toggle="modal"-->
        <!--                                            data-bs-target="#edit_project"><i class="fa fa-pencil m-r-5"></i>-->
        <!--                                            Edit</a>-->
        <!--                                        <a class="dropdown-item" href="#" data-bs-toggle="modal"-->
        <!--                                            data-bs-target="#delete_project"><i class="fa fa-trash-o m-r-5"></i>-->
        <!--                                            Delete</a>-->
        <!--                                    </div>-->
        <!--                                </div>-->
        <!--                                <h4 class="project-title">-->
        <!--                                    <a href="https://smarthr.dreamguystech.com/php/template/project-view.php">Video-->
        <!--                                        Calling App</a>-->
        <!--                                </h4>-->
        <!--                                <small class="block text-ellipsis m-b-15">-->
        <!--                                    <span class="text-xs">3</span>-->
        <!--                                    <span class="text-muted">open tasks, </span>-->
        <!--                                    <span class="text-xs">3</span>-->
        <!--                                    <span class="text-muted">tasks completed</span>-->
        <!--                                </small>-->
        <!--                                <p class="text-muted">-->
        <!--                                    Lorem Ipsum is simply dummy text of the printing and-->
        <!--                                    typesetting industry. When an unknown printer took a-->
        <!--                                    galley of type and scrambled it...-->
        <!--                                </p>-->
        <!--                                <div class="pro-deadline m-b-15">-->
        <!--                                    <div class="sub-title">Deadline:</div>-->
        <!--                                    <div class="text-muted">17 Apr 2019</div>-->
        <!--                                </div>-->
        <!--                                <div class="project-members m-b-15">-->
        <!--                                    <div>Project Leader :</div>-->
        <!--                                    <ul class="team-members">-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="Jeffery Lalor"><img-->
        <!--                                                    alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-16.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                    </ul>-->
        <!--                                </div>-->
        <!--                                <div class="project-members m-b-15">-->
        <!--                                    <div>Team :</div>-->
        <!--                                    <ul class="team-members">-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="John Doe"><img alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-02.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="Richard Miles"><img-->
        <!--                                                    alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-09.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="John Smith"><img-->
        <!--                                                    alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-10.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="Mike Litorus"><img-->
        <!--                                                    alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-05.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                        <li class="dropdown avatar-dropdown">-->
        <!--                                            <a href="#" class="all-users dropdown-toggle"-->
        <!--                                                data-bs-toggle="dropdown" aria-expanded="false">+15</a>-->
        <!--                                            <div class="dropdown-menu dropdown-menu-right">-->
        <!--                                                <div class="avatar-group">-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-02.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-09.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-10.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-05.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-11.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-12.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-13.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-01.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-16.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                </div>-->
        <!--                                                <div class="avatar-pagination">-->
        <!--                                                    <ul class="pagination">-->
        <!--                                                        <li class="page-item">-->
        <!--                                                            <a class="page-link" href="#"-->
        <!--                                                                aria-label="Previous">-->
        <!--                                                                <span aria-hidden="true">«</span>-->
        <!--                                                                <span class="visually-hidden">Previous</span>-->
        <!--                                                            </a>-->
        <!--                                                        </li>-->
        <!--                                                        <li class="page-item">-->
        <!--                                                            <a class="page-link" href="#">1</a>-->
        <!--                                                        </li>-->
        <!--                                                        <li class="page-item">-->
        <!--                                                            <a class="page-link" href="#">2</a>-->
        <!--                                                        </li>-->
        <!--                                                        <li class="page-item">-->
        <!--                                                            <a class="page-link" href="#"-->
        <!--                                                                aria-label="Next">-->
        <!--                                                                <span aria-hidden="true">»</span>-->
        <!--                                                                <span class="visually-hidden">Next</span>-->
        <!--                                                            </a>-->
        <!--                                                        </li>-->
        <!--                                                    </ul>-->
        <!--                                                </div>-->
        <!--                                            </div>-->
        <!--                                        </li>-->
        <!--                                    </ul>-->
        <!--                                </div>-->
        <!--                                <p class="m-b-5">-->
        <!--                                    Progress-->
        <!--                                    <span class="text-success float-end">40%</span>-->
        <!--                                </p>-->
        <!--                                <div class="progress progress-xs mb-0">-->
        <!--                                    <div class="progress-bar bg-success" role="progressbar"-->
        <!--                                        data-bs-toggle="tooltip" title="40%" style="width: 40%"></div>-->
        <!--                                </div>-->
        <!--                            </div>-->
        <!--                        </div>-->
        <!--                    </div>-->
        <!--                    <div class="col-lg-4 col-sm-6 col-md-4 col-xl-3">-->
        <!--                        <div class="card">-->
        <!--                            <div class="card-body">-->
        <!--                                <div class="dropdown profile-action">-->
        <!--                                    <a href="#" class="action-icon dropdown-toggle"-->
        <!--                                        data-bs-toggle="dropdown" aria-expanded="false"><i-->
        <!--                                            class="material-icons">more_vert</i></a>-->
        <!--                                    <div class="dropdown-menu dropdown-menu-right">-->
        <!--                                        <a class="dropdown-item" href="#" data-bs-toggle="modal"-->
        <!--                                            data-bs-target="#edit_project"><i class="fa fa-pencil m-r-5"></i>-->
        <!--                                            Edit</a>-->
        <!--                                        <a class="dropdown-item" href="#" data-bs-toggle="modal"-->
        <!--                                            data-bs-target="#delete_project"><i class="fa fa-trash-o m-r-5"></i>-->
        <!--                                            Delete</a>-->
        <!--                                    </div>-->
        <!--                                </div>-->
        <!--                                <h4 class="project-title">-->
        <!--                                    <a href="https://smarthr.dreamguystech.com/php/template/project-view.php">Hospital-->
        <!--                                        Administration</a>-->
        <!--                                </h4>-->
        <!--                                <small class="block text-ellipsis m-b-15">-->
        <!--                                    <span class="text-xs">12</span>-->
        <!--                                    <span class="text-muted">open tasks, </span>-->
        <!--                                    <span class="text-xs">4</span>-->
        <!--                                    <span class="text-muted">tasks completed</span>-->
        <!--                                </small>-->
        <!--                                <p class="text-muted">-->
        <!--                                    Lorem Ipsum is simply dummy text of the printing and-->
        <!--                                    typesetting industry. When an unknown printer took a-->
        <!--                                    galley of type and scrambled it...-->
        <!--                                </p>-->
        <!--                                <div class="pro-deadline m-b-15">-->
        <!--                                    <div class="sub-title">Deadline:</div>-->
        <!--                                    <div class="text-muted">17 Apr 2019</div>-->
        <!--                                </div>-->
        <!--                                <div class="project-members m-b-15">-->
        <!--                                    <div>Project Leader :</div>-->
        <!--                                    <ul class="team-members">-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="Jeffery Lalor"><img-->
        <!--                                                    alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-16.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                    </ul>-->
        <!--                                </div>-->
        <!--                                <div class="project-members m-b-15">-->
        <!--                                    <div>Team :</div>-->
        <!--                                    <ul class="team-members">-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="John Doe"><img alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-02.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="Richard Miles"><img-->
        <!--                                                    alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-09.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="John Smith"><img-->
        <!--                                                    alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-10.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                        <li>-->
        <!--                                            <a href="#" data-bs-toggle="tooltip" title="Mike Litorus"><img-->
        <!--                                                    alt-->
        <!--                                                    src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-05.jpg" /></a>-->
        <!--                                        </li>-->
        <!--                                        <li class="dropdown avatar-dropdown">-->
        <!--                                            <a href="#" class="all-users dropdown-toggle"-->
        <!--                                                data-bs-toggle="dropdown" aria-expanded="false">+15</a>-->
        <!--                                            <div class="dropdown-menu dropdown-menu-right">-->
        <!--                                                <div class="avatar-group">-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-02.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-09.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-10.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-05.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-11.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-12.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-13.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-01.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                    <a class="avatar avatar-xs" href="#">-->
        <!--                                                        <img alt-->
        <!--                                                            src="https://smarthr.dreamguystech.com/php/template/assets/img/profiles/avatar-16.jpg" />-->
        <!--                                                    </a>-->
        <!--                                                </div>-->
        <!--                                                <div class="avatar-pagination">-->
        <!--                                                    <ul class="pagination">-->
        <!--                                                        <li class="page-item">-->
        <!--                                                            <a class="page-link" href="#"-->
        <!--                                                                aria-label="Previous">-->
        <!--                                                                <span aria-hidden="true">«</span>-->
        <!--                                                                <span class="visually-hidden">Previous</span>-->
        <!--                                                            </a>-->
        <!--                                                        </li>-->
        <!--                                                        <li class="page-item">-->
        <!--                                                            <a class="page-link" href="#">1</a>-->
        <!--                                                        </li>-->
        <!--                                                        <li class="page-item">-->
        <!--                                                            <a class="page-link" href="#">2</a>-->
        <!--                                                        </li>-->
        <!--                                                        <li class="page-item">-->
        <!--                                                            <a class="page-link" href="#"-->
        <!--                                                                aria-label="Next">-->
        <!--                                                                <span aria-hidden="true">»</span>-->
        <!--                                                                <span class="visually-hidden">Next</span>-->
        <!--                                                            </a>-->
        <!--                                                        </li>-->
        <!--                                                    </ul>-->
        <!--                                                </div>-->
        <!--                                            </div>-->
        <!--                                        </li>-->
        <!--                                    </ul>-->
        <!--                                </div>-->
        <!--                                <p class="m-b-5">-->
        <!--                                    Progress-->
        <!--                                    <span class="text-success float-end">40%</span>-->
        <!--                                </p>-->
        <!--                                <div class="progress progress-xs mb-0">-->
        <!--                                    <div class="progress-bar bg-success" role="progressbar"-->
        <!--                                        data-bs-toggle="tooltip" title="40%" style="width: 40%"></div>-->
        <!--                                </div>-->
        <!--                            </div>-->
        <!--                        </div>-->
        <!--                    </div>-->
        <!--                </div>-->
        <!--            </div>-->

        <!--            <div id="tasks" class="tab-pane fade">-->
        <!--                <div class="project-task">-->
        <!--                    <ul class="nav nav-tabs nav-tabs-top nav-justified mb-0">-->
        <!--                        <li class="nav-item">-->
        <!--                            <a class="nav-link active" href="#all_tasks" data-bs-toggle="tab"-->
        <!--                                aria-expanded="true">All Tasks</a>-->
        <!--                        </li>-->
        <!--                        <li class="nav-item">-->
        <!--                            <a class="nav-link" href="#pending_tasks" data-bs-toggle="tab"-->
        <!--                                aria-expanded="false">Pending Tasks</a>-->
        <!--                        </li>-->
        <!--                        <li class="nav-item">-->
        <!--                            <a class="nav-link" href="#completed_tasks" data-bs-toggle="tab"-->
        <!--                                aria-expanded="false">Completed Tasks</a>-->
        <!--                        </li>-->
        <!--                    </ul>-->
        <!--                    <div class="tab-content">-->
        <!--                        <div class="tab-pane show active" id="all_tasks">-->
        <!--                            <div class="task-wrapper">-->
        <!--                                <div class="task-list-container">-->
        <!--                                    <div class="task-list-body">-->
        <!--                                        <ul id="task-list">-->
        <!--                                            <li class="task">-->
        <!--                                                <div class="task-container">-->
        <!--                                                    <span class="task-action-btn task-check">-->
        <!--                                                        <span class="action-circle large complete-btn"-->
        <!--                                                            title="Mark Complete">-->
        <!--                                                            <i class="material-icons">check</i>-->
        <!--                                                        </span>-->
        <!--                                                    </span>-->
        <!--                                                    <span class="task-label" contenteditable="true">Patient-->
        <!--                                                        appointment booking</span>-->
        <!--                                                    <span class="task-action-btn task-btn-right">-->
        <!--                                                        <span class="action-circle large" title="Assign">-->
        <!--                                                            <i class="material-icons">person_add</i>-->
        <!--                                                        </span>-->
        <!--                                                        <span class="action-circle large delete-btn"-->
        <!--                                                            title="Delete Task">-->
        <!--                                                            <i class="material-icons">delete</i>-->
        <!--                                                        </span>-->
        <!--                                                    </span>-->
        <!--                                                </div>-->
        <!--                                            </li>-->
        <!--                                            <li class="task">-->
        <!--                                                <div class="task-container">-->
        <!--                                                    <span class="task-action-btn task-check">-->
        <!--                                                        <span class="action-circle large complete-btn"-->
        <!--                                                            title="Mark Complete">-->
        <!--                                                            <i class="material-icons">check</i>-->
        <!--                                                        </span>-->
        <!--                                                    </span>-->
        <!--                                                    <span class="task-label" contenteditable="true">Appointment-->
        <!--                                                        booking with payment-->
        <!--                                                        gateway</span>-->
        <!--                                                    <span class="task-action-btn task-btn-right">-->
        <!--                                                        <span class="action-circle large" title="Assign">-->
        <!--                                                            <i class="material-icons">person_add</i>-->
        <!--                                                        </span>-->
        <!--                                                        <span class="action-circle large delete-btn"-->
        <!--                                                            title="Delete Task">-->
        <!--                                                            <i class="material-icons">delete</i>-->
        <!--                                                        </span>-->
        <!--                                                    </span>-->
        <!--                                                </div>-->
        <!--                                            </li>-->
        <!--                                            <li class="completed task">-->
        <!--                                                <div class="task-container">-->
        <!--                                                    <span class="task-action-btn task-check">-->
        <!--                                                        <span class="action-circle large complete-btn"-->
        <!--                                                            title="Mark Complete">-->
        <!--                                                            <i class="material-icons">check</i>-->
        <!--                                                        </span>-->
        <!--                                                    </span>-->
        <!--                                                    <span class="task-label">Doctor available module</span>-->
        <!--                                                    <span class="task-action-btn task-btn-right">-->
        <!--                                                        <span class="action-circle large" title="Assign">-->
        <!--                                                            <i class="material-icons">person_add</i>-->
        <!--                                                        </span>-->
        <!--                                                        <span class="action-circle large delete-btn"-->
        <!--                                                            title="Delete Task">-->
        <!--                                                            <i class="material-icons">delete</i>-->
        <!--                                                        </span>-->
        <!--                                                    </span>-->
        <!--                                                </div>-->
        <!--                                            </li>-->
        <!--                                            <li class="task">-->
        <!--                                                <div class="task-container">-->
        <!--                                                    <span class="task-action-btn task-check">-->
        <!--                                                        <span class="action-circle large complete-btn"-->
        <!--                                                            title="Mark Complete">-->
        <!--                                                            <i class="material-icons">check</i>-->
        <!--                                                        </span>-->
        <!--                                                    </span>-->
        <!--                                                    <span class="task-label" contenteditable="true">Patient and-->
        <!--                                                        Doctor video-->
        <!--                                                        conferencing</span>-->
        <!--                                                    <span class="task-action-btn task-btn-right">-->
        <!--                                                        <span class="action-circle large" title="Assign">-->
        <!--                                                            <i class="material-icons">person_add</i>-->
        <!--                                                        </span>-->
        <!--                                                        <span class="action-circle large delete-btn"-->
        <!--                                                            title="Delete Task">-->
        <!--                                                            <i class="material-icons">delete</i>-->
        <!--                                                        </span>-->
        <!--                                                    </span>-->
        <!--                                                </div>-->
        <!--                                            </li>-->
        <!--                                            <li class="task">-->
        <!--                                                <div class="task-container">-->
        <!--                                                    <span class="task-action-btn task-check">-->
        <!--                                                        <span class="action-circle large complete-btn"-->
        <!--                                                            title="Mark Complete">-->
        <!--                                                            <i class="material-icons">check</i>-->
        <!--                                                        </span>-->
        <!--                                                    </span>-->
        <!--                                                    <span class="task-label" contenteditable="true">Private chat-->
        <!--                                                        module</span>-->
        <!--                                                    <span class="task-action-btn task-btn-right">-->
        <!--                                                        <span class="action-circle large" title="Assign">-->
        <!--                                                            <i class="material-icons">person_add</i>-->
        <!--                                                        </span>-->
        <!--                                                        <span class="action-circle large delete-btn"-->
        <!--                                                            title="Delete Task">-->
        <!--                                                            <i class="material-icons">delete</i>-->
        <!--                                                        </span>-->
        <!--                                                    </span>-->
        <!--                                                </div>-->
        <!--                                            </li>-->
        <!--                                            <li class="task">-->
        <!--                                                <div class="task-container">-->
        <!--                                                    <span class="task-action-btn task-check">-->
        <!--                                                        <span class="action-circle large complete-btn"-->
        <!--                                                            title="Mark Complete">-->
        <!--                                                            <i class="material-icons">check</i>-->
        <!--                                                        </span>-->
        <!--                                                    </span>-->
        <!--                                                    <span class="task-label" contenteditable="true">Patient-->
        <!--                                                        Profile add</span>-->
        <!--                                                    <span class="task-action-btn task-btn-right">-->
        <!--                                                        <span class="action-circle large" title="Assign">-->
        <!--                                                            <i class="material-icons">person_add</i>-->
        <!--                                                        </span>-->
        <!--                                                        <span class="action-circle large delete-btn"-->
        <!--                                                            title="Delete Task">-->
        <!--                                                            <i class="material-icons">delete</i>-->
        <!--                                                        </span>-->
        <!--                                                    </span>-->
        <!--                                                </div>-->
        <!--                                            </li>-->
        <!--                                        </ul>-->
        <!--                                    </div>-->
        <!--                                    <div class="task-list-footer">-->
        <!--                                        <div class="new-task-wrapper">-->
        <!--                                            <textarea id="new-task" placeholder="Enter new task here. . ."></textarea>-->
        <!--                                            <span class="error-message hidden">You need to enter a task-->
        <!--                                                first</span>-->
        <!--                                            <span class="add-new-task-btn btn" id="add-task">Add Task</span>-->
        <!--                                            <span class="btn" id="close-task-panel">Close</span>-->
        <!--                                        </div>-->
        <!--                                    </div>-->
        <!--                                </div>-->
        <!--                            </div>-->
        <!--                        </div>-->
        <!--                        <div class="tab-pane" id="pending_tasks"></div>-->
        <!--                        <div class="tab-pane" id="completed_tasks"></div>-->
        <!--                    </div>-->
        <!--                </div>-->
        <!--            </div>-->
        <!--        </div>-->
        <!--    </div>-->
        <!--</div>-->
@endsection

@section('scripts')
    <!-- Select2 JS -->
    <script src="{{ asset('assets/plugins/select2/select2.min.js') }}"></script>
    <!-- Datatable JS -->
    <script src="{{ asset('assets/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"
        integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js">
    </script>
@endsection
