@extends('halamanpegawai.homepegawai')

@section('konten')

<div class="main-panel">
  <div class="content-wrapper">
    <div class="page-header">
      <h3 class="page-title mb-4">
        <span class="page-title-icon bg-gradient-primary text-white me-2">
          <i class="mdi mdi-face"></i>
        </span>Home <i class="mdi mdi-chevron-right"></i> Pegawai <i class="mdi mdi-chevron-right"></i> Profile
      </h3>
    </div>

    <div class="container">
      <div class="float-start">
        <div class="row">
          <div class="col-12 grid-margin">
            <div class="card">
              <div class="card-body">
                <div class="row">
                  <div class="ms-3 col-md-10">
                    <form action="{{ url('home/pegawai/profile/' . Auth::id()) }}" method="POST">
                      @csrf
                      @method('PUT')
                      <div class="mb-2">
                        <label for="profilePicture" class="form-label">Profile Picture</label>
                          <input type="file" class="form-control" name="nama_file_ori" id="profilePicture" accept="image/*">
                      </div>
                      
                      <div class="mb-2">
                        <label for="fullName" class="form-label">Username</label>
                        <input type="text" name="username" class="form-control" id="fullName" value="{{ Auth::user()->username }}" disabled>
                      </div>

                      <div class="mb-2">
                        <label for="username" class="form-label">Nama</label>
                        <input type="text" name="name" class="form-control" id="username" value="{{ Auth::user()->name }}">
                      </div>
    
                      <div class="mb-2">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" id="email" value="{{ Auth::user()->email }}">
                      </div>
    
                      <div class="mb-2">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="Kosongi jika tidak ingin mengganti password">
                      </div>
    
                      <div class="mb-2">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <input type="password" name="" class="form-control" id="confirmPassword" placeholder="Kosongi jika tidak ingin mengganti password">
                      </div>
    
                      <button type="submit" class="btn text-light me-auto" style="background: #51c71a" onclick="updateProfile()"><i class="mdi mdi-content-save"></i> Update Profile</button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>  

    <div class="float-end">
      <div class="row">
        <div class="col-12 grid-margin">
          <div class="card">
            <div class="card-body">
              <div class="row">
                <div class="ms-3 col-md-6">
                  <img class="img-profile" src="{{ asset('assets/images/faces/face1.jpg') }}" alt="">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
</div>

<script>
  // Function to display SweetAlert
  function showAlert(icon, title, text) {
    Swal.fire({
      allowOutsideClick: false,
      showConfirmButton: false,
      icon: icon,
      title: title,
      text: text,
      toast: true,
      position: 'top-end',
      timer: 5000
    });
  }

  // Check for error message from the server
  @if(session('error'))
    showAlert('warning', 'Oops...', '{{ session('error') }}');
  @endif

  // Check for success message from the server
  @if(session('success'))
    showAlert('success', 'Berhasil', '{{ session('success') }}');
  @endif
</script>

@endsection