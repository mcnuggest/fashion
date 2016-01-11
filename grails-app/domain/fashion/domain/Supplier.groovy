package fashion.domain

class Supplier {

    String id
    Date dateCreated
    Date lastUpdated 
    String createUser
    String updateUser
    
    String supplierCode
    String supplierName
    String telephone
    String address
    String webSite
    String zipCode
    String classCode
    String description
    String licenceNumber
    String contactPersonName
    String contactPersonPhone
    String contactPersonMobile
    String contactPersonEmail
    String returnAddress
    String bankAccountName
    String bankAccountNumber
    Date firstSupplyTime
    String memo

    static hasMany = [products: Product]

    static constraints = {
        description maxSize: 500
        memo maxSize: 500
    }
    
    static mapping = {
        id generator: 'uuid.hex'
    }
}
