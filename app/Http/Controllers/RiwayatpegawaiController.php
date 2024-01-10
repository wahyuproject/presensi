<?php

namespace App\Http\Controllers;

use App\Models\Data;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class RiwayatpegawaiController extends Controller
{
    public function riwayatPegawai(Request $request)
{
    $user = Auth::user();
    $presensiData = Data::where('created_by', $user->id);

    // Filter berdasarkan bulan jika nilai cari-bulan tidak ada dalam request
    if (!$request->has('cari-bulan')) {
        $presensiData->whereMonth('created_at', Carbon::now()->month);
    } else {
        $cariBulanPegawai = $request->input('cari-bulan');
        $presensiData->whereMonth('created_at', Carbon::parse($cariBulanPegawai)->month);
    }

    // Tambahan kondisi untuk tipe 1 dan tipe 2
    $presensiData->where(function ($query) {
        $query->where('presensi.tipe', '=', 1)
            ->orWhere('presensi.tipe', '=', 2);
    });

    $presensiData = $presensiData->get();

    // Pemformatan tanggal di sini
    foreach ($presensiData as $presensi) {
        $presensi->formatted_created_at = Carbon::parse($presensi->created_at)->format('d F Y');
        // Anda dapat menambahkan kolom lain untuk diformat di sini
    }

    return view('halamanpegawai.riwayatpegawai', compact('presensiData'));
}

}

