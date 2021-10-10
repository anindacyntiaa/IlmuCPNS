<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\ModelLembarSoal;
use Illuminate\Http\Request;

class HasilUjianController extends Controller
{
    public function index()
    {
        //mengambil data dari database
        $data = ModelLembarSoal::selectRaw('id_peserta')
                ->selectRaw('tipe_tryout')
                ->selectRaw('kesempatan')
                ->selectRaw('sum(nilai) as hasil_total')
                ->selectRaw('(Select sum(nilai)from tb_lembar_soal a JOIN tb_soal ON tb_soal.id_soal = a.id_soal where a.tipe_tryout = tb_lembar_soal.tipe_tryout and a.kesempatan = tb_lembar_soal.kesempatan and a.id_peserta=tb_lembar_soal.id_peserta and id_kategori=1) as hasil_twk')
                ->selectRaw('(Select sum(nilai)from tb_lembar_soal a JOIN tb_soal ON tb_soal.id_soal = a.id_soal where a.tipe_tryout = tb_lembar_soal.tipe_tryout and a.kesempatan = tb_lembar_soal.kesempatan and a.id_peserta=tb_lembar_soal.id_peserta and id_kategori=2) as hasil_tiu')
                ->selectRaw('(Select sum(nilai)from tb_lembar_soal a JOIN tb_soal ON tb_soal.id_soal = a.id_soal where a.tipe_tryout = tb_lembar_soal.tipe_tryout and a.kesempatan = tb_lembar_soal.kesempatan and a.id_peserta=tb_lembar_soal.id_peserta and id_kategori=3) as hasil_tkp')
                ->from('tb_lembar_soal')
                ->where('status', 1)
                ->orderBy('hasil_total','DESC')
                ->groupBy('id_peserta', 'kesempatan', 'tipe_tryout')
                ->get();
        
        //parsing data dari controller ke views
        $params = [
            'title' => 'Olah Data Hasil Ujian',
            'data' => $data
        ];

        //me-return ke views
        return view('admin/olahHasilUjian.index', $params);
    }
}
