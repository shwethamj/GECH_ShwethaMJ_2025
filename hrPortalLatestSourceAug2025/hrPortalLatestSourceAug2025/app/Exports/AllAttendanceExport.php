<?php

namespace App\Exports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class AllAttendanceExport implements FromCollection, WithMapping, WithHeadings, WithStyles
{
    use Exportable;

    protected $attendanceData;
    protected $dates;

    public function __construct($attendanceData, $dates)
    {
        $this->attendanceData = $attendanceData;
        $this->dates = $dates;
    }

    public function collection()
    {
        // Transform your data into the desired format
        $formattedData = [];

        foreach ($this->attendanceData as $username => $userData) {
            $row = [
                'Username' => $username,
            ];

            foreach ($this->dates as $date) {
                $row["{$date} Checkin"] = $userData[$date]['Checkin Time'] ?? '';
                $row["{$date} Checkout"] = $userData[$date]['Checkout Time'] ?? '';
            }

            $formattedData[] = $row;
        }

        return new Collection($formattedData);
    }

    public function map($row): array
    {
        return $row;
    }

    public function headings(): array
    {
        $headings = ['Username'];

        foreach ($this->dates as $date) {
            $headings[] = "{$date} Checkin";
            $headings[] = "{$date} Checkout";
        }

        return $headings;
    }
    public function styles(Worksheet $sheet)
    {
        return [
            // Style the first row (header row) to be bold.
            1 => ['font' => ['bold' => true]],
        ];
    }
}

