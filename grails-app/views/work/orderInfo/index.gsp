<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div style="float: left;margin-right: 30px;">
            <h1>
                订单信息管理
                <small>管理所有订单</small>
            </h1>
        </div>

        <div>
            <h1>
                <button class="btn btn-primary" onclick="createProduct();">
                    <i class="fa fa-plus"></i>
                    添加订单信息
                </button>
            </h1>
        </div>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i> 主页</a></li>
            <li><g:link controller="orderInfo" action="index" base="/work">订单管理</g:link></li>
            <li class="active">订单</li>
        </ol>
    </section>
    <!-- Main content -->
    <section class="content">
        <g:render template="/share/pageMessage"/>
        <div style="margin-bottom: 70px">
            <div style="float: left" class="input-group">
                <input type="text" name="search" class="form-control input-sm "
                       style="width: 150px;" placeholder="订单代码/名字"
                       value="${params.search != null ? params.search : ""}"/>

                <div style="float: left">
                    <button type="submit" class="btn btn-sm btn-default"><i
                            class="fa fa-search"></i></button>
                </div>
            </div>
        </div>



        <div class="row">
            <div class="col-xs-12">
                <form id="form" method="post" action="/work/orderInfo/index.do">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">现有订单(共有<span id="domainTotalCount">${total}</span>条记录)</h3>

                            %{--<div class="box-tools">--}%
                                %{--<div class="input-group">--}%
                                    %{--<input type="text" name="search" class="form-control input-sm pull-right"--}%
                                           %{--style="width: 150px;" placeholder="订单代码/名字"--}%
                                           %{--value="${params.search != null ? params.search : ""}"/>--}%

                                    %{--<div class="input-group-btn">--}%
                                        %{--<button type="submit" class="btn btn-sm btn-default"><i--}%
                                                %{--class="fa fa-search"></i></button>--}%
                                    %{--</div>--}%
                                %{--</div>--}%
                            %{--</div>--}%
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
                                <tbody id="domainTableTbody">
                                <g:each in="${orderInfos}">
                                    <tr id="tr_${it.id}">
                                        <td id="td_orderCode_${it.id}">${it.orderCode}</td>
                                        <td id="td_customerID_${it.id}">${it.customerID}</td>
                                        <td id="td_orderTime_${it.id}">${it.orderTime}</td>
                                        <td id="td_totalPrice_${it.id}">${it.totalPrice}</td>
                                        <td id="td_deductionPoint_${it.id}">${it.deductionPoint}</td>
                                        <td id="td_coupondID_${it.id}">${it.coupondID}</td>
                                        <td id="td_payPrice_${it.id}">${it.payPrice}</td>
                                        <td id="td_deliveryAddressID_${it.id}">${it.deliveryAddressID}</td>
                                        <td id="td_status_${it.id}">${it.status}</td>
                                        <td id="td_payTime_${it.id}">${it.payTime}</td>
                                        <td id="td_paymentID_${it.id}">${it.paymentID}</td>
                                        <td id="td_verifyTime_${it.id}">${it.verifyTime}</td>
                                        <td id="td_deliveryTime_${it.id}">${it.deliveryTime}</td>
                                        <td id="td_logisticCompany_${it.id}">${it.logisticCompany}</td>
                                        <td id="td_logisticNumber_${it.id}">${it.logisticNumber}</td>
                                        <td id="td_verifyReceiveTime_${it.id}">${it.verifyReceiveTime}</td>
                                        <td id="td_closeTime_${it.id}">${it.closeTime}</td>
                                        <td id="td_spreaderID_${it.id}">${it.spreaderID}</td>

                                        <td><g:formatDate format="yyyy-MM-dd hh:mm:ss" date="${it.dateCreated}"/></td>
                                        <td>
                                            <i class="fa fa-edit fa-2x" style="cursor:pointer" title="编辑"
                                               onclick="editProduct('${it.id}')"></i>
                                            <i class="fa fa-trash fa-2x" style="cursor:pointer" title="删除"
                                               onclick="delProduct('${it.id}')"></i>
                                        </td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer">
                            <div class="pagination pull-right">
                                <g:paginate controller="orderInfo" action="index" total="${total}"
                                            params='[order: "desc", sort: "orderCode"]'/>
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
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
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
    $(document).ready(function () {

    });

    function createProduct() {
        $.post("/work/orderInfo/create", null, function (data) {
            $("#domainModalBody").html(data);
            $("#domainModal").modal("show");
        }, "html");
    }
    function editProduct(id) {
        $.post("/work/orderInfo/edit", {id: id}, function (data) {
            $("#domainModalBody").html(data);
            $("#domainModal").modal("show");
        }, "html");
    }

    function delProduct(id) {
        bootbox.confirm("确实要删除这个商品吗？", function (isOk) {
            if (isOk) {
                $.post("/work/orderInfo/delete.do", {id: id}, function (data) {
                    if (data.status != "success") {
                        bootbox.alert(data.message, function () {

                        });
                    } else {
                        $("#tr_" + id).remove();
                    }
                }, "json");
            }
        });
    }

    function saveProduct() {
        $.post("/work/orderInfo/save", $("#orderInfoForm").serializeArray(), function (bdata) {
            if (bdata.status != "success") {
                bootbox.alert(bdata.message);
            } else {
                var domainAction = $("#domainAction").val();
                if (domainAction == "create") {
                    var html = "<tr id=\"tr_\"" + bdata.orderInfo.id + ">";
                    html += "<td id=\"td_orderCode_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.orderCode + "</td>";
                    html += "<td id=\"td_customerID_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.customerID + "</td>";
                    html += "<td id=\"td_orderTime_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.orderTime + "</td>";
                    html += "<td id=\"td_totalPrice_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.totalPrice + "</td>";
                    html += "<td id=\"td_deductionPoint_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.deductionPoint + "</td>";
                    html += "<td id=\"td_coupondID_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.coupondID + "</td>";
                    html += "<td id=\"td_payPrice_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.payPrice + "</td>";
                    html += "<td id=\"td_deliveryAddressID_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.deliveryAddressID + "</td>";
                    html += "<td id=\"td_status_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.status + "</td>";
                    html += "<td id=\"td_payTime_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.payTime + "</td>";
                    html += "<td id=\"td_paymentID_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.paymentID + "</td>";
                    html += "<td id=\"td_verifyTime_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.verifyTime + "</td>";
                    html += "<td id=\"td_deliveryTime_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.deliveryTime + "</td>";
                    html += "<td id=\"td_logisticCompany_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.logisticCompany + "</td>";
                    html += "<td id=\"td_logisticNumber_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.logisticNumber + "</td>";
                    html += "<td id=\"td_verifyReceiveTime_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.verifyReceiveTime + "</td>";
                    html += "<td id=\"td_closeTime_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.closeTime + "</td>";
                    html += "<td id=\"td_spreaderID_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.spreaderID + "</td>";
                    html += "<td id=\"td_dateCreated_" + bdata.orderInfo.id + "\">" + bdata.orderInfo.dateCreated + "</td>";
                    html += "<td>";
                    html += "<i class=\"fa fa-edit fa-2x\" style=\"cursor:pointer\" title=\"编辑\" onclick=\"editProduct('" + bdata.orderInfo.id + "')\"></i>";
                    html += "<i class=\"fa fa-trash fa-2x\" style=\"cursor:pointer\" title=\"删除\" onclick=\"delProduct('" + bdata.orderInfo.id + "')\"></i>";
                    html += "</td>";
                    html += "</tr>";
                    $("#domainTableTbody").prepend(html);
                    $("#domainTotalCount").html(parseInt($("#domainTotalCount").html()) + 1)
                } else if (domainAction == "edit") {
                    $("#td_orderCode_" + bdata.orderInfo.id).html(bdata.orderInfo.orderCode);
                    $("#td_customerID_" + bdata.orderInfo.id).html(bdata.orderInfo.customerID);
                    $("#td_orderTime_" + bdata.orderInfo.id).html(bdata.orderInfo.orderTime);
                    $("#td_totalPrice_" + bdata.orderInfo.id).html(bdata.orderInfo.totalPrice);
                    $("#td_deductionPoint_" + bdata.orderInfo.id).html(bdata.orderInfo.deductionPoint);
                    $("#td_coupondID_" + bdata.orderInfo.id).html(bdata.orderInfo.coupondID);
                    $("#td_payPrice_" + bdata.orderInfo.id).html(bdata.orderInfo.payPrice);
                    $("#td_deliveryAddressID_" + bdata.orderInfo.id).html(bdata.orderInfo.deliveryAddressID);
                    $("#td_status_" + bdata.orderInfo.id).html(bdata.orderInfo.status);
                    $("#td_payTime_" + bdata.orderInfo.id).html(bdata.orderInfo.payTime);
                    $("#td_paymentID_" + bdata.orderInfo.id).html(bdata.orderInfo.paymentID);
                    $("#td_verifyTime_" + bdata.orderInfo.id).html(bdata.orderInfo.verifyTime);
                    $("#td_deliveryTime_" + bdata.orderInfo.id).html(bdata.orderInfo.deliveryTime);
                    $("#td_logisticCompany_" + bdata.orderInfo.id).html(bdata.orderInfo.logisticCompany);
                    $("#td_logisticNumber_" + bdata.orderInfo.id).html(bdata.orderInfo.logisticNumber);
                    $("#td_verifyReceiveTime_" + bdata.orderInfo.id).html(bdata.orderInfo.verifyReceiveTime);
                    $("#td_closeTime_" + bdata.orderInfo.id).html(bdata.orderInfo.closeTime);
                    $("#td_spreaderID_" + bdata.orderInfo.id).html(bdata.orderInfo.spreaderID);
                    $("#td_dateCreated_" + bdata.orderInfo.id).html(bdata.orderInfo.dateCreated);


                }
                $("#domainModal").modal("hide");
            }
        }, "json");
    }
</script>



