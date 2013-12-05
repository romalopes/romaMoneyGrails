package br.com.romalopes.romamoneygrails

import java.util.List;

class BankAccount {
	String name
	String description
	BigDecimal balance
	Date dateCreated // Nome predefinido pelo Grails a ser preenchido automaticamente
	
	User user
	List transactions
	// Certify that Account  will be deleted if a User is deleted Cascade
	static belongsTo=[user:User]
	static hasMany=[transactions:Transaction]
	
    static constraints = {
		name(blank:false, nullable: false, size:6..50)
		description(nullable:true, blank:true, maxSize:300)
        balance(nullable:true)  
        user(nullable:false)  
    }  
    String toString(){  
          return name  
    }  
}
