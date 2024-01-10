<nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
      <a class="navbar-brand brand-logo" href="{{ route('user.dashboardpegawai') }}">Presensi</a>
      <a class="navbar-brand brand-logo-mini" href="#"><img src="{{ asset('assets/images/logo-mini.svg') }}" alt="logo" /></a>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-stretch">
      <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
        <span class="mdi mdi-menu"></span>
      </button>
      <ul class="navbar-nav navbar-nav-right">
        <li class="nav-item d-none d-lg-block full-screen-link">
          <a class="nav-link">
            <i class="mdi mdi-fullscreen" id="fullscreen-button"></i>
          </a>
        </li>
        <li class="nav-item d-none d-lg-block full-screen-link">
          <div id="jam"></div>
        </li>
        <li class="nav-item nav-profile dropdown">
          <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
            <div class="nav-profile-img">
              <img src="{{ asset('assets/images/faces/face1.jpg') }}" alt="image">
              <span class="availability-status online"></span>
            </div>
            <div class="nav-profile-text">
              <p id="current-date" class="mb-1 text-black"></p>
              <p class="mb-1 text-black">{{ Auth::user()->name }}</p>
            </div>
          </a>
          <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
            <a class="dropdown-item" href="{{ url('home/pegawai/profile') }}" id="editProfile">
              <i class="mdi mdi-face me-2 text-success"></i> Akun
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" id="logoutButton" href="#">
              <i class="mdi mdi-logout me-2 text-primary"></i> Signout
            </a>
          </div>
        </li>
      </ul>
      <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
        <span class="mdi mdi-menu"></span>
      </button>
    </div>
  </nav>
  <br><br>

<script>
  document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('logoutButton').addEventListener('click', function () {
      Swal.fire({
        allowOutsideClick: false,
        title: 'Konfirmasi Logout',
        text: 'Anda yakin ingin keluar?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'Ya, Logout',
        cancelButtonText: 'Batal',
      }).then(function (result) {
        if (result.isConfirmed) {
          // Lakukan tindakan logout setelah pengguna mengonfirmasi
          window.location.href = '{{ route('logout.logout') }}';
        }
      });
    });
  });
</script>
  
<script>
  function updateDate() {
      var days = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
      var months = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
  
      var currentDate = new Date();
      var currentDay = days[currentDate.getDay()];
      var dayOfMonth = currentDate.getDate();
      var currentMonth = months[currentDate.getMonth()];
      var currentYear = currentDate.getFullYear();
  
      // Format the date as "Hari, DD Bulan YYYY"
      var formattedDate = currentDay + ', ' + dayOfMonth + ' ' + currentMonth + ' ' + currentYear;
  
      // Update the HTML element with the formatted date
      document.getElementById('current-date').innerHTML = formattedDate;
  
      // Set the function to run again after 24 hours
      var millisecondsUntilTomorrow = 24 * 60 * 60 * 1000 - (currentDate.getHours() * 60 * 60 * 1000 + currentDate.getMinutes() * 60 * 1000 + currentDate.getSeconds() * 1000);
      setTimeout(updateDate, millisecondsUntilTomorrow);
  }
  
  // Call the updateDate function to start displaying the current date
  updateDate();
  </script>

<script>
  function updateJam() {
      var date = new Date();
      var jam = date.getHours();
      var menit = date.getMinutes();
      var detik = date.getSeconds();

      // Format jam agar selalu dua digit (00-23)
      jam = (jam < 10) ? "0" + jam : jam;

      // Format menit agar selalu dua digit (00-59)
      menit = (menit < 10) ? "0" + menit : menit;

      // Format detik agar selalu dua digit (00-59)
      detik = (detik < 10) ? "0" + detik : detik;

      // Tampilkan jam pada elemen dengan ID 'jam'
      document.getElementById("jam").innerHTML = jam + ":" + menit + ":" + detik;

      // Perbarui setiap detik
      setTimeout(updateJam, 1000);
  }

  // Panggil fungsi updateJam untuk pertama kali
  updateJam();
</script>