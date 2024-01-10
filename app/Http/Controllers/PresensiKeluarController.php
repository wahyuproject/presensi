<?php

namespace App\Http\Controllers;
use App\Models\User;
use App\Models\Data;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class PresensiKeluarController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $presensi = Data::all();
        return view('halamanpegawai.presensikeluar', compact('presensi'));
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
            'tipe' => $request->tipe ?? 2,
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

            // Cek apakah pengguna mencoba melakukan presensi keluar sebelum pukul 17:00 atau setelah pukul 19:00
            $currentTime = now();
            $presensiKeluarStartTime = now()->setTime(17, 0, 0);
            $presensiKeluarEndTime = now()->setTime(19, 0, 0);

            if ($currentTime < $presensiKeluarStartTime || $currentTime > $presensiKeluarEndTime) {
                // Pengguna mencoba melakukan presensi keluar di luar waktu yang diizinkan, tampilkan pesan error
                return redirect()->back()->with('error', 'Presensi Keluar hanya dapat dilakukan antara pukul 17:00 dan 19:00.');
            }

            // Cek apakah pengguna sudah melakukan presensi hari ini
            $user = Auth::user();
            $todayStart = now()->startOfDay()->addHours(17); // Set waktu awal hari ke jam 17:00
            $todayEnd = now()->endOfDay(); // Set waktu akhir hari

            // Cek apakah pengguna sudah melakukan presensi keluar hari ini
            $existingPresensiKeluar = Data::where('created_by', $user->id)
                ->whereBetween('created_at', [$todayStart, $todayEnd])
                ->where('tipe', '2') 
                ->exists();

            if ($existingPresensiKeluar) {
                // Jika presensi keluar telah dilakukan hari ini
                return redirect()->back()->with('error', 'Anda sudah melakukan presensi Keluar hari ini.');
            }

            // Jika belum, lanjutkan dengan membuat presensi keluar baru
            $data['created_by'] = $user->id;
            $data['tipe'] = '2'; // Set jenis presensi menjadi 'keluar'

            // Hitung selisih waktu dalam menit
            $selisihWaktu = $currentTime->diffInMinutes($presensiKeluarStartTime);

            // Simpan selisih waktu dalam menit di dalam field lebih_awal
            $data['lebih_awal'] = $selisihWaktu;

            Data::create($data);

            return redirect()->to('home/pegawai/presensikeluar')->with('success', 'Berhasil Melakukan Presensi Keluar. Terlambat: ' . $selisihWaktu . ' menit.');

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
