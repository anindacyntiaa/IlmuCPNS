<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CETAK HASIL</title>
  <style>
    .container {
      width: auto;
      margin: 20px;
      font-family: Arial;
    }

    .judul {
      text-align: center;
    }

    .biodata {
      margin: 50px;
      margin-bottom: 20px;
      margin-top: 30px;
      padding: 10px;    
    }

    #biodata {
      height: 30px;
    }

    .hasil {
      margin: auto;
      width: 80%;
      padding: 10px;
    }

    #hasil {
      width: 100%;
      border-collapse: collapse;
      border: 1px solid black;
      text-align: center;
    }

  </style>
</head>
<body>
  <div class="container">
    <div class="judul">
      <h3>Laporan Hasil Tryout SKD</h3>
    </div>
    <div class="biodata">
      <table id="biodata">
        <tbody>
          <tr>
            <td style="vertical-align: top;">ID Peserta</td>
            <td style="width: 20px; text-align: center;vertical-align: top;">:</td>
            <td style="vertical-align: top;">{{sprintf('D'.'%04d', $peserta->kode_peserta)}}</td>
          </tr>
          <tr>
            <td style="vertical-align: top;">Nama Peserta</td>
            <td style="width: 20px; text-align: center;vertical-align: top;">:</td>
            <td style="vertical-align: top;">{{$peserta->nama_peserta}}</td>
          </tr>
          <tr>
            <td style="vertical-align: top;">Alamat</td>
            <td style="width: 20px; text-align: center;vertical-align: top;">:</td>
            <td style="vertical-align: top;">{{$peserta->alamat}}</td>
          </tr>
          <tr>
            <td style="vertical-align: top;">No Handphone</td>
            <td style="width: 20px; text-align: center;vertical-align: top;">:</td>
            <td style="vertical-align: top;">{{$peserta->no_hp}}</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="hasil">
      <table border="1" id="hasil">
        <thead style="background-color: darkcyan;">
          <tr>
            <th>No</th>
            <th>Tipe Tryout</th>
            <th>Tryout Ke</th>
            <th>TWK</th>
            <th>TIU</th>
            <th>TKP</th>
            <th>Total</th>
            <th>Keterangan</th>
          </tr>
        </thead>
        <tbody>
          <?php $no=1;?>
          @foreach($hasil as $data)
          <tr>
            <td>{{$no++}}</td>
            <td>{{$data->tipe_tryout}}</td>
            <td>{{$data->kesempatan}}</td>
            <td>{{$data->hasil_twk}}</td>
            <td>{{$data->hasil_tiu}}</td>
            <td>{{$data->hasil_tkp}}</td>
            <td>{{$data->hasil_total}}</td>
            <td>
              @php
              if($data->hasil_total >= 311 && $data->hasil_twk >= 65 && $data->hasil_tiu >= 80 && $data->hasil_tkp >= 166){
                echo '<p class="btn btn-success btn-sm">LULUS</p>';
              }else{
                echo '<p class="btn btn-danger btn-sm">TIDAK LULUS</p>';
              }
              @endphp
            </td>
          </tr>
          @endforeach
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>