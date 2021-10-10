<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ModelResetPassword extends Model
{
    protected $table = 'tb_reset_password';
    public $timestamps = FALSE;
}
