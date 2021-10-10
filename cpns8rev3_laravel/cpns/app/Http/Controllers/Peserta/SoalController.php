<?php

namespace App\Http\Controllers\Peserta;

use App\Http\Controllers\Controller;
use App\ModelKategori;
use App\ModelSoal;

class SoalController extends Controller
{
    public function twk()
    {
        $kategori = ModelKategori::where('id_kategori', '1')->first();
        $data = ModelSoal::where(['id_kategori' => 1, 'tipe_soal' => 'latihan'])->paginate(10);

        $params = [
            'title' => 'Tes Wawasan Kebangsaan',
            'data'  => $data,
            'kategori' => $kategori
        ];

        return view('peserta/soal.index', $params);
    }

    public function tiu()
    {
        $kategori = ModelKategori::where('id_kategori', '2')->first();
        $data = ModelSoal::where(['id_kategori' => 2, 'tipe_soal' => 'latihan'])->paginate(10);

        $params = [
            'title' => 'Tes Intelegensi Umum',
            'data'  => $data,
            'kategori' => $kategori
        ];

        return view('peserta/soal.index', $params);
    }

    public function tkp()
    {
        $kategori = ModelKategori::where('id_kategori', '3')->first();
        $data = ModelSoal::where(['id_kategori' => 3, 'tipe_soal' => 'latihan'])->paginate(10);
        $params = [
            'title' => 'Tes Karakteristik Pribadi',
            'data'  => $data,
            'kategori' => $kategori
        ];

        return view('peserta/soal.index', $params);
    }
}
