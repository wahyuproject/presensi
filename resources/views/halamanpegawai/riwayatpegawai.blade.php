@extends('halamanpegawai.homepegawai')

@section('konten')

<div class="main-panel">
    <div class="content-wrapper">
      <div class="page-header mb-4">
        <h3 class="page-title">
          <span class="page-title-icon bg-gradient-primary text-white me-2">
            <i class="mdi mdi-crosshairs-gps menu-icon"></i>
          </span>Home <i class="mdi mdi-chevron-right"></i> Riwayat
        </h3>

      </div>
     <!-- Input Pencarian -->
    <div class="container">
         <div class="row">
             <div class="col-12 grid-margin">
                 <div class="card">
                     <div class="card-body">
                        <div class="table-responsive">
                          <h5><i class="mdi mdi-filter mdi-24px"></i> Filter</h5>
                            <form action="{{ route('riwayatpegawai.riwayatpegawai') }}" class="d-flex" method="GET">
                                <div class="d-flex mb-4 col-8">
                                    <input type="month" class="form-control" id="cari-bulan-pegawai" max="<?= date('Y-m'); ?>" name="cari-bulan" value="{{ $selectedBulanInput ?? date('Y-m') }}">
                                    <button type="submit" class="btn-sm" id="search-button"><i class="mdi mdi-filter mdi-24px"></i> Terapkan</button>
                                </div>
                            </form>  
                            <table id="example" class="table table-striped" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Tanggal</th>
                                        <th>Waktu Kehadiran</th>
                                        <th>Terlambat</th>
                                        <th>Keterangan Masuk</th>
                                        <th>Waktu Keluar</th>
                                        <th>Terlambat</th>
                                        <th>Keterangan Keluar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                        $increment = 1; // Inisialisasi nomor increment
                                    @endphp
                                    @foreach ($presensiData as $presensi)
                                        <tr>
                                            <td>{{ $increment++ }}</td>
                                            <td>{{ $presensi->formatted_created_at }}</td>
                                            <td>
                                              @if ($presensi['tipe'] == 1)
                                              {{ $presensi['waktu_presensi'] }}
                                              @endif
                                            </td>
                                            <td>{{ $presensi->terlambat > 0 ? '-' : '' }}{{ $presensi->terlambat }} menit</td>
                                            <td>
                                              @if ($presensi['tipe'] == 1)
                                              {{ $presensi['keterangan'] }}
                                              @endif
                                            </td>
                                            <td>
                                              @if ($presensi['tipe'] == 2)
                                              {{ $presensi['waktu_presensi'] }}
                                              @endif
                                            </td>
                                            <td>{{ $presensi->lebih_awal > 0 ? '+' : '' }}{{ $presensi->lebih_awal }} menit</td>
                                            <td>
                                              @if ($presensi['tipe'] == 2)
                                              {{ $presensi['keterangan'] }}
                                              @endif
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                     </div>
                 </div>
             </div>
         </div>
    </div>
    <!-- content-wrapper ends -->
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
      const cariBulanPegawai  = document.getElementById('cari-bulan-pegawai');
      const selectBulan = localStorage.getItem('selectBulan');
  
      if (selectBulan) {
        cariBulanPegawai.value = selectBulan;
      }
  
      cariBulanPegawai.addEventListener('change', function() {
        localStorage.setItem('selectBulan', cariBulanPegawai.value);
      });
    });
  </script>
    
@endsection