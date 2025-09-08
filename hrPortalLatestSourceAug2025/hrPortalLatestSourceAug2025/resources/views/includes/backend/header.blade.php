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
{{-- Old existing script --}}
{{-- <script>
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
</script> --}}
{{-- New script --}}
<script>
    $(document).ready(function() {
        var targetLatitude = 13.071609; 
        // var targetLatitude = 13.3381856; 
        var targetLongitude = 77.506332; 
        // var targetLongitude = 77.101359; 
        var checkinStartTime = "12:45"; 
        var checkinEndTime = "12:50";   

        $('#punch-btn').click(function() {
            var url = '{{ route("attendance.punchClock") }}';
            var button = $(this);

            // Check if geolocation is supported
            if (navigator.geolocation) {
                // Get user's current location
                navigator.geolocation.getCurrentPosition(function(position) {
                    var latitude = position.coords.latitude;
                    var longitude = position.coords.longitude;

                    var withinRange = calculateDistance(latitude, longitude, targetLatitude, targetLongitude) < 100; // 100 meters radius (adjust as needed)

                    var withinTimeRange = checkTimeRange();

                    if (withinRange && withinTimeRange) {
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

                                    if (response.checkin_time) {
                                        $('#checkin-time').text(response.checkin_time);
                                    }
                                    if (response.checkout_time) {
                                        $('#checkout-time').text(response.checkout_time);
                                    }

                                    if (response.checkout_time) {
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
                    } else {
                        if (!withinRange) {
                            alert("You are not within the allowed location range for check-in.");
                        }
                        if (!withinTimeRange) {
                            alert("It is not within the allowed time range for check-in.");
                        }
                    }
                }, function(error) {
                    console.log(error.message);
                    alert("Unable to determine your location. Please enable location services.");
                });
            } else {
                alert("Geolocation is not supported by your browser.");
            }
        });

        // Function to calculate distance between two points using Haversine formula
        function calculateDistance(lat1, lon1, lat2, lon2) {
            var R = 6371000; // Radius of the Earth in meters
            var dLat = deg2rad(lat2 - lat1);
            var dLon = deg2rad(lon2 - lon1);
            var a =
                Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
                Math.sin(dLon / 2) * Math.sin(dLon / 2);
            var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            var distance = R * c;
            return distance;
        }

        function deg2rad(deg) {
            return deg * (Math.PI / 180);
        }

        // Function to check if the current time is within the allowed range
        function checkTimeRange() {
            var currentTime = new Date();
            var currentHours = currentTime.getHours();
            var currentMinutes = currentTime.getMinutes();

            var checkinHours = parseInt(checkinStartTime.split(":")[0]);
            var checkinMinutes = parseInt(checkinStartTime.split(":")[1]);
            var checkoutHours = parseInt(checkinEndTime.split(":")[0]);
            var checkoutMinutes = parseInt(checkinEndTime.split(":")[1]);

            return (
                (currentHours > checkinHours) ||
                (currentHours == checkinHours && currentMinutes >= checkinMinutes) &&
                (currentHours < checkoutHours) ||
                (currentHours == checkoutHours && currentMinutes <= checkoutMinutes)
            );
        }
    });
</script>
<!-- /Header -->