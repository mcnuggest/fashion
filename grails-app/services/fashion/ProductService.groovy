package fashion

import grails.transaction.Transactional
import fashion.domain.Product
import grails.validation.ValidationException

@Transactional
class ProductService {

    def allProduct() {
        Product.list()
    }

    def listdata(params) {
        Product.list(offset: params.start, max:params.length, sort:'', order:'')
    }

    def save(product) {
        if(!product.validate()) {
            throw new ValidationException("保存失败", product.errors)
        }else {
            product.save()
        }
    }
}
