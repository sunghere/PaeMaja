<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-04-21
  Time: 오후 4:06
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.pae.maja.pmashop.model.PMAShopDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/yscss.css" />
<div class="row">

		<c:if test="${empty shoplist}">
	없어
	</c:if>
		<c:forEach items="${shoplist}" var="tempShop" varStatus="vs">
			<div class="col-xs-12 col-sm-12  col-md-4 col-xl-3">
				<div class="mbr-plan card text-xs-center">
					<div class="mbr-plan-header card-block">

						<div class="card-title">
							<h3 class="mbr-plan-title">STANDARD</h3>
							<small class="mbr-plan-subtitle">Description</small>
						</div>
						<div class="card-text">
							<div class="mbr-price">
								<span class="mbr-price-value">$</span> <span
									class="mbr-price-figure">0</span><small class="mbr-price-term">/mo.</small>
							</div>
							<small class="mbr-plan-price-desc">More details</small>
						</div>
					</div>
					<div class="mbr-plan-body card-block">
						<div class="mbr-plan-list">
							<ul class="list-group list-group-flush">
								<li class="list-group-item">32 GB storage</li>
								<li class="list-group-item">Unlimited users</li>
								<li class="list-group-item">15 GB bandwidth</li>
							</ul>
						</div>

					</div>
				</div>
			</div>
			<c:if test="${vs.count% 3 eq 0 }">
	</div>
	<div class="row">
		</c:if>
		</c:forEach>
	</div>
</div>


