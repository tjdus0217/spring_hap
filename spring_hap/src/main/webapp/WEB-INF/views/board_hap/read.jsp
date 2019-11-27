<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>간단한 지도 표시하기</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=YOUR_CLIENT_ID"></script>
	
<title>회원</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
 	function createB() {  
 		var url = "${contextPath.requeset.rootContext}room_hap/create";  
 		url += "?board_num=${dto.board_num}";
 		location.href = url;   

 	}  

 	function updatePw() {  
 		var url = "updatePw";  
 		location.href = url;  

 	}  
 	function listM() {  

 		var url = "list";  
// 		url += "?col=${param.col}";
 		url += "&word=${param.word}";  
 		url += "&nowPage=${param.nowPage}";  

 		location.href = url;  
 	}  
</script>  

</head>
<body>

	<div class="container">
		<h2 class="col-sm-offset-2 col-sm-10">${dto.board_name }</h2>
<!-- admin만 -->		<button class = "btn" onclick = "location.href='../room_hap/create?board_num=${dto.board_num}'">방 등록</button>
	<table class="table table-bordered">
			<tr>
				<td colspan="2" style="text-align: center">
					<div id="myCarousel" class="carousel slide" data-ride="carousel"
						style="height: 100%; width: 100%;" align="center">
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>


						<div class="carousel-inner">
							<div class="item active">
								<img src="/hap/images/motel1.jpg" alt="motel1"
									height="100%" width="100%">
							</div>

							<div class="item">
								<img src="/hap/images/motel2.jpg" alt="motel2"
									height="100%" width="100%">
							</div>

							<div class="item">
								<img src="/hap/images/motel3.jpg" alt="motel3"
									height="100%" width="100%">
							</div>
						</div>

						<a class="left carousel-control" href="#myCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> <span
							class="sr-only">Next</span>
						</a>
					</div> <input type="hidden" name="col" value="${param.col }"> <input
					type="hidden" name="word" value="${param.word }"> <input
					type="hidden" name="nowPage" value="${param.nowPage }">
				</td>
			</tr>

		</table>

  
</div>
		<hr>
		<button class = "btn" onclick = "location.href='../room_hap/delete?board_num=${dto.board_num}'">방 삭제</button>
		<button class = "btn" onclick = "location.href='../room_hap/update?board_num=${dto.board_num}'">방 수정</button>
		<table class = "table table-bordered">
			<c:forEach var="dto" items="${rlist }">
			
			
			<tr>
			<th>방 사진</th>
	 		<th>방 이름</th>
			<th>방 가격</th>
			<th>최대 숙박인원</th>
			<th>방 정보</th>	
			
			
			</tr>
			
			<tr>
				<td><img src = "${pageContext.request.contextPath}/storage/${dto.room_filename}" class = "img-rounded "width = "200px" height = "200px"></td>
				<td>${dto.room_name }</td>
				<td>${dto.room_price }</td>
				<td>${dto.room_max }</td>
				<td>${dto.room_content }</td>
			
			
			</tr>
			

	   
		   </c:forEach>
	   
	   		</table>
	   <hr>

			
			<table cellpadding="0" cellspacing="0" width="462">
			  <tr>
			  지도
			    <td style="border:1px solid #cecece;">
			    <a href="https://v4.map.naver.com/?searchCoord=0ab48c7e75af1855e33dd58e25a2303becc4d514bb23086638e4585ac93dc6e4&query=7IaU642w7Iqk7YGs&menu=location&tab=1&lng=4d3fff340ef578cacbc29f5d6390f980&__fromRestorer=true&mapMode=0&mpx=f440d166ab8fccf209a536f4e12561bb1e9e16be5c4c6d5dd75731d3a375716263bbce83afc37eae9852cae5f58a418b&lat=9fb7bb36e64d3551cc3d1e2b44cce92a&dlevel=12&enc=b64" target="_blank"><img src="http://prt.map.naver.com/mashupmap/print?key=p1574646517458_-69050510" width="460" height="340" alt="지도 크게 보기" title="지도 크게 보기" border="0" style="vertical-align:top;"/></a></td> </tr> <tr> <td> <table cellpadding="0" cellspacing="0" width="100%"> <tr> <td height="30" bgcolor="#f9f9f9" align="left" style="padding-left:9px; border-left:1px solid #cecece; border-bottom:1px solid #cecece;"> <span style="font-family: tahoma; font-size: 11px; color:#666;">2019.11.25</span>&nbsp;<span style="font-size: 11px; color:#e5e5e5;">|</span>&nbsp;<a style="font-family: dotum,sans-serif; font-size: 11px; color:#666; text-decoration: none; letter-spacing: -1px;" href="https://v4.map.naver.com/?searchCoord=0ab48c7e75af1855e33dd58e25a2303becc4d514bb23086638e4585ac93dc6e4&query=7IaU642w7Iqk7YGs&menu=location&tab=1&lng=4d3fff340ef578cacbc29f5d6390f980&__fromRestorer=true&mapMode=0&mpx=f440d166ab8fccf209a536f4e12561bb1e9e16be5c4c6d5dd75731d3a375716263bbce83afc37eae9852cae5f58a418b&lat=9fb7bb36e64d3551cc3d1e2b44cce92a&dlevel=12&enc=b64" target="_blank">지도 크게 보기</a> </td> <td width="98" bgcolor="#f9f9f9" align="right" style="text-align:right; padding-right:9px; border-right:1px solid #cecece; border-bottom:1px solid #cecece;"> <span style="float:right;"><span style="font-size:9px; font-family:Verdana, sans-serif; color:#444;">&copy;&nbsp;</span>&nbsp;<a style="font-family:tahoma; font-size:9px; font-weight:bold; color:#2db400; text-decoration:none;" href="https://www.navercorp.com" target="_blank">NAVER Corp.</a></span> </td> </tr> </table> </td> </tr> </table>

			<div class='row'>
			<div class="col-lg-12">
				<div class="panel panel-default">


					<div class="panel-heading">
						<i class="fa fa-comments fa-fw" ></i>댓글<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
					
					<br><br>
					</div>


					<!-- panel-heading -->
					<div class="panel-body">
						<ul class="chat list-group">
							<li class="left clearfix" data-rno="12">
								<div>
									<div class="header">
										<div>
										<img src="../images/pic04.jpg" alt="이미지의 묘사 내용" height="100px" width="100px"/>
										</div>	
										<strong class="primary-font">무플 방지 위원회</strong> <small
											class="pull-right text-muted">20XX-XX-XX</small>
									</div>
									<p>ㅎㅇ</p>
								</div>
							</li>
						</ul>
						<!-- ./ end ul -->
					</div>


					<div class="panel-footer"></div>
				</div>
				<!-- /.panel -->
			</div>
			<!-- col-lg-12 end -->
		</div>
		<!-- row end -->

	</div>
	<!-- container div-->


</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">답변 모달</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>내용</label>
						<textarea cols="10" rows="3" class="form-control" name='content'>New Reply!!!!</textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
					<button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
					<button id='modalCloseBtn' type="button" class="btn  ">취소</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->




	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/breply.js"></script>
	<script>
	$(document).ready(
		function() {
			var board_num = "${board_num}";
			var sno = "${sno}";
			var eno = "${eno}";
			var replyUL = $(".chat");

			showList();

	function showList() {
			replyService.getList({board_num : board_num , sno : sno , eno : eno},function(list) {
				var str = "";
	
				if (list == null|| list.length == 0) {
					return;
				}
				for (var i = 0, len = list.length || 0; i < len; i++) {
					str += "<li class='list-group-item' data-rw_num='"+list[i].rw_num+"'>";
					str += "<div><div class='header'><div><img src=\"${fname}\" alt=\"신호 없음\" height=\"100px\" width=\"100px\"/></div><strong class='primary-font'>"+ list[i].id+ "</strong>";
					str += "<small class='pull-right text-muted'>"+ list[i].regdate+ "</small></div>";
					str += replaceAll(list[i].content,'\n', '<br>')+ "</div></li>";
				}
				replyUL.html(str);
	
				showReplyPage();
	
			});//end function

			}//end showlist

			function replaceAll(str, searchStr, replaceStr) {
				return str.split(searchStr).join(replaceStr);
			}
			// 2019-10-30 수요일

			var nPage = '<c:out value="${nPage}"/>';
			var nowPage = '<c:out value="${nowPage}"/>';
			var colx = '<c:out value="${col}"/>';
			var wordx = '<c:out value="${word}"/>';
			var replyPageFooter = $(".panel-footer");
			var param = "nPage=" + nPage;

			param += "&nowPage=" + nowPage;
			param += "&board_num=" + board_num;
			param += "&col=" + colx;
			param += "&word=" + wordx;

			function showReplyPage() {

				replyService.getPage(param, function(paging) {

					console.log(paging);

					var str = "<div><small class='text-muted'>"
							+ paging + "</small></div>";
					replyPageFooter.html(str);

				});

			}//end showReplyPage

			var modal = $(".modal");
			var modalInputContent = modal.find("textarea[name='content']");
			var modalModBtn = $("#modalModBtn");
			var modalRemoveBtn = $("#modalRemoveBtn");
			var modalRegisterBtn = $("#modalRegisterBtn");

			$("#modalCloseBtn").on("click", function(e) {

				modal.modal('hide');
			});

			$("#addReplyBtn")
					.on(
							"click",
							function(e) {

								if ('${sessionScope.id}' == '') {
									if (confirm("로그인을 해야 댓글을 쓸수 있습니다.")) {
										var url = "../member/login";
										url += "?col=${col}";
										url += "&word=${word}";
										url += "&nowPage=${nowPage}";
										url += "&nPage=${nPage}";
										url += "&board_num=${board_num}";
										url += "&rurl=../board_hap/read";
										location.href = url;

									}
								} else {

					modalInputContent.val("");
					modal.find("button[id !='modalCloseBtn']").hide();
					modalRegisterBtn.show();

					$(".modal").modal("show");
				}
			}); //end addReplyBtns

			modalRegisterBtn.on("click", function(e) {

				if (modalInputContent.val() == '') {
					alert("댓글을 입력하세요")
					return;
				}

				var reply = {
					content : modalInputContent.val(),
					rw_filename :'<c:out value="${rw_filename}"/>',
					id : '<c:out value="${sessionScope.id}"/>',
					board_num : '<c:out value="${board_num}"/>'
				};
				//alert(reply.content);
				replyService.add(reply, function(result) {

					alert(result);

					modal.find("input").val("");
					modal.modal("hide");

					//showList(1);
					showList();

				}); //end add

			}); //end modalRegisterBtn.on

			//댓글 조회 클릭 이벤트 처리 
			$(".chat").on("click","li",function(e) {
				var rw_num = $(this).data("rw_num");//alert(rw_num);
							replyService.get(rw_num,
				function(reply) {
								modalInputContent.val(reply.content);
								modal.data("rw_num",reply.rw_num);
								modal.find("button[id !='modalCloseBtn']").hide();
								if ('${sessionScope.id}' == reply.id) {
								modalModBtn.show();
								modalRemoveBtn.show();
									}
								$(".modal").modal("show");
								});
								});

			modalModBtn.on("click", function(e) {

				var reply = {
					rw_num : modal.data("rw_num"),
					content : modalInputContent.val()
				};
				//alert(reply.rw_num);
				replyService.update(reply, function(result) {

					alert(result);
					modal.modal("hide");
					showList();

				});

			});//modify 

			modalRemoveBtn.on("click", function(e) {

				var param={rw_num:modal.data("rw_num"), board_num:board_num, nPage:nPage};

				replyService.remove(param, function(result) {
					location.href='./read?board_num=${board_num}&col=${col}&word=${word}&nowPage=${nowPage}&nPage='+result.nPage;
					alert(result.msg);
					modal.modal("hide");
					showList();

				});

			});//remove
			
		}); //end $(document).ready
	</script>
<div class="container">
			<div class="1">
			<section class="2">
				<h2>편의 시설</h2>
				<img src="/hap/images/motel4.png">
				<ul type ="disc">
					<li>1일 생수 2병, 웰컴 드링크2병(웰치스,립튼) 무료제공, 투숙객 무료주차, 객실 내 무선인터넷 가능</li>
					<li>Guest Lounge, 카페테리아, 비지니스센터, 레스토랑(2F), 고객주차장</li>
					<li>개인PC, 무료 와이파이, 커피포트</li>
				</ul>
					
			</section>
			<hr>
			
					<div class="1">
			
			<section class="5">
				<h2>이용 안내</h2>
					<img src="/hap/images/motel4.png">
				<ul type ="disc">
				        <h1>공지사항</h1>
				        <li>리치웰 호텔 파티룸 오픈파티 가능한 객실을 준비해 두었습니다</li>
				        <li>객실당 차량 1대 가능</li>
			    </ul>
			    
			    <ul type ="disc">    
				       <h1> 기본규정</h1>
				        <li>객실은 부티크 호텔 특성상 이미지와 다른 객실이 배정될 수 있습니다</li>
				        <li>객실 지정은 불가 합니다(체크인시 랜덤 배정)</li>
				        <li>전 객실 2인기준 (인원추가 1인당 2만원)</li>
				        <li>연박 불가(연박시 추가요금 발생)</li>
				        <li>자세한 문의는 프런트 부탁드리겠습니다</li>
				        <li>회원혜택은 제휴점 내규에 따라 적용됩니다</li>
				</ul>			
			</section>

			


		</div>




		<div style="text-align: center">
			<button class="btn" onclick="">결제하기</button>
		</div>
</div>

	</div>
</body>
</html>