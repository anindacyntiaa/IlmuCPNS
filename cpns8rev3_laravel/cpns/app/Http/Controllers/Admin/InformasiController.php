<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\ModelInformasi;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class InformasiController extends Controller
{
    public function index()
    {
        //mengambil seluruh data
        $data = ModelInformasi::all();

        //parsing data dari controller ke views
        $params = [
            'title' => 'Olah Data Informasi',
            'data'  => $data
        ];

        //me-return ke views
        return view('admin/olahInformasi.index', $params);
    }

    public function tambah()
    {
        //parsing data dari controller ke views
        $params = [
            'title' => 'Tambah Data Informasi'
        ];

        //me-return ke views
        return view('admin/olahInformasi.tambah', $params);
    }

    public function aksi_tambah(Request $request)
    {
        //validasi jika ada inputan yang kosong
        $request->validate([
            'judul'  => 'required',
            'isi'    => 'required',
            'gambar' => 'required|mimes:png,jpe,jpeg'
        ]);

        //mengambil inputan gambar
        $gambar    = $request->file('gambar');

        //mengubah nama gambar asli menjadi nama baru
        $newGambar = time().'.'.$gambar->getClientOriginalExtension();

        //proses input data ke database
        $data = new ModelInformasi();
        $data->judul      = $request->input('judul');
        $data->isi        = $request->input('isi');
        //input dengan nama gambar baru
        $data->gambar     = $newGambar;
        //mengambil tanggal dan waktu sekarang menggunakan Carbon::now()
        $data->tgl_upload = Carbon::now();
        $data->save();

        //memindahkan gambar ke folder public/infomasi dengan nama gambar baru
        $gambar->move(public_path().'/informasi',$newGambar);

        //me-return ke route dengan pesan tambah
        return redirect('admin/olahInformasi/index')->with('tambah', 'Data Informasi Telah Ditambahkan');
    }

    public function edit($id)
    {
        //mengambil data berdasarkan id yang dikirim dari route
        $data = ModelInformasi::find($id);

        //parsing data dari controller ke views
        $params = [
            'title' => 'Edit Data Informasi',
            'data'  => $data
        ];

        //me-return ke views
        return view('admin/olahInformasi.edit', $params);
    }

    public function aksi_ubah(Request $request, $id)
    {
        //validasi inputan yang kosong
        $request->validate([
            'judul'  => 'required',
            'isi'    => 'required'
        ]);

        //validasi apakah admin memperbarui gambar
        if ($request->hasFile('gambar')) {
            if ($request->file('gambar')->isValid()) {
                //mengambil inputan gambar
                $gambar    = $request->file('gambar');
                //mengubah nama gambar asli menjadi nama gambar baru
                $newGambar = $gambar->getClientOriginalName();

                //mencari data berdasarkan id yang dikirim route
                $data = ModelInformasi::find($id);
                //menghapus gambar lama dari folder public/informasi dengan nama gambar yang ada di database
                Storage::disk('informasi')->delete($data->gambar);
                //input informasi ke database
                $data->judul  = $request->input('judul');
                $data->isi    = $request->input('isi');
                //input gambar baru dengan nama gambar baru
                $data->gambar = $newGambar;
                $data->save();

                //memindahkan gambar baru ke folder public/informasi dengan nama gambar baru
                $gambar->move(public_path().'/informasi',$newGambar);
            }
        }

        //proses update jika admin tidak mengubah gambar
        //mengambil data berdasarkan id yang dikirim dari route
        $data   = ModelInformasi::find($id);
        //mengambil nama gambar dari database
        $gambar = $data['gambar'];
        //proses update
        $data->judul  = $request->input('judul');
        $data->isi    = $request->input('isi');
        //update gambar didatabase dengan nama yang sama
        $data->gambar = $gambar;
        $data->save();

        //return ke route dengan pesan edit
        return redirect('admin/olahInformasi/index')->with('edit', 'Data Informasi Telah Diubah');
    }

    public function aksi_hapus($id)
    {
        //mengambil data berdasarkan id yang dikirim dari route
        $data = ModelInformasi::find($id);
        //menghapus gambar yang ada di folder public/informasi dengan nama yang ada di database
        Storage::disk('informasi')->delete($data->gambar);
        //proses hapus data
        $data->delete();

        //return ke route dengan pesan hapus
        return redirect('admin/olahInformasi/index')->with('hapus', 'Data Informasi Telah Dihapus');
    }
}
