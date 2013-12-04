import org.apache.log4j.ConsoleAppender
import org.apache.log4j.PatternLayout

grails.project.groupId = br.com.romalopes.romamoneygrails // change this to alter the default package name and Maven publishing destination
grails.project.groupId = appName
grails.mime.file.extensions = true
grails.mime.use.accept.header = false
grails.mime.types = [
	all:           '*/*',
	atom:          'application/atom+xml',
	css:           'text/css',
	csv:           'text/csv',
	form:          'application/x-www-form-urlencoded',
	html:          ['text/html','application/xhtml+xml'],
	js:            'text/javascript',
	json:          ['application/json', 'text/json'],
	multipartForm: 'multipart/form-data',
	rss:           'application/rss+xml',
	text:          'text/plain',
	xml:           ['text/xml', 'application/xml']
]

grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']
grails.views.default.codec = "html"
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
grails.views.gsp.sitemesh.preprocess = true
grails.scaffolding.templates.domainSuffix = 'Instance'
grails.json.legacy.builder = false
grails.enable.native2ascii = true
grails.spring.bean.packages = []
grails.web.disable.multipart=false
grails.exceptionresolver.params.exclude = ['password']
grails.hibernate.cache.queries = false

environments {
	development {
		grails.logging.jul.usebridge = true
	}
	production {
		grails.logging.jul.usebridge = false
	}
}

log4j = {
    def logLayoutPattern = new PatternLayout("%d [%t] %-5p %c %x - %m%n")

    appenders {
        new ConsoleAppender(name: "console",
                layout: logLayoutPattern)
    }
    root {
        warn 'console'
    }

	warn 'org.codehaus.groovy.grails',
	      'org.springframework',
	      'org.hibernate',
	      'net.sf.ehcache.hibernate'
}

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'br.com.romalopes.romamoneygrails.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'br.com.romalopes.romamoneygrails.UserRole'
grails.plugin.springsecurity.authority.className = 'br.com.romalopes.romamoneygrails.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	'**/**':                              ['permitAll'],
	'/index':                         ['permitAll'],
	'/index.gsp':                     ['permitAll'],
	'/**/js/**':                      ['permitAll'],
	'/**/css/**':                     ['permitAll'],
	'/**/images/**':                  ['permitAll'],
	'/**/favicon.ico':                ['permitAll'],
	'/login/**':          			  ['permitAll'],
	 '/logout/**':         			  ['permitAll']
//	'/**/category/*':				  ['ROLE_USER'],
//	'/**/bankaccount/*':			  ['ROLE_USER'],
//	'/**/groupcategory/*':			  ['ROLE_USER'],
//	'/**/transaction/*':			  ['ROLE_USER'],
//	'/**/user/*':			  		  ['ROLE_USER'],
//	'/user/**':              		  ['ROLE_ADMIN']
]



// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'br.com.romalopes.romamoneygrails.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'br.com.romalopes.romamoneygrails.UserRole'
grails.plugin.springsecurity.authority.className = 'br.com.romalopes.romamoneygrails.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	'/':                              ['permitAll'],
	'/index':                         ['permitAll'],
	'/index.gsp':                     ['permitAll'],
	'/**/js/**':                      ['permitAll'],
	'/**/css/**':                     ['permitAll'],
	'/**/images/**':                  ['permitAll'],
	'/**/favicon.ico':                ['permitAll']
]

