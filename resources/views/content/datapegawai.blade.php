@extends('layouts.index')

@section('konten')


<div class="main-panel">
    <div class="content-wrapper">
      <div class="page-header">
        <h3 class="page-title">
          <span class="page-title-icon bg-gradient-primary text-white me-2">
            <i class="mdi mdi-contacts menu-icon"></i>
          </span>Home <i class="mdi mdi-chevron-right"></i> Data Pegawai
          <ol class="ps-5">
            Fitur ini digunakan untuk mengetahui Data Pegawai yang Terdaftar.
          </ol>
        </h3>
        
      </div>
      <!-- Tombol Create Data -->
      <div class="row">
        <div class="col-12 grid-margin">
          <div class="card">
            <div class="card-body">
              <div class="table-responsive">
                <div class="text-right mb-3">
                  <button class="btn-sm" style="background: #b66dff; color:white" id="create-data-button" onclick="createData()"><i class="mdi mdi-account-plus mdi-24px" style="padding-right: 6px"></i> Tambah Data</button>
                </div>
                <div class="table-responsive">
                    <table id="example" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th class="col-md-">No</th>
                                <th class="col-md-3">Nama</th>
                                <th class="col-md-3">Username</th>
                                <th class="col-md-3">Email</th>
                                <th class="col-md-3">Role</th>
                                <th class="col-md-3">Created</th>
                                <th class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                            $nomor = 1;
                            @endphp
                            @foreach($users as $data)
                            <tr>
                                <td>{{ $nomor }}</td>
                                <td>{{ $data->name }}</td>
                                <td>{{ $data->username }}</td>
                                <td>{{ $data->email }}</td>
                                <td>
                                  @if($data->kodeakses == 8)
                                      User
                                  @else($data->kodeakses == 1)
                                      Administrator
                                  @endif
                                </td>
                                <td>
                                  @php
                                    // Menggunakan Carbon untuk memanipulasi tanggal
                                    $tanggal = \Carbon\Carbon::parse($data->created_at);
                                  @endphp
                                  {{ $tanggal->isoFormat('dddd, D MMMM Y') }}</td>
                                <td>
                                  <button class="btn-edit" onclick="editData('{{ $data->id }}', '{{ $data->name }}', '{{ $data->username }}', '{{ $data->email }}')">
                                    <i class="mdi mdi-pencil-box mdi-24px"></i>
                                  </button>

                                  <form class="d-inline" action="{{ url('home/datapegawai/'.$data->id) }}" method="post" id="delete-form">
                                    @csrf
                                    @method('DELETE')
                                    <button type="button" name="submit" class="btn-delete" onclick="confirmDelete('{{ $data->id }}')">
                                        <i class="mdi mdi-delete mdi-24px"></i>
                                    </button>
                                  </form>
                                </td>
                            </tr>
                            @php
                            $nomor++;
                            @endphp
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

{{-- tambah data --}}
<script>
  function createData() {
    Swal.fire({
      allowOutsideClick: false,
      title: 'Buat Data Pengguna',
      html:
        '<form id="create-form" action="{{ url('home/datapegawai') }}" method="POST" onsubmit="return validateForm()">' +
        '@csrf' +
        '<div class="form-group">' +
        '<input type="hidden" class="form-control" name="id" id="id" required>' +
        '<label for="name">Nama:</label>' +
        '<input type="text" class="form-control" name="name" id="name" required>' +
        '</div>' +
        '<div class="form-group">' +
        '<label for="username">Username:</label>' +
        '<input type="text" class="form-control" name="username" id="username" required>' +
        '</div>' +
        '<div class="form-group">' +
        '<label for="email">Email:</label>' +
        '<input type="email" class="form-control" name="email" id="email" required>' +
        '</div>' +
        '<div class="form-group">' +
        '<label for="password">Password:</label>' +
        '<input type="password" class="form-control" name="password" id="password" required>' +
        '</div>' +
        '<div class="form-group">' +
        '<label for="access_code">Kode Akses:</label>' +
        '<select class="form-control" name="kodeakses" id="kodeakses" required>' +
        '<option value="8">User</option>' +
        '<option value="1">Admin</option>' +
        '</select>' +
        '<input type="hidden" id="koordinat" name="koordinat" required>' +
        '</div>' +
        '<input type="hidden" name="koordinat" value="1,2">' +
        '</form>',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Buat Data',
    }).then((result) => {
      if (result.isConfirmed) {
      // Validasi formulir sebelum mengonfirmasi SweetAlert
      const form = document.getElementById('create-form');
      if (validateForm()) {
        // Validasi berhasil, kirim formulir
        form.submit();
        
        // Tampilkan SweetAlert sukses setelah mengirim formulir
        showSuccessAlert();
      }
      }else if (result.dismiss === Swal.DismissReason.cancel) {
        Swal.fire({
          icon: 'info',
          title: 'Pembuatan data dibatalkan',
          showConfirmButton: false,
          toast: true,
          position: 'top-end',
          timer: 5000
        });
      }
    });
  }

  // Fungsi untuk menampilkan SweetAlert Sukses
  function showSuccessAlert() {
    Swal.fire({
      icon: 'success',
      title: 'Sukses Menambahkan Data',
      allowOutsideClick: false,
      showConfirmButton: false,
      toast: true,
      position: 'top-end',
      timer: 5000
    }).then((result) => {
      if (result.isConfirmed) {
        // Di sini Anda dapat menambahkan tindakan apa yang ingin dilakukan setelah pengguna menekan tombol "OK"
        // Contoh: Redirect atau apa pun yang sesuai dengan kebutuhan Anda
      }
    });
  }

</script>

{{-- validate kolom semua harus di isi --}}
<script>
  function validateForm() {
    var name = document.getElementById('name').value;
    var username = document.getElementById('username').value;
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
    var kodeakses = document.getElementById('kodeakses').value;

    // Validasi email
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      Swal.fire({
        showConfirmButton: false,
        icon: 'error',
        title: 'Oops...',
        text: 'Format email tidak valid!',
        toast: true,
        position: 'top-end',
        timer: 5000
      });
      return false;
    }

    // Validasi password
    if (password.length < 6) {
      Swal.fire({
        showConfirmButton: false,
        icon: 'error',
        title: 'Oops...',
        text: 'Password harus minimal 6 karakter!',
        toast: true,
        position: 'top-end',
        timer: 5000
      });
      return false;
    }

    if (name === '' || username === '' || email === '' || password === '' || kodeakses === '') {
      Swal.fire({
        showConfirmButton: false,
        icon: 'error',
        title: 'Oops...',
        text: 'Semua kolom harus diisi!',
        toast: true,
        position: 'top-end',
        timer: 5000
      });
      return false; // Menghentikan pengiriman formulir jika ada yang kosong
    }

    return true; // Lanjutkan pengiriman formulir jika semua kolom terisi dan valid
  }
</script>

<!-- Tambahkan ini ke tata letak HTML Anda atau sertakan dalam file JavaScript Anda -->
<script>
  @if($errors->any())
      Swal.fire({
          showConfirmButton: false,
          icon: 'error',
          title: 'Error Validasi',
          html: '{!! implode('<br>', $errors->all()) !!}',
          toast: true,
          position: 'top-end',
          timer: 5000
        });
  @endif
</script>



{{-- edit data --}}
<script>
  function editData(id, name, username, email) {
    Swal.fire({
      allowOutsideClick: false,
      title: 'Edit Data Pengguna',
      html:
        `<form id="edit-form" method="POST" action="{{ url("home/datapegawai/") }}/${id}">
          @csrf
          @method('PUT')
          <div class="form-group">
            <label for="name">Nama:</label>
            <input type="hidden" class="form-control" name="id" id="id" value="${id}">
            <input type="text" class="form-control" name="name" id="name" value="${name}">
          </div>
          <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" class="form-control" name="username" id="username" value="${username}">
          </div>
          <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" name="email" id="email" value="${email}">
          </div>
          <div class="form-group">
            <label for="password">Ganti Password:</label>
            <input type="password" class="form-control" name="password" id="password">
          </div>
          <div class="form-group">
            <label for="password_confirmation">Ulangi Password:</label>
            <input type="password" class="form-control" name="password_confirmation" id="password_confirmation">
          </div>
        </form>`,
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Simpan Perubahan',
      preConfirm: () => {
        const form = document.getElementById('edit-form');
        const formData = new FormData(form);

        return fetch(form.action, {
          method: 'POST', // Still use POST here
          body: formData,
        })
          .then(data => {
            Swal.fire({
              toast: true,
              position: 'top-end',
              title: 'Berhasil!',
              text: 'Data berhasil diubah.',
              icon: 'success',
              showConfirmButton: false,
              timer: 5000 
            });
            // Add a delay before reloading the page (e.g., 3 seconds)
            setTimeout(() => {
                location.reload();
            }, 1000);
          })
          .catch(error => {
            Swal.fire({
              toast: true,
              position: 'top-end',
              title: 'Gagal!',
              text: 'Terjadi kesalahan saat mengubah data.',
              icon: 'error',
              showConfirmButton: false,
              timer: 5000
            });
          });
      },
      // Handle cancel button
      onCancel: () => {
        Swal.fire({
          toast: true,
          position: 'top-end',
          title: 'Batal',
          text: 'Proses edit dibatalkan.',
          icon: 'info',
          showConfirmButton: false,
          timer: 5000
        });
      }
    });
  }
</script>

{{-- hapus data --}}
<script>
  function confirmDelete(id) {
    // Display confirmation dialog
    Swal.fire({
      allowOutsideClick: false,
      title: 'Anda yakin?',
      text: 'Data akan dihapus secara permanen.',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#d33',
      cancelButtonColor: '#3085d6',
      confirmButtonText: 'Ya, Hapus!',
      cancelButtonText: 'Batal'
    }).then((result) => {
      // If the user clicks "OK", submit the form with CSRF token and method
      if (result.isConfirmed) {
        // Create a new form element
        const form = document.createElement('form');
        form.action = '{{ url("home/datapegawai/") }}' + '/ ' + id;
        form.method = 'POST'; // This is a POST request since you are creating a new form

        // Add CSRF token input
        const csrfInput = document.createElement('input');
        csrfInput.type = 'hidden';
        csrfInput.name = '_token';
        csrfInput.value = '{{ csrf_token() }}';

        // Add method input
        const methodInput = document.createElement('input');
        methodInput.type = 'hidden';
        methodInput.name = '_method';
        methodInput.value = 'DELETE';

        // Append inputs to the form
        form.appendChild(csrfInput);
        form.appendChild(methodInput);

        // Append the form to the body
        document.body.appendChild(form);

        // Submit the form
        form.submit();

        // Handle success after deletion
        Swal.fire({
          title: 'Berhasil!',
          text: 'Data telah dihapus.',
          icon: 'success',
          toast: true,
          position: 'top-end',
          showConfirmButton: false,
          timer: 5000
        });
      } else {
        console.log('Konfirmasi dibatalkan');
        Swal.fire({
          title: 'Dibatalkan!',
          text: 'Hapus Data Dibatalkan.',
          icon: 'info',
          toast: true,
          position: 'top-end',
          showConfirmButton: false,
          timer: 5000
        });      
      }
    });
  }
</script>

@endsection