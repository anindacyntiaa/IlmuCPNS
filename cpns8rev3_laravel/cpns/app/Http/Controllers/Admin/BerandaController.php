<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\ModelMateri;
use App\ModelPeserta;
use App\ModelPremium;
use App\ModelSoal;
use Illuminate\Http\Request;

class BerandaController extends Controller
{
    public function index()
    {
        //menghitung jumlah perserta yang ada didatabase
        $peserta = ModelPeserta::count();
        //menghitung jumlah materi yang ada di databse
        $materi = ModelMateri::count();
        //menghitung jumlah banyak paket yang sudah dibeli
        $premium = ModelPremium::sum('banyak_paket');
        //mengambil data soal tryout
        $tryout = ModelSoal::where('tipe_soal', 'tryout')->count();
        //mengambil jumlah soal Latihan
        $latihan = ModelSoal::where('tipe_soal', 'latihan')->count();

        //parsing data dari controller ke views
        $params = [
            'title' => 'Beranda',
            'peserta' => $peserta,
            'materi' => $materi,
            'premium' => $premium,
            'tryout' => $tryout,
            'latihan' => $latihan
        ];

        //me-return views
        return view('admin.beranda', $params);
    }
}
