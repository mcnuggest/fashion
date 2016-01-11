package fashion.domain

class Base {
    
    Date dateCreated
    Date lastUpdated 
    String createUser
    String updateUser
    
    static mapping = {
        id generator: 'uuid.hex'
        tablePerHierarchy false
    }
}