<h3>Laporan Hasil Tryout SKD</h3>
<table>
  <thead>
    <tr>
      <th>No</th>
      <th>Nama Peserta</th>
      <th>Tipe Tryout</th>
      <th>Tryout Ke</th>
      <th>TWK</th>
      <th>TIU</th>
      <th>TKP</th>
      <th>Total</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    <?php $no=1?>
    @foreach($data as $rank)
    <tr>
      <td>{{$no++}}</td>
      <td>{{$rank->getPeserta->nama_peserta}}</td>
      <td>{{$rank->tipe_tryout}}</td>
      <td>{{$rank->kesempatan}}</td>
      <td>{{$rank->hasil_twk}}</td>
      <td>{{$rank->hasil_tiu}}</td>
      <td>{{$rank->hasil_tkp}}</td>
      <td>{{$rank->hasil_total}}</td>
      <td>
        @php
        if($rank->hasil_total >= 311 && $rank->hasil_twk >= 65 && $rank->hasil_tiu >= 80 && $rank->hasil_tkp >= 166){echo "Lulus";}
        else{echo "Tidak Lulus";}
        @endphp
      </td>
    </tr>
    @endforeach
  </tbody>
</table>