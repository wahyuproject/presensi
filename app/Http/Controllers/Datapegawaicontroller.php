<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;

class Datapegawaicontroller extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $users = User::orderBy('name', 'asc')->get(); // Mengambil semua data dari tabel "users" dan mengurutkannya berdasarkan nama secara ascending (A-Z)
        return view('content.datapegawai', compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        // return 'HI';
        // return view('content.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
{
    // Validasi input
    $request->validate([
        'name' => 'required|unique:users',
        'username' => 'required|unique:users',
        'email' => 'required|email|unique:users',
        // Tambahkan aturan validasi lainnya sesuai kebutuhan
    ]);

    // Kode Anda yang sudah ada
    $data = [
        'name' => $request->name,
        'username' => $request->username,
        'email' => $request->email,
        'password' => $request->password,
        'kodeakses' => $request->kodeakses,
        'koordinat' => json_encode(["1", "2"]),
        'waktu_masuk' => $request->waktu_masuk ?? '08:00:00',
        'waktu_keluar' => $request->waktu_keluar ?? '17:00:00',
        'remember_token' => Str::random(60),
        'created_at' => now(),
        'updated_at' => now(),
    ];

    // Buat pengguna
    User::create($data);

    // Tampilkan pesan alert sukses dan redirect
    return redirect()->to('home/datapegawai');
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
        // return 'HI';
        // $data = User::where('id', $id)->first();
        // return redirect()->to('home/data pegawai')->with('data', $data);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        // Validasi data yang diterima dari request
        $request->validate([
            'name' => 'required|string|max:255',
            'username' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'password' => 'nullable|string|min:6|confirmed',
        ]);

        // Temukan pengguna berdasarkan ID
        $data = User::findOrFail($id);

        // Perbarui data pengguna
        $data->name = $request->input('name');
        $data->username = $request->input('username');
        $data->email = $request->input('email');

        // Perbarui password jika diberikan
        if ($request->filled('password')) {
            $data->password = bcrypt($request->input('password'));
        }

        // Simpan perubahan
        $data->save();

        // Redirect kembali
        return redirect()->to('home/datapegawai');
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // return 'HI'. $id;
        User::where('id', $id)->delete();
        return redirect()->to('home/datapegawai');
    }
}
