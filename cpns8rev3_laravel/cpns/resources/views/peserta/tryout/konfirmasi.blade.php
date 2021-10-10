@extends('peserta/template.main')
@section('title', $title)
@section('content')
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-6">
            <h1>Konfirmasi Jawaban</h1>
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
              <div class="card-body">
                <table class="table table-bodered">
                  <thead>
                    <tr>
                      <th>No Soal</th>
                      <th>Detail Jawaban</th>
                    </tr>
                  </thead>
                  <tbody>
                    <!-- lopping jawaban peserta -->
                    @foreach($data as $d)
                    <tr>
                      <td>{{$d->no_soal}}</td>
                      <td>
                        @php
                          if($d->ragu == 1){
                            echo '<p class="text-warning"><b>Ragu-ragu</b></p>';
                          }elseif($d->jawaban == 'kosong'){
                            echo '<p class="text-danger"><b>Tidak Dijawab</b></p>';
                          }elseif($d->jawaban == 'null'){
                            echo '<p class="text-danger"><b>Tidak Dijawab</b></p>';
                          }else{
                            echo '<p class="text-success"><b>Sudah Dijawab</b></p>';
                          }
                        @endphp
                      </td>
                    </tr>
                    @endforeach
                  </tbody>
                </table>
                <div class="row">
                  <div class="col-6"></div>
                  <div class="col-6 text-right">
                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal">
                      Kirim Sekarang
                    </button>
                      <button type="button" class="btn btn-secondary btn-sm" onclick="history.back()">Kembali Mengerjakan</button>
                  </div>
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

  <!-- Modal kirim konfirmasi -->
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Konfirmasi Kirim Jawaban</h5>
        </div>
        <div class="modal-body">
          <form action="{{url('/tryout/postKonfirmasi')}}" method="post">
            {{csrf_field()}}
            <div class="form-group">
              <p>Anda yakin akan mengirim jawaban?</p>
            </div>
            <div class="form-group">
              <button type="submit" onclick="hapusWaktu()" class="btn btn-primary">Kirim</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">Tidak</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
@endsection

@section('script')
<!-- script menghapus localstorage -->
  <script>
    function hapusWaktu() {
      localStorage.clear("count_timer");
    }
  </script>
@endsection