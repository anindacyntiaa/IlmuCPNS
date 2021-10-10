<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ModelPeserta extends Model
{

    protected $table = 'tb_peserta';
    protected $primaryKey = 'kode_peserta';
    public $timestamps = FALSE;
}
