@extends('admin/template.main')
@section('title', $title)
@section('content')
<div class="content-wrapper">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Tambah Data Admin</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="{{url('admin/olahAdmin/index')}}">Olah Data Admin</a></li>
            <li class="breadcrumb-item active">Tambah Data Admin</li>
          </ol>
        </div>
      </div>
      <div class="row">
        <!-- Menampilkan Pesan Error pada Inputan -->
        @if (count($errors) > 0)
        <div class="alert alert-danger">
          <ul>
          @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
          @endforeach
          </ul>
        </div>
        @endif
      </div>
    </div>
  </section>

  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          <div class="card card-primary">
            <!-- Form Input Data Admin Baru -->
            <form role="form" action="{{url('admin/olahAdmin/aksi_tambah')}}" method="POST" enctype="multipart/form-data">
            {{csrf_field()}}
              <div class="card-body">
                <div class="form-group">
                  <label>Nama Admin</label>
                  <input type="text" name="nama_admin" class="form-control" placeholder="Nama Admin">
                </div>
                <div class="form-group">
                  <label>No Telp</label>
                  <input type="number" name="no_telp" class="form-control" placeholder="No Tellp">
                </div>
                <div class="form-group">
                  <label>Jenis Kelamin</label>
                  <select type="text" name="jenis_kelamin" class="form-control">
                    <option value="">Pilih Jenis Kelamin</option>
                    <option value="Laki-laki">Laki-laki</option>
                    <option value="Perempuan">Perempuan</option>
                  </select>
                </div>
                <div class="form-group">
                  <label>Username</label>
                  <input type="text" name="username" class="form-control" placeholder="Username">
                </div>
                <div class="form-group">
                  <label>Password</label>
                  <input type="password" name="password" class="form-control" placeholder="Password">
                </div>
              </div>
              <div class="card-footer">
                <button type="submit" class="btn btn-primary float-right ml-3">Simpan</button>
                <a href="{{url('admin/olahAdmin/index')}}" class="btn btn-danger float-right">Kembali</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
@endsection