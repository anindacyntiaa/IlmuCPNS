@extends('admin/template.main')
@section('title', $title)
@section('content')
    <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Olah Peserta Premium</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item active">Olah Peserta Premium</li>
            </ol>
          </div>
        </div>
        <div class="row">
          @if (count($errors) > 0)
          <div class="alert alert-danger">
            <ul>
            @foreach ($errors->all() as $error)
              <li>{{ $error }}</li>
            @endforeach
            </ul>
          </div>
          @endif
          <!-- Menampilkan respon CRUD -->
          @if(session('tambah'))
              <div class="alert alert-success" role="alert">{{session('tambah')}}</div>
          @endif
          @if(session('paket'))
              <div class="alert alert-secondary" role="alert">{{session('paket')}}</div>
          @endif
          @if(session('edit'))
              <div class="alert alert-warning" role="alert">{{session('edit')}}</div>
          @endif
          @if(session('hapus'))
              <div class="alert alert-danger" role="alert">{{session('hapus')}}</div>
          @endif
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <section class="content">
    <div class="container-fluid">
      <div class="row">
        <!-- left column -->
        <div class="col-md-12">
          <!-- general form elements -->
          <div class="card card-primary">
              <div class="card-header">
                <h4>Tambah Peserta Premium</h4>
              </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form role="form" action="{{url('admin/olahPremium/aksi_tambah')}}" method="POST" enctype="multipart/form-data">
            {{csrf_field()}}
              <div class="card-body">
                <div class="form-group">
                  <label>Nama Peserta</label>
                  <select name="peserta" class="form-control form-control-sm theSelect">
                      <option selected>Pilih Peserta</option>
                      @foreach($peserta as $data)
                      <option value="{{$data->kode_peserta}}">{{sprintf('D'.'%04d', $data->kode_peserta)}} - {{$data->nama_peserta}}</option>
                      @endforeach
                  </select>
                </div>
                <div class="form-group">
                  <label>Banyak Paket</label>
                  <input type="text" onkeypress="return hanyaAngka(event)" name="paket" class="form-control form-control-sm" placeholder="Banyak Paket">
                </div>
              </div>
              <!-- /.card-body -->

              <div class="card-footer">
                <button type="submit" class="btn btn-primary float-right ml-3">Simpan</button>
              </div>
            </form>
          </div>
          <!-- /.card -->
        </div>
        <!--/.col (right) -->
      </div>
      <!-- /.row -->
    </div><!-- /.container-fluid -->
  </section>

    <!-- Main content -->
    <section class="content">

      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- Default box -->
            <div class="card">
              <div class="card-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead class="text-center">
                  <tr>
                    <th width="10px">No</th>
                    <th>Nama Peserta</th>
                    <th>Banyak Paket</th>
                    <th>Sisa Paket</th>
                    <th>Admin</th>
                    <th>Aksi</th>
                  </tr>
                </thead>
                <?php $no=1;?>
                <tbody>
                  @foreach($premium as $d)
                  <tr>
                    <td class="text-center">{{$no++}}</td>
                    <td>{{sprintf('D'.'%04d', $d->id_peserta)}} - {{$d->getPeserta->nama_peserta}}</td>
                    <td class="text-center">{{$d->banyak_paket}}</td>
                    <td class="text-center">{{$d->sisa_paket}}</td>
                    <td>{{$d->getAdmin->nama_admin}}</td>
                    <td class="text-center">
                      <div class="btn-group">
                        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#tambahPremium-{{$d->id_premium}}">
                          Tambah Paket
                        </button>
                        <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#editPremium-{{$d->id_premium}}">
                          Edit
                        </button>
                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#hapusPremium-{{$d->id_premium}}">
                          Hapus
                        </button>
                      </div>
                    </td>
                  </tr>
                  @endforeach
                </tbody>
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

  <!-- MODAL Tambah Paket -->
  @foreach($premium as $tambah)
    <div class="modal fade" id="tambahPremium-{{$tambah->id_premium}}">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="tambahPeserta">Tambah Paket Premium</h5>
                </div>
                <div class="modal-body">
                  <form action="{{url('admin/olahPremium/tambahPaket')}}/{{$tambah->id_premium}}" method="POST">
                    {{csrf_field()}}
                    {{method_field('PUT')}}
                    <div class="form-group">
                      <label>Nama Peserta</label><br>
                      <select name="peserta" disabled class="form-control form-control-sm">
                          <option value="{{$tambah->id_peserta}}" selected>{{sprintf('D'.'%04d', $tambah->id_peserta)}} - {{$tambah->getPeserta->nama_peserta}}</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label>Banyak Paket</label>
                      <input type="number" onkeypress="return hanyaAngka(event)" name="paket" class="form-control form-control-sm" placeholder="Banyak Paket">
                    </div>
                    <div class="row">
                      <div class="col-6">
                        <button type="submit" class="btn btn-primary">Simpan</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Kembali</button>
                    </div>
                    </div>
                  </form>
                </div>
            </div>
        </div>
    </div>
  @endforeach
  
  <!-- MODAL HAPUS DATA -->
  @foreach($premium as $hapus)
    <div class="modal fade" id="hapusPremium-{{$hapus->id_premium}}">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="hapusPremium">Hapus Data Peserta</h5>
                </div>
                <div class="modal-body">
                    <form action="{{url('admin/olahPremium/hapus')}}/{{$hapus->id_premium}}" method="post">
                        {{csrf_field()}}
                        <input type="hidden" name="tipe" value="free">
                        <div class="form-group">
                            <p>Hapus Peserta <b class="text-danger">{{sprintf('D'.'%04d', $hapus->id_peserta)}} - {{$hapus->getPeserta->nama_peserta}}</b> dari Premium</p>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Hapus</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Tidak</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
  @endforeach

  <!-- MODAL EDIT DATA -->
  @foreach($premium as $edit)
    <div class="modal fade" id="editPremium-{{$edit->id_premium}}">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editPeserta">Edit Data Premium</h5>
                </div>
                <div class="modal-body">
                  <form action="{{url('admin/olahPremium/aksi_ubah')}}/{{$edit->id_premium}}" method="POST">
                    {{csrf_field()}}
                    {{method_field('PUT')}}
                    <div class="form-group">
                      <label>Nama Peserta</label><br>
                      <select name="peserta" disabled class="form-control form-control-sm">
                          <option value="{{$edit->id_peserta}}" selected>{{sprintf('D'.'%04d', $edit->id_peserta)}} - {{$edit->getPeserta->nama_peserta}}</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label>Banyak Paket</label>
                      <input type="text" onkeypress="return hanyaAngka(event)" name="paket" class="form-control form-control-sm" value="{{$edit->banyak_paket}}" placeholder="Banyak Paket">
                    </div>
                    <div class="form-group">
                      <label>Sisa Paket</label>
                      <input type="text" onkeypress="return hanyaAngka(event)" name="sisa_paket" class="form-control form-control-sm" value="{{$edit->sisa_paket}}" placeholder="Banyak Paket">
                    </div>
                    <div class="row">
                      <div class="col-6">
                        <button type="submit" class="btn btn-primary">Simpan</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Kembali</button>
                    </div>
                    </div>
                  </form>
                </div>
            </div>
        </div>
    </div>
  @endforeach
@endsection
@section('script')
  <script>
    $(document).ready(function() {
      $('.theSelect').select2();
    });
  </script>
  <script>
    function hanyaAngka(event) {
      var angka = (event.which) ? event.which : event.keyCode
      if (angka != 46 && angka > 31 && (angka < 48 || angka > 57))
        return false;
      return true;
    }
  </script>
@endsection
