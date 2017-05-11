<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="nows" class="java.util.Date" />
<nav id="topNav" class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-navbar">
				<span class="sr-only"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>

		</div>
		<div class="navbar-collapse collapse" id="bs-navbar">
			<ul class="nav navbar-nav">
				<li><a title="메인" href="main.do"><i class="fa fa-home"></i>메인</a>
				</li>

				<c:if test="${ !empty login && login.auth eq 1 }">
					<li><a title="관리메뉴" href="/setting.do">관리자 메뉴</a></li>
					<li><a title="관리메뉴" href="/shopwrite.do">가게 작성</a></li>
				</c:if>

			</ul>

			<ul class="nav navbar-nav navbar-right">
				<c:if test="${ !empty login  && login.name ne ''}">
					<li><a class="" data-toggle="modal" data-target="#infomodal"
						title="내정보" href="#"><i class="fa fa-info-circle"></i>${login.name}</a>
					</li>
				</c:if>
				<c:if test="${ !empty login  && login.id ne ''}">
					<li><a href="/logout.do" title="로그아웃">로그아웃</a></li>

				</c:if>

				<c:if test="${empty login}">
					<li><a title="회원가입" href="regi.do">회원가입</a></li>
					<li><a href="#" data-toggle="modal" title="로그인"
						data-target="#shLogin" class="icon06">로그인 </a></li>
				</c:if>

			</ul>
		</div>
	</div>
</nav>

<div class="container-fluid">
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<a href="#" class="thumbnail"> <img src="image/img02gsee.jpg"
					alt="...">
				</a>
				<div class="carousel-caption"></div>
			</div>
			<div class="item">
				<a href="#" class="thumbnail"> <img src="image/img02gsee.jpg"
					alt="...">
				</a>
				<div class="carousel-caption">
					<h3>가라요</h3>
					<p>...</p>
				</div>
			</div>
			<div class="item">
				<img src="image/img02gsee.jpg" class="img4" alt="...">
				<div class="carousel-caption"></div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
</div>
