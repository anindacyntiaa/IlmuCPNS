@extends('peserta/template.main')
@section('title', $title)
@section('content')
    <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-6">
            <h1>Akun</h1>
          </div>
        </div>
        <div class="row mb-2">
            @if(session('success'))
              <div class="alert alert-success" role="alert">{{session('success')}}</div>
            @endif
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- Default box -->
            <div class="card">
              <div class="card-header">
                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal"data-target="#editAkun-{{$data->kode_peserta}}">Perbarui Data</button>
                <button type="button" class="btn btn-success btn-sm" data-toggle="modal"data-target="#gantiPassword">Ganti Password</button>
              </div>
              <div class="card-body">
                <!-- Menampilkan data diri peserta -->
                <table class="table table-borderless">
                    <thead>
                        <tr>
                        <th scope="col">ID Peserta</th>
                            <th>:</th>
                            <th scope="col">{{sprintf('D'.'%04d', $data->kode_peserta)}}</th>
                        </tr>
                        <tr>
                            <th scope="col">Nama Peserta</th>
                            <th>:</th>
                            <th scope="col">{{$data->nama_peserta}}</th>
                        </tr>
                        <tr>
                            <th scope="col">Tempat Lahir</th>
                            <th>:</th>
                            <th scope="col">{{$data->tempat_lahir}}</th>
                        </tr>
                        <tr>
                            <th scope="col">Tanggal Lahir</th>
                            <th>:</th>
                            <th scope="col">{{date('d F Y', strtotime($data->tgl_lahir))}}</th>
                        </tr>
                        <tr>
                            <th scope="col">Email</th>
                            <th>:</th>
                            <th scope="col">{{$data->email}}</th>
                        </tr>
                        <tr>
                            <th scope="col">No Telepon</th>
                            <th>:</th>
                            <th scope="col">{{$data->no_hp}}</th>
                        </tr>
                        <tr>
                            <th scope="col">Username</th>
                            <th>:</th>
                            <th scope="col">{{$data->username}}</th>
                        </tr>
                        <tr>
                            <th scope="col">Alamat</th>
                            <th>:</th>
                            <th scope="col">{{$data->alamat}}</th>
                        </tr>
                    </thead>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Modal Perbarui Data -->
  <div class="modal fade" id="editAkun-{{$data->kode_peserta}}" tabindex="-1" role="dialog" aria-labelledby="editAkun" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editAkun">Perbarui Akun</h5>
                </div>
                <div class="modal-body">
                    <form action="{{url('akun/aksi_ubah')}}/{{$data->kode_peserta}}" method="post">
                        {{csrf_field()}}
                        {{method_field('PUT')}}
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Username</label>
                                    <input type="text" class="form-control form-control-sm" name="username" value="{{$data->username}}" placeholder="Username">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>No Telepon</label>
                                    <input type="number" class="form-control form-control-sm" name="no_hp" value="{{$data->no_hp}}" placeholder="No. Telepon">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Nama</label>
                                    <input type="text" class="form-control form-control-sm" name="nama_peserta" value="{{$data->nama_peserta}}" placeholder="Nama">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Tempat Lahir</label>
                                    <input type="text" class="form-control form-control-sm" name="tempat_lahir" value="{{$data->tempat_lahir}}" placeholder="Tempat Lahir">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" class="form-control form-control-sm" name="email" value="{{$data->email}}" placeholder="Email">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Tanggal Lahir</label>
                                    <input type="date" class="form-control form-control-sm" name="tgl_lahir" value="{{$data->tgl_lahir}}" placeholder="Tanggal Lahir">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Alamat</label>
                                    <textarea name="alamat" rows="2">{{$data->alamat}}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">Simpan</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Tidak</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- /Modal Perbarui Data -->

    <!-- Modal Ganti Password -->
    <div class="modal fade" id="gantiPassword" tabindex="-1" role="dialog" aria-labelledby="hapusKategori" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="hapusKategori">Ganti Password</h5>
                </div>
                <div class="modal-body">
                    <form action="{{url('akun/ubah_pass')}}/{{$data->kode_peserta}}" method="post">
                        {{csrf_field()}}
                        {{method_field('PUT')}}
                        <div class="form-group">
                            <label for="">Password Lama</label>
                            <input type="password" class="form-control form-control-sm" name="old">
                        </div>
                        <div class="form-group">
                            <label for="">Password Baru</label>
                            <input type="password" class="form-control form-control-sm" name="new">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Simpan</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Kembali</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection