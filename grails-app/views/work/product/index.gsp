<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            界面一
            <small>界面一</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i> 主页</a></li>
            <li><g:link controller="product" action="index" base="/work">界面一</g:link></li>
            <li class="active">一</li>
        </ol>
    </section>
    <!-- Main content -->
    <div class="cow">

        <div class="col-md-2">
            <p>款式风格</p>
            <br/>
        </div>

        <div class="col-md-2">
            <p>款式类型</p>
            <br/>
        </div>

        <div class="col-md-2">
            <p>穿着季节</p>
            <br/>
        </div>

        <div class="col-md-2">
            <p>穿着场合</p>
            <br/>
        </div>

        <div class="col-md-2">
            <p>面料类型</p>
            <br/>
        </div>

        <div class="col-md-2">
            <p>配饰</p>
            <br/>
        </div>

    </div>
</div><!-- /.content-wrapper -->
<!-- REQUIRED JS SCRIPTS -->

<!-- page script -->
<script>
    $(document).ready(function () {
        fixPaginationA();
    });

    function resetPage() {
        $("#searchForm")[0].reset();
        loadPage();
    }

    function loadPage() {
        $.post("/work/product/loadPage", $("#searchForm").serializeArray(), function (data) {
            $("#listBoxDiv").html(data);
            fixPaginationA();
        }, "html").done();
    }

    function createProduct() {
        $.post("/work/product/create", null, function (data) {
            $("#domainModalBody").html(data);
            $("#saveButton").attr("disabled", false);
        }, "html");
    }

    function showProduct(id) {
        $.post("/work/product/edit", {id: id}, function (data) {
            $("#domainModalBody").html(data);
            // 所有输入表单控件只读显示
            $("#productForm input:not(:button,:hidden)").prop("readonly", true);
            $("#delButton").attr("disabled", false);
        }, "html");
    }

    function editProduct() {
        $("#productForm input:not(:button,:hidden)").prop("readonly", false);
        $("#delButton").attr("disabled", false);
        $("#saveButton").attr("disabled", false);
    }

    function deleteProduct() {
        delProduct($("#id").val());
    }

    function delProduct(id) {
        var productCode = $("#td_productCode_" + id).html();
        var productName = $("#td_productName_" + id).html();

        bootbox.confirm("您要删除的是" + productCode + " " + productName + "吗？", function (isOk) {
            if (isOk) {
                bootbox.confirm("确认删除吗？", function (isOk) {
                    if (isOk) {
                        $.post("/work/product/delete.do", {id: id}, function (data) {
                            if (data.status != "success") {
                                bootbox.alert(data.message, function () {

                                });
                            } else {
                                $("#tr_" + id).remove();
                                var total = parseInt($("#domainTotalCount").html()) - 1;
                                total = total <= 0 ? 0 : total;
                                $("#domainTotalCount").html(total);
                                if ($("#id") != null && $("#id").val() == id) {
                                    $("#domainModalBody").html("...");
                                    $("#delButton").attr("disabled", true);
                                    $("#saveButton").attr("disabled", true);
                                }
                            }
                        }, "json");
                    }
                });
            }
        });
    }

    function saveProduct() {
        $.post("/work/product/save", $("#productForm").serializeArray(), function (bdata) {
            if (bdata.status != "success") {
                bootbox.alert(bdata.message);
            } else {
                bootbox.alert("保存成功");
                var domainAction = $("#domainAction").val();
                if (domainAction == "create") {
                    var html = "<tr id=\"tr_\"" + bdata.product.id + ">";
                    html += "<td id=\"td_productCode_" + bdata.product.id + "\">" + bdata.product.productCode + "</td>";
                    html += "<td id=\"td_productName_" + bdata.product.id + "\">" + bdata.product.productName + "</td>";
                    html += "<td></td>";
                    html += "<td></td>";
                    var t = bdata.product.dateCreated;
                    t = t.replace('T', ' ');
                    t = t.replace('Z', '');
                    html += "<td id=\"td_dateCreated_" + bdata.product.id + "\">" + t + "</td>";
                    html += "<td>";
                    html += "    <i class=\"fa fa-edit fa-2x\" style=\"cursor:pointer\" title=\"编辑\" onclick=\"editProduct('" + bdata.product.id + "')\"></i>";
                    html += "    <i class=\"fa fa-trash fa-2x\" style=\"cursor:pointer\" title=\"删除\" onclick=\"delProduct('" + bdata.product.id + "')\"></i>";
                    html += "</td>";
                    html += "</tr>";
                    $("#domainTableTbody").prepend(html);
                    $("#domainTotalCount").html(parseInt($("#domainTotalCount").html()) + 1);
                } else if (domainAction == "edit") {
                    $("#td_productCode_" + bdata.product.id).html(bdata.product.productCode);
                    $("#td_productName_" + bdata.product.id).html(bdata.product.productName);
                    var t = bdata.product.dateCreated;
                    t = t.replace('T', ' ');
                    t = t.replace('Z', '');
                    $("#td_dateCreated_" + bdata.product.id).html(t);
                }
                $("#domainModalBody").html("...");
                $("#delButton").attr("disabled", true);
                $("#saveButton").attr("disabled", true);
            }
        }, "json");
    }

    function setSort(name, dispayName) {
        $("#sort").val(name);
        if ($("#order").val() == "asc") {
            $("#order").val("desc");
            loadPage();
        } else {
            $("#order").val("asc");
            loadPage();
        }
    }
</script>