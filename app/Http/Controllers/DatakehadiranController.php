<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use App\Models\Data;
use App\Models\User;
use App\Models\DummyData;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;



class DatakehadiranController extends Controller
{
    public function harian(Request $request)
    {
        // Check if a search has been initiated
        $isSearch = false;

        // Fetch data from the 'presensi' table
        $query = Data::query();

        // Join with the 'users' table using the 'created_by' relationship
        $query->join('users', 'presensi.created_by', '=', 'users.id');

        $searchDate = $request->input('searchDate');

        if ($searchDate) {
            $query->whereDate('presensi.created_at', '=', Carbon::parse($searchDate)->format('Y-m-d'));
            $isSearch = true;
        }

        $searchPreviousMonth = $request->input('searchPreviousMonth');
        if ($searchPreviousMonth) {
            $query->whereMonth('presensi.created_at', '=', Carbon::now()->subMonth()->format('m'));
            $isSearch = true;
        }

        // Tambahan kondisi untuk tipe 1 dan tipe 2
        $query->where(function($query) {
            $query->where('presensi.tipe', '=', 1)
                ->orWhere('presensi.tipe', '=', 2);
        });


        // Get the filtered data only if a search has been performed
        $filteredData = $isSearch ? $query->orderBy('presensi.created_at')->get()->toArray() : [];

        // Send data to the view
        return view('content.harian', compact('filteredData', 'searchDate'));
    }

    public function bulanan(Request $request)
    {
        // Get the selected month and name from the request
        $selectedBulan = $request->input('bulan');
        $selectedNama = $request->input('nama');

        // Inisialisasi variabel untuk mengecek apakah pencarian telah dilakukan
        $isSearch = false;

        // Query to retrieve presensi data with the specified conditions
        $presensiData = DB::table('presensi')
            ->join('users', 'presensi.created_by', '=', 'users.id')
            ->select('presensi.created_by', 'users.name as name', 'presensi.created_at', 'presensi.waktu_presensi', 'presensi.keterangan', 'presensi.tipe')
            ->when($selectedBulan, function ($query) use ($selectedBulan, &$isSearch) {
                $isSearch = true; // Pencarian telah dilakukan
                return $query->whereYear('presensi.created_at', '=', Carbon::parse($selectedBulan)->year)
                    ->whereMonth('presensi.created_at', '=', Carbon::parse($selectedBulan)->month);
            })
            ->when($selectedNama, function ($query) use ($selectedNama, &$isSearch) {
                $isSearch = true; // Pencarian telah dilakukan
                return $query->where('users.name', '=', $selectedNama);
            })
            ->when($isSearch, function ($query) {
                // Tambahan kondisi untuk tipe 1 dan tipe 2
                return $query->where(function ($query) {
                    $query->where('presensi.tipe', '=', 1)
                        ->orWhere('presensi.tipe', '=', 2);
                });
            })
            ->orderBy('presensi.created_at') // Add this line for sorting by the created_at column
            ->get();

        // Format the date using Carbon and add other necessary data
        foreach ($presensiData as $data) {
            $data->formatted_created_at = Carbon::parse($data->created_at)->locale('id')->isoFormat('LL');
            // Anda dapat menambahkan lebih banyak pemformatan atau informasi tanggal tambahan jika diperlukan
        }

        // Pass the data to the view, tetapi hanya jika pencarian telah dilakukan
        return view('content.bulanan', [
            'filteredData' => $isSearch ? $presensiData : [], // Hanya lewatkan data jika pencarian telah dilakukan
            'selectedNama' => $selectedNama,
            'users' => User::all(), // Mengasumsikan Anda ingin menampilkan semua pengguna dalam dropdown
        ]);
    }

    public function total(Request $request)
    {
        // Cek apakah ada permintaan pencarian
        if ($request->has('bulan_total')) {
            $selectedBulan = $request->input('bulan_total', date('Y-m'));

            $result = DB::table('users')
                ->select('users.name', DB::raw('SUM(presensi.waktu_presensi - presensi.waktu_masuk) AS total_waktu'))
                ->leftJoin('presensi', 'users.id', '=', 'presensi.created_by')
                ->whereMonth('presensi.created_at', '=', date('m', strtotime($selectedBulan)))
                ->whereYear('presensi.created_at', '=', date('Y', strtotime($selectedBulan)))
                ->groupBy('users.name')
                ->orderBy('users.name', 'ASC')
                ->get();
        } else {
            // Jika tidak ada pencarian, set $result menjadi null atau array kosong
            $result = [];
            $selectedBulan = null; // Opsional: Sesuaikan dengan cara Anda menangani variabel ini di view
        }

        return view('content.total', compact('result', 'selectedBulan'));
    }

}
