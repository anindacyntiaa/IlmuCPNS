@extends('peserta/template.main')
@section('title', $title)
@section('content')
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-9">
            <h1>Pembahasan Tryout</h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="container-fluid">
        <div class="row">
          <div class="col-8">
              <!-- Default box -->
            <?php $no=1;?>
            <!-- Looping Pembahasan -->
            @foreach($data as $d)
            <div class="card">
              <div class="card-body">
                <h4>Soal {{$d->no_soal}}</h4>
                <p class="lead">{{$d->soal}}</p>
                <ul class="list-group">
                    <li class="list-group-item">A. {{$d->j1}}</li>
                    <li class="list-group-item">B. {{$d->j2}}</li>
                    <li class="list-group-item">C. {{$d->j3}}</li>
                    <li class="list-group-item">D. {{$d->j4}}</li>
                    <li class="list-group-item">E. {{$d->j5}}</li>
                </ul>
                <p class="lead">Kunci Jawaban : <b>{{$d->kunci}}</b></p>
                <p class="lead">Jawaban Anda : <b>@if($d->jawaban == 'kosong' ) Tidak Diisi @elseif($d->jawaban == 'null') Tidak Diisi @else {{$d->jawaban}} @endif </b></p>
                <p class="lead text-danger">Pembahasan : </p>
                <p>{{$d->pembahasan}}</p>
                <div class="text-center">
                  <a class="btn btn-primary btn-sm mr-3" href="{{url('/tryout/pembahasan')}}/{{$d->tipe_tryout}}/{{$d->kesempatan}}?page={{$d->no_soal - 1}}" rel="prev" aria-label="« Sebelumnya">Sebelumnya</a>
                  <a class="btn btn-primary btn-sm" href="{{url('/tryout/pembahasan')}}/{{$d->tipe_tryout}}/{{$d->kesempatan}}?page={{$d->no_soal + 1}}" rel="next" aria-label="Berikutnya »">Berikutnya</a>
                </div>
              </div>
            <!-- /.card-body -->
            </div>
            <!-- /.card -->
            @endforeach
          </div>
          <div class="col-4">
            <div class="card">
              <div class="card-body">
                <div class="row">
                  <div class="col-12">
                    <p>Keterangan :</p>
                    <div class="row">
                      <div class="col-6 text-right"><p class="btn btn-success"></p></div>
                      <div class="col-6"><p>Jawaban Benar</p></div>
                    </div>
                    <div class="row">
                      <div class="col-6 text-right"><p class="btn btn-danger"></p></div>
                      <div class="col-6"><p>Jawaban Salah</p></div>
                    </div>
                    <div class="row">
                      <div class="col-6 text-right"><p class="btn btn-secondary"></p></div>
                      <div class="col-6"><p>Tidak Diisi</p></div>
                    </div>
                  </div>
                </div>

                <!-- index penomoran -->
                @foreach($page as $p)
                  @if($p->nilai > 0 )
                    <a href="{{url('/tryout/pembahasan')}}/{{$p->tipe_tryout}}/{{$p->kesempatan}}?page={{$p->no_soal}}" style="width: 48px;" class="btn btn-sm btn-success mb-1">{{$p->no_soal}}</a>
                  @elseif($p->jawaban != 'kosong' && $p->jawaban != 'null' )
                    <a href="{{url('/tryout/pembahasan')}}/{{$p->tipe_tryout}}/{{$p->kesempatan}}?page={{$p->no_soal}}" style="width: 48px;" class="btn btn-sm btn-danger mb-1">{{$p->no_soal}}</a>
                  @else
                    <a href="{{url('/tryout/pembahasan')}}/{{$p->tipe_tryout}}/{{$p->kesempatan}}?page={{$p->no_soal}}" style="width: 48px;" class="btn btn-sm btn-secondary mb-1">{{$p->no_soal}}</a>
                  @endif
                @endforeach
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