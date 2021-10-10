<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ModelLembarSoal extends Model
{
    protected $table = 'tb_lembar_soal';
    protected $primaryKey = 'id_lembar_soal';
    public $timestamps = FALSE;

    //relasi ont to one ke tb_soal
    public function getSoal()
    {
        return $this->hasOne('App\ModelSoal', 'id_soal', 'id_soal');
    }

    //relasi one to one ke tb_peserta
    public function getPeserta()
    {
        return $this->hasOne('App\ModelPeserta', 'kode_peserta', 'id_peserta');
    }
}
