<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Data extends Model
{
    public function user()
    {
        return $this->belongsTo(User::class, 'id');
    }

    protected $table = 'presensi';

    protected $fillable = [
        'id',
        'tipe',
        'foto',
        'koordinat',
        'keterangan',
        'created_at',
        'updated_at',
        'created_by',
        'updated_by',
        'waktu_presensi',
        'waktu_masuk',
        'waktu_keluar',
        'terlambat',
        'lebih_awal',
    ];

    // Tidak menggunakan timestamps (created_at dan updated_at)
    public $timestamps = false;
}
