<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\ModelAdmin;
use App\ModelPeserta;
use App\ModelPremium;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class PremiumController extends Controller
{
    public function index()
    {
        //menampilkan semua peserta dengan tipe_peserta free
        $peserta = ModelPeserta::where('tipe_peserta', 'free')->get();
        //menampilkan semua peserta premium
        $premium = ModelPremium::all();

        //parsing data dari controller ke views
        $params = [
            'title' => 'Peserta Premium',
            'peserta' => $peserta,
            'premium' => $premium
        ];

        //return ke views
        return view('admin/olahPremium.index', $params);
    }

    public function aksi_tambah(Request $request)
    {
        //mengambil data session admin
        $session = Session::get('admin');
        // mengambil data admin berdasarkan session yang ada
        $admin = ModelAdmin::where('username', $session)->first();
        
        //validasi inputan kosong
        $request->validate([
            'peserta' => 'required',
            'paket' => 'required'
        ]);

        //proses input peserta premium
        $data = new ModelPremium();
        $data->id_peserta = $request->input('peserta');
        $data->banyak_paket = $request->input('paket');
        $data->sisa_paket = $request->input('paket');
        //menambahkan id_admin berdasarkan session aktif
        $data->id_admin = $admin->id_admin;
        $data->save();

        //mengambil data peserta berdasarkan input kode_peserta
        $peserta = ModelPeserta::where('kode_peserta', $request->input('peserta'))->first();
        //mengubah tipe peserta dari free ke premium
        $peserta->tipe_peserta = "premium";
        $peserta->save();

        //return ke route dengan pesan tambah
        return redirect('admin/olahPremium/index')->with('tambah', 'Peserta Premium telah ditambahkan');
    }

    public function aksi_ubah(Request $request, $id)
    {
        //validasi inputan kosong
        $request->validate([
            'paket' => 'required',
            'sisa_paket' => 'required'
        ]);

        //mencari data berdasarkan id yang dikirim dari route
        $data = ModelPremium::find($id);
        $data->banyak_paket = $request->input('paket');
        $data->sisa_paket = $request->input('sisa_paket');
        $data->save();

        //return ke route dengan pesan edit
        return redirect('admin/olahPremium/index')->with('edit', 'Peserta Premium telah diubah');
    }

    public function tambahPaket(Request $request, $id)
    {
        //validasi inputan kosong
        $request->validate([
            'paket' => 'required'
        ]);

        //mencari data berdasarkan id yang dikirim dari route
        $data = ModelPremium::find($id);
        //menambah jumlah banyak paket dan sisa paket dengan inputan paket
        $data->banyak_paket += $request->input('paket');
        $data->sisa_paket += $request->input('paket');
        $data->save();
        
        //return ke route dengan pesan paket
        return redirect('admin/olahPremium/index')->with('paket', 'Paket anda telah di tambah');
    }

    public function aksi_hapus($id, Request $request)
    {
        //mencari data berdasarkan id yang dikirim dari route
        $data = ModelPremium::find($id);
        
        //Mengubah peserta menjadi tipe free
        $peserta = ModelPeserta::find($data->id_peserta);
        $peserta->tipe_peserta = $request->input('tipe');
        $peserta->save();

        //hapus data premium
        $data->delete();

        //return ke route dengan pesan hapus
        return redirect('admin/olahPremium/index')->with('hapus', 'Peserta Premium telah dihapus');
    }
}
