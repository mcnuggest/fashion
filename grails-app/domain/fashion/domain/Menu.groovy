package fashion.domain

class Menu {
    
    String id
    Date dateCreated
    Date lastUpdated 
    String createUser
    String updateUser
    
    String allowTypes
    String icon
    String name
    Integer sort
    String url
    
    static belongsTo = [parent: Menu]
    
    static constraints = {
        parent nullable: true
    }
    
    static mapping = {
        id generator: 'uuid.hex'
    }
}
