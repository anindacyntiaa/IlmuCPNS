@extends('peserta/template.main')
@section('title', $title)
@section('content')
<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Beranda</h1>
                </div>
            </div>
        </div>
    </section>
    
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- Menampilkan tipe akun -->
                <div class="col-lg-3 col-6">    
                    <div class="small-box bg-warning">
                        <div class="inner">
                            <h3>{{$peserta->tipe_peserta}}</h3>
                            <p>Akun</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-person"></i>
                        </div>
                    </div>
                </div>
                <!-- menampilkan sisa tryout gratis -->
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-secondary">
                        <div class="inner">
                            <h3>{{$peserta->sisa_kesempatan}}x Tryout</h3>
                            <p>Sisa Paket Tryout Gratis</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-compose"></i>
                        </div>
                    </div>
                </div>
                <!-- menampilkan sisa paket premium -->
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-success">
                        <div class="inner">
                            <h3>
                                <!-- percabangan jika peserta bukan premium -->
                                @if(empty($premium))
                                    0
                                @else
                                    {{$premium->sisa_paket}}x Tryout
                                @endif
                            </h3>
                            <p>Sisa Paket Tryout Dibeli</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-document-text"></i>
                        </div>
                    </div>
                </div>
                <!-- menampilkan link membeli paket -->
                <div class="col-lg-3 col-6">
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>Beli Paket?</h3>
                            <a href="https://api.whatsapp.com/send/?phone=6289619965254&text=Kak%2C%20saya%20mau%20beli%20paket%20tryout%0A%0AID%20Peserta%20%20%20%3A%0ANama%20Peserta%20%3A%20%0ABanyak%20Paket%20%3A%20%0A%0ANB%3A%0A-%20Isi%20form%20diatas%20sesuai%20data%20akun%20anda%0A-%20ID%20Peserta%20dapat%20dilihat%20pada%20profil%20akun" target="_blank" class="btn btn-outline-light">Beli Sekarang!!</a>
                        </div>
                        <div class="icon">
                            <i class="ion ion-cash"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- Looping data informasi -->
                @foreach($data as $d)
                <div class="col-lg-3 col-6">
                    <div class="card m-3" style="width: 15rem;">
                        <img src="{{asset('informasi')}}/{{$d->gambar}}" class="card-img-top" style="height: 15rem;">
                        <div class="card-body">
                            <h5 class="card-title">{{$d->judul}}</h5><br>
                            <a href="{{url('/informasi')}}/{{$d->id_informasi}}" class="btn btn-primary">Selengkapnya</a>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </section>
    
</div>
  
@endsection