@extends('peserta/template.main')
@section('title', $title)
@section('content')
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Tryout SKD</h1>
          </div>
          <div class="col-sm-6">
            <h5 class="text-right" id="time"></h5>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- Looping data soal -->
            @foreach($data as $d)
              <form action="{{url('tryout/cekJawaban')}}" method="post">
              {{csrf_field()}}
                <input type="hidden" name="id_soal" value="{{$d->getSoal->id_soal}}">
                <input type="hidden" name="page" value="{{$d->no_soal}}">
                <div class="card">
                  <div class="card-header">
                    <div class="row">
                      <div class="col-6">
                        <h4>Soal {{$d->no_soal}}</h4>
                      </div>
                      <div class="col-6 text-right">
                        <div class="custom-control custom-checkbox">
                          <input type="checkbox" name="ragu"  <?php if($d->ragu == 1){echo 'checked';}?> class="custom-control-input" value="1" id="customCheck1">
                          <label class="custom-control-label" for="customCheck1">Ragu - Ragu</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card-body">
                    <p class="lead">{{$d->getSoal->soal}}</p>
                      <div class="custom-control custom-radio">
                          <input type="radio" <?php if($d->getSoal->j1 == $d->jawaban){echo 'checked';}?> id="customRadioInline1" name="jawaban" value="{{$d->getSoal->j1}}" class="custom-control-input">
                          <label class="custom-control-label lead" for="customRadioInline1"></label><span class="lead">A. {{$d->getSoal->j1}}</span>
                      </div>
                      <div class="custom-control custom-radio">
                          <input type="radio" <?php if($d->getSoal->j2 == $d->jawaban){echo 'checked';}?> id="customRadioInline2" name="jawaban" value="{{$d->getSoal->j2}}" class="custom-control-input">
                          <label class="custom-control-label lead" for="customRadioInline2"></label><span class="lead">B. {{$d->getSoal->j2}}</span>
                      </div>
                      <div class="custom-control custom-radio">
                          <input type="radio" <?php if($d->getSoal->j3 == $d->jawaban){echo 'checked';}?> id="customRadioInline3" name="jawaban" value="{{$d->getSoal->j3}}" class="custom-control-input">
                          <label class="custom-control-label lead" for="customRadioInline3"></label><span class="lead">C. {{$d->getSoal->j3}}</span>
                      </div>
                      <div class="custom-control custom-radio">
                          <input type="radio" <?php if($d->getSoal->j4 == $d->jawaban){echo 'checked';}?> id="customRadioInline4" name="jawaban" value="{{$d->getSoal->j4}}" class="custom-control-input">
                          <label class="custom-control-label lead" for="customRadioInline4"></label><span class="lead">D. {{$d->getSoal->j4}}</span>
                      </div>
                      <div class="custom-control custom-radio">
                          <input type="radio" <?php if($d->getSoal->j5 == $d->jawaban){echo 'checked';}?> id="customRadioInline5" name="jawaban" value="{{$d->getSoal->j5}}" class="custom-control-input">
                          <label class="custom-control-label lead" for="customRadioInline5"></label><span class="lead">E. {{$d->getSoal->j5}}</span>
                      </div>
                      <div class="row mt-3 ml-auto">
                        @if($d->no_soal == 110)
                          <button type="submit" name="action" value="save" class="btn btn-primary btn-sm  mr-3">Selesai Ujian</button>
                          <button type="submit" name="action" value="simpan" class="btn btn-secondary btn-sm">Simpan</button>
                        @else
                          <button type="submit" name="action" value="save" class="btn btn-primary btn-sm  mr-3">Selesai Ujian</button>
                          <button type="submit" name="action" value="next" class="btn btn-btn-primary btn-sm">Simpan dan Lanjutkan</button>
                        @endif
                      </div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
              </form>
            @endforeach

            <div class="card">
              <div class="card-body">
                <!-- Looping index penomoran -->
                @foreach($page as $p)
                  <a href="{{url('/tryout/index')}}?page={{$p->no_soal}}" style="width: 48px;" class="
                  @php if($p->ragu == 1){echo 'btn btn-warning btn-sm mb-1';}elseif($p->jawaban != 'kosong' && $p->jawaban != 'null'){echo 'btn btn-success btn-sm mb-1';}else{echo 'btn btn-danger btn-sm mb-1';}@endphp"
                  >{{$p->no_soal}}</a>
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

@section('script')
  <script>
    if(localStorage.getItem("count_timer")){
      var count_timer = localStorage.getItem("count_timer");
    }else{
      var count_timer = 60*100;
    }

    var minutes = parseInt(count_timer/60);
    var seconds = parseInt(count_timer%60);
    
    function countdownTimer() {
      if(seconds < 10){
        seconds = "0"+ seconds;
      }if(minutes < 10){
        minutes = "0"+minutes
      }

      document.getElementById("time").innerHTML = minutes+":"+seconds;
      if (count_timer <= 0) {
        localStorage.clear("count_timer");
        window.location = url('/konfirmasi');
      }else{
        count_timer = count_timer - 1;
        minutes = parseInt(count_timer/60);
        seconds = parseInt(count_timer%60);
        localStorage.setItem("count_timer", count_timer);
        setTimeout("countdownTimer()", 1000);
      }
    }
    setTimeout("countdownTimer()", 1000);
  </script>
@endsection