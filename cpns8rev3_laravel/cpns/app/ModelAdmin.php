<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ModelAdmin extends Model
{
    protected $table = 'tb_admin';
    protected $primaryKey = 'id_admin';
    public $timestamps = FALSE;
}
