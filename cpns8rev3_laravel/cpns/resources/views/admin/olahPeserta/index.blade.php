@extends('admin/template.main')
@section('title', $title)
@section('content')
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Olah Data Peserta</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item active">Olah Data Peserta</li>
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
        </div>
      </div>
      <!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- Default box -->
            <div class="card">
              <!-- <div class="card-header">
                <a href="{{url('admin/olahPeserta/tambah')}}" class="btn btn-primary btn-sm">Tambah Data</a>
              </div> -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                      <tr>
                          <th width="10px">No</th>
                          <th>Kode Peserta</th>
                          <th>Nama Peserta</th>
                          <th>Email</th>
                          <th>No Telp</th>
                          <th>Aksi</th>
                      </tr>
                  </thead>
                  <tbody>
                      <?php $no = 1;?>
                      @foreach($data as $d)
                      <tr>
                        <td>
</td>
                          <td>{{$no++}}</td>
                          <td>{{sprintf('D'.'%04d', $d->kode_peserta)}}</td>
                          <td>{{$d->nama_peserta}}</td>
                          <td>{{$d->email}}</td>
                          <td>{{$d->no_hp}}</td>
                          <td>
                            <div class="btn-group">
                              <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#detailPeserta-{{$d->kode_peserta}}">
                                Detail
                              </button>
                              <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#hapusPeserta-{{$d->kode_peserta}}">
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

  <!-- MODAL HAPUS DATA -->
  @foreach($data as $hapus)
    <div class="modal fade" id="hapusPeserta-{{$hapus->kode_peserta}}">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="hapusPeserta">Hapus Data Peserta</h5>
                </div>
                <div class="modal-body">
                    <form action="{{url('admin/olahPeserta/hapus')}}/{{$hapus->kode_peserta}}" method="post">
                        {{csrf_field()}}
                        <div class="form-group">
                            <p>Hapus Peserta : {{$hapus->nama_peserta}}</p>
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

  <!-- MODAL DETAIL DATA -->
  @foreach($data as $detail)
    <div class="modal fade" id="detailPeserta-{{$detail->kode_peserta}}">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="detailPeserta">Detail Data Peserta</h5>
                </div>
                <div class="modal-body">
                <form>
                      <div class="row">
                        <div class="col-6">
                          <div class="form-group">
                            <label>Kode Peserta</label>
                            <input type="text" class="form-control form-control-sm" readonly value="{{sprintf('D'.'%04d', $detail->kode_peserta)}}">
                          </div>
                        </div>
                        <div class="col-6">
                          <div class="form-group">
                            <label>No Telepon</label>
                            <input type="number" class="form-control form-control-sm" readonly value="{{$detail->no_hp}}">
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6">
                          <div class="form-group">
                            <label>Nama</label>
                            <input type="text" class="form-control form-control-sm" readonly value="{{$detail->nama_peserta}}">
                          </div>
                        </div>
                        <div class="col-6">
                          <div class="form-group">
                            <label>Tempat Lahir</label>
                            <input type="text" class="form-control form-control-sm" readonly value="{{$detail->tempat_lahir}}">
                            </div>
                          </div>
                        </div>
                      <div class="row">
                        <div class="col-6">
                          <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control form-control-sm" readonly value="{{$detail->email}}">
                          </div>
                        </div>
                        <div class="col-6">
                          <div class="form-group">
                            <label>Tanggal Lahir</label>
                            <input type="date" class="form-control form-control-sm" readonly value="{{$detail->tgl_lahir}}">
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6">
                          <div class="form-group">
                            <label>Alamat</label>
                            <textarea rows="2" class="form-control form-control-sm" readonly>{{$detail->alamat}}</textarea>
                          </div>
                        </div>
                        <div class="col-6">
                          <div class="form-group">
                            <label>Username</label>
                            <input type="text" class="form-control form-control-sm" readonly value="{{$detail->username}}">
                          </div>
                        </div>
                      </div>
                    </form>
                    <div class="row">
                      <div class="col-6">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Kembali</button>
                      </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  @endforeach

@endsection