<?php

namespace App\Http\Controllers\Peserta;

use App\Exports\RankingExport;
use App\Http\Controllers\Controller;
use App\ModelLembarSoal;
use App\ModelPeserta;
use App\ModelPremium;
use App\ModelSoal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Barryvdh\DomPDF\Facade as PDF;
use Maatwebsite\Excel\Facades\Excel;

class TryoutController extends Controller
{
    public function index()
    {
        //mengambil data session
        $session = Session::get('peserta');
        //mengambil data peserta berdasarkan session
        $peserta = ModelPeserta::where('username', $session)->first();
        //mengambil data tryout bedasarkan kode_peserta
        $tryout = ModelLembarSoal::where('id_peserta', $peserta->kode_peserta)->first();
        //meengambil data premium peserta berdasarkan kode_peserta
        $premium = ModelPremium::where('id_peserta', $peserta->kode_peserta)->first();
        //mengambil data kesempatan berdasarkan tipe peserta dan kode_peserta
        $cek = ModelLembarSoal::where(['id_peserta'=> $peserta->kode_peserta, 'tipe_tryout' => $peserta->tipe_peserta])->groupBy('kesempatan')->orderBy('kesempatan', 'DESC')->first();

        //parsing data dari controller ke views
        $params = [
            'title' => 'Tryout',
            'peserta' => $peserta,
            'tryout' => $tryout,
            'premium' => $premium,
            'cek' => $cek
        ];

        //return ke views
        return view('peserta/tryout.index', $params);
    }

    public function tryout()
    {
        //mengambil data session
        $session = Session::get('peserta');
        //mengambil data peserta berdasarkan session
        $peserta = ModelPeserta::where('username', $session)->first();

        //mengambil data soal berdasatkan tipe soal dan kategori soal
        $twk = ModelSoal::select('id_soal')->where(['id_kategori' => 1, 'tipe_soal' => 'tryout'])->inRandomOrder()->limit('30')->get();
        $tiu = ModelSoal::select('id_soal')->where(['id_kategori' => 2, 'tipe_soal' => 'tryout'])->inRandomOrder()->limit('35')->get();
        $tkp = ModelSoal::select('id_soal')->where(['id_kategori' => 3, 'tipe_soal' => 'tryout'])->inRandomOrder()->limit('45')->get();

        //mengubah data soal dari object ke aray dan menggabungkannya
        $soal = array_merge($twk->toArray(), $tiu->toArray(), $tkp->toArray());
        //membuat penomoran soal
        $no = 1;

        //menambil data lembar soal dengan id peserta dan tipe tryout yang sama dengan kode dan tipe peserta
        $cek = ModelLembarSoal::where(['id_peserta'=> $peserta->kode_peserta, 'tipe_tryout' => $peserta->tipe_peserta])->groupBy('kesempatan')->orderBy('kesempatan', 'DESC')->first();
        //menambil data lembar soal dengan id peserta dan tipe tryout yang sama dengan kode dan tipe peserta
        $cekLembar = ModelLembarSoal::where(['id_peserta'=> $peserta->kode_peserta, 'tipe_tryout' => $peserta->tipe_peserta])->first();
        //mengambil data peserta premium berdasarkan id peserta yang terdaftar
        $cekPremium = ModelPremium::where('id_peserta', $peserta->kode_peserta)->first();

        //percabangan switch case dengan condition tipe peserta
        switch ($peserta->tipe_peserta) {
            //peserta free
            case 'free':
                //percabangan jika peserta sudah pernah mengerjakan atau belum
                if (empty($cek)) {
                    //generate lembar soal dengan data soal yang sudah diambil
                    foreach ($soal as $a) {
                        //proses input data lembar soal
                        $data = new ModelLembarSoal();
                        $data->id_peserta = $peserta->kode_peserta;
                        $data->id_soal = $a['id_soal'];
                        $data->no_soal = $no++;
                        $data->nilai = 0;
                        $data->kesempatan = 1;
                        $data->tipe_tryout = 'free';
                        $data->save();
                    }
    
                    //proses pengurangan sisa kesempatan gratis peserta
                    $peserta->sisa_kesempatan -= 1;
                    $peserta->save();
                }elseif (!empty($cek) && $cek->kesempatan != $peserta->kesempatan) {
                    //pengecekan apabila peserta sedang mengerjakan tryout dan tidak sengaja keluar
                    if ($cekLembar->status == 0) {
                        //$page untuk sistem penomoran di index soal
                        $page   = ModelLembarSoal::where(['id_peserta' => $peserta->kode_peserta, 'status' => 0])->get();
                        //$tryout untuk menampilkan soal satu per satu
                        $tryout = ModelLembarSoal::where(['id_peserta' => $peserta->kode_peserta, 'status' => 0])->paginate(1);
                        
                        //parsing data dari controller ke views
                        $params = [
                            'title' => 'Mengerjakan Tryout',
                            'data'  => $tryout,
                            'page'  => $page
                        ];

                        //return ke views
                        return view('peserta/tryout.tryout', $params);
        
                    }else {
                        //generate lembar soal baru
                        foreach ($soal as $a) {
                            $data = new ModelLembarSoal();
                            $data->id_peserta = $peserta->kode_peserta;
                            $data->id_soal = $a['id_soal'];
                            $data->no_soal = $no++;
                            $data->nilai = 0;
                            $data->kesempatan = $cek->kesempatan +1;
                            $data->tipe_tryout = 'free';
                            $data->save();
                        }
        
                        //proses pengurangan sisa kesempatan peserta
                        $peserta->sisa_kesempatan -= 1;
                        $peserta->save();
                    }
                }

                //$page untuk sistem penomoran di index soal
                $page   = ModelLembarSoal::where(['id_peserta' => $peserta->kode_peserta, 'status' => 0])->get();
                //$tryout untuk menampilkan soal satu per satu
                $tryout = ModelLembarSoal::where(['id_peserta' => $peserta->kode_peserta, 'status' => 0])->paginate(1);

                //parsing data dari controller ke views
                $params = [
                    'title' => 'Mengerjakan Tryout',
                    'data'  => $tryout,
                    'page'  => $page
                ];
                
                //return ke views
                return view('peserta/tryout.tryout', $params);

                break;
            
            //peserta premium
            case 'premium':
                //pengecekan apabila peserta sudah mengerjakan tryout atau belum
                if (empty($cek)) {
                    //generate lembar soal baru
                    foreach ($soal as $a) {
                        $data = new ModelLembarSoal();
                        $data->id_peserta = $peserta->kode_peserta;
                        $data->id_soal = $a['id_soal'];
                        $data->no_soal = $no++;
                        $data->nilai = 0;
                        $data->kesempatan = 1;
                        $data->tipe_tryout = 'premium';
                        $data->save();
                    }

                    //proses pengurangan sisa paket premium peserta
                    $kesempatanPremium = ModelPremium::where('id_peserta', $peserta->kode_peserta)->first();
                    $kesempatanPremium->sisa_paket = $cekPremium->sisa_paket -1;
                    $kesempatanPremium->save();
    
                }elseif(!empty($cek) && $cek->kesempatan != $cekPremium->banyak_paket){
                    //pengecekan apabila peserta sedang mengerjakan tryout dan tidak sengaja keluar
                    if ($cek->status == 0) {
                        //$page untuk sistem penomoran di index soal
                        $page   = ModelLembarSoal::where(['id_peserta' => $peserta->kode_peserta, 'status' => 0])->get();
                        //$tryout untuk menampilkan soal satu per satu
                        $tryout = ModelLembarSoal::where(['id_peserta' => $peserta->kode_peserta, 'status' => 0])->paginate(1);
                        
                        //parsing data dari controller ke views
                        $params = [
                            'title' => 'Mengerjakan Tryout',
                            'data'  => $tryout,
                            'page'  => $page
                        ];

                        //return ke views
                        return view('peserta/tryout.tryout', $params);
        
                    }else {
                        //generate lembar soal baru
                        foreach ($soal as $a) {
                            $data = new ModelLembarSoal();
                            $data->id_peserta = $peserta->kode_peserta;
                            $data->id_soal = $a['id_soal'];
                            $data->no_soal = $no++;
                            $data->nilai = 0;
                            $data->kesempatan = $cek->kesempatan +1;
                            $data->tipe_tryout = 'premium';
                            $data->save();
                        }
        
                        //proses pengurangan sisa paket premium peserta
                        $kesempatanPremium = ModelPremium::where('id_peserta', $peserta->kode_peserta)->first();
                        $kesempatanPremium->sisa_paket = $cekPremium->sisa_paket -1;
                        $kesempatanPremium->save();
                    }
                }
                break;
        }
        
        //$page untuk sistem penomoran di index soal
        $page   = ModelLembarSoal::where(['id_peserta' => $peserta->kode_peserta, 'status' => 0])->get();
        //$tryout untuk menampilkan soal satu per satu
        $tryout = ModelLembarSoal::where(['id_peserta' => $peserta->kode_peserta, 'status' => 0])->paginate(1);
        
        //parsing data dari controller ke views
        $params = [
            'title' => 'Mengerjakan Tryout',
            'data'  => $tryout,
            'page'  => $page
        ];
        
        //return ke views
        return view('peserta/tryout.tryout', $params);
    }

    public function cekJawaban(Request $request)
    {
        //mengambil data session
        $session = Session::get('peserta');
        //mengambil data peserta berdasarkan session
        $peserta = ModelPeserta::where('username', $session)->first();
        //mengambil index nomor dan ditambah 1
        $page = $request->input('page') + 1;

        //percabangan input selesai atau simpan jawaban
        switch ($request->input('action')) {
            //selesai
            case 'simpan' :
                $jawaban = $request->input('jawaban');
                //percabangan jika jawaban kosong atau terisi
                if (!empty($jawaban)) {
                    //mengambil data soal dari tb_soal
                    $cek = ModelSoal::where('id_soal', $request->input('id_soal'))->first();
                    //percabangan jika jawaban benar atau salah
                    if ($jawaban == $cek->kunci) {
                        //mengambil data lembar soal berdasarkan id soal dan id peserta dan status lembar soal yang masin 0
                        $nilai = ModelLembarSoal::where(['id_soal' => $request->input('id_soal'), 'id_peserta' => $peserta->kode_peserta, 'status' => 0])->first();
                        //input nilai di lembar soal berdasarkan skor di soal
                        $nilai->nilai = $cek->skor;
                        // percabangan jika peserta ragu
                        if (empty($request->input('ragu'))) {
                            $nilai->ragu = 0;
                        }else {
                            $nilai->ragu = $request->input('ragu');
                        }
                        //input jawaban dari peserta
                        $nilai->jawaban = $request->input('jawaban');
                        $nilai->save();
                    }else{
                        $nilai = ModelLembarSoal::where(['id_soal' => $request->input('id_soal'), 'id_peserta' => $peserta->kode_peserta, 'status' => 0])->first();
                        $nilai->nilai = 0;
                        if (empty($request->input('ragu'))) {
                            $nilai->ragu = 0;
                        }else {
                            $nilai->ragu = $request->input('ragu');
                        }
                        $nilai->jawaban = $request->input('jawaban');
                        $nilai->save();
                    }
                    
                    return redirect('/tryout/index?page=110');
                } else {
                    //percabangan jika jawaban kosong
                    if ($jawaban == null) {
                        $nilai = ModelLembarSoal::where(['id_soal' => $request->input('id_soal'), 'id_peserta' => $peserta->kode_peserta, 'status' => 0])->first();
                        $nilai->nilai = 0;
                        if (empty($request->input('ragu'))) {
                            $nilai->ragu = 0;
                        }else {
                            $nilai->ragu = $request->input('ragu');
                        }
                        $nilai->jawaban = "kosong";
                        $nilai->save();
                    }

                    return redirect('/tryout/index?page=110');
                }

                break;
            case 'save':
                //mengambil inputan jawaban peserta
                $jawaban = $request->input('jawaban');
                //percabangan jika jawaban kosong atau terisi
                if (!empty($jawaban)) {
                    //mengambil data soal dari tb_soal
                    $cek = ModelSoal::where('id_soal', $request->input('id_soal'))->first();
                    //percabangan jika jawaban benar atau salah
                    if ($jawaban == $cek->kunci) {
                        //mengambil data lembar soal berdasarkan id soal dan id peserta dan status lembar soal yang masin 0
                        $nilai = ModelLembarSoal::where(['id_soal' => $request->input('id_soal'), 'id_peserta' => $peserta->kode_peserta, 'status' => 0])->first();
                        //input nilai di lembar soal berdasarkan skor di soal
                        $nilai->nilai = $cek->skor;
                        // percabangan jika peserta ragu
                        if (empty($request->input('ragu'))) {
                            $nilai->ragu = 0;
                        }else {
                            $nilai->ragu = $request->input('ragu');
                        }
                        //input jawaban dari peserta
                        $nilai->jawaban = $request->input('jawaban');
                        $nilai->save();
                    }else{
                        $nilai = ModelLembarSoal::where(['id_soal' => $request->input('id_soal'), 'id_peserta' => $peserta->kode_peserta, 'status' => 0])->first();
                        $nilai->nilai = 0;
                        if (empty($request->input('ragu'))) {
                            $nilai->ragu = 0;
                        }else {
                            $nilai->ragu = $request->input('ragu');
                        }
                        $nilai->jawaban = $request->input('jawaban');
                        $nilai->save();
                    }
                    
                    return redirect('/tryout/konfirmasi');
                } else {
                    //percabangan jika jawaban kosong
                    if ($jawaban == null) {
                        $nilai = ModelLembarSoal::where(['id_soal' => $request->input('id_soal'), 'id_peserta' => $peserta->kode_peserta, 'status' => 0])->first();
                        $nilai->nilai = 0;
                        if (empty($request->input('ragu'))) {
                            $nilai->ragu = 0;
                        }else {
                            $nilai->ragu = $request->input('ragu');
                        }
                        $nilai->jawaban = "kosong";
                        $nilai->save();
                    }

                    return redirect('/tryout/konfirmasi');
                }

                break;
            
            case 'next':
                $jawaban = $request->input('jawaban');
                if (!empty($jawaban)) {
                    $cek = ModelSoal::where('id_soal', $request->input('id_soal'))->first();
                    if ($jawaban == $cek->kunci) {
                        $nilai = ModelLembarSoal::where(['id_soal' => $request->input('id_soal'), 'id_peserta' => $peserta->kode_peserta, 'status' => 0])->first();
                        $nilai->nilai = $cek->skor;
                        if (empty($request->input('ragu'))) {
                            $nilai->ragu = 0;
                        }else {
                            $nilai->ragu = $request->input('ragu');
                        }
                        $nilai->jawaban = $request->input('jawaban');
                        $nilai->save();
                    }else{
                        $nilai = ModelLembarSoal::where(['id_soal' => $request->input('id_soal'), 'id_peserta' => $peserta->kode_peserta, 'status' => 0])->first();
                        $nilai->nilai = 0;
                        if (empty($request->input('ragu'))) {
                            $nilai->ragu = 0;
                        }else {
                            $nilai->ragu = $request->input('ragu');
                        }
                        $nilai->jawaban = $request->input('jawaban');
                        $nilai->save();
                    }
                    
                    return redirect('/tryout/index?page='.$page);
                } else {
                    if ($jawaban == null) {
                        $nilai = ModelLembarSoal::where(['id_soal' => $request->input('id_soal'), 'id_peserta' => $peserta->kode_peserta, 'status' => 0])->first();
                        $nilai->nilai = 0;
                        if (empty($request->input('ragu'))) {
                            $nilai->ragu = 0;
                        }else {
                            $nilai->ragu = $request->input('ragu');
                        }
                        $nilai->jawaban = "kosong";
                        $nilai->save();
                    }
                    return redirect('/tryout/index?page='.$page);
                }
                
                break;

            default:
                echo "Kosong";
                break;
        }
    }

    public function konfirmasi()
    {
        //mengambil data session
        $session = Session::get('peserta');
        //mengambil data perserta berdasarkan session
        $peserta = ModelPeserta::where('username', $session)->first();
        //mengambil data lembar soal berdasarkan kode peserta dan status lembar soal 0
        $data   = ModelLembarSoal::where(['id_peserta' => $peserta->kode_peserta, 'status' => 0])->get();

        //parsing data dari controller ke views
        $params = [
            'title' => 'Konfrimasi Jawaban',
            'data' => $data
        ];

        //return ke views
        return view('peserta/tryout.konfirmasi', $params);
    }

    public function postKonfirmasi()
    {
        //mengambil data session
        $session = Session::get('peserta');
        //mengambil data peserta berdasarkan session
        $peserta = ModelPeserta::where('username', $session)->first();
        //mengubah status peserta dari 0 ke 1
        $peserta->status = 1;
        $peserta->save();

        //mengambil data lembar soal berdasarkan id peserta dan status lembar masih 0
        $lembarSoal = ModelLembarSoal::where(['id_peserta' => $peserta->kode_peserta, 'status' => 0])->get();
        //mengubah status lembar soal dari 0 ke 1, dan mengubah ragu menjadi 0
        foreach ($lembarSoal as $key) {
            $key->status = 1;
            $key->ragu = 0;
            $key->save();
        }

        //return ke route
        return redirect('/tryout');
    }

    public function hasil()
    {
        //mengambil data session
        $session = Session::get('peserta');
        //mengambil data perserta berdasarkan session
        $peserta = ModelPeserta::where('username', $session)->first();
        
        //menghambil data hasil tryout peserta
        $hasil = ModelLembarSoal::selectRaw('id_peserta')
        ->selectRaw('kesempatan')
        ->selectRaw('tipe_tryout')
        ->selectRaw('sum(nilai) as hasil_total')
        ->selectRaw('(Select sum(nilai)from tb_lembar_soal a JOIN tb_soal ON tb_soal.id_soal = a.id_soal where a.tipe_tryout = tb_lembar_soal.tipe_tryout and a.kesempatan = tb_lembar_soal.kesempatan and a.id_peserta=tb_lembar_soal.id_peserta and id_kategori=1 ) as hasil_twk')
        ->selectRaw('(Select sum(nilai)from tb_lembar_soal a JOIN tb_soal ON tb_soal.id_soal = a.id_soal where a.tipe_tryout = tb_lembar_soal.tipe_tryout and a.kesempatan = tb_lembar_soal.kesempatan and a.id_peserta=tb_lembar_soal.id_peserta and id_kategori=2 ) as hasil_tiu')
        ->selectRaw('(Select sum(nilai)from tb_lembar_soal a JOIN tb_soal ON tb_soal.id_soal = a.id_soal where a.tipe_tryout = tb_lembar_soal.tipe_tryout and a.kesempatan = tb_lembar_soal.kesempatan and a.id_peserta=tb_lembar_soal.id_peserta and id_kategori=3 ) as hasil_tkp')
        ->from('tb_lembar_soal')
        ->where(['id_peserta'=> $peserta->kode_peserta, 'status' => 1])
        ->groupBy('tipe_tryout', 'kesempatan')
        ->get();

        //parsing data dari controller ke views
        $params = [
            'title' => 'Hasil Tryout SKD',
            'peserta'  => $peserta,
            'hasil' => $hasil
        ];
        
        // JIKA YANG TAMPIL HANYA YANG SUDAH MENGERJAKAN
        if ($peserta->status == 0) {
            return redirect('/tryout')->with('error', 'Anda Harus Mengerjakan Terlebih Dahulu');
        }

        //return ke views
        return view('peserta/tryout.hasil', $params);
    }

    public function cetakHasil()
    {
        //mengambil data session
        $session = Session::get('peserta');
        //mengambil data peserta berdasarkan session
        $peserta = ModelPeserta::where('username', $session)->first();

        //mengambil data hasil tryout peserta
        $hasil = ModelLembarSoal::selectRaw('id_peserta')
        ->selectRaw('kesempatan')
        ->selectRaw('tipe_tryout')
        ->selectRaw('sum(nilai) as hasil_total')
        ->selectRaw('(Select sum(nilai)from tb_lembar_soal a JOIN tb_soal ON tb_soal.id_soal = a.id_soal where a.kesempatan = tb_lembar_soal.kesempatan and a.id_peserta=tb_lembar_soal.id_peserta and id_kategori=1 ) as hasil_twk')
        ->selectRaw('(Select sum(nilai)from tb_lembar_soal a JOIN tb_soal ON tb_soal.id_soal = a.id_soal where a.kesempatan = tb_lembar_soal.kesempatan and a.id_peserta=tb_lembar_soal.id_peserta and id_kategori=2 ) as hasil_tiu')
        ->selectRaw('(Select sum(nilai)from tb_lembar_soal a JOIN tb_soal ON tb_soal.id_soal = a.id_soal where a.kesempatan = tb_lembar_soal.kesempatan and a.id_peserta=tb_lembar_soal.id_peserta and id_kategori=3 ) as hasil_tkp')
        ->from('tb_lembar_soal')
        ->where(['id_peserta'=> $peserta->kode_peserta, 'status' => 1])
        ->groupBy('tipe_tryout', 'kesempatan')
        ->get();
        
        //parsing data dari controller
        $params = [
            'peserta'  => $peserta,
            'hasil' => $hasil
        ];

        //proses export html to pdf, buka folder resources/views/peserta/cetak.blade.php untuk template export
        $pdf = PDF::loadview('peserta/tryout.cetak', $params);
        //mengunduh pdf
        return $pdf->download('laporan-hasil-tryout.pdf');
    }

    public function grafik($tipe, $kesempatan)
    {
        //mengambil data session
        $session = Session::get('peserta');
        //mengambil data peserta berdasarkan session
        $peserta = ModelPeserta::where('username', $session)->first();
        //MENGAMBIL DATA NILAI
        $hasil = ModelLembarSoal::selectRaw('id_peserta')
        ->selectRaw('kesempatan')
        ->selectRaw('tipe_tryout')
        ->selectRaw('sum(nilai) as total')
        ->selectRaw('(Select sum(nilai)from tb_lembar_soal a JOIN tb_soal ON tb_soal.id_soal = a.id_soal where a.tipe_tryout = tb_lembar_soal.tipe_tryout and a.kesempatan = tb_lembar_soal.kesempatan and a.id_peserta=tb_lembar_soal.id_peserta and id_kategori=1 ) as twk')
        ->selectRaw('(Select sum(nilai)from tb_lembar_soal a JOIN tb_soal ON tb_soal.id_soal = a.id_soal where a.tipe_tryout = tb_lembar_soal.tipe_tryout and a.kesempatan = tb_lembar_soal.kesempatan and a.id_peserta=tb_lembar_soal.id_peserta and id_kategori=2 ) as tiu')
        ->selectRaw('(Select sum(nilai)from tb_lembar_soal a JOIN tb_soal ON tb_soal.id_soal = a.id_soal where a.tipe_tryout = tb_lembar_soal.tipe_tryout and a.kesempatan = tb_lembar_soal.kesempatan and a.id_peserta=tb_lembar_soal.id_peserta and id_kategori=3 ) as tkp')
        ->from('tb_lembar_soal')
        ->where(['id_peserta'=> $peserta->kode_peserta, 'tipe_tryout' => $tipe, 'kesempatan' => $kesempatan])
        ->first();

        // MENGAMBIL DATA GRAFIK
        $a = ModelLembarSoal::where(['id_peserta'=> $peserta->kode_peserta, 'tipe_tryout' => $tipe, 'kesempatan' => $kesempatan])
                    ->where('id_kategori', 1)
                    ->Where('nilai', 5)
                    ->join('tb_soal', function($query){
                        $query->on('tb_soal.id_soal', '=', 'tb_lembar_soal.id_soal');
                    })->get();
        $b = ModelLembarSoal::where(['id_peserta'=> $peserta->kode_peserta, 'tipe_tryout' => $tipe, 'kesempatan' => $kesempatan])
                    ->where('id_kategori', 2)
                    ->Where('nilai', 5)
                    ->join('tb_soal', function($query){
                        $query->on('tb_soal.id_soal', '=', 'tb_lembar_soal.id_soal');
                    })->get();
        $c = ModelLembarSoal::where(['id_peserta'=> $peserta->kode_peserta, 'tipe_tryout' => $tipe, 'kesempatan' => $kesempatan])
                    ->where('id_kategori', 3)
                    ->Where('nilai', 5)
                    ->join('tb_soal', function($query){
                        $query->on('tb_soal.id_soal', '=', 'tb_lembar_soal.id_soal');
                    })->get();
        $salah = ModelLembarSoal::where(['id_peserta'=> $peserta->kode_peserta, 'tipe_tryout' => $tipe, 'kesempatan' => $kesempatan])
                    ->where('nilai', 0)
                    ->where('jawaban', 'not like', '%null%')
                    ->get();
        $kosong = ModelLembarSoal::where('jawaban', 'like', '%null%')
                    ->Where(['id_peserta'=> $peserta->kode_peserta, 'tipe_tryout' => $tipe, 'kesempatan' => $kesempatan])
                    ->get();

        //parsing data dari controller ke views
        $params = [
            'title' => 'Detail Hasil Tryout',
            'peserta' => $peserta,
            'hasil' => $hasil,
            'a' => $a,
            'b' => $b,
            'c' => $c,
            'salah' => $salah,
            'kosong' => $kosong
        ];

        //return ke views
        return view('peserta/tryout.grafik', $params);
    }

    public function ranking()
    {
        //mengambil data lembar soal yang sudah dikerjakan untuk diurutkan menjadi ranking
        $rank = ModelLembarSoal::selectRaw('id_peserta')
                ->selectRaw('tipe_tryout')
                ->selectRaw('kesempatan')
                ->selectRaw('sum(nilai) as hasil_total')
                ->selectRaw('(Select sum(nilai)from tb_lembar_soal a JOIN tb_soal ON tb_soal.id_soal = a.id_soal where a.tipe_tryout = tb_lembar_soal.tipe_tryout and a.kesempatan = tb_lembar_soal.kesempatan and a.id_peserta=tb_lembar_soal.id_peserta and id_kategori=1) as hasil_twk')
                ->selectRaw('(Select sum(nilai)from tb_lembar_soal a JOIN tb_soal ON tb_soal.id_soal = a.id_soal where a.tipe_tryout = tb_lembar_soal.tipe_tryout and a.kesempatan = tb_lembar_soal.kesempatan and a.id_peserta=tb_lembar_soal.id_peserta and id_kategori=2) as hasil_tiu')
                ->selectRaw('(Select sum(nilai)from tb_lembar_soal a JOIN tb_soal ON tb_soal.id_soal = a.id_soal where a.tipe_tryout = tb_lembar_soal.tipe_tryout and a.kesempatan = tb_lembar_soal.kesempatan and a.id_peserta=tb_lembar_soal.id_peserta and id_kategori=3) as hasil_tkp')
                ->from('tb_lembar_soal')
                ->where('status', 1)
                ->groupBy('id_peserta', 'kesempatan', 'tipe_tryout')
                ->orderBy('hasil_total', 'DESC')
                ->get();
        
        //parsing data dari controller ke voews
        $params = [
            'title' => 'Ranking Tryout SKD',
            'data'  => $rank
        ];

        //return ke views
        return view('peserta/tryout.ranking', $params);
    }

    public function cetakRanking()
    {
        //proses export rankinf html to excel ada di folder app/Export/RankingExport.php
        return Excel::download(new RankingExport, 'rankingTryout.xlsx');
    }

    public function pembahasan($tipe, $kesempatan)
    {
        //mengambil data session
        $session = Session::get('peserta');
        //mengambil data peserta berdasarkan session
        $peserta = ModelPeserta::where('username', $session)->first();

        //mengambil data lembar soal untuk dijadikan index penomoran
        $page   = ModelLembarSoal::where(['id_peserta'=> $peserta->kode_peserta, 'tipe_tryout' => $tipe, 'kesempatan' => $kesempatan])->get();
        //mengambil data lembar soal untuk dijadikan pembahasan
        $data = ModelLembarSoal::where(['id_peserta'=> $peserta->kode_peserta, 'tipe_tryout' => $tipe, 'kesempatan' => $kesempatan])
                    ->join('tb_soal', function($query){
                        $query->on('tb_soal.id_soal', '=', 'tb_lembar_soal.id_soal');
                    })->paginate(1);
        
        //parsing data dari controller ke views
        $params = [
            'title' => 'Pembahasan Tryout',
            'data' => $data,
            'page' => $page
        ];

        //return ke views
        return view('peserta/tryout.pembahasan', $params);
    }
}
