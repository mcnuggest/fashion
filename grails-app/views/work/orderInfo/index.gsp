<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            订单信息管理
            <small>管理所有订单</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i> 主页</a></li>
            <li><g:link controller="orderInfo" action="index" base="/work" >订单管理</g:link></li>
            <li class="active">订单</li>
        </ol>
    </section>
    <!-- Main content -->
    <section class="content">
        <g:render template="/share/pageMessage" />
        <h2 class="page-header">
        <a class="btn btn-primary" href="/work/orderInfo/create">
            <i class="fa fa-plus"></i>
            添加订单信息
        </a>
        </h2>
        <div class="row">
            <div class="col-xs-12">
                <form id="form" method="post" action="/work/orderInfo/index.do">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">现有订单信息(共有${total}条记录)</h3>
                        <div class="box-tools">
                            <div class="input-group">
                                <input type="text" name="search" class="form-control input-sm pull-right" style="width: 150px;" placeholder="订单代码/名字" value="${params.search !=null?params.search:"" }"  />
                                <div class="input-group-btn">
                                    <button type="submit" class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body table-responsive no-padding">
                        <table id="orderInfoTable" class="table table-hover table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>订单编号</th>
                                <th>客户ID</th>
                                <th>下单时间</th>
                                <th>总价格</th>
                                <th>抵扣积分</th>
                                <th>使用优惠券</th>
                                <th>付款金额</th>
                                <th>收货地址</th>
                                <th>订单状态</th>
                                <th>付款时间</th>
                                <th>付款方式</th>
                                <th>确认时间</th>
                                <th>发货时间</th>
                                <th>物流公司</th>
                                <th>物流单号</th>
                                <th>收货确认时间</th>
                                <th>订单结束时间</th>
                                <th>微推员代码</th>
                                <th>创建时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${orderInfos}">
                                <tr id="tr_${it.id}">
                                    <td>${it.orderCode}</td>
                                    <td>${it.customerID}</td>
                                    <td>${it.orderTime}</td>
                                    <td>${it.totalPrice}</td>
                                    <td>${it.deductionPoint}</td>
                                    <td>${it.coupondID}</td>
                                    <td>${it.payPrice}</td>
                                    <td>${it.deliveryAddressID}</td>
                                    <td>${it.status}</td>
                                    <td>${it.payTime}</td>
                                    <td>${it.paymentID}</td>
                                    <td>${it.verifyTime}</td>
                                    <td>${it.deliveryTime}</td>
                                    <td>${it.logisticCompany}</td>
                                    <td>${it.logisticNumber}</td>
                                    <td>${it.verifyReceiveTime}</td>
                                    <td>${it.closeTime}</td>
                                    <td>${it.spreaderID}</td>
                                    <td><g:formatDate format="yyyy-MM-dd hh:mm:ss" date="${it.dateCreated}"/></td>
                                    <td>
                                        <i class="fa fa-edit fa-2x" style="cursor:pointer" title="编辑" onclick="editOrderInfo('${it.id}')"></i>
                                        <i class="fa fa-trash fa-2x" style="cursor:pointer" title="删除" onclick="delOrderInfo('${it.id}')"></i>
                                    </td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer">
                        <div class="pagination pull-right">
                            <g:paginate controller="orderInfo" action="index" total="${total}" />
                        </div>
                    </div>
                </div><!-- /.box -->
            </form>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
<!-- REQUIRED JS SCRIPTS -->



<!-- Modal -->
<div class="modal fade" id="domainModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">订单信息</h4>
            </div>
            <div class="modal-body" id="domainModalBody">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="saveProduct();">保存</button>
            </div>
        </div>
    </div>
</div>


<!-- page script -->
<script>
    $(document).ready(function() {

    });

    function createProduct(){
        $.post("/work/product/create", null, function(data) {
            $("#domainModalBody").html(data);
            $("#domainModal").modal("show");
        }, "html");
    }
    function editProduct(id){
        $.post("/work/product/edit", {id: id}, function(data) {
            $("#domainModalBody").html(data);
            $("#domainModal").modal("show");
        }, "html");
    }

    function delProduct(id) {
        bootbox.confirm("确实要删除这个商品吗？", function(isOk) {
            if (isOk) {
                $.post("/work/product/delete.do", {id: id}, function(data) {
                    if (data.status != "success") {
                        bootbox.alert(data.message, function() {

                        });
                    } else {
                        $("#tr_"+id).remove();
                    }
                }, "json");
            }
        });
    }

    function saveProduct() {
        $.post("/work/product/save", $("#productForm").serializeArray(), function(bdata) {
            if (bdata.status != "success") {
                bootbox.alert(bdata.message);
            } else {
                var domainAction = $("#domainAction").val();
                if (domainAction == "create") {
                    var html = "<tr id=\"tr_\""+bdata.product.id+">";
                    html += "<td id=\"td_productCode_"+bdata.product.id+"\">"+bdata.product.productCode+"</td>";
                    html += "<td id=\"td_productName_"+bdata.product.id+"\">"+bdata.product.productName+"</td>";
                    html += "<td></td>";
                    html += "<td></td>";
                    html += "<td id=\"td_dateCreated_"+bdata.product.id+"\">"+bdata.product.dateCreated+"</td>";
                    html += "<td>";
                    html += "    <i class=\"fa fa-edit fa-2x\" style=\"cursor:pointer\" title=\"编辑\" onclick=\"editProduct('"+bdata.product.id+"')\"></i>";
                    html += "    <i class=\"fa fa-trash fa-2x\" style=\"cursor:pointer\" title=\"删除\" onclick=\"delProduct('"+bdata.product.id+"')\"></i>";
                    html += "</td>";
                    html += "</tr>";
                    $("#domainTableTbody").prepend(html);
                    $("#domainTotalCount").html(parseInt($("#domainTotalCount").html())+1)
                }else if (domainAction == "edit") {
                    $("#td_productCode_"+bdata.product.id).html(bdata.product.productCode);
                    $("#td_productName_"+bdata.product.id).html(bdata.product.productName);
                    $("#td_dateCreated_"+bdata.product.id).html(bdata.product.dateCreated);
                }
                $("#domainModal").modal("hide");
            }
        }, "json");
    }
</script>



<!-- page script -->
<script>
    $(document).ready(function() {

    });

    function editOrderInfo(id){
        window.location.href = "/work/orderInfo/edit?id=" + id;
    }

    function delOrderInfo(id) {
        bootbox.confirm("确实要删除这个订单信息吗？", function(isOk) {
            if (isOk) {
                $.post("/work/orderInfo/delete.do", {id: id}, function(data) {
                    if (data.status != "success") {
                        bootbox.alert(data.message, function() {

                        });
                    } else {
                        $("#tr_"+id).remove();
                    }
                }, "json");
            }
        });
    }
</script>