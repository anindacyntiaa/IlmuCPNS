<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Support\Facades\Route;


// Routing untuk Peserta
Route::get('/login', 'Peserta\LoginController@index');
Route::get('/daftar', 'Peserta\LoginController@daftar');
Route::post('/postDaftar', 'Peserta\LoginController@aksi_daftar');
Route::post('/postLogin', 'Peserta\LoginController@aksi_login');
Route::get('/logout', 'Peserta\LoginController@logout');

Route::get('/verifikasi', 'Peserta\VerifikasiController@index');
Route::get('/resend', 'Peserta\VerifikasiController@resend');
Route::post('/resendVerifikasi', 'Peserta\VerifikasiController@resendVerifikasi');
Route::post('/postVerifikasi', 'Peserta\VerifikasiController@postVerifikasi');

Route::get('/reset', 'Peserta\ResetController@index');
Route::post('/postReset', 'Peserta\ResetController@postMailReset');
Route::get('/gantiPassword/{token}', 'Peserta\ResetController@resetPasswordForm');
Route::post('/postGantiPassword', 'Peserta\ResetController@submitResetPasswordForm');

Route::middleware('PesertaLogin')->group(function(){
    Route::get('/', 'Peserta\BerandaController@index');
    Route::get('/informasi/{id}', 'Peserta\BerandaController@informasi');

    Route::prefix('akun')->group(function(){
        Route::get('/', 'Peserta\AkunController@index');
        Route::put('/aksi_ubah/{kode}', 'Peserta\AkunController@aksi_ubah');
        Route::put('/ubah_pass/{kode}', 'Peserta\AkunController@ubah_pass');
    });

    Route::prefix('materi')->group(function(){
        Route::get('/TWK', 'Peserta\MateriController@twk');
        Route::get('/TIU', 'Peserta\MateriController@tiu');
        Route::get('/TKP', 'Peserta\MateriController@tkp');
        Route::get('/lihatMateri/{id}', 'Peserta\MateriController@lihatMateri');
    });

    Route::prefix('soal')->group(function(){
        Route::get('/TWK', 'Peserta\SoalController@twk');
        Route::get('/TIU', 'Peserta\SoalController@tiu');
        Route::get('/TKP', 'Peserta\SoalController@tkp');
    });

    Route::prefix('tryout')->group(function(){
        Route::get('/', 'Peserta\TryoutController@index');
        Route::get('/index', 'Peserta\TryoutController@tryout');
        Route::post('/cekJawaban', 'Peserta\TryoutController@cekJawaban');
        Route::get('/konfirmasi', 'Peserta\TryoutController@konfirmasi');
        Route::post('/postKonfirmasi', 'Peserta\TryoutController@postKonfirmasi');
        Route::get('/hasil', 'Peserta\TryoutController@hasil');
        Route::get('/grafik/{tipe}/{kesempatan}', 'Peserta\TryoutController@grafik');
        Route::get('/ranking', 'Peserta\TryoutController@ranking');
        Route::get('/cetak', 'Peserta\TryoutController@cetakHasil');
        Route::get('/pembahasan/{tipe}/{kesempatan}', 'Peserta\TryoutController@pembahasan');
        Route::get('/cetakRanking', 'Peserta\TryoutController@cetakRanking');
    });

    Route::prefix('olahLembarSoal')->group(function(){
        Route::get('/aksi_tambah', 'Admin\LembarSoalController@aksi_tambah');
    });
});



// Routing untuk Admin
Route::prefix('admin')->group(function(){
    Route::get('/login', 'Admin\LoginController@index');
    Route::post('/postLogin', 'Admin\LoginController@postLogin');
    Route::get('/logout', 'Admin\LoginController@logout');
    Route::middleware('AdminLogin')->group(function(){
        Route::get('/', 'Admin\BerandaController@index');

        Route::prefix('olahAdmin')->group(function(){
            Route::get('/index', 'Admin\AdminController@index');
            Route::get('/tambah', 'Admin\AdminController@tambah');
            Route::post('/aksi_tambah', 'Admin\AdminController@aksi_tambah');
            Route::get('/edit/{id}', 'Admin\AdminController@edit');
            Route::put('/aksi_ubah/{id}', 'Admin\AdminController@aksi_ubah');
            Route::post('/hapus/{id}', 'Admin\AdminController@aksi_hapus');
        });

        Route::prefix('olahPeserta')->group(function(){
            Route::get('/index', 'Admin\PesertaController@index');
            Route::get('/tambah', 'Admin\PesertaController@tambah');
            Route::post('/aksi_tambah', 'Admin\PesertaController@aksi_tambah');
            Route::get('/edit/{id}', 'Admin\PesertaController@edit');
            Route::put('/aksi_ubah/{id}', 'Admin\PesertaController@aksi_ubah');
            Route::post('/hapus/{id}', 'Admin\PesertaController@aksi_hapus');
        });

        Route::prefix('olahPremium')->group(function(){
            Route::get('/index', 'Admin\PremiumController@index');
            Route::post('/aksi_tambah', 'Admin\PremiumController@aksi_tambah');
            Route::put('/aksi_ubah/{id}', 'Admin\PremiumController@aksi_ubah');
            Route::put('/tambahPaket/{id}', 'Admin\PremiumController@tambahPaket');
            Route::post('/hapus/{id}', 'Admin\PremiumController@aksi_hapus');
        });
    
        Route::prefix('olahKategori')->group(function(){
            Route::get('/index', 'Admin\KategoriController@index');
            Route::get('/tambah', 'Admin\KategoriController@tambah');
            Route::post('/aksi_tambah', 'Admin\KategoriController@aksi_tambah');
            Route::get('/edit/{id}', 'Admin\KategoriController@edit');
            Route::put('/aksi_ubah/{id}', 'Admin\KategoriController@aksi_ubah');
            Route::post('/hapus/{id}', 'Admin\KategoriController@aksi_hapus');
        });
    
        Route::prefix('olahMateri')->group(function(){
            Route::get('/index', 'Admin\MateriController@index');
            Route::post('/aksi_tambah', 'Admin\MateriController@aksi_tambah');
            Route::get('/edit/{id}', 'Admin\MateriController@edit');
            Route::put('/aksi_ubah/{id}', 'Admin\MateriController@aksi_ubah');
            Route::post('/hapus/{id}', 'Admin\MateriController@aksi_hapus');
        });
        Route::prefix('olahInformasi')->group(function(){
            Route::get('/index', 'Admin\InformasiController@index');
            Route::post('/aksi_tambah', 'Admin\InformasiController@aksi_tambah');
            Route::get('/edit/{id}', 'Admin\InformasiController@edit');
            Route::put('/aksi_ubah/{id}', 'Admin\InformasiController@aksi_ubah');
            Route::post('/hapus/{id}', 'Admin\InformasiController@aksi_hapus');
        });
        Route::prefix('olahSoal')->group(function(){
            Route::get('/index', 'Admin\SoalController@index');
            Route::get('/tambah', 'Admin\SoalController@tambah');
            Route::get('/contoh', 'Admin\SoalController@contoh');
            Route::post('/tambahFile', 'Admin\SoalController@tambahFile');
            Route::post('/aksi_tambah', 'Admin\SoalController@aksi_tambah');
            Route::get('/edit/{id}', 'Admin\SoalController@edit');
            Route::put('/aksi_ubah/{id}', 'Admin\SoalController@aksi_ubah');
            Route::post('/hapus/{id}', 'Admin\SoalController@aksi_hapus');
        });
        Route::prefix('olahHasilUjian')->group(function(){
            Route::get('/index', 'Admin\HasilUjianController@index');
        });
    });
});
