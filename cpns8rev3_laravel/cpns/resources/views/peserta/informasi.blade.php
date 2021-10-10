@extends('peserta/template.main')
@section('title', $title)
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Informasi</h1>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <!-- Menampilkan informasi -->
                    <div class="card">
                        <img src="{{asset('informasi')}}/{{$data->gambar}}" style="height: 15rem;" class="rounded mx-auto d-block mt-2">
                        <div class="card-body">
                            <h3>{{$data->judul}}</h3>
                            <small>Diunggah pada {{date('l, d F Y', strtotime($data->tgl_upload))}}</small><br><br>
                            <p class="card-text lead">{{$data->isi}}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /.content -->
</div>
  <!-- /.content-wrapper -->
@endsection