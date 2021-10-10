@extends('peserta/template.main')
@section('title', $title)
@section('content')
    <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>{{$data->judul}}</h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- Default box -->
            <!-- Menampilkan materi dalam bentuk pdf -->
            <div class="card">
              <div class="card-header">
                  <button type="button" class="btn btn-danger btn-sm" onclick="history.back();">Kembali</button>
              </div>
              <div class="card-body">
                <iframe src="{{asset('materi')}}/{{$data->file}}#toolbar=0" width="100%" height="430px" style="border: none;"></iframe>
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
@endsection