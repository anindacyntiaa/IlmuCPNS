<?php

namespace App\Http\Controllers\Peserta;

use App\Http\Controllers\Controller;
use App\ModelPeserta;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class AkunController extends Controller
{
    public function index()
    {
        //mengambil data session 
        $session = Session::get('peserta');
        // mengambil data peserta dengan username berdasarkan session
        $data    = ModelPeserta::where('username', $session)->first();

        //parsing data dari controller ke voews
        $params = [
            'title' => 'Akun',
            'data'  => $data
        ];

        // return ke views
        return view('peserta/akun.index', $params);
    }

    public function aksi_ubah(Request $request, $kode)
    {
        //validasi inputan kosong
        $request->validate([
            'username' => 'required',
            'nama_peserta' => 'required',
            'email' => 'required',
            'no_hp' => 'required',
            'alamat' => 'required',
            'tgl_lahir' => 'required',
            'tempat_lahir' => 'required'
        ]);
        
        // proses update data berdasarkan kode_peserta yang dikirim dari route
        $data = ModelPeserta::where('kode_peserta', $kode)->first();
        $data->username = $request->input('username');
        $data->nama_peserta = $request->input('nama_peserta');
        $data->email = $request->input('email');
        $data->no_hp = $request->input('no_hp');
        $data->alamat = $request->input('alamat');
        $data->tgl_lahir = $request->input('tgl_lahir');
        $data->tempat_lahir = $request->input('tempat_lahir');
        $data->save();

        //memperbarui session dengan username baru
        $request->session()->put('peserta', $request->input('username'));

        //return ke route dengan pesan success
        return redirect('/akun')->with('success', 'Data Anda Sudah Diperbarui');
    }

    public function ubah_pass(Request $request, $kode)
    {
        //validasi inputan ksong
        $request->validate([
            'old' => 'required',
            'new' => 'required'
        ]);

        //proses update data berdasarkan id yang dikirim dari route
        $data = ModelPeserta::where('kode_peserta', $kode)->first();
        //input password dengan passowrd baru
        $data->password = $request->input('new');
        $data->save();

        //return ke route dengan pesan success
        return redirect('/akun')->with('success', 'Password Anda Telah Diganti');
    }
}
