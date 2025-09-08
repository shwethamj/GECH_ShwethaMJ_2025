<?php

namespace App\Exports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
class AttendanceExport implements FromCollection, WithHeadings, WithStyles
{
    /**
    * @return \Illuminate\Support\Collection
    */
    protected $attendanceData;

    public function __construct($attendanceData)
    {
        $this->attendanceData = $attendanceData;
    }

    public function collection()
    {
        return collect($this->attendanceData);
    }

    public function headings(): array
    {
        // Define the column headings for your Excel file.
        return [
            'Date',
            'Checkin Time',
            'Checkout Time',
        ];
    }

    public function styles(Worksheet $sheet)
    {
        return [
            // Style the first row (header row) to be bold.
            1 => ['font' => ['bold' => true]],
        ];
    }
}
