<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Reset Password</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{asset('/assets/plugins/fontawesome-free/css/all.min.css')}}">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="{{asset('/assets/plugins/icheck-bootstrap/icheck-bootstrap.min.css')}}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{asset('/assets/dist/css/adminlte.min.css')}}">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <h4 class="login-box-msg"><b>RESET PASSWORD</b></h4>
      <!-- Menampilkan pesan -->
      @if (Session::has('message'))
        <div class="alert alert-success" role="alert">
        {{ Session::get('message') }}
        </div>
      @endif
      <p class="text-center">Masukkan alamat email yang digunakan untuk mendaftar. Kami akan mengirim email berisi nama pengguna dan tautan untuk mereset sandi kepadamu.</p>

      <!-- FOrm mengirim email untuk reset password -->
      <form action="{{url('/postReset')}}" method="post">
      {{csrf_field()}}
        <div class="input-group mb-3">
          <input type="text" class="form-control text-center" name="email" placeholder="Alamat Email Terdaftar">
          <div class="input-group-append">
            <div class="input-group-text">
            </div>
          </div>
        </div>
        <div class="row">
            <button type="submit" class="btn btn-primary btn-block">Kirim</button>
        </div>
      </form>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="{{asset('/assets/plugins/jquery/jquery.min.js')}}"></script>
<!-- Bootstrap 4 -->
<script src="{{asset('/assets/plugins/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
<!-- AdminLTE App -->
<script src="{{asset('/assets/dist/js/adminlte.min.js')}}"></script>

</body>
</html>
