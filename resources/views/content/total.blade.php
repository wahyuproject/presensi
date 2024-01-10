@extends('layouts.index')

@section('konten')
<div class="main-panel">
    <div class="content-wrapper">
      <div class="page-header">
        <h3 class="page-title">
          <span class="page-title-icon bg-gradient-primary text-white me-2">
            <i class="mdi mdi-crosshairs-gps menu-icon"></i>
          </span>Home <i class="mdi mdi-chevron-right"></i> Data Kehadiran <i class="mdi mdi-chevron-right"></i> Kehadiran Total Pegawai
          <ol class="ps-5">
            Fitur ini digunakan untuk mengetahui Total Jam Kerja Pegawai Per Bulan.
          </ol>
        </h3>
      </div>

      <!-- Input Pencarian Nama berdasarkan Bulan -->
  <div class="row">
    <div class="col-12 grid-margin">
      <div class="card">
        <div class="card-body">
          <div class="table-responsive">
            <h5><i class="mdi mdi-filter mdi-24px"></i> Filter</h5>
            <form action="{{ route('total.total') }}" method="get" id="search-form-total">
              <div class="d-flex mb-4 col-8">
                  <input type="month" class="form-control" id="bulan-cari-total" name="bulan_total" max="{{ date('Y-m') }}" value="{{ $selectedBulanTotal ?? date('Y-m') }}">
                  <button type="submit" id="search-button-total" class="btn-sm"><i class="mdi mdi-filter mdi-24px"></i> Terapkan</button>
                  <button type="button" id="print-button" class="btn-sm"><i class="mdi mdi-printer mdi-24px"></i> Cetak</button>
              </div>
            </form>
            <table id="example" class="table table-striped" style="width:100%">
              <thead>
                  <tr>
                      <th class="col-2">No</th>
                      <th>Nama</th>
                      <th>Total Jam Kerja</th>
                  </tr>
              </thead>
              <tbody>
                  @php
                      $nomor = 1;
                  @endphp
                  @foreach ($result as $data)
                  <tr>
                      <td>{{ $nomor++ }}</td>
                      <td>{{ $data->name }}</td>
                      <td>{{ $data->total_waktu }} jam</td>
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
        const searchBulanTotal = document.getElementById('bulan-cari-total');
        const storedBulanTotal = localStorage.getItem('selectedBulanTotal');
  
        // If there's a stored value, use it; otherwise, set the default to the current month
        searchBulanTotal.value = storedBulanTotal || getCurrentMonth();
  
        // Update the stored value when the input changes
        searchBulanTotal.addEventListener('change', function() {
            localStorage.setItem('selectedBulanTotal', searchBulanTotal.value);
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
    printWindow.document.write('<html><head><title>Cetak Rekap Total Jam Kerja Bulanan</title>');
    printWindow.document.write('<style>');
    printWindow.document.write('table { border-collapse: collapse; width: 100%; }'); // Mengatur garis tabel
    printWindow.document.write('th, td { border: 1px solid #000; padding: 8px; text-align: left; }'); // Mengatur garis dan padding sel
    printWindow.document.write('h2, h4 { text-align: center; }'); // Memusatkan judul
    printWindow.document.write('#logo { position: absolute; top: 20px; left: 20px; max-width: 100px; max-height: 100px; }'); // Menentukan posisi dan ukuran logo
    printWindow.document.write('</style>');
    printWindow.document.write('</head><body>');
    
    // Tambahkan logo di sudut kiri atas
    printWindow.document.write('<img id="logo" src="{{ asset('assets/images/logo-global.jpg') }}" alt="Logo">');

    printWindow.document.write('<h2>Total Jam Kerja Pegawai</h2>');
    printWindow.document.write('<h4>PT. GLOBAL INTERMEDIA NUSANTARA</h4>');
    printWindow.document.write(document.getElementById('example').outerHTML);
    printWindow.document.write('</body></html>');
    printWindow.document.close();
    printWindow.print();
  }
</script>

@endsection