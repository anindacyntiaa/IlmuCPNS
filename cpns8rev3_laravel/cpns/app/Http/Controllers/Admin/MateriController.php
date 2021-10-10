<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\ModelKategori;
use App\ModelMateri;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class MateriController extends Controller
{
    public function index()
    {
        //menampilkan semua data materi
        $data = ModelMateri::all();
        //menampilkan semua data kategori
        $kategori = ModelKategori::all();

        //parsing data dari controller ke views
        $params = [
            'title'    => 'Olah Data Materi',
            'data'     => $data,
            'kategori' => $kategori
        ];

        //return ke views
        return view('admin/olahMateri.index', $params);
    }

    public function aksi_tambah(Request $request)
    {
        //validasi inputan yang kosong
        $request->validate([
            'judul'       => 'required',
            'id_kategori' => 'required',
            'file'        => 'required|mimes:pdf'
        ]);

        //mengambil inputan file
        $file    = $request->file('file');
        //mengambil nama file baru
        $newFile = $file->getClientOriginalName();

        //proses input 
        $data = new ModelMateri();
        $data->judul       = $request->input('judul');
        $data->id_kategori = $request->input('id_kategori');
        //input file dengan nama file baru
        $data->file        = $newFile;
        $data->save();

        //memindahkan file ke folder public/materi dengan nama file baru
        $file->move(public_path().'/materi',$newFile);

        //return ke route dengan pesan tambah
        return redirect('admin/olahMateri/index')->with('tambah', 'Data Materi Telah Ditambahkan');
    }

    public function edit($id)
    {
        //mengambil data materi berdasarkan id yang dikirim dari route
        $data = ModelMateri::find($id);
        //mengambil semua data kategori
        $kategori = ModelKategori::all();

        //parsing data dari controller ke views
        $params = [
            'title'    => 'Edit Data Materi',
            'data'     => $data,
            'kategori' => $kategori
        ];

        //return ke views
        return view('admin/olahMateri.edit', $params);
    }

    public function aksi_ubah(Request $request, $id)
    {
        //validasi inputan yang kosong
        $request->validate([
            'judul'       => 'required',
            'id_kategori' => 'required',
            'file'        => 'mimes:pdf'
        ]);

        //pengecekan apakah admin mengubah file
        if ($request->hasFile('file')) {
            if ($request->file('file')->isValid()) {
                //mengambil inputan file
                $file = $request->file('file');
                //mengubah nama file mejadi nama file baru
                $newFile = $file->getClientOriginalName();

                //mencari data di database berdasarkan id yang dikirim dari route
                $data = ModelMateri::find($id);
                //menghapus file lama di folder public/materi dengan nama yang ad di database
                Storage::disk('materi')->delete($data->file);
                //proses update data
                $data->judul       = $request->input('judul');
                $data->id_kategori = $request->input('id_kategori');
                //input file baru ke database dengan nama file baru
                $data->file        = $newFile;
                $data->save();

                //menyimpan file baru ke folder public/materi dengan nama file baru
                $file->move(public_path().'/materi',$newFile);
            }
        }

        //proses update jika admin tidak mengubah file
        //mencari data didatbase berdasarkan id yang dikirim dari route
        $data = ModelMateri::find($id);
        //mengambil nama file dari database
        $file = $data['file'];
        //proses update
        $data->judul       = $request->input('judul');
        $data->id_kategori = $request->input('id_kategori');
        //proses input file dengan nama file yang sudah ada didatabase
        $data->file        = $file;
        $data->save();

        //return ke route dengan pesan edit
        return redirect('admin/olahMateri/index')->with('edit', 'Data Materi Telah Diubah');
    }

    public function aksi_hapus($id)
    {
        //mencari data berdasarkan id yang dikirim dari route
        $data = ModelMateri::find($id);
        //menghapus filr yang ada di folder public/materi dengan nama file yang ada didtabase
        Storage::disk('materi')->delete($data->file);
        $data->delete();

        //return ke route dengan pesan hapus
        return redirect('admin/olahMateri/index')->with('hapus', 'Data Materi Telah Dihapus');
    }
}
