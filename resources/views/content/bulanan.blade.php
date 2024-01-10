@extends('layouts.index')

@section('konten')  
<div class="main-panel">
    <div class="content-wrapper">
      <div class="page-header">
        <h3 class="page-title">
          <span class="page-title-icon bg-gradient-primary text-white me-2">
            <i class="mdi mdi-crosshairs-gps menu-icon"></i>
          </span>Home <i class="mdi mdi-chevron-right"></i> Data Kehadiran <i class="mdi mdi-chevron-right"></i> Kehadiran Bulanan Pegawai
          <ol class="ps-5">
            Fitur ini digunakan untuk mengetahui Pegawai yang hadir berdasarkan Bulan dan Nama.
          </ol>
        </h3>
      </div>

     <!-- Input Pencarian -->
<div class="row">
  <div class="col-12 grid-margin">
    <div class="card">
      <div class="card-body">
        <div class="table-responsive">
          <h5><i class="mdi mdi-filter mdi-24px"></i> Filter</h5>
          <form action="{{ route('bulanan.bulanan') }}" method="get" id="search-form">
            <div class="d-flex mb-3 col-8">
              <input type="month" class="form-control" id="bulan-cari" name="bulan" max="<?= date('Y-m'); ?>" value="{{ $selectedBulan ?? date('Y-m') }}">
              <select class="form-control" name="nama" id="search-nama">
                <option value="">Pilih Nama</option>
                @foreach ($users->sortBy('name') as $user)
                  <option value="{{ $user->name }}"{{ $selectedNama == $user->name ? ' selected' : '' }}>
                      {{ $user->name }}
                  </option>
                @endforeach            
              </select>
                <button type="submit" id="search-button" class="btn-sm"><i class="mdi mdi-filter mdi-24px"></i> Terapkan</button>
                <button type="button" id="print-button" class="btn-sm"><i class="mdi mdi-printer mdi-24px"></i> Cetak</button>
            </div>
          </form>
        
              <table id="example" class="table table-striped" style="width:100%">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Tanggal</th>
                        <th>Waktu Masuk</th>
                        <th>Waktu Keluar</th>
                        <th>Keterangan</th>
                    </tr>
                </thead>
                <tbody>
                    @php
                    $nomor = 1;
                    @endphp
                    @foreach ($filteredData as $data)
                        <tr>
                            <td>{{ $nomor++ }}</td>
                            <td>{{ $data->formatted_created_at }}</td>
                            <td>
                              @if ($data->tipe == 1)
                                  {{ $data->waktu_presensi }}
                              @endif
                            </td>
                            <td>
                                @if ($data->tipe == 2)
                                    {{ $data->waktu_presensi }}
                                @endif
                            </td>
                              <td>{{ $data->keterangan }}</td>
                        </tr>
                    @endforeach
                </tbody>
              </table>
            
        </div>
      </div>
    </div>
  </div>
      <!-- content-wrapper ends -->
</div>

<script>
  document.addEventListener('DOMContentLoaded', function() {
      const searchBulan = document.getElementById('bulan-cari');
      const storedBulan = localStorage.getItem('selectedBulan');

      // If there's a stored value, use it; otherwise, set the default to the current month
      searchBulan.value = storedBulan || getCurrentMonth();

      // Update the stored value when the input changes
      searchBulan.addEventListener('change', function() {
          localStorage.setItem('selectedBulan', searchBulan.value);
      });

      function getCurrentMonth() {
          const currentDate = new Date();
          const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
          const year = currentDate.getFullYear();
          return `${year}-${month}`;
      }
  });
</script>

<script>
  document.getElementById('print-button').addEventListener('click', function() {
    printTable();
  });

  function printTable() {
    var printWindow = window.open('', '_blank');
    printWindow.document.write('<html><head><title>Cetak Kehadiran Bulanan</title>');
    printWindow.document.write('<style>');
    printWindow.document.write('table { border-collapse: collapse; width: 100%; }'); // Mengatur garis tabel
    printWindow.document.write('th, td { border: 1px solid #000; padding: 8px; text-align: left; }'); // Mengatur garis dan padding sel
    printWindow.document.write('h2, h4 { text-align: center; }'); // Memusatkan judul
    printWindow.document.write('#logo { position: absolute; top: 20px; left: 20px; max-width: 100px; max-height: 100px; }'); // Menentukan posisi dan ukuran logo
    printWindow.document.write('</style>');
    printWindow.document.write('</head><body>');
    
    // Tambahkan logo di sudut kiri atas
    printWindow.document.write('<img id="logo" src="{{ asset('assets/images/logo-global.jpg') }}" alt="Logo">');

    printWindow.document.write('<h2>Kehadiran Bulanan Pegawai</h2>');
    printWindow.document.write('<h4>PT. GLOBAL INTERMEDIA NUSANTARA</h4>');
    printWindow.document.write(document.getElementById('example').outerHTML);
    printWindow.document.write('</body></html>');
    printWindow.document.close();
    printWindow.print();
  }
</script>


@endsection