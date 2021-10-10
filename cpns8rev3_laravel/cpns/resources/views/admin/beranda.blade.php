@extends('admin/template.main')
@section('title', $title)
@section('content')
  <div class="content-wrapper"> 
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Beranda</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item active">Beranda</li>
            </ol>
          </div>
        </div>
      </div>
    </section>
    
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- Menampilkan jumlah peserta -->
          <div class="col-lg-4 col-6">
            <div class="small-box bg-info">
              <div class="inner">
                <h3>{{$peserta}} Peserta</h3>
                <p>Jumlah Peserta</p><br>
              </div>
              <div class="icon">
                <i class="fas fa-users"></i>
              </div>
            </div>
          </div>
          <!-- Menampilkan jumlah materi -->
          <div class="col-lg-4 col-6">
            <div class="small-box bg-success">
              <div class="inner">
                <h3>{{$materi}} Materi</h3>
                <p>Jumlah Materi</p><br>
              </div>
              <div class="icon">
                <i class="fas fa-book"></i>
              </div>
            </div>
          </div>
          <!-- menampikan jumlah paket yang dibeli -->
          <div class="col-lg-4 col-6">
            <div class="small-box bg-secondary">
              <div class="inner">
                <h3>{{$premium}} Paket</h3>
                <p>Jumlah Paket <br>Premium Dibeli</p>
              </div>
              <div class="icon">
                <i class="ion ion-card"></i>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <!-- menampilkan jumlah soal tryout -->
          <div class="col-lg-4 col-6">
            <div class="small-box bg-warning">
              <div class="inner">
                <h3>{{$tryout}} Soal</h3>
                <p>Jumlah Soal Tryout</p><br>
              </div>
              <div class="icon">
                <i class="fas fa-book"></i>
              </div>
            </div>
          </div>
          <!-- menampilkan jumlah soal latihan -->
          <div class="col-lg-4 col-6">
            <div class="small-box bg-primary">
              <div class="inner">
                <h3>{{$latihan}} Soal</h3>
                <p>Jumlah Soal Latihan</p><br>
              </div>
              <div class="icon">
                <i class="fas fa-book"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
@endsection