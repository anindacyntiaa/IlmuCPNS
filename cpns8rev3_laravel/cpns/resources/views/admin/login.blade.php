<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="{{asset('/assets/plugins/fontawesome-free/css/all.min.css')}}">
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="{{asset('/assets/plugins/icheck-bootstrap/icheck-bootstrap.min.css')}}">
  <link rel="stylesheet" href="{{asset('/assets/dist/css/adminlte.min.css')}}">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <h3>Selamat Datang</h3>
  </div>
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Administrator CPNS Online</p>
      <!-- Pesan Error login -->
      @if(session('error'))
      <div class="alert alert-danger" role="alert">{{session('error')}}</div>
      @endif

      <!-- Form Login -->
      <form action="{{url('admin/postLogin')}}" method="post">
      {{csrf_field()}}
        <div class="input-group mb-3">
          <input type="text" class="form-control" name="username" placeholder="Username">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" name="password" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8"></div>
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">Sign In</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>



<script src="{{asset('/assets/plugins/jquery/jquery.min.js')}}"></script>

<script src="{{asset('/assets/plugins/bootstrap/js/bootstrap.bundle.min.js')}}"></script>

<script src="{{asset('/assets/dist/js/adminlte.min.js')}}"></script>

</body>
</html>
