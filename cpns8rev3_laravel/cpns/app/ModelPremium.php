<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ModelPremium extends Model
{
    protected $table = 'tb_premium';
    protected $primaryKey = 'id_premium';
    public $timestamps = FALSE;

    public function getPeserta()
    {
        return $this->hasOne('App\ModelPeserta', 'kode_peserta', 'id_peserta');
    }
    public function getAdmin()
    {
        return $this->hasOne('App\ModelAdmin', 'id_admin', 'id_admin');
    }
}
