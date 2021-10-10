<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ModelSoal extends Model
{
    protected $table = 'tb_soal';
    protected $primaryKey = 'id_soal';
    protected $fillable = ['id_kategori','tipe_soal','soal', 'j1', 'j2', 'j3', 'j4', 'j5', 'kunci', 'skor', 'pembahasan'];
    public $timestamps = FALSE;

    //relasi ke tb_kategori one to one
    public function getKategori()
    {
        //hasOne adalah relasi one to one dalam eloquent laravel
        return $this->hasOne('App\ModelKategori', 'id_kategori','id_kategori');
    }
}

