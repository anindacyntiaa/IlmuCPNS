@extends('admin/template.main')
@section('title', $title)
@section('content')
  <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Olah Data Informasi</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item active">Olah Data Informasi</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <!-- Menampilkan Pesan error pada inputan kosong -->
          @if (count($errors) > 0)
          <div class="alert alert-danger">
            <ul>
            @foreach ($errors->all() as $error)
              <li>{{ $error }}</li>
            @endforeach
            </ul>
          </div>
          @endif
          
          <!-- Menampilkan Pesan hasil crud -->
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
              <h4>Tambah Data Informasi</h4>
            </div>
            <!-- Form Input Data Infotmasi -->
            <form role="form" action="{{url('admin/olahInformasi/aksi_tambah')}}" method="POST" enctype="multipart/form-data">
            {{csrf_field()}}
              <div class="card-body">
                <div class="form-group">
                  <label>Judul</label>
                  <input type="text" name="judul" class="form-control form-control-sm" placeholder="Judul">
                </div>
                <div class="form-group">
                  <label>Isi</label>
                  <textarea name="isi" class="form-control" cols="30" rows="5"></textarea>
                </div>
                <div class="form-group">
                  <label>Gambar</label>
                  <input type="file" name="gambar" class="form-control form-control-sm" placeholder="Gambar">
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
                <!-- Tabel read data informasi -->
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                      <tr>
                          <th width="10px">No</th>
                          <th>Judul</th>
                          <th>Tanggal</th>
                          <th>Gambar</th>
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
                          <td>{{date('l, d F Y', strtotime($d->tgl_upload))}}</td>
                          <td class="text-center"><img src="{{asset('informasi')}}/{{$d->gambar}}" alt="" class="img-thumbnail" width="100px"></td>
                          <td class="text-center">
                              <a href="{{url('admin/olahInformasi/edit')}}/{{$d->id_informasi}}" class="btn btn-warning btn-sm">Edit</a>
                              <button type="button" class="btn btn-danger btn-sm" data-toggle="modal"data-target="#hapusInformasi-{{$d->id_informasi}}">
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
  
  <!-- Modal hapus data -->
  @foreach($data as $hapus)
    <div class="modal fade" id="hapusInformasi-{{$hapus->id_informasi}}" tabindex="-1" role="dialog" aria-labelledby="hapusInformasi" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="hapusInformasi">Hapus Data Informasi</h5>
                </div>
                <div class="modal-body">
                  <form action="{{url('admin/olahInformasi/hapus')}}/{{$hapus->id_informasi}}" method="post">
                      {{csrf_field()}}
                      <div class="form-group">
                          <p>Hapus data informasi dengan judul : {{$hapus->judul}}</p>
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