<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title')</title>
    @include('peserta/template.header')
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wapper">
        @include('peserta/template.sidebar')
        @include('peserta/template.body')
        @include('peserta/template.footer')
    </div>
</body>
</html>