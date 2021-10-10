<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\ModelAdmin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class LoginController extends Controller
{
    public function index()
    {
        //return ke views
        return view('admin.login');
    }

    public function postLogin(Request $request)
    {
        //validasi inputan yang kosong
        $request->validate([
            'username' => 'required',
            'password' => 'required'
        ]);
        
        //mencari data admin dengan username
        $data = ModelAdmin::where('username', $request->input('username'))->first();

        //pengecekan apa bila data ada di database
        if (!empty($data)) {
            //pengecekan apabila data di database sesuai dengan inputan
            if ($data['username'] == $request->input('username') && $data['password'] == $request->input('password')) {
                //menyimpan session admin
                $request->session()->put('admin', $request->input('username'));
                //return ke route
                return redirect('admin/');
            }else{
                //jika data di database tidak sesuai dengan inputan
                //return ke route
                return redirect('admin/login')->with('error', 'Username/Password anda salah');
            }
        }else{
            //jika data di database tidak ada
            //return ke route
            return redirect('admin/login')->with('error', 'Username/Password anda salah');
        }
    }

    public function logout(Request $request)
    {
        //menghapus session admin
        $request->session()->forget('admin');
        //return ke route
        return redirect('admin/login');
    }
}
