<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use RealRashid\SweetAlert\Facades\Alert;

class LoginController extends Controller
{
    public function login()
    {
        return view('layouts.login.login');
    }
   
    public function postlogin(Request $request)
    {
        $request->validate([
            'username' => 'required',
            'password' => 'required',
        ], [
            'username.required' => 'Username Wajib diisi',
            'password.required' => 'Password Wajib diisi',
        ]);
    
        $infologin = [
            'username' => $request->username,
            'password' => $request->password,
        ];
    
        if (Auth::attempt($infologin)) {
            if (Auth::user()->kodeakses == '1') {
                return redirect('home/dashboard');
            } elseif (Auth::user()->kodeakses == '8') {
                return redirect('home/pegawai/dashboard');
            }
        }
    
        // Authentication attempt failed, display an error message
        return redirect()->back()->withInput()->withErrors(['login' => 'Username atau password salah']);
    }
    

    public function logout()
{
    Auth::logout();

    // Display a SweetAlert success message
    Alert::success('Logout Berhasil', 'Anda telah berhasil logout. Sampai jumpa lagi!');

    return redirect('/');
}
}
