@extends('peserta/template.main')
@section('title', $title)
@section('content')
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-6">
            <h1>Ranking Tryout SKD</h1>
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
              <div class="card-header text-right">
                <a href="{{url('tryout/cetakRanking')}}" class="btn btn-primary btn-sm">Download Ranking</a>
              </div>
              <div class="card-body">
                <table class="table table-bordered table-sm" id="example1">
                    <thead class="thead-dark text-center">
                        <tr>
                            <th>Peringkat</th>
                            <th>Nama</th>
                            <th>Tipe Tryout</th>
                            <th>Tryout Ke</th>
                            <th>TWK</th>
                            <th>TIU</th>
                            <th>TKP</th>
                            <th>Nilai Total</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                      @php $no = 1; @endphp
                      <!-- Looping data ranking -->
                      @foreach($data as $rank)
                        <tr>
                            <td class="text-center align-middle">{{$no++}}</td>
                            <td class="align-middle">{{$rank->getPeserta->nama_peserta}}</td>
                            <td class="text-center align-middle">{{$rank->tipe_tryout}}</td>
                            <td class="text-center align-middle">{{$rank->kesempatan}}</td>
                            <td class="text-center align-middle">{{$rank->hasil_twk}}</td>
                            <td class="text-center align-middle">{{$rank->hasil_tiu}}</td>
                            <td class="text-center align-middle">{{$rank->hasil_tkp}}</td>
                            <td class="text-center align-middle">{{$rank->hasil_total}}</td>
                            @php
                            if($rank->hasil_total >= 311 && $rank->hasil_twk >= 65 && $rank->hasil_tiu >= 80 && $rank->hasil_tkp >= 166){
                              echo '<td class="text-center align-middle text-success">';
                              echo '<b>LULUS</b>';
                              echo '</td>';
                            }else{
                              echo '<td class="text-center align-middle text-danger">';
                              echo '<b>TIDAK LULUS</b>';
                              echo '</td>';
                            }
                            @endphp
                        </tr>
                      @endforeach
                    </tbody>
                </table>
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