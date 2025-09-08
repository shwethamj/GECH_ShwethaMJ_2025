<!-- Sidebar -->
<div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="menu-title">
                    <span>Main</span>
                </li>
                <li class="{{ route_is('dashboard') ? 'active' : '' }}">
                    <a href="{{route('dashboard')}}"><i class="la la-dashboard"></i> <span> Dashboard</span></a>
                </li>
                <li class="submenu">
                    {{-- <a href="#"><i class="la la-cube"></i> <span> Apps</span> <span class="menu-arrow"></span></a> --}}
                    <ul style="display: none;">
                        
                        <li><a class="{{ route_is('contacts') ? 'active' : '' }}" href="{{route('contacts')}}">Contacts</a></li>
                    </ul>
                </li>
                <li class="menu-title">
                    <span>Employees</span>
                </li>
                <li class="submenu">
                    <a href="#" class="{{ route_is(['employees','employees-list']) ? 'active' : '' }} noti-dot"><i class="la la-user"></i> <span> Employees</span> <span class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        {{-- <li><a class="{{ route_is('employees') ? 'active' : '' }} admin" href="{{route('employees')}}">All Employees</a></li> --}}
                        {{-- <li><a class="{{ route_is('employee-infoProfileHR') ? 'active' : '' }} hr admin" href="{{ route('employee-infoProfileHR', ['user_id' => Auth::user()->id]) }}">Employee Info(HR)</a></li> --}}
                        {{-- <li><a class="{{ route_is('employee-infoEmp') ? 'active' : '' }}" href="{{route('employee-infoEmp')}}">Employee Info(Employee)</a></li> --}}
                        {{-- <li><a class="{{ route_is('employee-infoEmp') ? 'active' : '' }} employee admin" href="{{route('employee-infoEmp', ['user_id' => auth()->id()])}}">Employee Info(Employee)</a></li> --}}
                        {{-- <li><a class="{{ route_is('holidays') ? 'active' : '' }} admin" href="{{route('holidays')}}">Holidays</a></li> --}}
                        {{-- <li><a class="{{ route_is('employees.attendance') ? 'active' : '' }} admin" href="{{route('employees.attendance')}}">Attendance</a></li> --}}
                        {{-- <li><a class="{{ route_is('employee_attendance') ? 'active' : '' }} employee admin" href="{{ route('employee_attendance')}}">Attendance (Employee)</a></li> --}}
                        {{-- <li><a class="{{ route_is('hr_attendance') ? 'active' : '' }} hr admin" href="{{ route('hr_attendance')}}">Attendance (HR)</a></li> --}}
                        {{-- <li><a class="{{ route_is('employee-leave') ? 'active' : '' }} admin" href="{{route('employee-leave')}}">Leaves (HR)</a></li> --}}
                        {{-- <li><a class="{{ route_is('leave-request.store') ? 'active' : '' }} employee admin" href="{{route('leave-request.store')}}">Leaves (Employee)</a></li> --}}
                        {{-- <li><a class="{{ route_is('leave-request.indexHR') ? 'active' : '' }} hr admin" href="{{route('leave-request.indexHR')}}">Leave Requests (HR)</a></li> --}}
                        {{-- <li><a class="{{ route_is('overtime') ? 'active' : '' }} admin" href="{{route('overtime')}}">Overtime</a></li> --}}
                        @if(auth()->user()->role == 2 || auth()->user()->role == 1)
                            <li><a class="{{ route_is('employees') ? 'active' : '' }} admin" href="{{route('employees')}}">All Employees</a></li>
                        @endif
                        @if(auth()->user()->role == 1 || auth()->user()->role == 3)
                            <li><a class="{{ route_is('holidays') ? 'active' : '' }} admin" href="{{route('holidays')}}">Holidays</a></li>
                            <!--<li><a class="{{ route_is('employees.attendance') ? 'active' : '' }} admin" href="{{route('employees.attendance')}}">Attendance</a></li>-->
                            {{-- <li><a class="{{ route_is('employee-leave') ? 'active' : '' }} admin" href="{{route('employee-leave')}}">Leaves (HR)</a></li> --}}
                            <!--<li><a class="{{ route_is('overtime') ? 'active' : '' }} admin" href="{{route('overtime')}}">Overtime</a></li>-->
                        @endif
                        @if(auth()->user()->role == 2 || auth()->user()->role == 1)
                            <li><a class="{{ route_is('employee-infoProfileHR') ? 'active' : '' }} hr admin" href="{{ route('employee-infoProfileHR', ['user_id' => Auth::user()->id]) }}">Employee Info</a></li>
                            <li><a class="{{ route_is('hr_attendance') ? 'active' : '' }} hr admin" href="{{ route('hr_attendance')}}">Attendance Info</a></li>
                            <li><a class="{{ route_is('leave-request.indexHR') ? 'active' : '' }} hr admin" href="{{route('leave-request.indexHR')}}">Leave Requests</a></li>
                        @endif
                        @if(auth()->user()->role == 3 )
                            <li><a class="{{ route_is('employee-infoEmp') ? 'active' : '' }} employee admin" href="{{route('employee-infoEmp', ['user_id' => auth()->id()])}}">Employee Info</a></li>
                            <li><a class="{{ route_is('employee_attendance') ? 'active' : '' }} employee admin" href="{{ route('employee_attendance')}}">Attendance</a></li>
                            <li><a class="{{ route_is('leave-request.store') ? 'active' : '' }} employee admin" href="{{route('leave-request.store')}}">Leaves</a></li>
                        @endif
                    </ul>
                </li>
                @if(auth()->user()->role == 1)
                <li class="submenu">
                    <a href="#"><i class="la la-user-secret"></i> <span> Masters </span> <span class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        <li><a class="{{ route_is('departments') ? 'active' : '' }}" href="{{route('departments')}}">Departments</a></li>
                        <li><a class="{{ route_is('designations') ? 'active' : '' }}" href="{{route('designations')}}">Designations</a></li>
                        <li><a class="{{ route_is('leave-type') ? 'active' : '' }}" href="{{route('leave-type')}}">Leave Type</a></li>
                        <!--Roles menu has been hidden here, if any changes required tweek this-->
                        <!--<li><a class="{{ route_is('roles-master') ? 'active' : '' }}" href="{{route('roles-master')}}">Roles</a></li>-->
                    </ul>
                </li>
                @endif
                <li class="submenu">
                    <a href="#"><i class="la la-rocket"></i> <span> Projects </span> <span class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        <li>
                            <a class="{{ route_is(['projects','project-list']) ? 'active' : '' }}" href="{{route('projects')}}">Projects</a>
                        </li>
                        @if(auth()->user()->role == 2 || auth()->user()->role == 1)
                        <li class="{{route_is('leads') ? 'active' : '' }}"> 
                            <a href="{{route('leads')}}"> <span>Project Leads</span></a>
                        </li>
                        @endif
                        @if(auth()->user()->role == 2 || auth()->user()->role == 3)
                        <li class="{{route_is('tickets') ? 'active' : '' }}"> 
                            <a href="{{route('tickets')}}"> <span>Tickets</span></a>
                        </li>
                        @endif
                        <li>
                            {{-- <a href="{{route('tasks')}}">Tasks</a> --}}
                        </li>
                    </ul>
                </li>
                <!--@if(auth()->user()->role == 2 || auth()->user()->role == 1)-->
                <li class="menu-title"> 
                    <span>HR</span>
                </li>
                @if(auth()->user()->role == 2 || auth()->user()->role == 1)
                <!--<li class="{{ route_is('clients') ? 'active' : '' }}">-->
                <!--    <a href="{{route('clients')}}"><i class="la la-users"></i> <span>Clients</span></a>-->
                <!--</li>-->
                <li class="submenu">
                    <a href="#"><i class="la la-users"></i> <span> Clients </span> <span class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        <li>
                            <a class="{{ route_is('clients') ? 'active' : '' }}" href="{{route('clients')}}">Clients</a>
                        </li>
                        <li>
                            <a class="{{ route_is('clients-leads') ? 'active' : '' }}" href="{{route('clients-leads')}}">Client Meetings</a>
                        </li>
                    </ul>
                </li>
                @endif
                <!--<li class="submenu">-->
                <!--    <a href="#"><i class="la la-files-o"></i> <span> Accounts </span> <span class="menu-arrow"></span></a>-->
                <!--    <ul style="display: none;">-->
                <!--        <li><a class="{{ route_is('invoices.*') ? 'active' : '' }}" href="{{route('invoices.index')}}">Invoices</a></li>-->
                <!--        <li><a class="{{ route_is('expenses') ? 'active' : '' }}" href="{{route('expenses')}}">Expenses</a></li>-->
                <!--        <li><a class="{{ route_is('provident-fund') ? 'active' : '' }}" href="{{route('provident-fund')}}">Provident Fund</a></li>-->
                <!--        <li><a class="{{ route_is('taxes') ? 'active' : '' }}" href="{{route('taxes')}}">Taxes</a></li>-->
                <!--    </ul>-->
                <!--</li>-->
                <!--@endif-->
                <li class="{{ route_is('policies') ? 'active' : '' }}">
                    <a href="{{route('policies')}}"><i class="la la-file-pdf-o"></i> <span>Policies</span></a>
                </li>
                <!--@if(auth()->user()->role == 2 || auth()->user()->role == 1)-->
                <!--<li class="submenu">-->
                <!--    <a href="#"><i class="la la-briefcase"></i> <span> Jobs </span> <span class="menu-arrow"></span></a>-->
                <!--    <ul style="display: none;">-->
                <!--        <li><a class="{{ route_is('jobs') ? 'active' : '' }}" href="{{route('jobs')}}"> Manage Jobs </a></li>-->
                <!--        <li><a class="{{ route_is('job-applicants') ? 'active' : '' }}" href="{{route('job-applicants')}}"> Applied Candidates </a></li>-->
                <!--    </ul>-->
                <!--</li>-->
                <!--@endif-->
                <li class="submenu">
                    <a href="#"><i class="la la-crosshairs"></i> <span> Goals </span> <span class="menu-arrow"></span></a>
                    <ul style="display: none;">
                        <li><a class="{{ route_is('goal-tracking') ? 'active' : '' }}" href="{{route('goal-tracking')}}"> Goal List </a></li>
                        @if(auth()->user()->role == 2 || auth()->user()->role == 1)
                            <li><a class="{{ route_is('goal-type') ? 'active' : '' }}" href="{{route('goal-type')}}"> Goal Type </a></li>
                        @endif
                    </ul>
                </li>
                @if(auth()->user()->role == 2 || auth()->user()->role == 1)
                <li class="{{ route_is('assets') ? 'active' : '' }}"> 
                    <a href="{{route('assets')}}"><i class="la la-object-ungroup"></i> <span>Assets</span></a>
                </li>
                @endif
                <li>
                    {{-- <a class="{{ route_is('activity') ? 'active' : '' }}" href="{{route('activity')}}"><i class="la la-bell"></i> <span>Activities</span></a> --}}
                </li>
                @if(auth()->user()->role == 2 || auth()->user()->role == 1)
                <li class="{{ route_is('users') ? 'active' : '' }}">
                    <a href="{{route('users')}}"><i class="la la-user-plus"></i> <span>Users</span></a>
                </li>
                @endif
                <li>
                    <a class="{{ route_is('settings.theme') ? 'active' : '' }}" href="{{route('settings.theme')}}"><i class="la la-cog"></i> <span>Settings</span></a>
                </li>
                {{-- <li class="{{ Request::is('backups') ? 'active' : '' }}">
                    <a href="{{ route('backups') }}"
                        ><i class="la la-cloud-upload"></i> <span>Backups </span>
                    </a>
                </li> --}}
                
            </ul>
        </div>
    </div>
</div>
<!-- /Sidebar -->