<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('presensi', function (Blueprint $table) {
            $table->id();
            $table->integer('tipe', ['1','2']);
            $table->string('foto');
            $table->string('koordinat');
            $table->string('keterangan');
            $table->timestamps();
            $table->integer('created_by');
            $table->integer('updated_by');
            $table->time('waktu_presensi');
            $table->time('waktu_masuk');
            $table->time('waktu_keluar');
            $table->string('terlambat');
            $table->string('lebih_awal');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('presensi');
    }
};
