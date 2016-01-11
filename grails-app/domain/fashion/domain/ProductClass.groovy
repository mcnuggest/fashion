package fashion.domain

class ProductClass {

    String id
    Date dateCreated
    Date lastUpdated 
    String createUser
    String updateUser
    
    String classCode
    String className
    String description
    static hasMany = [products: Product]

    static constraints = {
        classCode nullable:false
        className nullable:false
        description nullable:false
    }

    static mapping = {
//        table 'product_class'
        id generator: 'uuid.hex'
        description maxSize: 500
    }
}