<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="PetClinic :: a Grails Framework demonstration"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<r:require modules="jquery,application"/>
		<g:layoutHead/>
		<r:layoutResources/>
	</head>
	<body>

	<body>
		<div id="grailsLogo" role="banner"><a class="home" href="${createLink(uri: '/')}"><img style="width:30px" src="${resource(dir: 'images', file: 'home.png')}" alt="Roma Money Grails"/></a></div>
		<g:if test="${controllerName != 'viewSource'}">
		<aside>
			<h2><g:link controller="viewSource" action="controllerAndView"
			            params="[viewPath:viewPath,controllerClass:controllerClass,viewName:(viewName ?: actionName),controllerName:controllerName]">View/edit source for this page</g:link></h2>
		</aside>
		</g:if>

		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>


<%--		<header><g:img dir="images" file="banner-graphic.png"/></header>

		<g:if test="${controllerName != 'viewSource'}">
		<aside>
			<h2><g:link controller="viewSource" action="controllerAndView"
			            params="[viewPath:viewPath,controllerClass:controllerClass,viewName:(viewName ?: actionName),controllerName:controllerName]">View/edit source for this page</g:link></h2>
		</aside>
		</g:if>

		<div id="main">
			<g:layoutBody/>
		</div>

		<footer>
			<div class="logo"><g:img dir="images" file="springsource-logo.png"/></div>
			<div><g:link uri="/">Home</g:link></div>
		</footer>
		<r:layoutResources/>
	</body>
--%>

</html>
