<?php

namespace App\Http\Controllers\Peserta;

use App\Http\Controllers\Controller;
use App\ModelPeserta;
use App\ModelResetPassword;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class ResetController extends Controller
{
    public function index()
    {
        //return ke views
        return view('peserta.resetPassword');
    }

    public function postMailReset(Request $request)
    {
        //validasi inputan kosong
        $request->validate([
            'email' => 'required'
        ]);

        //generate token
        $token = sha1(time());

        //proses input data
        $data = new ModelResetPassword();
        $data->email = $request->input('email');
        $data->token = $token;
        $data->save();

        //proses mengirim email reset password ke peserta
        Mail::send('peserta.resetMail', ['token' => $token, 'url' => url('/gantiPassword'.'/'.$token)], function($message) use($request){
            $message->to($request->input('email'));
            $message->subject('Reset Password');
        });

        //return kembali
        return back()->with('message', 'Tautan untuk reset password sudah dikirim, silahkan cek email anda!');
    }

    public function resetPasswordForm($token) {
        //mengambil data berdasarkan token yang dikirim dari route
        $data = ModelResetPassword::where('token', $token)->first();

        //return ke views
        return view('peserta.gantiPassword', ['token' => $token, 'data' => $data]);
    }

    public function submitResetPasswordForm(Request $request)
    {
        //validasi inputan kosong
        $request->validate([
            'email' => 'required',
            'password' => 'required|required_with:konfirPassword|same:konfirPassword',
            'konfirPassword' => 'required'
        ]);

        //mengambil data peserta
        $updatePassword = ModelResetPassword::where(['email' => $request->input('email'), 'token' => $request->input('token')])->first();

        //validasi jika token tidak sesuai
        if(!$updatePassword){
            return back()->withInput()->with('error', 'Token Tidak Valid!');
        } 

        //update password peserta
        $peserta = ModelPeserta::where('email', $request->input('email'))->first();
        $peserta->password = $request->input('password');
        $peserta->save();

        //menghapus data di table reset password
        ModelResetPassword::where(['email'=> $request->email])->delete();

        //return ke halaman login
        return redirect('/login')->with('success', 'Password anda telah diganti, silahkan login kembali');

    }
}
