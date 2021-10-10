@extends('admin/template.main')
@section('title', $title)
@section('content')
  <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Olah Data Hasil Ujian</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item active">Olah Data Hasil Ujian</li>
            </ol>
          </div>
        </div>
      </div>
    </section>
    
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <!-- Tabel Read Data Hasil Ujian -->
                <table id="example1" class="table table-bordered">
                  <thead class="bg-dark">
                    <tr>
                      <th width="10px">No</th>
                      <th>Nama Peserta</th>
                      <th>Tipe Tryout</th>
                      <th>Tryout Ke</th>
                      <th>TWK</th>
                      <th>TIU</th>
                      <th>TKP</th>
                      <th>Hasil Total</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $no=1;?>
                    <!-- Looping Data dari database -->
                    @foreach($data as $d)
                    <tr>
                      <td>{{$no++}}</td>
                      <td>{{$d->getPeserta->nama_peserta}}</td>
                      <td>{{$d->tipe_tryout}}</td>
                      <td>{{$d->kesempatan}}</td>
                      <td>{{$d->hasil_twk}}</td>
                      <td>{{$d->hasil_tiu}}</td>
                      <td>{{$d->hasil_tkp}}</td>
                      <td>{{$d->hasil_total}}</td>
                      @php
                        if($d->hasil_total >= 311 && $d->hasil_twk >= 65 && $d->hasil_tiu >= 80 && $d->hasil_tkp >= 166){
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
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
@endsection