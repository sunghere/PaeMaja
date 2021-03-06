<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>

<style>
.w3-input {
	margin-top: 1%;
	margin-bottom: 1%;
	width: 62%;
}

#menu {
	margin-bottom: 3%;
}

.blank-div {
	padding-top: 5%;
}

.wbtn {
	background-color: white;
	color: black;
	border: none;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.wbtn:hover {
	background-color: #e7e7e7;
	border: 1px solid #e6fdff;
}
</style>
<script>
	$(function() {
		var init = function() {

			CKEDITOR.replace('ckedtest', {
				width : '100%',
				height : '400px',
				filebrowserUploadUrl : 'imageUpload.do',
			})
		};

		$("#typetest")
				.click(
						function() {
							var shopContent = CKEDITOR.instances.ckedtest
									.getData();
							$("#shop_content").attr("value", shopContent);
							showMsgs("작성하시겠습니까??<br><button class='btn btn-primary' type='button' id='writeBtn'>작성</button>");
						});

		$("#alertModal").on("click", "#writeBtn", function() {
			$("#writeForm").attr({
				"action" : "shopwriteaf.do",
				"method" : "post"
			}).submit();
		});

		init();
	});
</script>

<form method="post" id='writeForm'>
	<div class="row">
		<div class="col-md-5">
			<div class="blank-div"></div>
			<input class="w3-input" type="text" id="name" name="name"
				placeholder="상호명을 입력해주세요" width="20%"> <input
				class="w3-input" type="text" id="mapAdd" name="addr"
				placeholder="주소를 입력해주세요" data-toggle="modal" data-target="#mapModal">
			<input class="w3-input" type="text" id="tel" name="tel"
				placeholder="전화번호를 입력해주세요"> <input class="w3-input"
				type="text" id="category" name="category" placeholder="카테고리를 입력해주세요">
			<input class="w3-input" type="text" id="menu" name="menu"
				placeholder="메뉴를 입력해주세요">
		</div>
		<div class="col-md-5">
			<div id="mymap" style="height: 280px; width: 300px;"></div>
			<input type="hidden" id="shop_content" name="content" value="">

		</div>

	</div>
	<textarea id='ckedtest'>

	</textarea>


	<button type="button" id="typetest" class="wbtn">글 작성</button>
	<a href="main.do"><button type="button" id="typetest" class="wbtn">취
			소</button></a> <input type="hidden" id="xpos" name="xpos"> <input
		type="hidden" id="ypos" name="ypos">

</form>

<!--지도부분-->

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=1i78w7iQT3tYF8nVdzAU&submodules=panorama,geocoder"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function NewZipCode5NumCheck() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						/*
						 // 우편번호와 주소 정보를 해당 필드에 넣는다.
						 document.getElementById('inpPOST').value = data.zonecode; //5자리 새우편번호 사용
						 document.getElementById('inpADDR').value = fullAddr;

						 // 커서를 상세주소 필드로 이동한다.
						 document.getElementById('inpADDR').focus();
						 document.getElementById('inpADDR').setSelectionRange(999,999);
						 */

						$("#addrtf").val(fullAddr);
						$("#bSearch").focus();
					}
				}).open();
	}
</script>
<div class="modal fade" aria-hidden="true" id="mapModal" role="dialog">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">

			<div class="modal-header line_none">
				<button type="button" class="close" id="login_close"
					data-dismiss="modal">
					<span class='loginexit' aria-hidden="true">x<br></span> <span
						class="sr-only">Close</span>
				</button>
				<div class="input-group modal-header-body">
					<input id="addrtf" class="form-control" name="addrtf"
						placeholder="주소를 입력해주세요" type="search" /> <span id="bSearch"
						class="input-group-addon black-control">&nbsp;<i
						class="icon ion-search"></i>&nbsp;
					</span>
				</div>
			</div>
			<div class="modal-body">
				<div id="map" style="height: 300px; width: 270px"></div>
				<div id="scriptCode"></div>
			</div>
		</div>
	</div>
</div>

<script id="code">
	var map;
	var maps;
	var marker;
	var infoWindow;
	var maplist = new Array();
	var maptaglist = new Array();
	var mylat = 37.5666102;
	var mylng = 126.9783881;
	var htmlAddresses = [];
	if (!!navigator.geolocation) {
		navigator.geolocation
				.getCurrentPosition(successCallback, errorCallback);
	} else {
		alert("이 브라우저는 Geolocation를 지원하지 않습니다");
	}
	function errorCallback(error) {
		alert(error.message);
	}

	function successCallback(position) {
		mylat = position.coords.latitude;
		mylng = position.coords.longitude;
	}

	$('#mapAdd').click(function() {
		mapinit("map");

	})

	var mapOptions = {
		center : new naver.maps.LatLng(mylat, mylng),
		zoom : 10,
		scaleControl : false,
		logoControl : false,
		mapDataControl : false,
		mapTypeControl : true,
		zoomControl : true,
		minZoom : 1
	};
	Array.prototype.contains = function(element) {
		for (var i = 0; i < this.length; i++) {
			if (this[i] == element) {
				return true;
			}
		}
		return false;
	}
	mapinit = function(mapId) {
		var mylatlng = new naver.maps.LatLng(mylat, mylng);
		mapOptions = {
			center : mylatlng,
			zoom : 8,
			scaleControl : false,
			logoControl : false,
			mapDataControl : false,
			mapTypeControl : true,
			zoomControl : true,
			minZoom : 1
		};
		if (maplist.contains(mapId) == false) {

			maptaglist.push(mapId);
			map = new naver.maps.Map(mapId, mapOptions);

			maplist.push(map);
			marker = new naver.maps.Marker({
				position : mylatlng,
				map : map
			});
			infowindow = new naver.maps.InfoWindow({
				maxWidth : 140,
				backgroundColor : "#ccc",
				borderColor : "#ccc",
				borderWidth : 5,
				anchorColor : "#ccc",
				content : ''
			});
			if (mapId != "mymap") {

				naver.maps.Event.addListener(map, 'click', function(e) {
					marker.setPosition(e.coord);
					updateInfoWindow(e.coord,1);
					searchCoordinateToAddress(e.coord);
				});
				
				updateInfoWindow(mylatlng,1);
			} else {
				/* infowindow.open(map, marker); */
				
			}
		} else {
			map = maplist[maptaglist.indexOf(mapId)];
			map.setCenter(mylatlng); // 중심 좌표 이동
			map.setZoom(11); // 줌 레벨 변경
			marker.setPosition(latlng); // 마크 이동
		}

	

		
	}

	function updateInfoWindow(latlng,sel) {
		var utmk = naver.maps.TransCoord.fromLatLngToUTMK(latlng), // 위/경도 -> UTMK
		tm128 = naver.maps.TransCoord.fromUTMKToTM128(utmk), // UTMK    -> TM128
		naverCoord = naver.maps.TransCoord.fromTM128ToNaver(tm128), // TM128   -> NAVER
		latlngConv = naver.maps.LatLng(latlng); // 위/경도

		var latVal = latlngConv.lat();
		var lngVal = latlngConv.lng();

		utmk.x = parseFloat(utmk.x.toFixed(1));
		utmk.y = parseFloat(utmk.y.toFixed(1));

		if(sel ==1){
		infowindow
				.setContent([
						'<div style="padding:10px;width: 10%;font-size:14px;line-height:20px;">',
						'<span class="non-fixed-balloon" onclick="selectLatLng('
								+ latVal
								+ ', '
								+ lngVal
								+ ');" style="cursor:pointer;"><strong>Click</strong></span><br />',
						'</div>' ].join(''));
		}
		infowindow.open(map, marker);
		//        infoWindow.open(map, latlng);
	}

	function selectLatLng(lat, lng) {
		var sHTMLCODE = "" + lat + "/" + lng;
//		$("#scriptCode").html(sHTMLCODE);
		$('#mapAdd').val($('#addrtf').val());
		$('.loginexit').click();
		mylat = lat;
		mylng = lng;
		mapinit("mymap");

		$('#xpos').attr('value', lat)
		$('#ypos').attr('value', lng)

	}

	function searchCoordinateToAddress(latlng) {
		var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);

		naver.maps.Service.reverseGeocode({
			location : tm128,
			coordType : naver.maps.Service.CoordType.TM128
		}, function(status, response) {
			if (status === naver.maps.Service.Status.ERROR) {
				return alert('Something Wrong!');
			}

			var items = response.result.items;
			htmlAddresses = [];

			for (var i = 0, ii = items.length, item, addrType; i < ii; i++) {
				item = items[i];
				addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]';

				htmlAddresses.push(item.address);
				htmlAddresses.push('&nbsp&nbsp&nbsp -> ' + item.point.x + ','
						+ item.point.y);
			}

		});
		$('#addrtf').val(htmlAddresses[2]);
	}
	function selectAddress(lat, lng) {
		var latlng = new naver.maps.LatLng(lat, lng);
		map.setCenter(latlng); // 중심 좌표 이동
		map.setZoom(13); // 줌 레벨 변경
		marker.setPosition(latlng); // 마크 이동
		updateInfoWindow(latlng,1); // 정보창 표현
		$("#bAddress").focus();
		
	}
	$('#addrtf').click(function() {
		NewZipCode5NumCheck();
	})
	$("#bSearch")
			.click(
					function() {
						var sHTML = "";
						var sUrl = "https://apis.daum.net/local/geo/addr2coord?apikey=c667c95837e03d151e89f86cc5e4d1b8&output=json&page_size=30&q=";
						var sAddr = $("#addrtf").val();
						if (sAddr.length == 0) {
							alert("주소를 입력하세요");
							$("#bAddress").focus();
							return;
						}
						$.ajax({
									type : "post",
									url : sUrl + encodeURIComponent(sAddr),
									dataType : "jsonp",
									async : true,
									success : function(data) {
										if (data.channel.item.length == 0) {
											alert("올바른 주소를 입력하세요");
											$("#bAddress").focus();
										} else if (data.channel.item.length == 1) {
											selectAddress(
													data.channel.item[0].lat,
													data.channel.item[0].lng);
										} else {
											sHTML = sHTML
													+ "<table cellpadding=\"5\" cellspacing=\"5\" width=\"100%\" height=\"100%\">                                                      ";
											sHTML = sHTML
													+ "<tbody>                                                                                                                         ";
											sHTML = sHTML
													+ "<tr>                                                                                                                            ";
											sHTML = sHTML
													+ "    <td align=\"center\" valign=\"middle\" style=\"background-color:#FFFFFF;\">                                                 ";
											sHTML = sHTML
													+ "	<table cellpadding=\"3\" cellspacing=\"3\" style=\"border:2px solid #c5dbec;\" width=\"100%\">                               ";
											sHTML = sHTML
													+ "	<tbody>                                                                                                                      ";
											sHTML = sHTML
													+ "	<tr>                                                                                                                         ";
											sHTML = sHTML
													+ "		<td style=\"border:1px solid #c5dbec;text-align:center;height:30px;font-weight:bold;background-color:#dfeffc;\">주소</td>";
											sHTML = sHTML
													+ "		<td style=\"border:1px solid #c5dbec;text-align:center;height:30px;font-weight:bold;background-color:#dfeffc;\">lat</td> ";
											sHTML = sHTML
													+ "		<td style=\"border:1px solid #c5dbec;text-align:center;height:30px;font-weight:bold;background-color:#dfeffc;\">lng</td> ";
											sHTML = sHTML
													+ "	</tr>                                                                                                                        ";
											for (var i = 0; i < data.channel.item.length; i++) {
												sHTML = sHTML
														+ "<tr>                                                                                                                                                                                                                                                                       ";
												sHTML = sHTML
														+ "	<td style=\"border:1px solid #c5dbec;text-align:left;height:30px;font-weight:bold;background-color:#f9fcff;cursor:pointer;\" onclick=\"selectAddress('"
														+ data.channel.item[i]["lat"]
														+ "', '"
														+ data.channel.item[i]["lng"]
														+ "');\">"
														+ data.channel.item[i]["title"]
														+ "</td>";
												sHTML = sHTML
														+ "	<td style=\"border:1px solid #c5dbec;text-align:center;height:30px;background-color:#ffffff;\">"
														+ data.channel.item[i]["lat"]
														+ "</td>                                                                                                                                 ";
												sHTML = sHTML
														+ "	<td style=\"border:1px solid #c5dbec;text-align:center;height:30px;background-color:#ffffff;\">"
														+ data.channel.item[i]["lng"]
														+ "</td>                                                                                                                                 ";
												sHTML = sHTML
														+ "</tr>                                                                                                                                                                                                                                                                      ";
											}
											sHTML = sHTML
													+ "</tbody></table></td></tr></tbody></table>";
											showMsg(sHTML);
										}
									},
									error : function(jqXHR, textStatus,
											errorThrown) {
										alert('[' + jqXHR.status + '] '
												+ textStatus + ': '
												+ errorThrown + ': '
												+ jqXHR.responseText);
									}
								});
					});

</script>