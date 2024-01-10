<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Data;
use App\Models\User;
use Carbon\Carbon;


class layoutController extends Controller
{
    public function index()
    {
        // Mendapatkan nilai bulan sekarang
        $currentMonth = Carbon::now()->month;

        // Mengambil semua nilai 1 dan 2 pada kolom 'tipe' di bulan ini
        $totalTypeOnes = Data::whereIn('tipe', [1, 2])
        ->whereMonth('created_at', $currentMonth)
        ->count();


        // Hitung total user pada bulan ini yang memiliki presensi tipe 1
        $totalUsersWithPresensiTypeOne = User::whereExists(function ($query) use ($currentMonth) {
            $query->select(DB::raw(1))
                ->from('presensi')
                ->whereRaw('users.id = presensi.created_by')
                ->where('tipe', 1)
                ->whereMonth('created_at', $currentMonth);
        })
        ->where('kodeakses', '!=', 1) // Menambahkan kondisi kodeakses tidak sama dengan 1
        ->count();

        // Hitung rata-rata dalam persentase berdasarkan jumlah user yang melakukan presensi tipe 1 dan jumlah hari dalam bulan ini
        $averagePercentage = $totalTypeOnes != 0 ? ($totalTypeOnes / User::where('kodeakses', '!=', 1)->count()) * (100 / Carbon::now()->daysInMonth) : 0;



        // Mengecek nama-nama user yang tidak melakukan presensi hari ini dengan kodeakses 1
        $usersWithoutPresensi = User::whereNotExists(function ($query) use ($currentMonth) {
            $query->select(DB::raw(1))
                ->from('presensi')
                ->whereRaw('users.id = presensi.created_by')
                ->where('tipe', 1)
                ->whereDate('created_at', Carbon::today()) // Menambahkan kondisi created_at pada hari ini
                ->whereMonth('created_at', $currentMonth);
        })
        ->where('kodeakses', '!=', 1) // Menambahkan kondisi kodeakses tidak sama dengan 1
        ->pluck('name'); // Mengambil nama-nama user yang tidak melakukan presensi hari ini
        
        // Hitung jumlah user yang tidak melakukan presensi hari ini
        $usersWithoutPresensiCount = $usersWithoutPresensi->count();

        // Pass data ke view
        return view('content.dashboard', compact('totalTypeOnes', 'averagePercentage', 'usersWithoutPresensi', 'usersWithoutPresensiCount'));
    }

    public function user()
    {
        $userId = Auth::id();

        // Set bulan dan tahun yang diinginkan
        $bulanSekarang = now()->month;
        $tahunSekarang = now()->year;

        // Mengambil total presensi masuk (tipe 1) dari relasi dengan users
        $totalPresensiMasuk = Data::where('created_by', $userId)
            ->whereMonth('created_at', $bulanSekarang)
            ->whereYear('created_at', $tahunSekarang)
            ->where('tipe', 1)
            ->count();

        // Mengambil total presensi keluar (tipe 2) dari relasi dengan users
        $totalPresensiKeluar = Data::where('created_by', $userId)
            ->whereMonth('created_at', $bulanSekarang)
            ->whereYear('created_at', $tahunSekarang)
            ->where('tipe', 2)
            ->count();

        // Menghitung rata-rata persentase presensi dari 100%
        $jumlahBulan = 1; // Misalnya, kita ingin menghitung rata-rata selama 3 bulan
        $rataRataPersentaseMasuk = ($totalPresensiMasuk / ($jumlahBulan * 30)) * 100; // Menggunakan asumsi 30 hari per bulan
        $rataRataPersentaseKeluar = ($totalPresensiKeluar / ($jumlahBulan * 30)) * 100;

        $presensiMasukHariIni = Data::where('created_by', $userId)
            ->whereDate('created_at', now())
            ->where('tipe', 1)
            ->first();

        $presensiKeluarHariIni = Data::where('created_by', $userId)
            ->whereDate('created_at', now())
            ->where('tipe', 2)
            ->first();

        return view('halamanpegawai.dashboardpegawai', compact('presensiMasukHariIni', 'presensiKeluarHariIni', 'rataRataPersentaseMasuk', 'rataRataPersentaseKeluar'));

    }
}
