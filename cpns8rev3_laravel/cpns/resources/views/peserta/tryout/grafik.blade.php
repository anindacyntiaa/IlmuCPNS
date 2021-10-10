@extends('peserta/template.main')
@section('title', $title)
@section('content')
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-6">
            <h1>Statistik Tryout SKD</h1>
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
                <a href="{{url('/tryout/hasil')}}" class="btn btn-danger btn-sm">Kembali</a>
              </div>
              <!-- Menampilkan data diri peserta -->
              <div class="card-body">
                <div class="row">
                  <div class="col-3">
                      <p>ID Peserta</p>
                  </div>
                  <div class="col-8">
                    <p>{{sprintf('D'.'%04d', $peserta->kode_peserta)}}</p>
                  </div>
                </div>
                <div class="row">
                  <div class="col-3">
                    <p>Nama Peserta</p>
                  </div>
                  <div class="col-8">
                    <p>{{$peserta->nama_peserta}}</p>
                  </div>
                </div>
                <div class="row">
                  <div class="col-3">
                    <p>Tipe Tryout</p>
                  </div>
                  <div class="col-8">
                    <p >{{$hasil->tipe_tryout}}</p>
                  </div>
                </div>
                <div class="row">
                  <div class="col-3">
                    <p>Tryout Ke</p>
                  </div>
                  <div class="col-8">
                    <p >{{$hasil->kesempatan}}</p>
                  </div>
                </div>
                <div class="row">
                  <div class="col-3">
                    <p>Alamat</p>
                  </div>
                  <div class="col-8">
                    <p >{{$peserta->alamat}}</p>
                  </div>
                </div>
                <div class="row">
                  <div class="col-3">
                    <p>No Handphone</p>
                  </div>
                  <div class="col-8">
                    <p >{{$peserta->no_hp}}</p>
                  </div>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
        <div class="row">
          <div class="col-4">
            <!-- Menampilkan skor total peserta -->
            <div class="card">
              <div class="card-body text-center" style="height: 348px;">
                <h5><b>Skor Akhir</b></h5>
                <p>{{$hasil->total}}</p>
                <p>dari 550</p>
                <h5><b>Keterangan</b></h5>
                @php
                if($hasil->total >= 311 && $hasil->twk >= 65 && $hasil->tiu >= 80 && $hasil->tkp >= 166){
                  echo '<p class="text-success"><b>LULUS</b></p>';
                }else{
                  echo '<p class="text-danger"><b>TIDAK LULUS</b></p>';
                }
                @endphp
              </div>
            </div>
          </div>
          <div class="col-4">
            <!-- membandingkan nilai peserta denga passing grade -->
            <div class="card">
              <div class="card-body text-center" style="height: 348px;">
                <div class="row">
                  <div class="col-6">
                    <h5><b>Hasil</b></h5>
                    <p>TWK = {{$hasil->twk}}</p>
                    <p>TIU = {{$hasil->tiu}}</p>
                    <p>TKP = {{$hasil->tkp}}</p>
                  </div>
                  <div class="col-6">
                    <h5><b>Passing Grade</b></h5>
                    <p>TWK = 65</p>
                    <p>TIU = 80</p>
                    <p>TKP = 166</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-4">
            <div class="card">
              <div class="card-header">
              <h5><b>Detail Pengerjaan</b></h5>
              </div>
              <!-- Chart pengerjaan -->
              <div class="card-body">
                <canvas  id="donutChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
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

@section('script')
<!-- script chart -->
  <script>
    var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
    var donutData        = {
      labels: [
          'TWK Benar', 
          'TIU Benar',
          'TKP Benar', 
          'Tidak Dijawab',
          'Salah'
      ],
      datasets: [
        {
          data: ['<?php echo count($a); ?>', '<?php echo count($b); ?>', '<?php echo count($c); ?>', '<?php echo count($kosong); ?>', '<?php echo count($salah);?>'],
          backgroundColor : ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#d2d6de'],
        }
      ]
    }
    var donutOptions     = {
      maintainAspectRatio : false,
      responsive : true,
    }
    //Create pie or douhnut chart
    // You can switch between pie and douhnut using the method below.
    var donutChart = new Chart(donutChartCanvas, {
      type: 'doughnut',
      data: donutData,
      options: donutOptions      
    })
  </script>
@endsection