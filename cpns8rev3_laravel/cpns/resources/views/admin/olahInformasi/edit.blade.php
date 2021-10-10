@extends('admin/template.main')
@section('title', $title)
@section('content')
<div class="content-wrapper">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Edit Data Informasi</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="{{url('admin/olahAdmin/index')}}">Olah Data Informasi</a></li>
            <li class="breadcrumb-item active">Edit Data Informasi</li>
          </ol>
        </div>
      </div>
      <div class="row">
        <!-- Menampilkan Pesan Error pada Inputan Kosong -->
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
            <!-- Form Edit Data Informasi -->
            <form role="form" action="{{url('admin/olahInformasi/aksi_ubah')}}/{{$data->id_informasi}}" method="POST" enctype="multipart/form-data">
            {{csrf_field()}}
            {{method_field('PUT')}}
            <div class="card-body">
                <div class="form-group">
                  <label>Judul</label>
                  <input type="text" name="judul" value="{{$data->judul}}" class="form-control form-control-sm" placeholder="Judul">
                </div>
                <div class="form-group">
                  <label>Isi</label>
                  <textarea name="isi" class="form-control" cols="30" rows="5">{{$data->isi}}</textarea>
                </div>
                <div class="form-group">
                  <label>Gambar</label>
                  <p class="lead">Gambar Lama : <img src="{{asset('informasi')}}/{{$data->gambar}}" alt="" class="img-thumbnail" width="100px"></p>
                  <input type="file" name="gambar" class="form-control form-control-sm" placeholder="Gambar">
                </div>
              </div>
              <div class="card-footer">
                <button type="submit" class="btn btn-primary float-right ml-3">Simpan</button>
                <a href="{{url('admin/olahInformasi/index')}}" class="btn btn-danger float-right">Kembali</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
@endsection