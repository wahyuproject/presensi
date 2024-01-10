@extends('layouts.index')

@section('konten')
<div class="main-panel">
    <div class="content-wrapper">
      <div class="page-header mb-4">
        <h3 class="page-title">
          <span class="page-title-icon bg-gradient-primary text-white me-2">
            <i class="mdi mdi-home"></i>
          </span> Home <i class="mdi mdi-chevron-right"></i> Dashboard
        </h3>
      </div>
      <div class="row">
        <div class="col-md-4 stretch-card grid-margin">
          <div class="card bg-gradient-danger card-img-holder text-white">
            <div class="card-body d-flex align-items-center">
              <i class="mdi mdi-account-multiple mdi-48px" style="padding-right: 10px"></i>
              <div>
                <h4 class="flex-column" style="padding-right: 10px">{{ \App\Models\User::count() }}</h4>
                <h4 class="font-weight-normal d-block"> Jumlah Pegawai</h4>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4 stretch-card grid-margin">
          <div class="card bg-gradient-info card-img-holder text-white">
            <div class="card-body d-flex align-items-center">
              <i class="mdi mdi-chart-line mdi-48px" style="padding-right: 10px"></i>
              <div>
                <h4>{{ number_format($averagePercentage, 2) }}%</h4>
                <h4 class="font-weight-normal mb-3"> Rata-Rata Kehadiran Bulan ini</h4>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4 stretch-card grid-margin">
          <div class="card bg-gradient-success card-img-holder text-white">
            <div class="card-body d-flex align-items-center">
              <i onclick="showAlertIcon()" class="mdi mdi-alert-circle mdi-48px" style="padding-right: 10px; cursor: pointer;"></i>
              <div>
                <h4>{{ $usersWithoutPresensiCount }}</h4>
                <h4 class="font-weight-normal mb-3"> Tidak Berangkat Hari Ini</h4>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- content-wrapper ends -->
</div>

<script>
  // Fungsi untuk menampilkan SweetAlert
  function showAlertIcon() {
      // Mendapatkan nama user yang tidak melakukan presensi
      var usersWithoutPresensi = {!! $usersWithoutPresensi !!};

      // Menampilkan SweetAlert dengan spasi di samping nama-nama
      Swal.fire({
          allowOutsideClick: false,
          icon: 'info',
          title: 'Nama-nama yang tidak melakukan presensi hari ini:',
          html: addSpacing(usersWithoutPresensi),
          width: '50%',
      });
  }

  // Fungsi untuk menambahkan spasi di samping nama-nama
  function addSpacing(names) {
      var spacedNames = names.map(function (name) {
          return '<span style="margin-right: 10px;">' + name + ',' + '</span>';
      });
      return '<div>' + spacedNames.join('') + '</div>';
  }
</script>

@endsection