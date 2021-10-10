@extends('admin/template.main')
@section('title', $title)
@section('content')
    <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Olah Data Materi</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item active">Olah Data Materi</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <!-- Menampilkan Error pada inputan data kosong -->
          @if (count($errors) > 0)
          <div class="alert alert-danger">
            <ul>
            @foreach ($errors->all() as $error)
              <li>{{ $error }}</li>
            @endforeach
            </ul>
          </div>
          @endif
          
          <!-- Menampilkan pesan hasil crud -->
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
      </div>
    </section>

    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card card-primary">
              <div class="card-header">
                <h4>Tambah Data Materi</h4>
              </div>
              <!-- Form Tambah materi -->
              <form role="form" action="{{url('admin/olahMateri/aksi_tambah')}}" method="POST" enctype="multipart/form-data">
              {{csrf_field()}}
                <div class="card-body">
                  <div class="form-group">
                    <label>Judul</label>
                    <input type="text" name="judul" class="form-control form-control-sm" placeholder="Judul">
                  </div>
                  <div class="form-group">
                    <label>Kategori</label>
                    <select name="id_kategori" class="form-control form-control-sm">
                        <option selected>Pilih Kategori</option>
                        @foreach($kategori as $kt)
                        <option value="{{$kt->id_kategori}}">{{$kt->nama_kategori}}</option>
                        @endforeach
                    </select>
                  </div>
                  <div class="form-group">
                    <label>File</label>
                    <input type="file" name="file" class="form-control form-control-sm" placeholder="File">
                  </div>
                </div>
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary float-right ml-3">Simpan</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
              <!-- Tabel read data materi -->
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th width="10px">No</th>
                        <th>Judul</th>
                        <th>Kategori</th>
                        <th>File</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $no = 1;?>
                    <!-- Looping data dari database -->
                    @foreach($data as $d)
                    <tr>
                        <td>{{$no++}}</td>
                        <td>{{$d->judul}}</td>
                        <td>{{$d->getKategori->nama_kategori}}</td>
                        <td>{{$d->file}}</td>
                        <td>
                            <a href="{{url('admin/olahMateri/edit')}}/{{$d->id_materi}}" class="btn btn-warning btn-sm">Edit</a>
                            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal"data-target="#hapusMateri-{{$d->id_materi}}">
                              Hapus
                            </button>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
              </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
  
  <!-- Modal Hapus data -->
  @foreach($data as $hapus)
    <div class="modal fade" id="hapusMateri-{{$hapus->id_materi}}" tabindex="-1" role="dialog" aria-labelledby="hapusMateri" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="hapusMateri">Hapus Data Materi</h5>
                </div>
                <div class="modal-body">
                    <form action="{{url('admin/olahMateri/hapus')}}/{{$hapus->id_materi}}" method="post">
                        {{csrf_field()}}
                        <div class="form-group">
                            <p>Hapus materi dengan judul : {{$hapus->judul}}</p>
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