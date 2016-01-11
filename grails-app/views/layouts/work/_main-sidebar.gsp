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
                <p>供应商</p>
                <!-- Status -->
                <a href="#"><i class="fa fa-circle text-success"></i> 下午好</a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>
            <!-- Optionally, you can add icons to the links -->
            <li class="treeview">
                <a href="#"><i class="fa fa-shopping-cart"></i> <span>商品管理</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><g:link controller="productClass" base="/work" action="index"><i class="fa fa-circle-o"></i> 分类管理</g:link></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> 模板管理</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> 商品上架审核</a></li>
                </ul>
            </li>
            <li class="active treeview">
                <a href="#"><i class="fa fa-table"></i> <span>订单管理</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><g:link controller="orderInfo" base="/work" action="index"><i class="fa fa-circle-o"></i> 订单信息管理</g:link></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> 已支付未发货订单</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> 退款订单</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#"><i class="fa fa-male"></i> <span>客户管理</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> 微推员管理</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> 客户管理</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#"><i class="fa fa-gear"></i> <span>系统管理</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="#"><i class="fa fa-circle-o"></i> 角色管理</a></li>
                    <li><a href="#"><i class="fa fa-circle-o"></i> 联系我们</a></li>
                </ul>
            </li>
        </ul><!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>