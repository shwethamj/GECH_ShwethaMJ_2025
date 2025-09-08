<!DOCTYPE html>
<html>
<head>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 8px;
            text-align: center;
        }

        th {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>Username</th>
                @foreach ($dates as $date)
                    <th colspan="2">{{ $date }}</th>
                @endforeach
            </tr>
            <tr>
                <th></th>
                @foreach ($dates as $date)
                    <th>Checkin</th>
                    <th>Checkout</th>
                @endforeach
            </tr>
        </thead>
        <tbody>
            @foreach ($attendanceData as $username => $userData)
                <tr>
                    <td>{{ $username }}</td>
                    @foreach ($dates as $date)
                        <td>{{ isset($userData[$date]['Checkin Time']) ? $userData[$date]['Checkin Time'] : '' }}</td>
                        <td>{{ isset($userData[$date]['Checkout Time']) ? $userData[$date]['Checkout Time'] : '' }}</td>
                    @endforeach
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
