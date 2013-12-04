package br.com.romalopes.romamoneygrails

class Transaction {
	String name
	String description
	BigDecimal value
	Date dateCreation
	
	Category category
//	// Certify that Transaction  will be deleted if a BankAccount is deleted Cascade
	static belongsTo=[bankAccount:BankAccount]
		
    static constraints = {
		name(blank:false, nullable: false, size:6..50)
		description(maxSize:300)
		value(nullable: false)
		dateCreation (max: new Date())
		category(nullable: false)
		bankAccount(nullable: false)
    }
	
	String toString(){
		return name
  }

}
