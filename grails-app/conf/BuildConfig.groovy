grails.server.port.http = 8090
grails.servlet.version = "2.5"
grails.project.work.dir = "target/$grailsVersion"
grails.project.target.level = 1.6
grails.project.source.level = 1.6

grails.project.dependency.resolution = {

	inherits "global"
	log "warn"
	checksums true

	repositories {
		inherits true

		grailsPlugins()
		grailsHome()
		grailsCentral()

        mavenLocal()
        mavenCentral()
        mavenRepo 'http://repo.spring.io/milestone'
        mavenRepo "http://download.java.net/maven/2/"
		mavenRepo "http://repo.spring.io/milestone/"
	}

    dependencies {
        runtime 'mysql:mysql-connector-java:5.1.25'
    }

	plugins {
		runtime ":hibernate:$grailsVersion"
		runtime ":jquery:1.8.0", ":jquery-ui:1.8.24"
		runtime ":resources:1.1.6"
		build ":tomcat:$grailsVersion"
		runtime ':twitter-bootstrap:2.3.2'
		compile ':spring-security-core:2.0-RC2'
        runtime ":database-migration:1.1"
        compile ':cache:1.0.0'
        compile ':webxml:1.4.1'
        compile ":spring-security-ui:1.0-RC1"

	}
}
