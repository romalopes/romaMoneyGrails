import org.grails.samples.PetType
import org.grails.samples.Speciality
import org.grails.samples.Vet

import br.com.romalopes.romamoneygrails.BankAccount
import br.com.romalopes.romamoneygrails.Role
import br.com.romalopes.romamoneygrails.User
import br.com.romalopes.romamoneygrails.UserRole


class BootStrap {

	def init = { servletContext ->

		if(User.count() == 0) {
			def testUser = new User(username: 'me', password: 'password')
			testUser.save(flush: true)

			User userCida = new User(username:"cydynha@msn.com", password: 'foobar')
			if (!userCida.save()){
				log.error "Could not save user!!"
				log.error "${userCida.errors}"
			}
		}

		def testUser = new User(username: 'me', password: 'password')
		testUser.save(flush: true)

		User userCida = new User(username:"cydynha@msn.com", password: 'foobar')
		if (!userCida.save()){
			log.error "Could not save user!!"
			log.error "${userCida.errors}"
		}


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
