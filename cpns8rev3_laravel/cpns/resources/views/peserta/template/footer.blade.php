<!-- jQuery -->
<script src="{{asset('/assets/plugins/jquery/jquery.min.js')}}"></script>
<!-- Bootstrap 4 -->
<script src="{{asset('/assets/plugins/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
<!-- overlayScrollbars -->
<script src="{{asset('/assets/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js')}}"></script>
<!-- ChartJS -->
<script src="{{asset('/assets/plugins/chart.js/Chart.min.js')}}"></script>
<!-- AdminLTE App -->
<script src="{{asset('/assets/dist/js/adminlte.min.js')}}"></script>
<!-- AdminLTE for demo purposes -->
<script src="{{asset('/assets/dist/js/demo.js')}}"></script>
<!-- DataTables -->
<script src="{{asset('/assets/plugins/datatables/jquery.dataTables.js')}}"></script>
<script src="{{asset('/assets/plugins/datatables-bs4/js/dataTables.bootstrap4.js')}}"></script>
<!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
    });
  });
</script>
@yield('script')
