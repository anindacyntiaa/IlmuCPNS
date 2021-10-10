<?php

namespace App\Http\Controllers\Peserta;

use App\Http\Controllers\Controller;
use App\ModelKategori;
use App\ModelMateri;
use Illuminate\Http\Request;

class MateriController extends Controller
{
    public function twk()
    {
        //mengambil data kategori
        $kategori = ModelKategori::where('id_kategori', '1')->first();
        //mengambil data materi berdasarkan kategori
        $data = ModelMateri::where('id_kategori', '1')->get();

        //parsing data dari controller ke views
        $params = [
            'title' => 'Tes Wawasan Kebangsaan',
            'data'  => $data,
            'kategori' => $kategori
        ];

        //return ke views
        return view('peserta/materi.index', $params);
    }

    public function tiu()
    {
        $kategori = ModelKategori::where('id_kategori', '2')->first();
        $data = ModelMateri::where('id_kategori', '2')->get();
        $params = [
            'title' => 'Tes Intelegensi Umum',
            'data'  => $data,
            'kategori' => $kategori
        ];
        return view('peserta/materi.index', $params);
    }

    public function tkp()
    {
        $kategori = ModelKategori::where('id_kategori', '3')->first();
        $data = ModelMateri::where('id_kategori', '3')->get();
        $params = [
            'title' => 'Tes Karakteristik Pribadi',
            'data'  => $data,
            'kategori' => $kategori
        ];
        return view('peserta/materi.index', $params);
    }

    public function lihatMateri($id)
    {
        //mengambil data berdasarkan id yang dikirim
        $data = ModelMateri::find($id);

        //parsing data dari controller ke views
        $params = [
            'title' => 'Lihat Materi',
            'data'  => $data
        ];

        //return ke views
        return view('peserta/materi.lihatMateri', $params);
    }
}
