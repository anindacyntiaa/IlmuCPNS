<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\ModelAdmin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class AdminController extends Controller
{
    public function index()
    {
        //mengambil data session
        $session = Session::get('admin');

        //mengambil semua data admin
        $data = ModelAdmin::all();

        //parsing data dari controller ke views
        $params = [
            'title' => 'Olah Data Admin',
            'data'  => $data,
            'aktif' => $session
        ];

        //me-return views
        return view('admin/olahAdmin.index', $params);
    }

    public function tambah()
    {
        //parsing data dari controller ke views
        $params = [
            'title' => 'Tambah Data Admin'
        ];

        //me-return views
        return view('admin/olahAdmin.tambah', $params);
    }

    public function aksi_tambah(Request $request)
    {
        // validasi jika ada inputan yang kosong
        $request->validate([
            'nama_admin'    => 'required',
            'no_telp'       => 'required',
            'jenis_kelamin' => 'required',
            'username'     => 'required',
            'password'     => 'required'
        ]);

        // proses kirim data ke database
        $data = new ModelAdmin();
        $data->nama_admin    = $request->input('nama_admin');
        $data->no_telp       = $request->input('no_telp');
        $data->jenis_kelamin = $request->input('jenis_kelamin');
        $data->username      = $request->input('username');
        $data->password      = $request->input('password');
        $data->save();

        //me-return ke route dengan pesan tambah
        return redirect('admin/olahAdmin/index')->with('tambah', 'Data Admin Telah Ditambahkan');
    }

    public function edit($id)
    {
        // menampilkan data sesuai id admin
        $data = ModelAdmin::find($id);

        //parsing data dari controller ke views
        $params = [
            'title' => 'Edit Data Admin',
            'data'  => $data
        ];

        //me-return views
        return view('admin/olahAdmin.edit', $params);
    }

    public function aksi_ubah(Request $request, $id)
    {
        //validasi jika ada inputan yang kosong
        $request->validate([
            'nama_admin'    => 'required',
            'no_telp'       => 'required',
            'jenis_kelamin' => 'required',
            'username'     => 'required',
            'password'     => 'required'
        ]);

        //mengambil data berdasarkan id yang dikirim dari route dan melakukan proses update
        $data = ModelAdmin::find($id);
        $data->nama_admin    = $request->input('nama_admin');
        $data->no_telp       = $request->input('no_telp');
        $data->jenis_kelamin = $request->input('jenis_kelamin');
        $data->username      = $request->input('username');
        $data->password      = $request->input('password');
        $data->save();

        //me-return ke route dengan pesan edit
        return redirect('admin/olahAdmin/index')->with('edit', 'Data Admin Telah Diubah');
    }

    public function aksi_hapus($id)
    {
        //mengambil data berdasarkan id yang dikirim dari route dan melakukan delete data
        $data = ModelAdmin::find($id);
        $data->delete();

        //me-return ke route dengan pesan hapus
        return redirect('admin/olahAdmin/index')->with('hapus', 'Data Admin Telah Dihapus');
    }
}
