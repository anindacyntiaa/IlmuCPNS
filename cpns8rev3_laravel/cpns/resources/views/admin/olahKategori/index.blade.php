@extends('admin/template.main')
@section('title', $title)
@section('content')
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Olah Data Kategori</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item active">Olah Data Kategori</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <!-- menampilkan respon CRUD -->
          @if(session('tambah'))
              <div class="alert alert-success" role="alert">{{session('tambah')}}</div>
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

    <!-- Main content -->
    <section class="content">

      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- Default box -->
            <div class="card">
              <div class="card-header">
                <a href="{{url('admin/olahKategori/tambah')}}" class="btn btn-primary btn-sm">Tambah Data</a>
              </div>
              <div class="card-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th width="10px">No</th>
                        <th>Nama Kategori</th>
                        <th>Jenis Kategori</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $no = 1;?>
                    @foreach($data as $d)
                    <tr>
                        <td>{{$no++}}</td>
                        <td>{{$d->nama_kategori}}</td>
                        <td>{{$d->role}}</td>
                        <td>
                            <a href="{{url('admin/olahKategori/edit')}}/{{$d->id_kategori}}" class="btn btn-warning btn-sm">Edit</a>
                            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal"data-target="#hapusKategori-{{$d->id_kategori}}">
                              Hapus
                            </button>
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

  <!-- MODAL HAPUS DATA -->
  @foreach($data as $hapus)
    <div class="modal fade" id="hapusKategori-{{$hapus->id_kategori}}" tabindex="-1" role="dialog" aria-labelledby="hapusKategori" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="hapusKategori">Hapus Data Kategori</h5>
                </div>
                <div class="modal-body">
                    <form action="{{url('admin/olahKategori/hapus')}}/{{$hapus->id_kategori}}" method="post">
                        {{csrf_field()}}
                        <div class="form-group">
                            <p>Hapus Kategori : {{$hapus->nama_kategori}}</p>
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
@endsection