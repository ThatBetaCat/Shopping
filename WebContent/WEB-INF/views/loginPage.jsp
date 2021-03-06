<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>


<%@include file="include/header.jsp"%>

<style>
.header {
	padding: 22px 0px;
	height: 88px;
	width: 1190px;
	margin: auto;
}

a {
	text-decoration: none;
}

.header .tm-logo {
	margin-top: 8px;
	width: 190px;
}

#mallPage, #mallPage.mallChn {
	width: auto;
	min-width: 990px;
	background-color: transparent;
}
</style>
<div class="mallPage" id="mallPage">
	<div class="header">
		<a href="${ctx }/home.action"> <img
			src="${ctx }/img/fore/tmallLogo.png" class="tm-logo">
		</a>
	</div>
</div>

<style>
* {
	margin: 0;
	padding: 0;
}

input:focus {
	outline: none;
}

.content {
	position: relative;
	width: 100%;
	margin-bottom: 40px;
}

.login-banner-wrap img {
	display: block;
	margin: auto;
}

.content .form {
	display: none;
	position: absolute;
	top: 91px;
	right: 60px;
	background: #fff;
}

.form-inner {
	padding: 25px 26px 20px;
	width: 350px;
	height: 404px;
}

.static-form {
	display: block;
	position: relative;
}

.login-title {
	height: 18px;
	line-height: 18px;
	font-size: 16px;
	color: #3c3c3c;
	margin-top: 19px;
	padding-bottom: 8px;
	font-weight: 700;
}

.field {
	margin-top: 25px;
	position: relative;
}

div.field {
	border: 1px solid #CBCBCB;
	margin: 20px 0px;
}

div.field span.loginInputIcon {
	margin: 0px;
	background-color: #CBCBCB;
	width: 40px;
	height: 40px;
	display: inline-block;
	position: relative;
	top: -1px;
	left: 1px;
}

span.loginInputIcon span.glyphicon {
	font-size: 22px;
	position: relative;
	left: 9px;
	top: 9px;
	color: #606060;
}

div.field input {
	display: inline-block;
	border: 0px solid transparent;
	width: 251px;
	height: 40px;
	position: relative;
	left: 2px;
	top: 1px;
}

button.redButton {
	color: white;
	background-color: #FF0036;
	font-size: 16px;
	font-weight: 700;
	height: 42px;
	line-height: 42px;
	vertical-align: middle;
	width: 300px;
	border-radius: 3px;
	border: 0;
}

button.redButton:hover {
	background-color: rgba(255, 0, 54, .8);
}
</style>
<script>
    $(function(){

      
        $("form.loginForm").submit(function(){
            if(0==$("#name").val().length||0==$("#password").val().length){
                $("span.errorMessage").html("请输入账号密码");
                $("div.loginErrorMessageDiv").show();
                return false;
            }
            return true;
        });

        $("form.loginForm input").keyup(function(){
            $("div.loginErrorMessageDiv").hide();
        });
        $("#login_form").on('submit',null,function(){
        	var user = $(this).serialize();
        	console.log(user);
        	$.post('${ctx}/user/login.action',user,function(data){
        		if(eval(data) == 1){
					if(document.referrer != '' && document.referrer != window.location.href){
						window.location = document.referrer;
        			}else if(window.location.pathname == '/Shopping/user/login.action'){
        				window.location = 'http://localhost:8080/Shopping/';
        			}else{
        			    window.location = window.location.href;        				
        			}
        		} else{
        			  $("span.errorMessage").html(eval(data));
        		      $("div.loginErrorMessageDiv").show();
        		}
        	})
        	return false;
        });
    })
</script>
<div class="content">
	<div class="login-banner-wrap"
		style="width: 100%; background-color: rgb(223, 226, 231);" title="">
		<div class="inner">
			<img src="${ctx}/img/fore/loginPage-background.jpg">
		</div>
	</div>

	<div class="form" style="display: block; right: 176.5px;">
		<div class="form-inner">
			<div class="static-form">
				<div class="loginErrorMessageDiv" style="display: none;">
					<div class="alert alert-danger">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close"></button>
						<span class="errorMessage"></span>
					</div>
				</div>
				<div class="login-title">密码登录</div>
				<form action="${ctx }/user/beginLogin.action" id="login_form"
					class="loginForm" method="post">
					<div class="field">
						<span class="loginInputIcon"> <span
							class=" glyphicon glyphicon-user"></span>
						</span> <input id="name" name="userName" placeholder="手机/会员名/邮箱"
							type="text">
					</div>
					<div class="field">
						<span class="loginInputIcon "> <span
							class=" glyphicon glyphicon-lock"></span>
						</span> <input id="password" name="userPwd" type="password"
							placeholder="密码" type="text">
					</div>

					<span class="text-danger">不要输入真实的天猫账号密码</span><br>
					<br>

					<div style="margin-top: 10px">
						<button class="redButton" type="submit">登 录</button>
					</div>

					<div style="margin-top: 20px;">
						<a class="notImplementLink" href="#nowhere">忘记登录密码</a> <a
							href="${ctx }/user/register.action" class="pull-right">免费注册</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@include file="include/footer.jsp"%>
</body>
</html>