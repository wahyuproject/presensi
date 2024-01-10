<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href=" {{ asset('assets/css/style.css') }}">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">

    <title>Presensi</title>
</head>
<body>
    <!----------------------- Main Container -------------------------->

    <div class="container d-flex justify-content-center align-items-center min-vh-100" >

        <!----------------------- Login Container -------------------------->
    
           <div class="row  rounded-5 p-3 shadow box-area" style="background-color: #fff;">
    
        <!--------------------------- Left Box ----------------------------->
     
        <div class="col-md-6 col-sm-12 rounded-4 d-flex justify-content-center align-items-center flex-column left-box" style="background: #fff;">
        <div class="featured-image mb-3">
            <a href="{{ route('login') }}"><img src="{{ asset('assets/images/dashboard/welcome.jpg') }}" class="img-fluid" style="max-widht: 250px; height:300px;" alt="Logo"></a>
        </div>
    
    </div>
    
    
        <!-------------------- ------ Right Box ---------------------------->
            
           <div class="col-md-6 right-box">
              <div class="row align-items-center">
                    <div class="header-text mb-4">
                         <h2>Hi!</h2>
                         <p >Kami Senang Anda Kembali.</p>
                    </div>
                    @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $item)
                                    <li>{{ $item }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                    @include('sweetalert::alert')

                <form action="{{ route('postlogin.login') }}" method="POST">
                    @csrf
                    <div class="input-group mb-3">
                        <input type="text" value="{{ old('username') }}" class="form-control form-control-lg bg-light fs-6" name="username" placeholder="Username">
                    </div>

                    <div class="input-group mb-3">
                        <input type="password" class="form-control form-control-lg bg-light fs-6" name="password" placeholder="Password" >
                    </div>

                    <div class="input-group mb-3">
                        <button name="submit" class="btn btn-lg  w-100 fs-6" style="background-color: blue;color: white">Login</button>
                    </div>
                </form>
              </div>
           </div> 
    
          </div>
        </div>

        @if ($errors->has('login'))
        <div class="alert alert-danger">
            {{ $errors->first('login') }}
        </div>
        @endif
        @include('sweetalert::alert')


        <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <!-- SweetAlert2 Bootstrap Theme -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>

</body>
</html>