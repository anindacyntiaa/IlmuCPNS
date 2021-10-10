@extends('admin/template.main')
@section('title', $title)
@section('content')
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Tambah Data Soal</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="{{url('admin/olahSoal/index')}}">Olah Data Soal</a></li>
            <li class="breadcrumb-item active">Tambah Data Soal</li>
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
            <form role="form" action="{{url('admin/olahSoal/aksi_tambah')}}" method="POST" enctype="multipart/form-data">
            {{csrf_field()}}
            <div class="card-body">
                <div class="form-group">
                  <label>Kategori Soal</label>
                  <select name="id_kategori" class="form-control form-control-sm">
                    <option selected>PILIH JENIS KATEGORI</option>
                    @foreach($kategori as $kt)
                    <option value="{{$kt->id_kategori}}">{{$kt->nama_kategori}}</option>
                    @endforeach
                  </select>
                </div>
                <div class="form-group">
                  <label>Tipe Soal</label>
                  <select name="tipe" class="form-control form-control-sm">
                    <option selected>PILIH TIPE SOAL</option>
                    <option value="tryout">Tryout</option>
                    <option value="latihan">Latihan</option>
                  </select>
                </div>
                <div class="form-group">
                  <label>Soal</label>
                  <textarea name="soal" class="form-control form-control-sm" cols="30" rows="3"></textarea>
                </div>
                <div class="form-group">
                  <label>Jawaban 1</label>
                  <input type="text" name="j1" class="form-control form-control-sm" placeholder="Jawaban 1">
                </div>
                <div class="form-group">
                  <label>Jawaban 2</label>
                  <input type="text" name="j2" class="form-control form-control-sm" placeholder="Jawaban 2">
                </div>
                <div class="form-group">
                  <label>Jawaban 3</label>
                  <input type="text" name="j3" class="form-control form-control-sm" placeholder="Jawaban 3">
                </div>
                <div class="form-group">
                  <label>Jawaban 4</label>
                  <input type="text" name="j4" class="form-control form-control-sm" placeholder="Jawaban 4">
                </div>
                <div class="form-group">
                  <label>Jawaban 5</label>
                  <input type="text" name="j5" class="form-control form-control-sm" placeholder="Jawaban 5">
                </div>
                <div class="form-group">
                  <label>Kunci</label>
                  <input type="text" name="kunci" class="form-control form-control-sm" placeholder="Kunci Jawaban">
                </div>
                <div class="form-group">
                  <label>Skor</label>
                  <input type="number" name="skor" class="form-control form-control-sm" placeholder="Skor">
                </div>
                <div class="form-group">
                  <label>Pembahasan</label>
                  <textarea name="pembahasan" class="form-control form-control-sm" cols="30" rows="5"></textarea>
                </div>
              </div>
              <!-- /.card-body -->

              <div class="card-footer">
                <button type="submit" class="btn btn-primary float-right ml-3">Simpan</button>
                <a href="{{url('admin/olahSoal/index')}}" class="btn btn-danger float-right">Kembali</a>
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