<div class="box box-primary">
    <div class="box-body table-responsive no-padding">
        <table id="productTable" class="table table-hover table-bordered table-striped">
            <thead>
            <tr>
                <th class="cursorPointer" id="th_productCode" onclick="javascript:setSort('productCode','商品代码');">
                    <g:if test="${params?.sort == 'productCode'}"><i class="fa fa-sort-amount-${params.order}"></i> </g:if>商品代码
                </th>
                <th class="cursorPointer" id="th_productName" onclick="javascript:setSort('productName','名字');">
                    <g:if test="${params?.sort == 'productName'}"><i class="fa fa-sort-amount-${params.order}"></i> </g:if>名字</th>
                <th>分类</th>
                <th>供应商</th>
                <th class="cursorPointer" id="th_dateCreated" onclick="javascript:setSort('dateCreated','创建时间');">
                    <g:if test="${params?.sort == 'dateCreated'}"><i class="fa fa-sort-amount-${params.order}"></i> </g:if>创建时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="domainTableTbody">
            <g:each in="${products}">
                <tr id="tr_${it.id}" onclick="showProduct('${it.id}')" class="cursorPointer">
                    <td id="td_productCode_${it.id}">${it.productCode}</td>
                    <td id="td_productName_${it.id}">${it.productName}</td>
                    <td></td>
                    <td></td>
                    <td id="td_dateCreated_${it.id}" width="170px"><g:formatDate format="yyyy-MM-dd hh:mm:ss" date="${it.dateCreated}"/></td>
                    <td width="100px">
                        <i class="fa fa-trash fa-2x" style="cursor:pointer" title="删除" onclick="delProduct('${it.id}')"></i>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div><!-- /.box-body -->
    <div class="box-footer">
        <div class="row">
            <div class="col-md-3 pull-left paginatation-total">
                共有 <span id="domainTotalCount">${total}</span> 条记录
            </div>
            <div class="col-md-9">
                <div class="pagination pull-right">
                    <g:paginate controller="product" action="index" total="${total}" params='[order:"desc", sort:"productName"]' />
                </div>                                
            </div>
        </div>                        
    </div>
</div><!-- /.box --> 
