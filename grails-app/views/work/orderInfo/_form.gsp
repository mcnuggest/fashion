<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">基本信息</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
        <g:hasErrors bean="${orderInfo}">
            <ul>
                <g:eachError var="err" bean="${orderInfo}">
                    <li><g:message error="${err}" /></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form name="orderInfoForm" url="[controller:'orderInfo', action:'save']" useToken="true">
            <g:hiddenField name="id" value="${orderInfo?.id}"/>
            <div class="form-group">
                <label for="orderCode">订单编号</label>
                <input id="orderCode" class="form-control money" type="text" placeholder="必填项" name="orderCode" value="${orderInfo?.orderCode}">
            </div>

            <div class="form-group">
                <label for="customerID">客户ID</label>
                <input id="customerID" class="form-control money" type="text" placeholder="必填项" name="customerID" value="${orderInfo?.customerID}">
            </div>

            <div class="form-group">
                <label for="orderTime">下单时间</label><br>
                <g:datePicker name="orderTime"  value="${orderInfo?.orderTime}" precision="day" years="${1930..3000}"/>
            </div>

            <div class="form-group">
                <label for="totalPrice">总价格</label>
                <input id="totalPrice" class="form-control money" type="text" placeholder="必填项" name="totalPrice" value="${orderInfo?.totalPrice}">
            </div>

            <div class="form-group">
                <label for="payPrice">付款金额</label>
                <input id="payPrice" class="form-control money" type="text" placeholder="必填项" name="payPrice" value="${orderInfo?.payPrice}">
            </div>

            <div class="form-group">
                <label for="deliveryAddressID">收货地址</label>
                <input id="deliveryAddressID" class="form-control money" type="text" placeholder="必填项" name="deliveryAddressID" value="${orderInfo?.deliveryAddressID}">
            </div>

            <div class="form-group">
                <label for="status">订单状态</label>
                <input id="status" class="form-control money" type="text" placeholder="必填项" name="status" value="${orderInfo?.status}">
            </div>

            <div class="form-group">
                <label for="paymentID">付款方式</label>
                <input id="paymentID" class="form-control money" type="text" placeholder="必填项" name="paymentID" value="${orderInfo?.paymentID}">
            </div>

            <div class="form-group">
                <label for="deductionPoint">抵扣积分</label>
                <input id="deductionPoint" class="form-control money" type="text" placeholder="选填项" name="deductionPoint" value="${orderInfo?.deductionPoint}">
            </div>

            <div class="form-group">
                <label for="coupondID">使用优惠券</label>
                <input id="coupondID" class="form-control money" type="text" placeholder="选填项" name="coupondID" value="${orderInfo?.coupondID}">
            </div>

            <div class="form-group">
                <label for="payTime">付款时间</label>
                <input id="payTime" class="form-control money" type="datetime" placeholder="选填项" name="payTime" value="${orderInfo?.payTime}">
            </div>

            <div class="form-group">
                <label for="verifyTime">确认时间</label>
                <input id="verifyTime" class="form-control money" type="text" placeholder="选填项" name="verifyTime" value="${orderInfo?.verifyTime}">
            </div>

            <div class="form-group">
                <label for="deliveryTime">发货时间</label>
                <input id="deliveryTime" class="form-control money" type="text" placeholder="选填项" name="deliveryTime" value="${orderInfo?.deliveryTime}">
            </div>

            <div class="form-group">
                <label for="logisticCompany">物流公司</label>
                <input id="logisticCompany" class="form-control money" type="text" placeholder="选填项" name="logisticCompany" value="${orderInfo?.logisticCompany}">
            </div>

            <div class="form-group">
                <label for="logisticNumber">物流单号</label>
                <input id="logisticNumber" class="form-control money" type="text" placeholder="选填项" name="logisticNumber" value="${orderInfo?.logisticNumber}">
            </div>

            <div class="form-group">
                <label for="verifyReceiveTime">收货确认时间</label>
                <input id="verifyReceiveTime" class="form-control money" type="text" placeholder="选填项" name="verifyReceiveTime" value="${orderInfo?.verifyReceiveTime}">
            </div>

            <div class="form-group">
                <label for="closeTime">订单结束时间</label>
                <input id="closeTime" class="form-control money" type="text" placeholder="选填项" name="closeTime" value="${orderInfo?.closeTime}">
            </div>

            <div class="form-group">
                <label for="spreaderID">微推员代码</label>
                <input id="spreaderID" class="form-control money" type="text" placeholder="选填项" name="spreaderID" value="${orderInfo?.spreaderID}">
            </div>

        </g:form>
    </div><!-- /.box-body -->
    <div class="box-footer">
        <a class="btn btn-info" href="/work/orderInfo/create">
            <i class="fa fa-expand"></i>
            其他功能
        </a>
    </div><!-- box-footer -->
</div><!-- /.box -->