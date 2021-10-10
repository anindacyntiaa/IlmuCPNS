<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
        </li>
    </ul>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <p>Hai {{Session::get('peserta')}}</p>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <div class="bg-light">
                <a href="{{url('/akun')}}" class="dropdown-item">Akun</a>
                <a href="{{url('/logout')}}" class="dropdown-item">Logout</a>
            </div>
        </div>
      </li>
    </ul>
</nav>

<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <div  class="brand-link bg-dark">
        <img src="{{asset('assets/img/Logo2.png')}}" style="width: 30px; margin-left: 15px;" class=""><span class=" ml-2 brand-text font-weight-light">Ilmu CPNS</span>
    </div>
    <!-- <a href="#" class="brand-link bg-secondary">
    </a> -->

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item has-treeview">
                    <a href="{{url('/')}}" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>Beranda</p>
                    </a>
                </li>
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-book"></i>
                        <p>
                            Materi SKD
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{url('/materi/TWK')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>  
                                <p>Tes Wawasan Kebangsaan</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{url('/materi/TIU')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Tes Intelegensi Umum</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{url('/materi/TKP')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Tes Karakteristik Pribadi</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="fas fa-th nav-icon"></i>
                        <p>
                            Soal Dan Pembahasan
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{url('/soal/TWK')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Tes Wawasan Kebangsaan</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{url('/soal/TIU')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Tes Intelegensi Umum</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{url('/soal/TKP')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Tes Karakteristik Pribadi</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item has-treeview">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-edit"></i>
                        <p>
                            Tryout SKD
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{url('/tryout/')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Tryout</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{url('/tryout/hasil')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Hasil Tryout</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{url('/tryout/ranking')}}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Ranking Tryout</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item has-treeview">
                    <a href="{{url('/logout')}}" class="nav-link">
                        <i class="fas fa-power-off nav-icon"></i>
                        <p>Logout</p>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</aside>