<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ModelInformasi extends Model
{
    protected $table = 'tb_informasi';
    protected $primaryKey = 'id_informasi';
    public $timestamps = FALSE;
}
