@extends('peserta/template.main')
@section('title', $title)
@section('content')
    <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Tryout</h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body text-center">
                <!-- Menampilkan pessan error -->
                @if(session('error'))
                  <div class="alert alert-danger" role="alert">{{session('error')}}</div>
                @endif

                <!-- Percabangan sisa paket dan mengerjakan tryout -->
                @if($peserta->tipe_peserta == 'free')
                  @if(!empty($cek) && $cek->status == 0)
                    <div class="alert alert-danger" role="alert">Anda Sedang Mengerjakan Tryout</div>
                    <h3>Selamat Datang Di Tryout CAT CPNS</h3>
                    <p class="lead text-danger"><b>Waktu Pengerjaan Sedang Berjalan</b></p>
                    <a href="{{url('tryout/index')}}" class="btn btn-warning">Kembali Mengerjakan</a><br>
                  @elseif($peserta->sisa_kesempatan == 0)
                    <h3>Selamat Datang Di Tryout CAT CPNS</h3>
                    <div class="alert alert-success" role="alert">
                      Paket Tryout Gratis anda sudah habis. Silahkan <a href="https://api.whatsapp.com/send/?phone=6289619965254&text=Kak%2C%20saya%20mau%20beli%20paket%20tryout%0A%0AID%20Peserta%20%20%20%3A%0ANama%20Peserta%20%3A%20%0ABanyak%20Paket%20%3A%20%0A%0ANB%3A%0A-%20Isi%20form%20diatas%20sesuai%20data%20akun%20anda%0A-%20ID%20Peserta%20dapat%20dilihat%20pada%20profil%20akun" target="_blank" class="alert-link">Klik link ini.</a>Jika ingin membeli paket tryout premium atau chat ke nomer <b>+6289619965254</b>
                    </div><br>
                  @else
                    <h3>Selamat Datang Di Tryout CAT CPNS</h3>
                    <p class="lead">Waktu pengerjaan 100 menit</p>
                    <p>Sisa Kesempatan Gratis {{$peserta->sisa_kesempatan}}X</p>
                    <a href="{{url('tryout/index')}}" class="btn btn-primary">Kerjakan Sekarang</a><br>
                  @endif
                @elseif($peserta->tipe_peserta == 'premium')
                  @if(!empty($cek) && $cek->status == 0)
                    <div class="alert alert-danger" role="alert">Anda Sedang Mengerjakan Tryout</div>
                    <h3>Selamat Datang Di Tryout CAT CPNS</h3>
                    <p class="lead text-danger"><b>Waktu Pengerjaan Sedang Berjalan</b></p>
                    <a href="{{url('tryout/index')}}" class="btn btn-warning">Kembali Mengerjakan</a><br>
                  @elseif($premium->sisa_paket == 0)
                    <h3>Selamat Datang Di Tryout CAT CPNS</h3>
                    <div class="alert alert-success" role="alert">
                      Paket Tryout Premium anda sudah habis. Silahkan <a href="https://api.whatsapp.com/send/?phone=6289619965254&text=Kak%2C%20saya%20mau%20beli%20paket%20tryout%0A%0AID%20Peserta%20%20%20%3A%0ANama%20Peserta%20%3A%20%0ABanyak%20Paket%20%3A%20%0A%0ANB%3A%0A-%20Isi%20form%20diatas%20sesuai%20data%20akun%20anda%0A-%20ID%20Peserta%20dapat%20dilihat%20pada%20profil%20akun" class="alert-link">Klik link ini.</a>Jika ingin membeli paket tryout premium atau chat ke nomer <b>+6289619965254</b>
                    </div><br>
                  @else
                    <h3>Selamat Datang Di Tryout CAT CPNS</h3>
                    <p class="lead">Waktu pengerjaan 100 menit</p>
                    <p>Sisa Kesempatan Premium {{$premium->sisa_paket}}X</p>
                    <a href="{{url('tryout/index')}}" class="btn btn-primary">Kerjakan Sekarang</a><br>
                  @endif
                @endif
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