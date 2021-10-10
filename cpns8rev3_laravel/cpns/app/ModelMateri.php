<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ModelMateri extends Model
{
    protected $table = 'tb_materi';
    protected $primaryKey = 'id_materi';
    public $timestamps = FALSE;

    public function getKategori()
    {
        return $this->hasOne('App\ModelKategori', 'id_kategori','id_kategori');
    }
}
