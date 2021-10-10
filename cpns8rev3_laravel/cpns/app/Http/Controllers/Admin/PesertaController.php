<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\ModelPeserta;
use Illuminate\Http\Request;

class PesertaController extends Controller
{
    public function index()
    {
        //menampilkan semua data yang ada didatabase
        $data = ModelPeserta::all();

        //parsing data dari controller ke views
        $params = [
            'title' => 'Olah Data Peserta',
            'data'  => $data
        ];

        //return ke views
        return view('admin/olahPeserta.index', $params);
    }

    public function aksi_hapus($id)
    {
        //mencari data bedasarkan id yang dikirim dari route
        $data = ModelPeserta::find($id);
        $data->delete();

        //return ke route dengan pesan hapus
        return redirect('admin/olahPeserta/index')->with('hapus', 'Data Peserta Telah Dihapus');
    }

    
}
