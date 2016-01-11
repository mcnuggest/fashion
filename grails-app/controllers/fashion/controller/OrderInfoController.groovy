package fashion.controller

import fashion.domain.OrderInfo
import grails.converters.JSON

class OrderInfoController {
    static layout = 'work/main'
    static namespace = 'work'
    def orderInfoService

    def index() {
        if (!params.max) params.max = 2 //g.meta(['name':'datalist.max'])
        if (!params.offset) params.offset = 0
        if (!params.order) params.order = "desc"
        if (!params.sort) params.sort = "dateCreated"

        def searchClosure = {
            if (params.search) {
//                or{
//                    like('productName', "%${params.search}%")
//                    eq('productCode', params.search)
//                }
            }
        }

        def c = OrderInfo.createCriteria()
        def orderInfolist =  c.list (params, searchClosure)
        [orderInfos: orderInfolist, total:orderInfolist.totalCount]
    }

    def create() {
        log.error(params)
        if(params.id != null) {
            respond OrderInfo.get(params.id)
        }else{
            respond new OrderInfo(params)
        }
    }

    def delete() {
        def p = OrderInfo.get(params.id)
        p.delete(flush: true)
        render(contentType: "application/json") {
            def result = ["status": "success","message": "操作成功"]
            render result as JSON
        }
    }

    def update() {}

    def edit() {
        [orderInfo: OrderInfo.get(params.id)]
    }

    def show() {
        [orderInfo: OrderInfo.get(params.id)]
    }

    def save() {
        def haserror = false
        def message = new StringBuffer()
        withForm {
            def p
            if (params.id != '') {
                p = OrderInfo.get(params.id)
                p.properties = params
            } else {
                p = new OrderInfo(params)
            }
            if (!p.validate()) {
                haserror = true
                p.errors.allErrors.each {e ->
                    message.append(e.toString())
                }
            } else {
                orderInfoService.save(p)
                message.append('操作成功')
            }
        }.invalidToken {
            haserror = true
            message.append('不可重复递交')
        }

        render(contentType: "application/json") {
            def result = ["status": haserror?"failed":"success","message": message]
            render result as JSON
        }
    }

    def listdata() {
        render(contentType: "application/json") {
            orderInfoService.listdata(params)
        }
    }
}
