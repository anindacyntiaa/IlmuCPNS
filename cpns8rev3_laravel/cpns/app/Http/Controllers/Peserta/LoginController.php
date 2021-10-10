<?php

namespace App\Http\Controllers\Peserta;

use App\Http\Controllers\Controller;
use App\ModelPeserta;
use App\ModelVerifikasi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;

class LoginController extends Controller
{
    public function index()
    {
        //return ke views
        return view('peserta.login');
    }

    public function daftar()
    {
        //return ke views
        return view('peserta.daftar');
    }

    public function aksi_daftar(Request $request)
    {
        //validasi inputan kosong
        $request->validate([
            'username' => 'required|unique:tb_peserta,username',
            'nama_peserta' => 'required',
            'email' => 'required|unique:tb_peserta,email',
            'no_hp' => 'required',
            'alamat' => 'required',
            'tgl_lahir' => 'required',
            'tempat_lahir' => 'required',
            'password' => 'required'
        ]);
            
        //proses input data
        $data = new ModelPeserta();
        $data->username = $request->input('username');
        $data->nama_peserta = $request->input('nama_peserta');
        $data->email = $request->input('email');
        $data->no_hp = $request->input('no_hp');
        $data->alamat = $request->input('alamat');
        $data->tipe_peserta = "free";
        $data->tgl_lahir = $request->input('tgl_lahir');
        //kesemptan di setting 2 untuk tipe peserta free
        $data->kesempatan = 2;
        $data->sisa_kesempatan = 2;
        $data->tempat_lahir = $request->input('tempat_lahir');
        $data->password = $request->input('password');
        $data->save();

        //membuat kode otp random
        $kodeOtp = rand(100000,999999);
        //menambahkan email dan kode otp ke tabel veridikasi
        $verifikasi = new ModelVerifikasi();
        $verifikasi->email = $request->input('email');
        $verifikasi->kode_otp =$kodeOtp;
        $verifikasi->save();

        //mengirim email ke peserta baru untuk melakukan verifikasi kode otp
        Mail::send('peserta/verifikasi.verifikasiMail', ['kodeOtp' => $kodeOtp], function($message) use($request){
            $message->to($request->input('email'));
            $message->subject('Verifikasi Email');
        });

        //return ke route dengan pesan message
        return redirect('/verifikasi')->with('message', 'Anda Sudah Mendaftar, Silahkan Cek Email dan Masukkan Kode OTP');
    }

    public function aksi_login(Request $request)
    {
        //validasi inputan kosong
        $request->validate([
            'username' => 'required',
            'password' => 'required'
        ]);

        //menvari data peserta berdasarkan username
        $data = ModelPeserta::where('username', $request->input('username'))->first();

        //pengecekan apakah peserta ada didalam databse
        if (!empty($data)) {
            //pengecekan apakah data sesuai dengan yang diinputkan
            if ($data['username'] == $request->input('username') && $data['password'] == $request->input('password')) {
                //pengecekan apakah peserta sudah melakukan verifikasi
                if ($data['verified'] == 0) {
                    return redirect('/login')->with('error', 'Anda Belum Melakukan Verifikasi Akun');
                }
                //menyimpan session
                $request->session()->put('peserta', $request->input('username'));
                //return ke route
                return redirect('/');
            }else{
                //return ke route dengan pesan error
                return redirect('/login')->with('error', 'Username/Password anda salah');
            }
        }else{
            //return ke route dengan pesan erroe
            return redirect('/login')->with('error', 'Username/Password anda salah');
        }
    }

    public function logout(Request $request)
    {
        //menghapus data session
        $request->session()->forget('peserta');
        //return ke route
        return redirect('/login');
    }
}
