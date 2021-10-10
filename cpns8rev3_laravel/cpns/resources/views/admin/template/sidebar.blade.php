<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
        </li>
    </ul>
</nav>

<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
    <img src="{{asset('assets/img/Logo2.png')}}" style="width: 30px; margin-left: 15px;" class=""><span class=" ml-2 brand-text font-weight-light">Admin CPNS</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item has-treeview">
                    <a href="{{url('admin')}}" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>Beranda</p>
                    </a>
                </li>
                <li class="nav-item has-treeview">
                    <a href="{{url('admin/olahAdmin/index')}}" class="nav-link">
                        <i class="nav-icon fas fa-user"></i>
                        <p>Olah Data Admin</p>
                    </a>
                </li>
                <li class="nav-item has-treeview">
                    <a href="{{url('admin/olahPeserta/index')}}" class="nav-link">
                        <i class="nav-icon fas fa-users"></i>
                        <p>Olah Data Peserta</p>
                    </a>
                </li>
                <li class="nav-item has-treeview">
                    <a href="{{url('admin/olahPremium/index')}}" class="nav-link">
                        <i class="nav-icon ion ion-card"></i>
                        <p>Olah Peserta Premium</p>
                    </a>
                </li>
                <li class="nav-item has-treeview">
                    <a href="{{url('admin/olahInformasi/index')}}" class="nav-link">
                        <i class="nav-icon fas fa-info-circle"></i>
                        <p>Olah Data Informasi</p>
                    </a>
                </li>
                <li class="nav-item has-treeview">
                    <a href="{{url('admin/olahMateri/index')}}" class="nav-link">
                        <i class="nav-icon fas fa-book"></i>
                        <p>Olah Data Materi</p>
                    </a>
                </li>
                <li class="nav-item has-treeview">
                    <a href="{{url('admin/olahSoal/index')}}" class="nav-link">
                        <i class="nav-icon fas fa-th"></i>
                        <p>Olah Data Soal</p>
                    </a>
                </li>
                <li class="nav-item has-treeview">
                    <a href="{{url('admin/olahHasilUjian/index')}}" class="nav-link">
                        <i class="nav-icon fas fa-copy"></i>
                        <p>Olah Data Hasil Ujian</p>
                    </a>
                </li>
                <li class="nav-item has-treeview">
                    <a href="{{url('admin/logout')}}" class="nav-link">
                        <i class="nav-icon fas fa-power-off"></i>
                        <p>Logout</p>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</aside>