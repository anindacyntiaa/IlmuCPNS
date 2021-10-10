<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Daftar | Peserta CPNS</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="{{asset('/assets/plugins/fontawesome-free/css/all.min.css')}}">
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="{{asset('/assets/plugins/icheck-bootstrap/icheck-bootstrap.min.css')}}">
  <link rel="stylesheet" href="{{asset('/assets/dist/css/adminlte.min.css')}}">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition register-page">
<div>
    <div class="login-logo">
        <h3>ILMU CPNS</h3>
    </div>
    <div class="card">  
        <div class="card-body register-card-body">
            <!-- menampilkan error inputan kosong -->
            @if (count($errors) > 0)
            <div class="alert alert-danger">
                <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
                </ul>
            </div>
            @endif

            <!-- form daftar -->
            <form action="{{url('/postDaftar')}}" method="post">
            {{csrf_field()}}
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label>Username</label>
                            <input type="text" class="form-control form-control-sm" name="username" placeholder="Username">
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label>No Telepon</label>
                            <input type="number" class="form-control form-control-sm" name="no_hp" placeholder="No. Telepon">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label>Nama</label>
                            <input type="text" class="form-control form-control-sm" name="nama_peserta" placeholder="Nama">
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label>Tempat Lahir</label>
                            <input type="text" class="form-control form-control-sm" name="tempat_lahir" placeholder="Tempat Lahir">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control form-control-sm" name="email" placeholder="Email">
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label>Tanggal Lahir</label>
                            <input type="date" class="form-control form-control-sm" name="tgl_lahir" placeholder="Tanggal Lahir">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label>Alamat</label>
                            <textarea name="alamat" rows="2"></textarea>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control form-control-sm" name="password" placeholder="Password">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 text-center">
                        <a href="{{url('/login')}}" class="btn btn-danger" style="width: 200px;">Kembali</a>
                    </div>
                    <div class="col-6 text-center">
                        <button type="submit" class="btn btn-success" style="width: 200px;">Daftar</button>
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
