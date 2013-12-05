package br.com.romalopes.romamoneygrails

class User {

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	BankAccount currentAccount
	List bankAccounts
		
	static hasMany = [bankAccounts: BankAccount]
	
    String toString(){  
          return username 
    }  

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		currentAccount(nullable: true)
		bankAccounts(nullable:true)
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
