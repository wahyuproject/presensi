<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
      <li class="nav-item nav-profile">
        <a href="#" class="nav-link">
          <div class="nav-profile-image">
            <img src="{{ asset('assets/images/faces/face1.jpg') }}" alt="profile">
            <span class="login-status online"></span>
            <!--change to offline or busy as needed-->
          </div>
          <div class="nav-profile-text d-flex flex-column">
            <span class="font-weight-bold mb-2">{{ Auth::user()->name }}</span>
            <span class="text-secondary text-small">{{ Auth::user()->email }}</span>
          </div>
          <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="{{ route('index.dashboard') }}">
          <span class="menu-title">Dashboard</span>
          <i class="mdi mdi-home menu-icon"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
          <span class="menu-title">Data Kehadiran</span>
          <i class="menu-arrow"></i>
          <i class="mdi mdi-crosshairs-gps menu-icon"></i>
        </a>
        <div class="collapse" id="ui-basic">
          <ul class="nav flex-column sub-menu">
            <li class="nav-item"> <a class="nav-link" href="{{ route('harian.harian') }}">Kehadiran Harian</a></li>
            <li class="nav-item"> <a class="nav-link" href="{{ route('bulanan.bulanan') }}">Kehadiran Bulanan</a></li>
            <li class="nav-item"> <a class="nav-link" href="{{ route('total.total') }}">Rekap Total Bulanan</a></li>
          </ul>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="{{ route('datapegawai.index') }}">
          <span class="menu-title">Data Pegawai</span>
          <i class="mdi mdi-contacts menu-icon"></i>
        </a>
      </li>
      {{-- <li class="nav-item">
        <a class="nav-link" href="{{ route('riwayat.riwayat') }}">
          <span class="menu-title">Log Aplikasi</span>
          <i class="mdi mdi-format-list-bulleted menu-icon"></i>
        </a>
      </li> --}}
    </ul>
  </nav>