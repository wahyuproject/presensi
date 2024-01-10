<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>402 Not Found</title>
</head>
<body>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
          @if(session('error'))
            Swal.fire({
              title: 'Login Gagal',
              text: '{{ session('error') }}',
              icon: 'error',
            });
          @endif
        });
      </script>
      
    
</body>
</html>