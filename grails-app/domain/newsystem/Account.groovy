package newsystem

class Account {  
    String accountId 
    String password 
 
    static constraints = { 
        accountId(size:6..8,unique:true) 
        password(size:6..8) 
    } 
}