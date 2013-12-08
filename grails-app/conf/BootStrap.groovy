import org.grails.samples.PetType
import org.grails.samples.Speciality
import org.grails.samples.Vet

import br.com.romalopes.romamoneygrails.BankAccount
import br.com.romalopes.romamoneygrails.SecUser
import br.com.romalopes.romamoneygrails.GroupCategory
import br.com.romalopes.romamoneygrails.Category

import br.com.romalopes.romamoneygrails.SecRole
import br.com.romalopes.romamoneygrails.SecUserSecRole

class BootStrap {

	def init = { servletContext ->
		makeUsers()
		makeAccounts()
		makeGroupCategories()
		makeTransactions()
		makeSpecialities()

	}

	def makeUsers(){

		if(SecUser.count() > 0)
			return;
		def roleAdmin = new SecRole(authority: 'ROLE_ADMIN')
		if(!roleAdmin.save(flush: true))
		{
				log.error "Could not save roleAdmin!!"
				log.error "${roleAdmin.errors}"
		}

		def roleUser = new SecRole(authority: 'ROLE_USER')
		if(!roleUser.save(flush: true))
		{
				log.error "Could not save roleUser!!"
				log.error "${roleUser.errors}"
		}

		def testUser = new SecUser(username: 'romalopes@yahoo.com.br', password: 'password')
		if(!testUser.save(flush: true)) 
		{
			log.error "Could not save testUser!!"
			log.error "${testUser.errors}"
		}
	
		SecUserSecRole.create testUser , roleAdmin, true

		testUser = new SecUser(username:"romalopes@gmail.com", password: 'foobar')
		testUser.save()

		SecUserSecRole.create testUser , roleUser, true

		testUser = new SecUser(username:"romalopes2@gmail.com", password: 'foobar')
		testUser.save()				
		SecUserSecRole.create testUser , roleUser, true
	}

	def makeAccounts() {
	/*
	    users = User.all
	    user  = users.first

	    #Create fake accounts
	    name = "account1"
	    description = "descriptin of account1"
	    user.accounts.create!(name: name,description: description, balance:50.0)

	    accounts = Account.all
	    account = accounts.first
	    #TODO se value from current_account_id
	#    puts user.name
	#    puts account.id
	#    user.update_attributes(:current_account_id => account.id)

	  
	    user  = User.first
	    puts "#{user.name}   #{user.current_account_id}.. #{account.balance}"

	    name = "account2"
	    description = "descriptin of account2"
	    user.accounts.create!(name: name,description: description, balance:10)

	    name = "account3"
	    description = "descriptin of account3"
	    user.accounts.create!(name: name,description: description, balance:-20)
	*/
	}

	def makeGroupCategories() {

		def income = new GroupCategory(name: "Income",
	                 image: "groupCategory/groupCategory.png",
	                 groupType: "Positive")
		if (!income.save(flush: true)){
				log.error "Could not save income!!"
				log.error "${income.errors}"
		}
		def expense = new GroupCategory(name: "Expense",
	                 image: "groupCategory/groupCategory.png",
	                 groupType: "Negative")
		if (!expense.save(flush: true)){
				log.error "Could not save expense!!"
				log.error "${expense.errors}"
		}

	  assert GroupCategory.count() == 2

	  def category = new Category(name: "Award",description: "", image:"category/category.png")
	  income.addToCategories(category)
	  income.addToCategories(new Category(name: "Salary",description: "", image:"category/category.png"))
	  income.addToCategories(new Category(name: "Selling",description: "", image:"category/category.png"))
	  income.addToCategories(new Category(name: "Donation",description: "", image:"category/category.png"))
	  income.addToCategories(new Category(name: "Others",description: "", image:"category/category.png"))
		
	  income.save(failOnError: true)


	  expense.addToCategories(new Category(name: "Clothing",description: "", image:"category/category.png"))
	  expense.addToCategories(new Category(name: "Entertainment",description: "", image:"category/category.png"))
	  expense.addToCategories(new Category(name: "Family",description: "", image:"category/category.png"))
	  expense.addToCategories(new Category(name: "Food",description: "", image:"category/category.png"))
	  expense.addToCategories(new Category(name: "House",description: "", image:"category/category.png"))
	  expense.addToCategories(new Category(name: "Medical",description: "", image:"category/category.png"))
	  expense.addToCategories(new Category(name: "Shopping",description: "", image:"category/category.png"))
	  expense.addToCategories(new Category(name: "Study",description: "", image:"category/category.png"))
	  expense.addToCategories(new Category(name: "Transport",description: "", image:"category/category.png"))
	  expense.addToCategories(new Category(name: "Travel",description: "", image:"category/category.png"))
	  expense.addToCategories(new Category(name: "Others",description: "", image:"category/category.png") ) 

	  expense.save(failOnError: true)
	  
	}

	def makeTransactions() {
	/*  study_category = Category.find_by(name:"Study")
	  transport_category = Category.find_by(name:"Transport")
	  salary_category = Category.find_by(name:"Salary")

	  user  = User.first
	  account = user.accounts.find_by(name:"account1")

	  Transaction.create!(name:"Transaction Salary",
	                      value: 20,
	                      date: Date.parse(Time.now.to_s),
	                      category:salary_category,
	                      account:account)

	  Transaction.create!(name:"Transaction Study",
	                      value: 10,
	                      date: Date.parse(Time.now.to_s),
	                      category:study_category,
	                      account:account)

	  Transaction.create!(name:"Transaction Transport",
	                      value: 20,
	                      date: Date.parse(Time.now.to_s),
	                      category:study_category,
	                      account:account)

	      #   t.string :name
	      # t.references :castegory, index: true
	      # t.references :account, index: true
	      # t.decimal :value
	      # t.string :description
	      # t.datetime :date
	*/
	}

	def makeSpecialities() {
		if (!Speciality.count()) {
			def radiology = new Speciality(name: 'radiology').save(failOnError: true)
			def surgery =   new Speciality(name: 'surgery').save(failOnError: true)
			def dentistry = new Speciality(name: 'dentistry').save(failOnError: true)

			new Vet(firstName: 'James', lastName: 'Carter').save(failOnError: true)
			new Vet(firstName: 'Helen', lastName: 'Leary')
					.addToSpecialities(radiology)
					.save(failOnError: true)
			new Vet(firstName: 'Linda', lastName: 'Douglas')
					.addToSpecialities(surgery)
					.addToSpecialities(dentistry)
					.save(failOnError: true)
			new Vet(firstName: 'Rafael', lastName: 'Ortega')
					.addToSpecialities(surgery)
					.save(failOnError: true)
			new Vet(firstName: 'Henry', lastName: 'Stevens')
					.addToSpecialities(radiology)
					.save(failOnError: true)
			new Vet(firstName: 'Sharon', lastName: 'Jenkins').save(failOnError: true)

			for (String type in ['dog', 'lizard', 'cat', 'snake', 'bird', 'hamster']) {
				new PetType(name: type).save(failOnError: true)
			}
		}
	}

}



