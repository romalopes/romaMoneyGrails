<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}
            
			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
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
		
		
			<div class="row">
				<aside class="span4">
				    <section>
				    </section>
				</aside>
				<div class="span8 center" style="background-color:lightgray; padding-bottom:20px">
			    	<h3>Welcome to the Roma Money Rails</h3><br>
			    	<a class="home btn btn-large btn-primary" style="margin-left:50px" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			  	</div>
			</div>
			<p> Please click in each controller to see all CRUD implemented
			Just as test of security, to access Role and User, you need to be logged in as:
			<ul style="margin-left:35px">
				<li>username: romalopes@yahoo.com.br</li>
				<li>password: foobar</li>
			</ul>
			
			<p>
			
			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
					<ul>
						<li><g:link class="list" controller="bankAccount" action="list">${message(code: 'bankAccount.label', default: 'BankAccount')} </g:link></li>
						<li><g:link class="list" controller="category" action="list">${message(code: 'category.label', default: 'Category')} </g:link></li>
						<li><g:link class="list" controller="groupCategory" action="list">${message(code: 'groupCategpry.label', default: 'groupCategpry')}</g:link></li>
						<li><g:link class="list" controller="tansaction" action="list">${message(code: 'transaction.label', default: 'transaction')}</g:link></li>						
						<li><g:link class="list" controller="user" action="list">${message(code: 'user.label', default: 'User')}</g:link></li>
					</ul>
<%--				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
--%>				
			</div>
		</div>
	</body>
</html>
