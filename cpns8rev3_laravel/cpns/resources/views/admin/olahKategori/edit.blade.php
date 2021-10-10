@extends('admin/template.main')
@section('title', $title)
@section('content')
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Edit Data Kategori</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="{{url('admin/olahAdmin/index')}}">Olah Data Admin</a></li>
            <li class="breadcrumb-item active">Edit Data Kategori</li>
          </ol>
        </div>
      </div>
      <div class="row">
        <!-- {{-- menampilkan error validasi --}} -->
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
    </div><!-- /.container-fluid -->
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <!-- left column -->
        <div class="col-md-12">
          <!-- general form elements -->
          <div class="card card-primary">
            <!-- /.card-header -->
            <!-- form start -->
            <form role="form" action="{{url('admin/olahKategori/aksi_ubah')}}/{{$data->id_kategori}}" method="POST" enctype="multipart/form-data">
            {{csrf_field()}}
            {{method_field('PUT')}}
              <div class="card-body">
                <div class="form-group">
                  <label>Nama Kategori</label>
                  <input type="text" name="nama_kategori" class="form-control" value="{{$data->nama_kategori}}"  placeholder="Nama Kategori">
                </div>
                <div class="form-group">
                  <label>Jenis Kategori</label>
                  <select name="role" class="form-control">
                    <option value="{{$data->role}}">{{$data->role}}</option>
                    <option value="Materi">Materi</option>
                    <option value="Soal">Soal</option>
                  </select>
                </div>
              </div>
              <!-- /.card-body -->

              <div class="card-footer">
                <button type="submit" class="btn btn-primary float-right ml-3">Simpan</button>
                <a href="{{url('admin/olahKategori/index')}}" class="btn btn-danger float-right">Kembali</a>
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
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->

@endsection