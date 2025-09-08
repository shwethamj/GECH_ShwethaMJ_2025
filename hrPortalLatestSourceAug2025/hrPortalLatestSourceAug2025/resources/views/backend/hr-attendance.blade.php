@extends('layouts.backend')

@section('styles')
<!-- Select2 CSS -->
<link rel="stylesheet" href="{{asset('assets/plugins/select2/select2.min.css')}}">
<!-- Datatable CSS -->
<link rel="stylesheet" href="{{asset('assets/css/dataTables.bootstrap4.min.css')}}">
{{-- <style>
    .table {
      border-collapse: collapse;
      font-family: sans-serif;
      font-size: 14px;
      width: 100%;
    }
  
    .table th {
      background-color: #f2f2f2;
      border: 1px solid #ddd;
      font-weight: bold;
      padding: 8px;
      text-align: center;
    }
  
    .table td {
      background-color: #fff;
      border: 1px solid #ddd;
      height: 90px;
      padding: 0;
      text-align: center;
      line-height: 90px;
      transition: all 0.2s ease-in-out;
    }
  
    .table td.today {
      background-color: #ffd500;
    }
  
    .table td:not(:empty):hover {
      background-color: #f5f5f5;
      cursor: pointer;
    }
  
    .table td.blur:not(.clicked) {
      filter: blur(1px);
    }
  
    .table td.clicked {
      transform: scale(1.5);
      z-index: 1;
      filter: blur(0);
    }
  
    .table td.clicked::before {
      content: '';
      position: absolute;
      top: 0;
      right: 0;
      bottom: 0;
      left: 0;
      background-color: rgba(255, 255, 255, 0.8);
    }
  
    .table td:not(.today):not(.clicked):hover {
      filter: blur(0px);
      cursor: pointer;
    }
  
    .table td.today {
      filter: blur(0);
    }
</style> --}}
<style>
  div .row > .col-md-12{
    background-color: rgba(255, 213, 0, 0.5);
  }
  .table {
    border-collapse: collapse;
    font-family: sans-serif;
    font-size: 14px;
    width: 100%;
  }

  .table th {
    background-color: #f2f2f2;
    border: 1px solid #ddd;
    font-weight: bold;
    padding: 8px;
    text-align: center;
  }

  .table td {
    background-color: #fff;
    border: 1px solid #ddd;
    height: 90px;
    width: 50px;
    padding: 0;
    text-align: center;
    line-height: 90px;
    transition: all 0.2s ease-in-out;
  }

  .table td.today {
    background-color: #ffa600;
  }

  .table td:not(:empty):hover {
    background-color: #f5f5f5;
    cursor: pointer;
  }

  .table td.blur:not(.clicked) {
    filter: blur(1px);
  }
  .table td.clicked {
    /* background-color: #F08080; */
    /* background-color: rgba(255, 213, 0, 0.5); */
    z-index: 1;
    filter: blur(0);
    /* transform: scale(2); */
    transform: scale(1.4);
    transform-origin: center center;
    position: relative;
  }

  .table td.clicked::before {
    content: '';
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background-color: rgba(255, 213, 0, 0.5);
    z-index: -1;
    transform: scale(0.75);
    transform-origin: center center;
  }

  .table td:not(.today):not(.clicked):hover {
    filter: blur(0px);
    cursor: pointer;
  }

  .table td.today {
    filter: blur(0);
  }
</style>
@endsection

@section('page-header')
<div class="row align-items-center">
	<div class="col">
		<h3 class="page-title">Employee Attendance</h3>
		{{-- <ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="{{route('dashboard')}}">Dashboard</a></li>
			<li class="breadcrumb-item active">Attendance</li>
		</ul> --}}
	</div>
</div>
@endsection

@section('content')
<div class="row">
  <div class="col-md-12" style="padding-top:12px">
        <form method="get">
          @php
              $today = \Carbon\Carbon::today();
              $year = isset($_GET['year']) ? $_GET['year'] : $today->year;
              $month = isset($_GET['month']) ? $_GET['month'] : $today->month;
              $daysInMonth = \Carbon\Carbon::create($year, $month)->daysInMonth;
              $firstDayOfMonth = \Carbon\Carbon::create($year, $month, 1)->dayOfWeek;
          @endphp
          <div class="form-group row">
            <label for="year" class="col-sm-1 col-form-label">Username</label>
            <div class="col-sm-2">
                <select class="form-control" name="user" onchange="fetchCalendarData()">
                    <option value="null" selected>Select User</option>
                    @foreach ($users as $user)
                        <option value="{{ $user->id }}"> {{ $user->username }} </option>
                    @endforeach
                </select>
            </div>
            <label for="year" class="col-sm-1 col-form-label">Year</label>
            <div class="col-sm-2">
                <select class="form-control" id="year" name="year">
                    @for ($i = 2000; $i <= 2100; $i++)
                        <option value="{{ $i }}" {{ $i == $year ? 'selected' : '' }}>{{ $i }}</option>
                    @endfor
                </select>
            </div>
            <label for="month" class="col-sm-1 col-form-label">Month</label>
            <div class="col-sm-2">
                <select class="form-control" id="month" name="month">
                    @for ($i = 1; $i <= 12; $i++)
                        <option value="{{ $i }}" {{ $i == $month ? 'selected' : '' }}>{{ \Carbon\Carbon::create($year, $i)->format('F') }}</option>
                    @endfor
                </select>
            </div>
            <div class="col-sm-2">
              <button type="submit" class="btn btn-primary">Go</button>
            </div>
            <div class="col-sm-2">
              <button type="button" class="btn btn-success" onclick="exportToExcel()">Export to Excel</button>
            </div>
            <div class="col-sm-2">
              <button type="button" class="btn btn-success" onclick="exportAllAttendance()">Export all</button>
            </div>
          </div>
      </form>
    <table id="calendar-table" class="table">
      <thead>
          <tr class="text-center">
              <th>Sun</th>
              <th>Mon</th>
              <th>Tue</th>
              <th>Wed</th>
              <th>Thu</th>
              <th>Fri</th>
              <th>Sat</th>
          </tr>
      </thead>
      <tbody>
          @for ($row = 0; $row < ceil(($firstDayOfMonth + $daysInMonth) / 7); $row++)
              <tr class="text-center">
                  @for ($col = 0; $col < 7; $col++)
                      @php
                          $day = $row * 7 + $col - $firstDayOfMonth + 1;
                          if ($day > 0) {
                              $date = \Carbon\Carbon::create($year, $month, $day);
                              $data_date = $date->format('Y-m-d');
                          } else {
                              $data_date = '';
                          }
                      @endphp
                      <td
                          @if (isset($date) && $date->isToday()) class="today not-blur" @endif
                          data-date="{{ $data_date }}"
                          onclick="handleClick(this)"
                      >
                          {{ isset($day) && $day > 0 && $day <= $daysInMonth ? $day : '' }}
                      </td>
                  @endfor
              </tr>
          @endfor
      </tbody>
    </table>  
  </div>
</div>

@endsection


@section('scripts')

<script src="{{asset('assets/plugins/select2/select2.min.js')}}"></script>
<!-- Datatable JS -->
<script src="{{asset('assets/js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('assets/js/dataTables.bootstrap4.min.js')}}"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script>
function handleClick(td) {
  const isActive = td.classList.contains("clicked");
  const tds = document.querySelectorAll(".table td");
  for (let i = 0; i < tds.length; i++) {
    if (tds[i] !== td) {
      tds[i].classList.toggle("blur", !isActive);
    }
    tds[i].classList.remove("clicked");
  }
  if (!isActive) {
    td.classList.add("clicked");
    td.classList.remove("blur");
  }
}
</script>
<script>
  function fetchCalendarData() {
      var user_id = $('select[name="user"]').val();
      if (user_id !== 'null') {
          $.ajax({
              url: "{{ route('emp.calendar.data') }}",
              type: "GET",
              data: { user_id: user_id },
              success: function (response) {
                  // Call the function to populate the calendar with the data
                  populateCalendar(response.data);
              },
              error: function (response) {
                  console.log(response);
              }
          });
      }
  }

//   function populateCalendar(data) {
//   $('.event').remove(); // Remove all existing events

//   $('td[data-date]').each(function () {
//     var date = $(this).data('date');
//     if (data[date]) {
//       var content = '<div class="event">' +
//           '<div class="time">' + data[date].checkin_time + ' - ' + data[date].checkout_time + '</div>' +
//           '</div>';
//       $(this).append(content);
//     }
//   });
// }
function populateCalendar(data) {
  $('.event').remove(); // Remove all existing events

  $('td[data-date]').each(function () {
    var date = $(this).data('date');
    if (data[date]) {
      var checkin = data[date].checkin_time ? 'Checkin: ' + data[date].checkin_time : '';
      var checkout = data[date].checkout_time ? 'Checkout: ' + data[date].checkout_time : '';
      var content = '<div class="event">' +
          '<div class="time">' + checkin + (checkin && checkout ? '<br>' : '') + checkout + '</div>' +
          '</div>';
      $(this).append(content);
    }
  });
  
  // Style the event time text to fit within the cell and float above 20px
  $('.event .time').css({
    'font-size': '15px',
    'line-height': '1',
    'white-space': 'nowrap',
    'width': '0px',
    'padding-left': '15px',
    'height': '0px',
    'position': 'relative',
    'top': '-30px',
  });
}

function exportToExcel() {
    var user_id = $('select[name="user"]').val();
    var year = $('select[name="year"]').val();
    var month = $('select[name="month"]').val();

    if (user_id !== 'null' && year && month) {
        window.location.href = "{{ route('export.attendance') }}?user_id=" + user_id + "&year=" + year + "&month=" + month;
    }
}

function exportAllAttendance() {
    var year = $('#year').val();
    var month = $('#month').val();

    if (year && month) {
        window.location.href = "{{ route('export.all.attendance') }}?year=" + year + "&month=" + month;
    }
}

// function exportAllToExcel() {
//     var year = $('select[name="year"]').val();
//     var month = $('select[name="month"]').val();

//     if (year && month) {
//         // Make an AJAX request to the server to fetch the data
//         $.ajax({
//             url: "{{ route('export.all.attendance') }}",
//             type: "GET",
//             data: { year: year, month: month },
//             success: function (response) {
//                 // Log the fetched data in JSON format to the console
//                 console.log(JSON.stringify(response.data));
//             },
//             error: function (response) {
//                 console.error(response);
//             }
//         });
//     }
// }

</script>
@endsection