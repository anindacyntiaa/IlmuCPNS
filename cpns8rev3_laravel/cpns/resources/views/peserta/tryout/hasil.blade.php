@extends('peserta/template.main')
@section('title', $title)
@section('content')
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-6">
            <h1>Hasil Tryout SKD</h1>
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
            <div class="card">
              <div class="card-header">
                <div class="row">
                    <div class="col-6"></div>
                    <div class="col-6 text-right">
                        <a href="{{url('/tryout/cetak')}}" class="btn btn-sm btn-primary">Cetak Raport</a>
                    </div>
                </div>
              </div>
              <!-- Menampilkan data diri peserta -->
              <div class="card-body">
                <div class="row">
                    <div class="col-4">
                        <p class="lead">ID Peserta</p>
                    </div>
                    <div class="col-8">
                        <p>{{sprintf('D'.'%04d', $peserta->kode_peserta)}}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4">
                        <p class="lead">Nama Peserta</p>
                    </div>
                    <div class="col-8">
                        <p>{{$peserta->nama_peserta}}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4">
                        <p class="lead">Alamat</p>
                    </div>
                    <div class="col-8">
                        <p >{{$peserta->alamat}}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4">
                        <p class="lead">No Handphone</p>
                    </div>
                    <div class="col-8">
                        <p >{{$peserta->no_hp}}</p>
                    </div>
                </div>
                <div class="row">
                  <!-- Menampilkan data dari database -->
                  <table class="table table-sm table-bordered text-center">
                    <thead class="thead-dark">
                      <tr>
                        <th >No</th>
                        <th>Tipe Tryout</th>
                        <th>Tryout Ke</th>
                        <th>TWK</th>
                        <th>TIU</th>
                        <th>TKP</th>
                        <th>Total</th>
                        <th>Keterangan</th>
                        <th>Aksi</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php $no=1;?>
                      <!-- looping data hasil tryout -->
                      @foreach($hasil as $data)
                      <tr>
                        <td class="align-middle">{{$no++}}</td>
                        <td class="align-middle">{{$data->tipe_tryout}}</td>
                        <td class="align-middle">{{$data->kesempatan}}</td>
                        <td class="align-middle">{{$data->hasil_twk}}</td>
                        <td class="align-middle">{{$data->hasil_tiu}}</td>
                        <td class="align-middle">{{$data->hasil_tkp}}</td>
                        <td class="align-middle">{{$data->hasil_total}}</td>
                        @php
                        if($data->hasil_total >= 311 && $data->hasil_twk >= 65 && $data->hasil_tiu >= 80 && $data->hasil_tkp >= 166){
                          echo '<td class="align-middle text-center text-success">';
                          echo '<b>LULUS</b>';
                          echo '</td>';
                        }else{
                          echo '<td class="align-middle text-center text-danger">';
                          echo '<b>TIDAK LULUS</b>';
                          echo '</td>';
                        }
                        @endphp
                        <td class="align-middle">
                            <a href="{{url('/tryout/grafik')}}/{{$data->tipe_tryout}}/{{$data->kesempatan}}" class="btn btn-warning btn-sm">Statistik</a>
                            <a href="{{url('/tryout/pembahasan')}}/{{$data->tipe_tryout}}/{{$data->kesempatan}}" class="btn btn-success btn-sm">Pembahasan</a>
                        </td>
                      </tr>
                      @endforeach
                    </tbody>
                  </table>
                </div>
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