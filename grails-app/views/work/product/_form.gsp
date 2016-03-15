<div class="container-fluid">
    <g:form name="productForm" url="[controller:'product', action:'save']" useToken="true">
    <g:hiddenField name="id" value="${product?.id}"/>
    <g:hiddenField name="domainAction" value="${action}"/>
    <div class="row">
        <div class="col-md-6">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">基本信息</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                    <g:hasErrors bean="${product}">
                        <ul>
                            <g:eachError var="err" bean="${product}">
                                <li><g:message error="${err}" /></li>
                            </g:eachError>
                        </ul>
                    </g:hasErrors>
                    <div class="form-group">
                        <label for="productCode">商品编码</label>
                        <input id="productCode" class="form-control money" type="text" placeholder="必填项" name="productCode" value="${product?.productCode}">
                    </div>
                    <div class="form-group">
                        <label for="productName">商品名称</label>
                        <input id="productName" class="form-control money" type="text" placeholder="必填项" name="productName" value="${product?.productName}">
                    </div>
                </div><!-- /.box-body -->
                <div class="box-footer">
                    <a class="btn btn-info" href="/work/create">
                        <i class="fa fa-expand"></i>
                        其他功能
                    </a>
                </div><!-- box-footer -->
            </div><!-- /.box -->
        </div>
        <div class="col-md-6">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">扩展信息</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                    其他信息
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>
    </g:form>
</div>