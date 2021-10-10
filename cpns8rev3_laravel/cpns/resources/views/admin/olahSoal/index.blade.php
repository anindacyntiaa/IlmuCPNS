@extends('admin/template.main')
@section('title', $title)
@section('content')
    <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Olah Data Soal</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item active">Olah Data Soal</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <!-- menampilkan respon CRUD -->
          @if(session('tambah'))
              <div class="alert alert-success" role="alert">{{session('tambah')}}</div>
          @endif
          @if(session('edit'))
              <div class="alert alert-warning" role="alert">{{session('edit')}}</div>
          @endif
          @if(session('hapus'))
              <div class="alert alert-danger" role="alert">{{session('hapus')}}</div>
          @endif
          
          <!-- Menampilkan Error pada saat validasi -->
          @if (count($errors) > 0)
            @foreach ($errors->all() as $error)
            <div class="alert alert-danger" role="alert">{{$error}}</div>
            @endforeach
          @endif
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
                <a href="{{url('admin/olahSoal/tambah')}}" class="btn btn-primary btn-sm">Tambah Data</a>
                <button type="button" class="btn btn-success btn-sm" data-toggle="modal"data-target="#tambahFile">Import File Soal</button>
              </div>
              <div class="card-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th width="10px">No</th>
                        <th width="150px">Kategori</th>
                        <th>Tipe Soal</th>
                        <th>Soal</th>
                        <th>Kunci</th>
                        <th width="30">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $no = 1;?>
                    @foreach($data as $d)
                    <tr>
                        <td>{{$no++}}</td>
                        <th>{{$d->getKategori->nama_kategori}}</th>
                        <th>{{$d->tipe_soal}}</th>
                        <th>{{$d->soal}}</th>
                        <th>{{$d->kunci}}</th>
                        <td>
                          <div class="btn-group-vertical">
                            <button type="button" class="btn btn-success btn-sm" data-toggle="modal"data-target="#detailSoal-{{$d->id_soal}}">
                              Detail
                            </button>
                            <a href="{{url('admin/olahSoal/edit')}}/{{$d->id_soal}}" class="btn btn-warning btn-sm">Edit</a>
                            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal"data-target="#hapusSoal-{{$d->id_soal}}">
                              Hapus
                            </button>
                          </div>
                        </td>
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

  <!-- MODAL TAMBAH SOAL FILE -->
  <div class="modal fade" id="tambahFile" tabindex="-1" role="dialog" aria-labelledby="tambahFile" aria-hidden="true">
      <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title" id="tambahFile">Tambah File Soal</h5>
              </div>
              <div class="modal-body">
                  <form action="{{url('admin/olahSoal/tambahFile')}}" enctype="multipart/form-data" method="post">
                      {{csrf_field()}}
                      <div class="form-group">
                          <input type="file" name="file" class="form-control form-control-sm">
                      </div>
                      <small>Perhatian : Type file harus xlsx, xls</small></br>
                      <div class="form-group">
                        <a href="{{ url('/admin/olahSoal/contoh') }}" class="btn btn-primary btn-sm">Unduh Template</a>
                      </div>
                      <div class="form-group">
                          <button type="submit" class="btn btn-success">Import</button>
                          <button type="button" class="btn btn-danger" data-dismiss="modal">Kembali</button>
                      </div>
                  </form>
              </div>
          </div>
      </div>
  </div>

  <!-- MODAL HAPUS DATA -->
  @foreach($data as $hapus)
    <div class="modal fade" id="hapusSoal-{{$hapus->id_soal}}" tabindex="-1" role="dialog" aria-labelledby="hapusSoal" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="hapusSoal">Hapus Data Soal</h5>
                </div>
                <div class="modal-body">
                    <form action="{{url('admin/olahSoal/hapus')}}/{{$hapus->id_soal}}" method="post">
                        {{csrf_field()}}
                        <div class="form-group">
                            <p>Hapus Soal : {{$hapus->soal}}</p>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Hapus</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Tidak</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
  @endforeach

  <!-- MODAL Detail DATA -->
  @foreach($data as $detail)
    <div class="modal fade" id="detailSoal-{{$detail->id_soal}}" tabindex="-1" role="dialog" aria-labelledby="detailSoal" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="detailSoal">Detail Soal</h5>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Kembali</button>
                </div>
                <div class="modal-body">
                    <form action="#" method="post">
                        {{csrf_field()}}
                        <div class="row">
                          <div class="col-6">
                            <div class="form-group">
                              <label>Kategori Soal</label>
                              <input type="text" class="form-control form-control-sm" name="id_kategori" value="{{$detail->getKategori->nama_kategori}}" readonly>
                            </div>
                            <div class="form-group">
                              <label>Soal</label>
                              <textarea name="soal" class="form-control form-control-sm" cols="30" rows="3" readonly>{{$detail->soal}}</textarea>
                            </div>
                            <div class="form-group">
                              <label>Kunci</label>
                              <input type="text" name="kunci" class="form-control form-control-sm" readonly value="{{$detail->kunci}}" placeholder="Kunci Jawaban">
                            </div>
                            <div class="form-group">
                              <label>Skor</label>
                              <input type="number" name="skor" class="form-control form-control-sm" readonly value="{{$detail->skor}}" placeholder="Skor">
                            </div>
                            <div class="form-group">
                              <label>Pembahasan</label>
                              <textarea name="pembahasan" class="form-control form-control-sm" readonly cols="30" rows="5">{{$detail->pembahasan}}</textarea>
                            </div>
                          </div>
                          <div class="col-6">
                            <div class="form-group">
                              <label>Jawaban 1</label>
                              <input type="text" name="j1" class="form-control form-control-sm" readonly value="{{$detail->j1}}" placeholder="Jawaban 1">
                            </div>
                            <div class="form-group">
                              <label>Jawaban 2</label>
                              <input type="text" name="j2" class="form-control form-control-sm" readonly value="{{$detail->j2}}" placeholder="Jawaban 2">
                            </div>
                            <div class="form-group">
                              <label>Jawaban 3</label>
                              <input type="text" name="j3" class="form-control form-control-sm"readonly value="{{$detail->j3}}" placeholder="Jawaban 3">
                            </div>
                            <div class="form-group">
                              <label>Jawaban 4</label>
                              <input type="text" name="j4" class="form-control form-control-sm" readonly value="{{$detail->j4}}" placeholder="Jawaban 4">
                            </div>
                            <div class="form-group">
                              <label>Jawaban 5</label>
                              <input type="text" name="j5" class="form-control form-control-sm" readonly value="{{$detail->j5}}" placeholder="Jawaban 5">
                            </div>
                          </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
  @endforeach
@endsection