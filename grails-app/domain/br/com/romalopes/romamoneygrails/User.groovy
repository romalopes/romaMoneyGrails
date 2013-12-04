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
	
	//static transients = ['springSecurityService']

	static constraints = {
		username email:true, blank: false, unique: true, size:3..50
		password blank: false
		currentAccount(nullable: true)
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

//	def beforeInsert() {
//		encodePassword()
//	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

//	protected void encodePassword() {
//		password = springSecurityService.encodePassword(password)
//	}

	String toString() {
		return username
	}
}
