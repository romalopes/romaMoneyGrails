		
<%--		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h1>Application Status</h1>
			<ul>
				<li>App version: <g:meta name="app.version"/></li>
				<li>Services: ${grailsApplication.serviceClasses.size()}</li>
				<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
			</ul>
			<h1>Installed Plugins</h1>
			<ul>
				<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
					<li>${plugin.name} - ${plugin.version}</li>
				</g:each>
			</ul> 
		</div>--%>

		<div id="page-body" role="main">
			<sec:ifNotLoggedIn>
				<div class="row">
					<aside class="span4">
					    <section>
					    	ROMA
					    </section>
					</aside>
					<div class="span8 center" style="background-color:lightgray; padding-bottom:20px">
						<CENTER>
				    	<h3>Welcome to the Roma Money Grails</h3><br>
				    	<g:link controller="login" action="auth" class="home btn btn-large btn-primary"><g:message code="default.login.label"/></g:link>
				    	<g:link controller="user" action="create" class="home btn btn-large btn-primary"><g:message code="default.signup.label"/></g:link>
				    	
				    	</CENTER>
				  	</div>
				</div>
				<p> Please click in each controller to see all CRUD implemented
				Just as test of security, to access Role and User, you need to be logged in as:
				<ul style="margin-left:35px">
					<li>username: romalopes@yahoo.com.br</li>
					<li>password: password</li>
				</ul>
				<p>
			</sec:ifNotLoggedIn>
			<sec:ifLoggedIn>
				<div id="controller-list" role="navigation">
					<h2>Available Controllers:</h2>
						<ul>
							<li><g:link class="list" controller="bankAccount" action="list">${message(code: 'bankAccount.label', default: 'BankAccount')} </g:link></li>
<%--
							<li><g:link class="list" controller="category" action="list">${message(code: 'category.label', default: 'Category')} </g:link></li>
							<li><g:link class="list" controller="groupCategory" action="list">${message(code: 'groupCategpry.label', default: 'groupCategpry')}</g:link></li>
--%>							
						<g:hasCurrentAccount>
							<li><g:link class="list" controller="transaction" action="list">${message(code: 'transaction.label', default: 'transaction')}</g:link></li>						
						</g:hasCurrentAccount>
							<sec:ifAnyGranted roles="ROLE_ADMIN">
								<li><g:link class="list" controller="user" action="list">${message(code: 'user.label', default: 'User')}</g:link></li>
							</sec:ifAnyGranted>

						</ul>
	<%--				<ul>
						<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
							<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
						</g:each>
					</ul>
	--%>				
				</div>
			</sec:ifLoggedIn>
		</div>
