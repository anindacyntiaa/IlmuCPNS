@extends('admin/template.main')
@section('title', $title)
@section('content')
<div class="content-wrapper">
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Edit Data Materi</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="{{url('admin/olahAdmin/index')}}">Olah Data Materi</a></li>
            <li class="breadcrumb-item active">Edit Data Materi</li>
          </ol>
        </div>
      </div>
      <div class="row">
        {{-- menampilkan error validasi --}}
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
            <!-- Form Edit data materi -->
            <form role="form" action="{{url('admin/olahMateri/aksi_ubah')}}/{{$data->id_materi}}" method="POST" enctype="multipart/form-data">
            {{csrf_field()}}
            {{method_field('PUT')}}
            <div class="card-body">
                <div class="form-group">
                  <label>Judul</label>
                  <input type="text" name="judul" value="{{$data->judul}}" class="form-control form-control-sm" placeholder="Judul">
                </div>
                <div class="form-group">
                  <label>Kategori</label>
                  <select name="id_kategori" class="form-control form-control-sm">
                      <option value="{{$data->id_kategori}}">{{$data->getKategori->nama_kategori}}</option>
                      @foreach($kategori as $kt)
                      <option value="{{$kt->id_kategori}}">{{$kt->nama_kategori}}</option>
                      @endforeach
                  </select>
                </div>
                <div class="form-group">
                  <label>File</label>
                  <p class="lead">File Lama : {{$data->file}}</p>
                  <input type="file" name="file" class="form-control form-control-sm" placeholder="File">
                </div>
              </div>
              <div class="card-footer">
                <button type="submit" class="btn btn-primary float-right ml-3">Simpan</button>
                <a href="{{url('admin/olahMateri/index')}}" class="btn btn-danger float-right">Kembali</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>


@endsection