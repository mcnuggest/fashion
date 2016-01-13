<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            全部商品
            <small>管理所有商品</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i> 主页</a></li>
            <li><g:link controller="product" action="index" base="/work" >商品管理</g:link></li>
            <li class="active">商品</li>
        </ol>
    </section>
    <!-- Main content -->
    <section class="content">
        <g:render template="/share/pageMessage" />
        <h2 class="page-header">
        
        </h2>
        <form id="searchForm" method="get" action="/work/product/index.do" class="form-inline">
            <g:hiddenField name="order" value="${params?.order}"/>
            <g:hiddenField name="sort" value="${params?.sort}"/>
            <g:hiddenField name="offset" value="${params?.offset}"/>
            <g:hiddenField name="max" value="${params?.max}"/>
            <div class="row">
                <div class="col-md-12">
                        <div class="box box-primary collapsed-box">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-search"></i> 商品查询</h3>
                                <div class="box-tools">
                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                                </div>
                            </div><!-- /.box-header -->
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="productCode">商品代码</label>
                                            <input type="text" name="productCode" class="form-control input-md pull-right" style="width: 150px;" placeholder="商品代码" value="${params?.productCode}"  />
                                        </div>                                  
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="productName">名字</label>
                                            <input type="text" name="productName" class="form-control input-md pull-right" style="width: 150px;" placeholder="名字" value="${params?.productName}"  />
                                        </div>                                  
                                    </div>

                                </div>                                                        
                            </div><!-- /.box-body -->
                            <div class="box-footer">
                                <div class="row">
                                    <div class="col-md-2 col-md-offset-4">
                                        <button type="button" class="btn btn-block btn-default" onclick="javascript:loadPage();">查询</button>
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-block btn-danger" onclick="javascript:resetPage();">重置</button>
                                    </div>
                                </div>                  
                            </div>
                        </div><!-- /.box -->                                
                </div>
            </div>
            <div class="row">
                <div class="col-md-12" id="listBoxDiv">
                    <g:render template="box_list_table" />           
                </div><!-- /.col -->
            </div><!-- /.row -->
        </form>
        <div class="row">
            <div class="col-md-12">                
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-info-circle"></i> 商品信息</h3>                            
                    </div><!-- /.box-header -->
                    <div class="box-body" id="domainModalBody">
                        ...
                    </div><!-- /.box-body -->
                    <div class="box-footer">
                            <div class="row">
                                <div class="col-md-2 col-md-offset-2">
                                    <button class="btn btn-block btn-primary" onclick="createProduct();">
                                        <i class="fa fa-plus"></i> 添加商品
                                    </button>  
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-block btn-primary" onclick="editProduct();">
                                        <i class="fa fa-edit"></i> 编辑
                                    </button>
                                </div>                                
                                <div class="col-md-2">
                                    <button id="saveButton" type="button" disabled="disabled" class="btn btn-block btn-primary" onclick="saveProduct();">
                                        <i class="fa fa-save"></i> 保存
                                    </button>
                                </div>
                                <div class="col-md-2">
                                    <button id="delButton" type="button" disabled="disabled" class="btn btn-block btn-primary" onclick="deleteProduct();">
                                        <i class="fa fa-trash"></i> 删除
                                    </button>
                                </div>                                
                            </div>        
                    </div>
                </div><!-- /.box -->                                
            </div>
        </div>        
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
<!-- REQUIRED JS SCRIPTS -->

<!-- page script -->
<script>
    $(document).ready(function() {
        fixPaginationA();
    });   

    function resetPage() {
        $("#searchForm")[0].reset();
        loadPage();
    }

    function loadPage() {
        $.post("/work/product/loadPage", $("#searchForm").serializeArray(), function(data) {
            $("#listBoxDiv").html(data);
            fixPaginationA();       
        }, "html").done();        
    }

    function createProduct(){
        $.post("/work/product/create", null, function(data) {
            $("#domainModalBody").html(data);
            $("#saveButton").attr("disabled", false);            
        }, "html");
    }

    function showProduct(id) {
        $.post("/work/product/edit", {id: id}, function(data) {
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
        var productCode = $("#td_productCode_"+id).html();
        var productName = $("#td_productName_"+id).html();

        bootbox.confirm("您要删除的是"+productCode+" "+productName+"吗？", function(isOk) {
            if (isOk) {
                bootbox.confirm("确认删除吗？", function(isOk) {
                    if (isOk) {   
                        $.post("/work/product/delete.do", {id: id}, function(data) {
                            if (data.status != "success") {
                                bootbox.alert(data.message, function() {

                                });
                            } else {
                                $("#tr_"+id).remove();
                                var total = parseInt($("#domainTotalCount").html())-1;
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
        $.post("/work/product/save", $("#productForm").serializeArray(), function(bdata) {
            if (bdata.status != "success") {
                bootbox.alert(bdata.message);
            } else {
                bootbox.alert("保存成功");
                var domainAction = $("#domainAction").val();
                if (domainAction == "create") {
                    var html = "<tr id=\"tr_\""+bdata.product.id+">";
                    html += "<td id=\"td_productCode_"+bdata.product.id+"\">"+bdata.product.productCode+"</td>";
                    html += "<td id=\"td_productName_"+bdata.product.id+"\">"+bdata.product.productName+"</td>";
                    html += "<td></td>";
                    html += "<td></td>";
                    var t = bdata.product.dateCreated;
                    t = t.replace('T', ' ');
                    t = t.replace('Z','');
                    html += "<td id=\"td_dateCreated_"+bdata.product.id+"\">"+t+"</td>";
                    html += "<td>";
                    html += "    <i class=\"fa fa-edit fa-2x\" style=\"cursor:pointer\" title=\"编辑\" onclick=\"editProduct('"+bdata.product.id+"')\"></i>";
                    html += "    <i class=\"fa fa-trash fa-2x\" style=\"cursor:pointer\" title=\"删除\" onclick=\"delProduct('"+bdata.product.id+"')\"></i>";
                    html += "</td>";
                    html += "</tr>";
                    $("#domainTableTbody").prepend(html);
                    $("#domainTotalCount").html(parseInt($("#domainTotalCount").html())+1);
                }else if (domainAction == "edit") {
                    $("#td_productCode_"+bdata.product.id).html(bdata.product.productCode);
                    $("#td_productName_"+bdata.product.id).html(bdata.product.productName);
                    var t = bdata.product.dateCreated;
                    t = t.replace('T', ' ');
                    t = t.replace('Z','');                    
                    $("#td_dateCreated_"+bdata.product.id).html(t);
                }
                $("#domainModalBody").html("...");
                $("#delButton").attr("disabled", true);
                $("#saveButton").attr("disabled", true);
            }
        }, "json");        
    }

    function setSort(name,dispayName) {
        $("#sort").val(name);
        if ($("#order").val()=="asc") {
            $("#order").val("desc");            
            loadPage();
        } else {
            $("#order").val("asc");
            loadPage();
        }
    }
</script>