@extends('halamanpegawai.homepegawai')

@section('konten')

<div class="main-panel">
  <div class="content-wrapper">
    <div class="page-header mb-4">
      <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white me-2">
          <i class="mdi mdi-crosshairs-gps menu-icon"></i>
        </span>Home <i class="mdi mdi-chevron-right"></i> Presensi <i class="mdi mdi-chevron-right"></i> Presensi Keluar
      </h3>
    </div>

<!-- Input Pencarian -->
<div class="row">
  <div class="col-12 grid-margin">
    <div class="card">
      <div class="card-body">
          <div class="row">
            <div class="ms-3 col-md-6">
              <form action="{{ url('home/pegawai/presensikeluar') }}" method="POST">
                @csrf
                <div class="col-md-8">
                  <!-- Checkbox Presensi di Luar Kantor -->
                  <div style="display: flex; align-items: center; margin: 0;">
                    <input class="form-check input" type="checkbox" name="presensiDiluarKantor" id="presensiDiluarKantor">
                    <label class="form-check label" for="presensiDiluarKantor">
                      Presensi Di luar Kantor
                    </label>
                  </div>

                  <!-- latitude -->
                  <div class="mb-3">
                    <input type="hidden" name="latitude" id="latitude" style="border: none" disabled>
                  </div>

                  <!-- longitude -->
                  <div class="mb-3">
                    <input type="hidden" name="longitude" id="longitude" style="border: none" disabled>
                  </div>
                  
                  <!-- Form Jarak -->
                  <div class="mb-3">
                    <label for="jarak" class="form-label">Jarak Ke Kantor (Km) :</label>
                    <input type="text" name="jarak" id="jarak" style="border: none" disabled>
                  </div>
                  <!-- Keterangan -->
                  <div class="mb-3">
                    <label for="keterangan" class="form-label">Keterangan:</label>
                    <textarea class="form-control" name="keterangan" id="keterangan" rows="3" placeholder="Masukkan keterangan"></textarea>
                  </div>
                  <!-- Tombol Presensi Sekarang -->
                  <button class="btn-primary mb-3" type="submit" id="presensiSekarang" onclick="validateForm(event)">Presensi Sekarang</button>
                </div>
              </form>
          </div>
      </div>
    </div>
  </div>
</div>
</div>
</div>

<script>
  const kantorLatitude = -7.78245; // Ganti dengan latitude kantor Anda
  const kantorLongitude = 110.39232; // Ganti dengan longitude kantor Anda

  // Aktifkan tombol "Presensi Sekarang" selalu.
  document.getElementById('presensiSekarang').disabled = false;

  // Handle tombol "Presensi Sekarang" di sini
  document.getElementById('presensiSekarang').addEventListener('click', function() {
      // Lakukan apa pun yang perlu Anda lakukan saat tombol "Presensi Sekarang" diklik
  });

  document.getElementById('presensiDiluarKantor').addEventListener('change', function() {
      if (this.checked) {
          if (navigator.geolocation) {
              navigator.geolocation.getCurrentPosition(function(position) {
                  document.getElementById('latitude').value = position.coords.latitude;
                  document.getElementById('longitude').value = position.coords.longitude;
                  const jarak = calculateDistance(position.coords.latitude, position.coords.longitude, kantorLatitude, kantorLongitude).toFixed(2);
                  document.getElementById('jarak').value = jarak + ' Km';
              });
          } else {
              alert('Geolocation tidak didukung oleh peramban ini.');
          }
      } else {
          document.getElementById('jarak').value = '';
          document.getElementById('latitude').value = '';
          document.getElementById('longitude').value = '';
      }
  });

  function calculateDistance(lat1, lon1, lat2, lon2) {
      const radlat1 = Math.PI * lat1 / 180;
      const radlat2 = Math.PI * lat2 / 180;
      const theta = lon1 - lon2;
      const radtheta = Math.PI * theta / 180;
      let dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
      dist = Math.acos(dist);
      dist = dist * 180 / Math.PI;
      dist = dist * 60 * 1.1515;
      dist = dist * 1.609344; // Konversi menjadi kilometer
      return dist;
  }
</script>

<script>
  function validateForm(event) {
      // Dapatkan nilai dari kolom keterangan
      var keteranganValue = $('#keterangan').val().trim();

      // Periksa apakah kolom keterangan kosong
      if (keteranganValue === '') {
          // Tampilkan SweetAlert jika kolom keterangan kosong
          Swal.fire({
              allowOutsideClick: false,
              showConfirmButton: false,
              toast: true,
              position: 'top-end',
              icon: 'error',
              title: 'Oops...',
              text: 'Kolom keterangan harus diisi!',
              timer: 5000,
          });

          // Cegah pengiriman formulir dan reload halaman
          event.preventDefault();
      }
  }
</script>

<script>
  @if(session('error'))
    Swal.fire({
      allowOutsideClick: false,
      showConfirmButton: false,
      icon: 'warning',
      title: 'Oops...',
      text: '{{ session('error') }}',
      toast: true,
      position: 'top-end',
      timer: 5000
    });
  @endif

  @if(session('success'))
    Swal.fire({
      allowOutsideClick: false,
      showConfirmButton: false,
      icon: 'success',
      title: 'Berhasil',
      text: '{{ session('success') }}',
      toast: true,
      position: 'top-end',
      timer: 5000
    });
  @endif
</script>

@endsection
