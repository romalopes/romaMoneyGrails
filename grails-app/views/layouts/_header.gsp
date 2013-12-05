<%end%>
<%-- navigation styled for Twitter Bootstrap 2.3 --%>
<header class="navbar navbar-fixed-top navbar-inverse" >
  <div class="navbar-inner" style="padding:0px">
    <div class="container" style="padding:0 0 5px 5px">
      <nav>
            <div id="grailsLogo" role="banner"><a class="home" href="${createLink(uri: '/')}"><img style="width:30px" src="${resource(dir: 'images', file: 'home.png')}" alt="Roma Money Grails"/></a><sec:username /></div>
        <ul class="nav pull-left">
          <li>Home</li>
          <li>Help</li>
          <sec:ifLoggedIn>
            <!-- if signed_in? -->
              <!-- if current_user.admin? -->
                <li>User</li>
              <!--%end %-->
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" style="background-color:#4B0082;" data-toggle="dropdown">
                  Account <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                  <li>Profile</li>
                  <li>Settings</li>
                  <li class="divider"></li>
                  <li>
                    <sec:username /> (<g:link controller="logout" method="post">sign out</g:link>)
                  </li>
                </ul>
              </li>
  <!--          < %else% > -->
          </sec:ifLoggedIn>
          <sec:ifNotLoggedIn>
            <li><g:link controller="login" action="auth" ><g:message code="default.login.label"/></g:link></li>
          </sec:ifNotLoggedIn>
          <!--% end %-->
        </ul>
        <!--% if signed_in? %-->
          <ul class="nav pull-right" style="padding:8px 5px 0px 5px">
            <li ><!--gravatar_for current_user, {size:30} --></li>
                <li> 
                  <small style="color:lightgray"><!--%= current_user.name %--> </small>
                </li>
          </ul>
        <!--%end%-->

      </nav>
    </div>
  </div>
</header> 