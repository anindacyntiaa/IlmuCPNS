<?php

namespace App\Imports;

use App\ModelSoal;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithValidation;

class SoalImports implements ToModel, WithHeadingRow, WithValidation
{
    //function untuk validasi data
    public function rules(): array
    {
        //validasi kolom kosong
        return [
            'id_kategori' => 'required',
            'tipe_soal'   => 'required',
            'soal'        => 'required',
            'j1'          => 'required',
            'j2'          => 'required',
            'j3'          => 'required',
            'j4'          => 'required',
            'j5'          => 'required',
            'kunci'       => 'required',
            'skor'        => 'required',
            'pembahasan'  => 'required'
        ];
    }

    //proses import data soal
    public function model(array $row)
    {
        //mengamvil data dari header
        return new ModelSoal([
            // 'id_kategori' adalah field di tb_soal
            // $row['id_kategori'] adalah data yang akan di import
            'id_kategori' => $row['id_kategori'],
            'tipe_soal'   => $row['tipe_soal'],
            'soal'        => $row['soal'],
            'j1'          => $row['j1'],
            'j2'          => $row['j2'],
            'j3'          => $row['j3'],
            'j4'          => $row['j4'],
            'j5'          => $row['j5'],
            'kunci'       => $row['kunci'],
            'skor'        => $row['skor'],
            'pembahasan'  => $row['pembahasan']
        ]);
    }

    //menentukan baris yang akan digunakan untuk header
    public function headingRow(): int
    {
        return 17;
    }
}
