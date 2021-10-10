<?php

namespace App\Http\Controllers\Peserta;

use App\Http\Controllers\Controller;
use App\ModelInformasi;
use App\ModelPeserta;
use App\ModelPremium;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class BerandaController extends Controller
{
    public function index()
    {
        //mengambil data session
        $session = Session::get('peserta');
        //mengambil data peserta berdasarkan session
        $peserta = ModelPeserta::where('username', $session)->first();
        //mengambil data premium berdasarkan peserta
        $premium = ModelPremium::where('id_peserta', $peserta->kode_peserta)->first();
        //mengambil semua data informasi
        $data = ModelInformasi::all();

        //parsing data dari controller ke views
        $params = [
            'title' => 'Beranda',
            'data'  => $data,
            'peserta' => $peserta,
            'premium' => $premium
        ];

        //return ke views
        return view('peserta.beranda', $params);
    }

    public function informasi($id)
    {
        //mengambil data informasi berdasrakan id yang dikirim dari route
        $data = ModelInformasi::find($id);

        //parsing data dari controller ke views
        $params = [
            'title' => 'Informasi',
            'data' => $data
        ];

        //return ke vies
        return view('peserta.informasi', $params);
    }
}
