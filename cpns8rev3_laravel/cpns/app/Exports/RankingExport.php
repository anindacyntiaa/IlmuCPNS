<?php

namespace App\Exports;

use App\ModelLembarSoal;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class RankingExport implements FromView, ShouldAutoSize, WithStyles
{
    public function styles(Worksheet $sheet)
    {
        //membuat merge and center
        $sheet->mergeCells('A1:I1');
    }

    //proses export html to excel
    public function view(): View
    {
        //mengambil data lembar soal untuk dijadikan ranking
        $data = ModelLembarSoal::selectRaw('id_peserta')
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

        //parsing data ke views
        $params =[
            'data' => $data
        ];

        //return ke views yang akan di export
        return view('peserta/tryout.cetakRanking', $params);
    }
}
