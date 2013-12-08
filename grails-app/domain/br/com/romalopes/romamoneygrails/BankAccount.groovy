package br.com.romalopes.romamoneygrails

import java.util.List;

class BankAccount {
	String name
	String description
	BigDecimal balance
	Date dateCreated // Nome predefinido pelo Grails a ser preenchido automaticamente
	
	SecUser secUser
	List transactions
	// Certify that Account  will be deleted if a User is deleted Cascade
	static belongsTo=[secUser:SecUser]
	static hasMany=[transactions:Transaction]
	
    static constraints = {
		name(blank:false, nullable: false, size:2..50)
		description(nullable:true, blank:true, maxSize:300)
        balance(nullable:true)  
        secUser(nullable:false)  
    }  
    String toString(){  
          return name  
    }  

    def getUser(){
    	return user
    }
}
