@extends('admin/template.main')
@section('title', $title)
@section('content')
<div class="content-wrapper">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Edit Data Admin</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="{{url('admin/olahAdmin/index')}}">Olah Data Admin</a></li>
            <li class="breadcrumb-item active">Edit Data Admin</li>
          </ol>
        </div>
      </div>
      <div class="row">
        <!-- Menampilkan Pesan Inputan Kosong -->
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
            <!-- Form Edit -->
            <form role="form" action="{{url('admin/olahAdmin/aksi_ubah')}}/{{$data->id_admin}}" method="POST">
            {{csrf_field()}}
            {{method_field('PUT')}}
              <div class="card-body">
                <div class="form-group">
                  <label>Nama Admin</label>
                  <input type="text" name="nama_admin" class="form-control" value="{{$data->nama_admin}}" placeholder="Nama Admin">
                </div>
                <div class="form-group">
                  <label>No Telp</label>
                  <input type="number" name="no_telp" class="form-control" value="{{$data->no_telp}}" placeholder="No Tellp">
                </div>
                <div class="form-group">
                  <label>Jenis Kelamin</label>
                  <select type="text" name="jenis_kelamin" class="form-control">
                    <option value="{{$data->jenis_kelamin}}">{{$data->jenis_kelamin}}</option>
                    <option value="">Pilih Jenis Kelamin</option>
                    <option value="Laki-laki">Laki-laki</option>
                    <option value="Perempuan">Perempuan</option>
                  </select>
                </div>
                <div class="form-group">
                  <label>Username</label>
                  <input type="text" name="username" value="{{$data->username}}" class="form-control" placeholder="Username">
                </div>
                <div class="form-group">
                  <label>Password</label>
                  <input type="password" name="password" value="{{$data->password}}" class="form-control" placeholder="Password">
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