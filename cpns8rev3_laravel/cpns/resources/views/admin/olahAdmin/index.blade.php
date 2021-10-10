@extends('admin/template.main')
@section('title', $title)
@section('content')
  <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Olah Data Admin</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item active">Olah Data Admin</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <!-- Menampilkan Pesan CRUD -->
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
    </section>
    
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <a href="{{url('admin/olahAdmin/tambah')}}" class="btn btn-primary btn-sm">Tambah Data</a>
              </div>
              <div class="card-body">
              <!-- Tabel Read Data -->
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th width="10px">No</th>
                        <th>Nama Admin</th>
                        <th>No Telp</th>
                        <th>jenis kelamin</th>
                        <th>Username</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $no = 1;?>
                    <!-- Looping data dari database -->
                    @foreach($data as $d)
                    <tr>
                        <td>{{$no++}}</td>
                        <td>{{$d->nama_admin}}</td>
                        <td>{{$d->no_telp}}</td>
                        <td>{{$d->jenis_kelamin}}</td>
                        <td>{{$d->username}}</td>
                        <td>
                          @if($aktif == $d->username)
                            <a href="{{url('admin/olahAdmin/edit')}}/{{$d->id_admin}}" class="btn btn-warning btn-sm">Edit</a>
                          @else
                            <a href="{{url('admin/olahAdmin/edit')}}/{{$d->id_admin}}" class="btn btn-warning btn-sm">Edit</a>
                            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#hapusAdmin-{{$d->id_admin}}">
                              Hapus
                            </button>
                          @endif
                        </td>
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
  

  <!-- MODAL HAPUS DATA -->
  @foreach($data as $hapus)
    <div class="modal fade" id="hapusAdmin-{{$hapus->id_admin}}" tabindex="-1" role="dialog" aria-labelledby="hapusAdmin" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="hapusAdmin">Hapus Data Admin</h5>
                </div>
                <div class="modal-body">
                    <form action="{{url('admin/olahAdmin/hapus')}}/{{$hapus->id_admin}}" method="post">
                        {{csrf_field()}}
                        <div class="form-group">
                            <p>Hapus Admin : {{$hapus->nama_admin}}</p>
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
@endsection

@section('script')
  <script>
    
  </script>
@endsection