<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Imports\SoalImports;
use App\ModelKategori;
use App\ModelSoal;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class SoalController extends Controller
{
    public function index()
    {
        //menampilkan semua data
        $data = ModelSoal::all();

        //parsing data dari controller ke views
        $params = [
            'title' => 'Olah Data Soal',
            'data'  => $data
        ];

        //return ke views
        return view('admin/olahSoal.index', $params);
    }

    public function tambah()
    {
        //menampilkan semua data kategori
        $kategori = ModelKategori::all();
        
        //parsing data dari controller ke views
        $params = [
            'title'    => 'Tambah Data Soal',
            'kategori' => $kategori
        ];

        //return ke views
        return view('admin/olahSoal.tambah', $params);
    }

    public function contoh()
    {
        //mengidentifikasi nama file contoh
        $filename = 'example.xlsx';
        //menidentifikasi path contoh
        $path = public_path('soal/'.$filename);
        
        //mengunduh file contoh berdasarkan path dan nama file di atas
        return response()->download($path, $filename);
    }

    public function tambahFile(Request $request)
    {
        //validasi inputan kosong
        $request->validate([
            'file' => 'required|mimes:xlsx,xls'
        ]);

        //proses import (buka folder app/Imports/SoalImport.php)
        Excel::import(new SoalImports, $request->file('file'));

        //return ke route dengan pesan tambah
        return redirect('admin/olahSoal/index')->with('tambah', 'Data Soal Telah Diimport');
    }

    public function aksi_tambah(Request $request)
    {
        //validasi inputan kosong
        $request->validate([
            'id_kategori'   => 'required',
            'tipe'          => 'required',
            'soal'          => 'required',
            'j1'            => 'required',
            'j2'            => 'required',
            'j3'            => 'required',
            'j4'            => 'required',
            'j5'            => 'required',
            'kunci'         => 'required',
            'skor'          => 'required',
            'pembahasan'    => 'required'
        ]);

        //proses input data
        $data = new ModelSoal();
        $data->id_kategori = $request->input('id_kategori');
        $data->tipe_soal   = $request->input('tipe');
        $data->soal        = $request->input('soal');
        $data->j1          = $request->input('j1');
        $data->j2          = $request->input('j2');
        $data->j3          = $request->input('j3');
        $data->j4          = $request->input('j4');
        $data->j5          = $request->input('j5');
        $data->kunci       = $request->input('kunci');
        $data->skor        = $request->input('skor');
        $data->pembahasan  = $request->input('pembahasan');
        $data->save();

        //return ke route dengan pesan tambah
        return redirect('admin/olahSoal/index')->with('tambah', 'Data Soal Telah Ditambahkan');
    }

    public function edit($id)
    {
        //mencari data dengan id yang dikirim dari route
        $data = ModelSoal::find($id);
        //menampilkan semua data kategori
        $kategori = ModelKategori::all();

        //parsing data dari controller ke views
        $params = [
            'title'    => 'Edit Data Kategori',
            'data'     => $data,
            'kategori' => $kategori

        ];

        //return ke views
        return view('admin/olahSoal.edit', $params);
    }

    public function aksi_ubah(Request $request, $id)
    {
        //validasi inputan kosong
        $request->validate([
            'id_kategori'    => 'required',
            'tipe'  => 'required',
            'soal'  => 'required',
            'j1'    => 'required',
            'j2'    => 'required',
            'j3'    => 'required',
            'j4'    => 'required',
            'j5'    => 'required',
            'kunci'    => 'required',
            'skor'    => 'required',
            'pembahasan'    => 'required'
        ]);

        //proses update data berdasarkan id yang dikirim dari route
        $data = ModelSoal::find($id);
        $data->id_kategori = $request->input('id_kategori');
        $data->tipe_soal   = $request->input('tipe');
        $data->soal        = $request->input('soal');
        $data->j1          = $request->input('j1');
        $data->j2          = $request->input('j2');
        $data->j3          = $request->input('j3');
        $data->j4          = $request->input('j4');
        $data->j5          = $request->input('j5');
        $data->kunci       = $request->input('kunci');
        $data->skor        = $request->input('skor');
        $data->pembahasan  = $request->input('pembahasan');
        $data->save();

        //return ke route dengan pesan edit
        return redirect('admin/olahSoal/index')->with('edit', 'Data Soal Telah Diubah');
    }

    public function aksi_hapus($id)
    {
        //proses delete data berdasarkan id yang dikirim dari route
        $data = ModelSoal::find($id);
        $data->delete();

        //return ke route dengan pesan hapus
        return redirect('admin/olahSoal/index')->with('hapus', 'Data Soal Telah Dihapus');
    }
}
