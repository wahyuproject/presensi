@extends('halamanpegawai.homepegawai')

@section('konten')

<div class="main-panel">
  <div class="content-wrapper">
    <div class="page-header">
      <h3 class="page-title mb-4">
        <span class="page-title-icon bg-gradient-primary text-white me-2">
          <i class="mdi mdi-home"></i>
        </span>Home <i class="mdi mdi-chevron-right"></i> Dashboard
      </h3>

    </div>
    <div class="row">
      <div class="col-md-3 grid-margin">
        <div class="card bg-gradient-primary card-img-holder text-white">
          <div class="card-body d-flex align-items-center">
            <i class="mdi mdi-arrow-right-box mdi-36px"></i>
            <div>
              <h4>{{ number_format($rataRataPersentaseMasuk, 2)}}%</h4>
              <h5 class="font-weight-normal mb-3"> Persentase Kehadiran Masuk </i></h5>
            </div>
           </div>
        </div>
      </div>
      <div class="col-md-3 grid-margin">
        <div class="card bg-gradient-warning card-img-holder text-white">
          <div class="card-body d-flex align-items-center">
            <i class="mdi mdi-arrow-left-box mdi-36px"></i>
            <div>
              <h4>{{number_format($rataRataPersentaseKeluar, 2)}}%</h4>
              <h5 class="font-weight-normal mb-3"> Persentase Kehadiran Keluar </i></h5>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-3 grid-margin">
        <div class="card bg-gradient-danger card-img-holder text-white">
            <div class="card-body">
                <h4 class="font-weight-normal mb-3">Presensi Masuk Hari Ini</i></h4>
                
                @if ($presensiMasukHariIni)
                    <p style="background: #32d969; padding: 10px; border-radius: 3px;"> Anda sudah presensi.</p>
                @else
                    <p style="background: #e3e03b; padding: 10px; border-radius: 3px;">Anda belum presensi.</p>
                @endif
            </div>
        </div>
    </div>    
      <div class="col-md-3 grid-margin">
        <div class="card bg-gradient-success card-img-holder text-white">
          <div class="card-body">
            <h4 class="font-weight-normal mb-3">Presensi Keluar Hari Ini</i>
            </h4>
            @if ($presensiKeluarHariIni)
                <p style="background: #32d969; padding: 10px; border-radius: 3px;">Anda sudah presensi.</p>
            @else
                <p style="background: #e3e03b; padding: 10px; border-radius: 3px;">Anda belum presensi.</p>
            @endif
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- content-wrapper ends -->

</div>
    
@endsection