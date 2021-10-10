@extends('peserta/template.main')
@section('title', $title)
@section('content')
    <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-9">
            <h1>Bank Soal Dan Pembahasan {{$kategori->nama_kategori}}</h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <?php $no = 1; ?>
            <!-- Looping data soal -->
            @foreach($data as $d)
            <div class="card">
              <div class="card-body">
                <p class="lead"><b>{{$no++}}</b>. {{$d->soal}}</p>
                <ul class="list-group">
                    <li class="list-group-item">A. {{$d->j1}}</li>
                    <li class="list-group-item">B. {{$d->j2}}</li>
                    <li class="list-group-item">C. {{$d->j3}}</li>
                    <li class="list-group-item">D. {{$d->j4}}</li>
                    <li class="list-group-item">E. {{$d->j5}}</li>
                </ul>
                <button class="btn btn-primary mt-2" type="button" data-toggle="collapse" data-target="#collapseExample-{{$d->id_soal}}" aria-expanded="false" aria-controls="collapseExample">Pembahasan</button>
                <div class="collapse mt-2" id="collapseExample-{{$d->id_soal}}">
                  <div class="card card-body">
                    <p >Kunci Jawaban : <b>{{$d->kunci}}</b></p>
                    <p class="text-danger">Pembahasan : </p>
                    <p>{{$d->pembahasan}}</p>
                  </div>
                </div>
              </div>
            <!-- /.card-body -->
            </div>
            <!-- /.card -->
            @endforeach
            <div class="card">
              <div class="card-body">
                <div class="row">
                  <div class="col-5"></div>
                  <div class="col-4">
                    {{$data->links()}}
                  </div>
                  <div class="col-3"></div>
                </div>
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