<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class TmpUpload extends Model
{
    use HasFactory;

    protected $table = 'tmp_upload';

    protected $fillable = [
        'id',
        'uuid',
        'nama_file',
        'nama_file_ori',
        'deskripsi',
        'id_user',
        'created_at',
        'updated_at',
        'other',
    ];

    public function setNamaFileOriAttribute($value)
    {
        $this->attributes['nama_file_ori'] = $value;

        // Generate UUID
        $this->attributes['uuid'] = (string) Str::uuid();

        // Generate hash for nama_file based on nama_file_ori
        $this->attributes['nama_file'] = hash('sha256', $value . microtime());
    }
}
