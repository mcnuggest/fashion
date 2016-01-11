<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><g:layoutTitle default="${g.meta(['name':'info.app.displayName'])}"/></title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://bootboxjs.com/css/main.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="https://almsaeedstudio.com/themes/AdminLTE/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="https://almsaeedstudio.com/themes/AdminLTE/dist/css/skins/skin-blue.min.css">
    <link rel="stylesheet" href="${resource(dir: 'assets/css', file: 'application.css')}" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="${resource(dir: 'assets/js', file: 'html5shiv.min.js')}"></script>
        <script src="${resource(dir: 'assets/js', file: 'respond.min.js')}"></script>
    <![endif]-->
    <g:layoutHead/>
    <asset:javascript src="application.js"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <g:render template="/layouts/work/main-header" />
    <g:render template="/layouts/work/main-sidebar" />
    <g:render template="/layouts/work/main-sidebar" />
    <g:layoutBody/>
    <g:render template="/layouts/work/main-footer" />
</div><!-- ./wrapper -->
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
</body>
</html>
