<?php

namespace App\Http\Controllers\Peserta;

use App\Http\Controllers\Controller;
use App\ModelPeserta;
use App\ModelVerifikasi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class VerifikasiController extends Controller
{
    public function index()
    {
        //parsing data dari controller ke views
        $params = [
            'title' => 'Verifikasi Email'
        ];

        //return ke views
        return view('peserta/verifikasi.verifikasiEmail', $params);
    }

    public function postVerifikasi(Request $request)
    {
        //validasi inputan kosong
        $request->validate([
            'kodeOtp' => 'required'
        ]);

        //mengambil email peserta berdasarkan kode otp
        $akun = ModelVerifikasi::where('kode_otp', $request->input('kodeOtp'))->first();

        //pengecekan email
        if(!$akun){
            return redirect('/verifikasi')->with('error', 'Kode OTP anda salah');
        }

        //mengambil data peserta berdasarkan email
        $peserta = ModelPeserta::where('email', $akun->email)->first();
        //update peserta menjadi verivied
        $peserta->verified = 1;
        $peserta->save();

        //menghapus data verifikasi
        ModelVerifikasi::where('kode_otp', $request->input('kodeOtp'))->delete();

        //return ke route dengan pesan success
        return redirect('/login')->with('success', 'Akun Anda Telah Diverifikasi, Silahkan Login');
    }

    public function resend()
    {
        //parsing data dari controller ke views
        $params = [
            'title' => 'Resend Verifikasi'
        ];

        //return ke views
        return view('peserta/verifikasi.resendVerifikasi', $params);
    }

    public function resendVerifikasi(Request $request)
    {
        $request->validate([
            'email' => 'required',
        ]);

        $kodeOtp = rand(100000,999999);
        //menambahkan email dan kode otp ke tabel veridikasi
        $verifikasi = new ModelVerifikasi();
        $verifikasi->email = $request->input('email');
        $verifikasi->kode_otp =$kodeOtp;
        $verifikasi->save();

        //mengirim email ke peserta baru untuk melakukan verifikasi kode otp
        Mail::send('peserta/verifikasi.verifikasiMail', ['kodeOtp' => $kodeOtp], function($message) use($request){
            $message->to($request->input('email'));
            $message->subject('Resend Verifikasi Email');
        });

        //return ke route dengan pesan message
        return redirect('/verifikasi')->with('message', 'Kode sudah dikirim ulang, Silahkan Cek Email dan Masukkan Kode OTP');
    }
}
