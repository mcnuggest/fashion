<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

        <!-- Sidebar user panel (optional) -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${resource(dir: 'assets/img', file: 'avatar5.png')}" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>亲爱的用户</p>
                <!-- Status -->
                <a href="#"><i class="fa fa-circle text-success"></i> 您好</a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>
            <!-- Optionally, you can add icons to the links -->
            <li class="treeview">
                <a href="#"><i class="fa fa-shopping-cart"></i> <span>一级菜单</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><g:link controller="productClass" base="/work" action="index"><i class="fa fa-circle-o"></i> 二级菜单</g:link></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> 二级菜单</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> 二级菜单</a></li>
                </ul>
            </li>
            <li class="active treeview">
                <a href="#"><i class="fa fa-table"></i> <span>一级菜单</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><g:link controller="orderInfo" base="/work" action="index"><i class="fa fa-circle-o"></i> 二级菜单</g:link></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> 二级菜单</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> 二级菜单</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#"><i class="fa fa-male"></i> <span>一级菜单</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> 二级菜单</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> 二级菜单</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#"><i class="fa fa-gear"></i> <span>一级菜单</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> 二级菜单</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> 二级菜单</a></li>
                </ul>
            </li>
        </ul><!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>