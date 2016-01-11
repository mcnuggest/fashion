package fashion

import grails.transaction.Transactional
import fashion.domain.OrderInfo
import grails.validation.ValidationException

@Transactional
class OrderInfoService {

    def allOrderInfo() {
        OrderInfo.list()
    }

    def listdata(params) {
        OrderInfo.list(offset: params.start, max:params.length, sort:'', order:'')
    }

    def save(orderInfo) {
        if(!orderInfo.validate()) {
            throw new ValidationException("保存失败", orderInfo.errors)
        }else {
            orderInfo.save()
        }
    }


}
