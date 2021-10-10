<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title')</title>
    @include('admin/template.header')
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    @include('admin/template.sidebar')
    @include('admin/template.body')
    @include('admin/template.footer')
</body>
</html>