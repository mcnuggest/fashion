<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            编辑订单信息
            <small>增加订单信息</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <g:render template="/share/pageMessage" />
        <h2 class="page-header">
            <button class="btn btn-default" href="#" onclick="if (window.opener != null) { window.close(); } else {history.back(); }">
                <i class="fa fa-arrow-left"></i>
                返回
            </button>
            <button class="btn btn-success" onclick="saveAll();">
                <i class="fa fa-save"></i>
                保存并返回
            </button>
            <button class="btn btn-info">
                <i class="fa fa-expand"></i>
                其他功能
            </button>
        </h2>
        <div class="row">
            <div class="col-md-6">
                <g:render template="form"/>
            </div>
        </div>
    </section>
</div>

<script type="text/javascript">
    function saveAll() {
        $.post("/work/orderInfo/save", $("#orderInfoForm").serializeArray(), function(bdata) {
            if (bdata.status != "success") {
                bootbox.alert(bdata.message);
            } else {
                if (window.opener != null) {
                    //window.opener.location.reload();
                    window.close();
                } else {
                    window.location.href = "/work/orderInfo/index";
                }
            }
        }, "json");
    }

</script>