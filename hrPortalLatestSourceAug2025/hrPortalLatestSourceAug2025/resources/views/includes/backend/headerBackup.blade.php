<!-- Header -->
<div class="header">
			
    <!-- Logo -->
    <div class="header-left">
        <a href="{{route('dashboard')}}" class="logo">
            <img src="{{!empty(app(App\Settings\ThemeSettings::class)->logo) ? asset('storage/settings/theme/'.app(App\Settings\ThemeSettings::class)->logo):asset('assets/img/logo.png')}}" alt="logo" width="100" height="50">
        </a>
    </div>
    <!-- /Logo -->
    
    <a id="toggle_btn" href="javascript:void(0);">
        <span class="bar-icon">
            <span></span>
            <span></span>
            <span></span>
        </span>
    </a>
    
    <!-- Header Title -->
    <div class="page-title-box">
        <h3>{{ucwords(app(App\Settings\CompanySettings::class)->company_name ?? 'Smart HR')}}</h3>
    </div>
    
    <!-- /Header Title -->
    
    <a id="mobile_btn" class="mobile_btn" href="#sidebar"><i class="fa fa-bars"></i></a>
    
    @php
        $user = Auth::user();
        $attendance = App\Models\Attendance::where('user_id', $user->id)
            ->whereDate('attendance_date', today())
            ->first();
    @endphp
    <!-- Header Menu -->
    <ul class="nav user-menu">
    @if(auth()->user()->role == 3 )
    <li class="nav-item" style="margin-top: 8px">
        <button type="button" class="btn btn-warning punch-btn" id="punch-btn" data-url="{{ route('attendance.punchClock') }}">
            @if (!$attendance || $attendance->checkout_time)
                Check-in
            @else
                Check-out
            @endif
        </button>
    </li>
    @endif
        <!-- Notifications -->
        <!-- Notifications -->
    <li class="nav-item dropdown">
        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
            <i class="fa fa-bell-o"></i> <span class="badge badge-pill">{{auth()->user()->notifications->count()}}</span>
        </a>
        <div class="dropdown-menu notifications">
            <div class="topnav-dropdown-header">
                <span class="notification-title">Notifications</span>
                <a href="{{route('clear-all')}}" class="clear-noti"> Clear All </a>
            </div>
            <div class="noti-content">
                <ul class="notification-list">
                    {{-- @foreach (auth()->user()->unreadNotifications as $notification)
                        <li class="notification-message">
                            <a href="{{route('activity')}}">
                                <div class="media">
                                    <span class="avatar">
                                        @if ($notification->data['employee_image']) 
                                            <img src="{{asset('storage/users/'.$notification->data['employee_image'])}}" alt="employee_image" width="50" height="50">
                                        @else
                                            <img src="{{asset('storage/users/default.png')}}" alt="employee_image" width="50" height="50">
                                        @endif
                                    </span>
                                    <div class="media-body">
                                        <p class="noti-details"><span class="noti-title">{{$notification->data['employee_name']}}</span><br> 
                                            <span class="noti-title">{{$notification->data['message']}}
                                                </span>
                                        <p class="noti-time"><span class="notification-time">{{$notification->created_at->diffForHumans()}}</span></p>
                                    </div>
                                </div>
                            </a>
                        </li> 
                    @endforeach  --}}
                </ul>
            </div>
            <div class="topnav-dropdown-footer">
                <a href="{{route('activity')}}">View all Notifications</a>
            </div>
        </div>
    </li>

        <!-- /Notifications -->
        
        

        <li class="nav-item dropdown has-arrow main-drop">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                <span class="user-img"><img src="{{!empty(auth()->user()->avatar) ? asset('storage/users/'.auth()->user()->avatar) : asset('assets/img/user.jpg')}}" alt="user">
                <span class="status online"></span></span>
                <span>{{auth()->user()->username}}</span>
            </a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="{{route('profile')}}">My Profile</a>
                <a class="dropdown-item" href="{{route('settings.theme')}}">Settings</a>
                <form action="{{route('logout')}}" method="post">
                    @csrf
                    <button type="submit" class="dropdown-item">Logout</button>
                </form>
            </div>
        </li>
    </ul>
    <!-- /Header Menu -->
    
    <!-- Mobile Menu -->
    <div class="dropdown mobile-user-menu">
        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
        <div class="dropdown-menu dropdown-menu-right">
            <a class="dropdown-item" href="{{route('profile')}}">My Profile</a>
            <a class="dropdown-item" href="{{route('settings.theme')}}">Settings</a>
            <form action="{{route('logout')}}" method="post">
                @csrf
                <button type="submit" class="dropdown-item">Logout</button>
            </form>
        </div>
    </div>
    <!-- /Mobile Menu -->
    
</div>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>

{{-- <script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script> --}}
<script>
    $(document).ready(function() {
        $('#punch-btn').click(function() {
            var url = '{{ route("attendance.punchClock") }}';
            var button = $(this);

            $.ajax({
                type: 'POST',
                url: url,
                data: {
                    _token: '{{ csrf_token() }}'
                },
                success: function(response) {
                    if (response.success) {
                        alert(response.message);
                        location.reload();

                        // Update punch-in and punch-out time
                        if (response.checkin_time) {
                            $('#checkin-time').text(response.checkin_time);
                        }
                        if (response.checkout_time) {
                            $('#checkout-time').text(response.checkout_time);
                        }

                        // Update button text based on response
                        if (response.checkin_time && response.checkout_time) {
                            button.text('Check-in');
                        } else if (response.checkin_time) {
                            button.text('Check-out');
                        } else {
                            button.text('Check-in');
                        }
                    } else {
                        alert(response.message);
                    }
                },
                error: function(xhr) {
                    console.log(xhr.responseText);
                }
            });
        });
    });
</script>
<!-- /Header -->