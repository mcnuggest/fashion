package fashion.domain

class Product {
    
    String id
    Date dateCreated
    Date lastUpdated 
    String createUser
    String updateUser
    
    String productCode
    String barCode
    String productName
    static belongsTo = [supplier: Supplier, productClass: ProductClass]

    static constraints = {
        productCode nullable: false
        productName nullable: false
        barCode nullable: true
        createUser nullable: true
        updateUser nullable: true
        supplier nullable: true
        productClass nullable: true
    }

    static mapping = {
        id generator: 'uuid.hex'
    }
    
}
