package fashion.controller

import fashion.domain.Product
import grails.converters.JSON

import javax.xml.bind.ValidationException

class ProductController {
    static layout = 'work/main'
    static namespace = 'work'
    def productService

    def loadPage() {
        def result = search(params)
        render(template: "/${namespace}/${params.controller}/box_list_table", model:[products:result.products, total: result.total])
    }

    def index() {
        search(params)
    }
    
    def create() {
        def p =new Product()
        render(template: "/${namespace}/${params.controller}/form", model:[product:p, action: "create"])
    }
    
    def delete() {
        def p = Product.get(params.id)
        p.delete(flush: true)
        render(contentType: "application/json") {
            def result = ["status": "success","message": "操作成功"]
            render result as JSON
        }
    }
    
    def update() {}
    
    def edit() {
        render(template: "/${namespace}/${params.controller}/form", model:[product: Product.get(params.id), action: "edit"])
    }
    
    def show() {
        [product: Product.get(params.id)]
    }

    def save() {
        def haserror = false
        def message = new StringBuffer()
        def p
        withForm {    
            log.error(params)        
            if (params.domainAction == 'edit') {
                p = Product.get(params.id)
                p.properties = params
            } else if(params.domainAction == 'create'){
                p = new Product(params)
            }
            if (!p.validate()) {
                haserror = true
                p.errors.allErrors.each {e ->
                    message.append(e.toString())
                }
            } else {
                productService.save(p)
                message.append('操作成功')
            }
        }.invalidToken {
            haserror = true
            message.append('不可重复递交')
        }

        render(contentType: "application/json") {
            def result = ["status": haserror?"failed":"success", "message": message, "product": p]
            render result as JSON
        }
    }

    def listdata() {
        render(contentType: "application/json") {
            productService.listdata(params)
        }
    }

    private def search(params) {
        if (!params.max) params.max = 2 //g.meta(['name':'datalist.max']).toInteger()
        if (!params.offset) params.offset = 0
        if (!params.order) params.order = "desc"
        if (!params.sort) params.sort = "dateCreated"

        def searchClosure = {
            if (params.productName) {
                like('productName', "%${params.productName}%")
            }
            if (params.productCode) {
                eq('productCode', params.productCode)
            }            
        }
        
        def c = Product.createCriteria()
        def productlist =  c.list (params, searchClosure)
        [products: productlist, total: productlist.totalCount]        
    }
}
