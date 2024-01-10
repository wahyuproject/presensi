<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Data;
use App\Models\User;

class ProfileAdminController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('content.profileadmin');
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
        //
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
        $loggedInUserId = Auth::id();

        // Periksa apakah pengguna yang login sama dengan yang profilnya sedang diupdate
        if ($loggedInUserId != $id) {
            return redirect()->back()->with('error', 'Gagal Melakukan Update Profil.');
        }

        // Temukan pengguna berdasarkan ID
        $user = User::findOrFail($loggedInUserId);

        // Perbarui data pengguna
        $user->name = $request->input('name');
        $user->email = $request->input('email');

        // Perbarui kata sandi jika diberikan
        if ($request->filled('password')) {
            $user->password = bcrypt($request->input('password'));
        }

        // Simpan perubahan
        $user->save();

        // Berhasil memperbarui profil
    return redirect()->to('home/profileadmin')->with('success', 'Berhasil Melakukan Update Profil');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
