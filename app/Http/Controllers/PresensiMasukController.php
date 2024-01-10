<?php

namespace App\Http\Controllers;
use App\Models\User;
use App\Models\Data;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;

use Illuminate\Http\Request;

class PresensiMasukController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $presensi = Data::all();
        return view('halamanpegawai.presensimasuk', compact('presensi'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // Check if latitude and longitude are provided, if not, set default values
        $latitude = $request->latitude ?? 0.0;
        $longitude = $request->longitude ?? 0.0;

        $user = Auth::user(); // Get the currently authenticated user
        
        $data = [
            'tipe' => $request->tipe ?? 1,
            'koordinat' => $request->latitude.','.$request->longitude,
            'keterangan' => $request->keterangan,
            'waktu_presensi' => now(),
            'waktu_masuk' => $request->waktu_masuk ?? '08:00:00', 
            'waktu_keluar' => $request->waktu_keluar ?? '17:00:00',
            'terlambat' => $request->terlambat,
            'lebih_awal' => $request->lebih_awal,
            'created_by' => $user->id, //berelasi dengan ID user
            'created_at' => now(),
            'updated_at' => now(),
        ];

        // Check if user has already done presensi today
            $user = Auth::user();
            $now = now();
            $todayStart = $now->copy()->startOfDay()->addHours(8); // Set waktu awal hari ke jam 8 pagi
            $todayEnd = $now->copy()->endOfDay(); // Set waktu akhir hari
            $presensiLimit = $now->copy()->startOfDay()->addHours(12); // Batas waktu presensi sampai jam 12.00

            // Periksa apakah waktu saat ini setelah jam 8 pagi dan sebelum jam 12.00
            if ($now->lt($todayStart) || $now->gt($presensiLimit)) {
                return redirect()->back()->with('error', 'Presensi Masuk hanya dapat dilakukan antara jam 8 pagi sampai 12.00.');
            }

            // Mengurangkan $todayStart dengan waktu awal hari pada jam 8 pagi dan mengonversi hasilnya dalam menit
            $waktuPresensi = $now->diffInMinutes($todayStart);

            $existingPresensi = Data::where('created_by', $user->id)
                ->whereBetween('created_at', [$todayStart, $todayEnd])
                ->exists();

            if ($existingPresensi) {
                // Jika presensi telah dilakukan hari ini
                return redirect()->back()->with('error', 'Anda sudah melakukan presensi Masuk hari ini.');
            }

            // Hitung waktu keterlambatan
            $terlambat = max(0, $waktuPresensi); // Keterlambatan dihitung dari selisih waktu, minimal 0

            // Presensi belum dilakukan hari ini, lanjutkan dengan membuat presensi baru
            $data['created_by'] = $user->id;
            $data['terlambat'] = $terlambat; // Simpan waktu keterlambatan ke dalam kolom terlambat
            Data::create($data);

            return redirect()->to('home/pegawai/presensimasuk')->with('success', 'Berhasil Melakukan Presensi. Terlambat: ' . $waktuPresensi . ' menit.');

    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
