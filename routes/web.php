<?php

use App\Http\Controllers\DatakehadiranController;
use App\Http\Controllers\DatapegawaiController;
use App\Http\Controllers\layoutController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\PresensiController;
use App\Http\Controllers\PresensiKeluarController;
use App\Http\Controllers\PresensiMasukController;
use App\Http\Controllers\ProfileAdminController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\RiwayatController;
use App\Http\Controllers\RiwayatpegawaiController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::middleware((['guest']))->group(function(){
    //login
    Route::get('/', [LoginController::class, 'login'])->name('login');
    Route::post('/', [LoginController::class, 'postlogin'])->name('postlogin.login');
});

//agar tidak kembali lagi ke halaman login
Route::get('home/dashboard', function(){
    return redirect('/home/dashboard');
});

// agar tidak bisa loncat halaman
Route::middleware(['auth'])->group(function(){
    // halaman admin
    Route::resource('home/profileadmin', ProfileAdminController::class)->middleware('userAkses:1');

    Route::get('home/dashboard', [layoutController::class, 'index'])->name('index.dashboard')->middleware('userAkses:1');

    Route::get('home/datakehadiran/harian', [DatakehadiranController::class, 'harian'])->name('harian.harian')->middleware('userAkses:1');
    Route::get('home/datakehadiran/bulanan', [DatakehadiranController::class, 'bulanan'])->name('bulanan.bulanan')->middleware('userAkses:1');
    Route::get('home/datakehadiran/rekaptotalbulanan', [DatakehadiranController::class, 'total'])->name('total.total')->middleware('userAkses:1');

    Route::resource('home/datapegawai', DatapegawaiController::class)->middleware('userAkses:1');

    Route::get('home/riwayat', [RiwayatController::class, 'riwayat'])->name('riwayat.riwayat')->middleware('userAkses:1');

    // halaman pegawai
    Route::resource('home/pegawai/profile', ProfileController::class)->middleware('userAkses:8');

    Route::get('home/pegawai/dashboard', [layoutController::class, 'user'])->name('user.dashboardpegawai')->middleware('userAkses:8');

    Route::resource('home/pegawai/presensimasuk', PresensiMasukController::class)->middleware('userAkses:8');

    Route::resource('home/pegawai/presensikeluar', PresensiKeluarController::class)->middleware('userAkses:8');
        
    Route::get('home/pegawai/riwayatpegawai', [RiwayatpegawaiController::class, 'riwayatpegawai'])->name('riwayatpegawai.riwayatpegawai')->middleware('userAkses:8');

    // logout
    Route::get('/logout', [LoginController::class, 'logout'])->name('logout.logout');
});

