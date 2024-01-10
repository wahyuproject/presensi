@extends('layouts.index')

@section('konten')
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/i18n/jquery-ui-i18n.min.js"></script>
    <script>
      $(function () {
          $("#datepicker").datepicker($.datepicker.regional["id"]);
          $("#datepicker").datepicker("option", "dateFormat", "d MM yy");
      });
    </script>
    
  <div class="main-panel">
    <div class="content-wrapper">
      <div class="page-header">
        <h3 class="page-title">
          <span class="page-title-icon bg-gradient-primary text-white me-2">
            <i class="mdi mdi-crosshairs-gps menu-icon"></i>
          </span>Home <i class="mdi mdi-chevron-right"></i> Data Kehadiran <i class="mdi mdi-chevron-right"></i> Kehadiran Harian Pegawai
          <ol class="ps-5">
            Fitur ini digunakan untuk mengetahui Pegawai yang hadir kemarin, hari ini dan seterusnya.
          </ol>
        </h3>
      </div>

      <!-- Input Pencarian -->
      <div class="row">
        <div class="col-12 grid-margin">
          <div class="card">
              <div class="card-body">
                <div class="table-responsive">
                  <div class=" mb-3">
                    <h5><i class="mdi mdi-filter mdi-24px"></i> Filter</h5>
                    <form method="get" action="{{ route('harian.harian') }}">
                      @csrf
                      <div class="d-flex col-8">
                        <input type="date" class="form-control" id="search-input" name="searchDate" data-date-format="yyyy-MM-dd" max="<?php echo date('Y-m-d'); ?>" value="{{ isset($searchDate) ? $searchDate : date('Y-m-d') }}">
                        <button type="submit" id="search-button" class="btn-sm"><i class="mdi mdi-filter mdi-24px"></i> Terapkan</button>
                        <button type="button" id="print-button" class="btn-sm"><i class="mdi mdi-printer mdi-24px"></i> Cetak</button>
                      </div>
                    </form>
                  </div>

                  <table id="example" class="table table-striped" style="width:100%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama</th>
                            <th>Waktu Masukp</th>
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
                                    <td>{{ $data['name'] }}</td>
                                    <td>
                                      @if ($data['tipe'] == 1)
                                          {{ $data['waktu_presensi'] }}
                                      @endif
                                    </td>
                                    <td>
                                        @if ($data['tipe'] == 2)
                                            {{ $data['waktu_presensi'] }}
                                        @endif
                                    </td>
                                    <td>{{ $data['keterangan'] }}</td>
                                </tr>
                            @endforeach
                        
                    </tbody>
                </table>
                
            </div>
          </div>
        </div>
      </div>
    </div>
      <!-- content-wrapper ends -->
  </div>
    
    <script>
      window.addEventListener('load', function() {
        var inputDateElement = document.getElementById('search-input');
        
        // Cek apakah pengguna telah memilih tanggal
        if (inputDateElement.value === '') {
          // Jika tidak ada tanggal yang dipilih, gunakan tanggal saat ini sebagai nilai default
          var currentDate = new Date();
          var year = currentDate.getFullYear();
          var month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
          var day = currentDate.getDate().toString().padStart(2, '0');
          var today = `${year}-${month}-${day}`;
          
          // Setel nilai input tanggal ke tanggal saat ini
          inputDateElement.value = today;
        }
    
        // Tangani perubahan dalam input tanggal
        inputDateElement.addEventListener('change', function() {
          // Pastikan nilai yang dimasukkan oleh responden tetap sesuai dengan inputan mereka
          if (inputDateElement.checkValidity()) {
            inputDateElement.dataset.value = inputDateElement.value;
          }
        });
      });
    </script>
    
    <script>
      $(document).ready(function() {
        $('#presensi-table').DataTable({
          "paging": true, // Enable pagination
          "lengthChange": true, // Show entries per page
          "searching": true, // Enable search box
          "ordering": true, // Enable column sorting
          "info": true, // Show information about the table
          "autoWidth": false // Disable auto-width
        });
      });
    </script>


<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/i18n/jquery-ui-i18n.min.js"></script>
<script>
  $(function () {
      $("#datepicker").datepicker($.datepicker.regional["id"]);
      $("#datepicker").datepicker("option", "dateFormat", "d MM yy");
  });
</script>

<script>
  document.getElementById('print-button').addEventListener('click', function() {
    printTable();
  });

  function printTable() {
    var printWindow = window.open('', '_blank');
    printWindow.document.write('<html><head><title>Cetak Kehadiran Harian</title>');
    printWindow.document.write('<style>');
    printWindow.document.write('table { border-collapse: collapse; width: 100%; }'); // Mengatur garis tabel
    printWindow.document.write('th, td { border: 1px solid #000; padding: 8px; text-align: left; }'); // Mengatur garis dan padding sel
    printWindow.document.write('h2, h4 { text-align: center; }'); // Memusatkan judul
    printWindow.document.write('#logo { position: absolute; top: 20px; left: 20px; max-width: 100px; max-height: 100px; }'); // Menentukan posisi dan ukuran logo
    printWindow.document.write('</style>');
    printWindow.document.write('</head><body>');
    
    // Tambahkan logo di sudut kiri atas
    printWindow.document.write('<img id="logo" src="{{ asset('assets/images/logo-global.jpg') }}" alt="Logo">');

    printWindow.document.write('<h2>Kehadiran Harian Pegawai</h2>');
    printWindow.document.write('<h4>PT. GLOBAL INTERMEDIA NUSANTARA</h4>');
    printWindow.document.write(document.getElementById('example').outerHTML);
    printWindow.document.write('</body></html>');
    printWindow.document.close();
    printWindow.print();
  }
</script>

@endsection