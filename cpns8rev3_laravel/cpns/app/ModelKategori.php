<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ModelKategori extends Model
{
    protected $table = 'tb_kategori';
    protected $primaryKey = 'id_kategori';
    public $timestamps = FALSE;
}
