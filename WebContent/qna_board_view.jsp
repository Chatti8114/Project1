<%@page import="net.board.db.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>중고나라</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        @font-face {
            font-family: 'roboto';
            src: url('juA.ttf');
            font-weight: 100;
            font-style: normal;
        }
        * {
            font-family: roboto;
            font-weight: 100;
            font-size: 20px;
        }
        body {
            margin-top: 70px;
        }
        .customImg {
            width: 50px;
            height: 50px;
        }
        p{
            width:100%;
            border:1px;
            overflow:visible;
            text-overflow:ellipsis;
            text-align: left;
            margin-bottom: 5px;
        }

        #soldout {
            width: 331px;
            height: 100px;

        }
    </style>
</head>
<body>
<%
    String role = "0";
    role = (String) session.getAttribute("role");
    if (role == null) {
        role = "0";
    }
    String id = "";
    if (session.getAttribute("id") != null) {
        id = (String) session.getAttribute("id");
    }
    BoardBean board = (BoardBean) request.getAttribute("boarddata");
%>
<nav class="navbar navbar-expand-md navbar-light fixed-top" style="background-color: rgba(230,230,230,.8)">
    <!-- 로고 -->
    <a class="navbar-brand" href="index.jsp"><img class="img-thumbnail" src="interface/main.png" style="width:150px;"
                                                  alt="이미지"></a>

    <!-- 토글 버튼 -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarID">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- 네비게이션 링크 -->
    <div class="collapse navbar-collapse justify-content-end" id="navbarID">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="/"><i class="fa fa-home"></i> 홈</a>
            </li>
            <% if (id != null) {%>
            <li class="nav-item">
                <a class="nav-link" href="BoardWrite.bo"><i class="fa fa-pencil"></i> 글작성</a>
            </li>
            <%}%>
            <li class="nav-item">
                <a class="nav-link" href="BoardList.bo"><i class="fa fa-th-list"></i> 게시판</a>
            </li>
            <% if (id == null) { %>
            <li class="nav-item">
                <a class="nav-link" href="MemberLogin.me"><i class="fa fa-sign-in"></i> 로그인</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="MemberAgree.me"><i class="fa fa-users"></i> 회원가입</a>
            </li>
            <%} else { %>
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#"><%= id%> <i class="fa fa-caret-down"></i></a>
                <div style="font-size: 20px;" class="dropdown-menu dropdown-menu-right px-4"
                     style="background-color: rgba(230,230,230,4); width: 50px">
                    <a class="nav-link" href="MemberInfo.me"><i class="fa fa-user"></i>
                        <small>내정보</small>
                    </a>
                    <% if (role.equals("1")) {%>
                    <a class="nav-link" href="MembershipManagement.me"><i class="fa fa-database"></i>
                        <small>회원관리</small></a>
                    <% }%>
                    <a class="nav-link" href="MemberLogout.me"><i class="fa fa-sign-out"></i>
                        <small>로그아웃</small>
                    </a>
                </div>
            </li>
            <%} %>
        </ul>
    </div>
</nav>

<div class="row">
    <div class="col-xs-2 col-md-2"></div>
    <div class="col-xs-8 col-md-8">
        <img src = "interface/main.png">
        <h2 class="text-center">게시글 보기</h2><p style="font-size: 15px" >&nbsp;</p>
        <div class="mb-3" style="width: inherit; font-size: 10px" align="right"><div data-toggle="modal" data-backdrop="true"
                                                                                     data-keyboard="true"
                                                                                     data-target="#myModal_2" class="btn btn-sm btn-outline-danger "><span style="vertical-align: middle" class="fa fa-exclamation"></span> 신고</div></div>
        <div class="table table-responsive">
            <table class="table">
                <tr>
                    <th class="success">글번호</th>
                    <td><%= board.getBOARD_NUM() %></td>
                    <th class="success">조회수</th>
                    <td><%= board.getBOARD_READCOUNT() %></td>
                    <td colspan="2" rowspan="3" align="center">
                        <img  data-toggle="modal" data-backdrop="true" data-keyboard="false" type="button"
                             data-target="#myModal_1" id="viewItem" style="padding-right: 0;" class="rounded" src="boardupload/<%=board.getBOARD_FILE1() != null ? board.getBOARD_FILE1() : (board.getBOARD_FILE2() != null ? board.getBOARD_FILE2() : (board.getBOARD_FILE3() != null ? board.getBOARD_FILE3():"noneImage.jpg"))%>" alt="" width="300" height="200"></td>
                    <td><img class="pr-0 pl-0 rounded customImg" src="boardupload/<%= board.getBOARD_FILE1() %>" alt="" ></td>
                </tr>
                <tr>
                    <th class="success">작성자</th>
                    <td><%= board.getBOARD_MEMBER_NAME().substring(0,1)+"**" %>&nbsp;&nbsp;&nbsp;
                        <a align="right" class="btn btn-outline-dark btn-sm" href="#"><span class="fa fa-user"></span></a></td>
                    <th class="success">작성일</th>
                    <td><%= board.getBOARD_DATE() %></td>
                    <td><img class="pr-0 pl-0 rounded customImg" src="boardupload/<%= board.getBOARD_FILE2() %>" alt="" ></td>
                </tr>

                <tr>
                    <td class="success">나이</td>
                    <td><%= board.getBOARD_MEMBER_AGE() %></td>
                    <th class="success">연락처</th>
                    <td><%= board.getBOARD_MEMBER_PHONE() %></td>
                    <td><img class="pr-0 pl-0 rounded customImg" src="boardupload/<%= board.getBOARD_FILE3() %>" alt="" ></td>
                </tr>
                <tr>
                    <th class="success">분야</th>
                    <td><%= board.getBOARD_CATEGORY() %>
                    <th class="success">제품상태</th>
                    <td><%= board.getBOARD_STATE() %></td>

                </tr>

                <tr>
                    <th class="success">환불 여부</th>
                    <td><%= board.getBOARD_REFUND() %>
                    <th class="success">배송비</th>
                    <td><%= board.getBOARD_DELIVERY() %>
                    <th class="success">거래 지역</th>
                    <td><%= board.getBOARD_AREA() %></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <th class="success">제목</th>
                    <td colspan="3"><%= board.getBOARD_TITLE() %></td>
                </tr>

                <tr>
                    <th class="success">글 내용</th>
                    <td colspan="3"><%= board.getBOARD_CONTENT() %></td>
                </tr>
                <tr>
                    <th class="success">파일 첨부1</th>
                    <td><a download="<%= board.getBOARD_OG_FILE1()==null ? "" : board.getBOARD_OG_FILE1() %>" style="text-decoration: none" href="boardupload/<%= board.getBOARD_FILE1()==null ? "" : board.getBOARD_FILE1() %>"><%= board.getBOARD_OG_FILE1()==null ? "" : board.getBOARD_OG_FILE1() %></a></td>
                    <td></td>
                    <td></td>
                    <td colspan="2" rowspan="3" align="right">
                        <% if (board.getBOARD_SOLD_OUT().equals("1")) {%>
                            <img id="soldout" src="interface/soldout.png" alt="">
                        <%} else if(id.equals(board.getBOARD_ID())) {%>
                            <a style="line-height: 85px; width: 331px; height: 100px; font-size: 30px" class="btn btn-outline-danger"
                               href="BoardSoldOut.bo?num=<%= board.getBOARD_NUM() %>" onclick="return confirm('판매완료 신청을 하시겠습니까?')"><span class="fa fa-check"></span> 판매완료</a>
                        <% }%>
                    </td>
                </tr>
                <tr>

                    <th class="success">파일 첨부2</th>
                    <td><a download="<%= board.getBOARD_OG_FILE2()==null ? "" : board.getBOARD_OG_FILE2() %>" href="boardupload/<%= board.getBOARD_FILE2()==null ? "" : board.getBOARD_FILE2() %>"><%= board.getBOARD_OG_FILE2()==null ? "" : board.getBOARD_OG_FILE2() %></a></td>
                </tr>

                <tr>
                    <th class="success">파일 첨부3</th>
                    <td><a download="<%= board.getBOARD_OG_FILE3()==null ? "" : board.getBOARD_OG_FILE3() %>" href="boardupload/<%= board.getBOARD_FILE3()==null ? "" : board.getBOARD_FILE3() %>"><%= board.getBOARD_OG_FILE3()==null ? "" : board.getBOARD_OG_FILE3() %></a></td>
                </tr>
                <% if (board.getBOARD_SOLD_OUT().equals("1")) {%>
                <tr>
                   <td class="text-danger" colspan="7" align="center">현재 상품은 판매가 완료 된 상품입니다</td>
                </tr>
                <%} %>
                <tr>
                    <td colspan="7" class="text-center">
                        <a href="#" class="btn btn-success" data-toggle="modal" data-backdrop="static" data-keyboard="true" data-target="#myModal_3"><span class="fa fa-commenting-o"></span> 답글쓰기</a>
                        <% if (id.equals(board.getBOARD_ID())) {%><a href="BoardModify.bo?num=<%= board.getBOARD_NUM()%>" class="btn btn-warning"><span class="fa fa-pencil-square-o"></span> 수정하기</a>
                        <a href="BoardDeleteAction.bo?num=<%= board.getBOARD_NUM()%>" onclick="return confirm('삭제하시겠습니까?');" class="btn btn-danger"><span class="fa fa-trash"></span> 삭제하기</a><%} %>
                        <a href="javascript:history.back()" class="btn btn-primary"><span class="fa fa-list"></span> 목록보기</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

<!-- 테두리 색깔: 1.기본 2.파랑 3.초록 4.청록 5.주황 6.빨강 7.회색 8.하양 9.검정 10.밝은회색 -->
<!-- 테두리 선택: 1.전체 2.위쪽 3.왼쪽 4.오른쪽 5.아래쪽 -->
<!-- 테두리 생성: 1.제거 2.추가 -->

<div class="modal fade" id="myModal_1" style="background-color: rgba(0,0,0,.9)">
    <div class="modal-dialog  modal-dialog-centered">
        <img id="modalImg" style="width: 100%;  height: 700px; transform: scale(1.2); overflow: auto;" src="boardupload/<%=board.getBOARD_FILE1() != null ? board.getBOARD_FILE1() : (board.getBOARD_FILE2() != null ? board.getBOARD_FILE2() : (board.getBOARD_FILE3() != null ? board.getBOARD_FILE3():"noneImage.jpg"))%>" alt="">
    </div>
</div>
<div class="modal fade" id="myModal_2">

    <form action="NotifyAciton.bo" method="post" name="noticeform">
        <div class="modal-dialog modal-dialog-xl modal-dialog-centered">
            <div class="modal-content modal-dialog">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">신고</h4>
                    <button type="button" class="close" data-dismiss="modal"><span class="fa fa-times text-danger"></span></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <input type="hidden" name="BOARD_ID" value="<%= board.getBOARD_ID() %>">
                    <input type="hidden" name="BOARD_NUM" value="<%= board.getBOARD_NUM() %>">
                    <table class="table table-boardered">
                        <p style="font-size: 15px" >이 글이 이용규칙 위반으로 운영진에 의해 삭제되어야 마땅하다고 생각된다면 신</p>
                        <p style="font-size: 15px" >고해주세요. <span class="text-danger">신고 3회 이상</span>의 글은 삭제 될 수 있으며 이용규칙에 위배되는 글을</p>
                        <p style="font-size: 15px" >여러차례 게시하여 신고를 많이 받은 이용자는 제한 조치가 취해집니다. </p>
                        <p style="font-size: 15px" >신고는 반대의견을 표시하는 기능이 아닙니다 글 작성자의 의견에 반대할 경우</p>
                        <p style="font-size: 15px" >신고 대신 평점을 눌러주세요 신고에 부적합한 글을 지속적으로 신고하는 회원에게</p>
                        <p style="font-size: 15px" >는 제한 조치가 취해질 수 있습니다.</p>
                        <br>
                        <tr style="font-size: 15pt;">
                            <th style="width:100px">신고사유</th>
                            <td style="font-size: 15px ">
                                <input type="checkbox" name="NB_REASON" value="허위사실">&nbsp;허위사실<br>
                                <input type="checkbox" name="NB_REASON" value="물품_미발송">&nbsp;물품 미발송<br>
                                <input type="checkbox" name="NB_REASON" value="개인정보_탈취">&nbsp;개인정보 탈취<br>
                                <input type="checkbox" name="NB_REASON" value="무단_이미지_도용">&nbsp;무단 이미지 도용<br>
                                <input type="checkbox" name="NB_REASON" value="사용_불가_제품_발송">&nbsp;사용 불가 제품 발송
                            </td>
                        </tr>
                        <tr style="font-size: 15pt">
                            <th><div>내 용</div></th>
                            <td><textarea name="NB_CONTENT" cols="10" style="width:100%; overflow:visible;text-overflow:ellipsis;" placeholder="<%= board.getBOARD_ID() %>님을 신고합니다"></textarea></td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer justify-content-end">
                    <button id="noticebtn" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </form>
</div>

<!-- Modal -->
<!-- 페이드인 효과 : 1. 사용함 2. 사용안함 -->
<div class="modal fade" id="myModal_3">

    <!-- 모달창 크기: 1.기본 2.작은 3.큰 4.더큰 -->
    <!-- 스크롤 기능: 1.사용안함 2.사용함 -->
    <!-- 가운데 정렬: 1.사용안함 2.사용함 (해당 페이지 중앙에 배치함) -->
    <div class="modal-dialog  modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">답글작성</h4>
                <button type="button" class="close" data-dismiss="modal"><span class="fa fa-times text-danger"></span></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form name="BoardReplyForm">
                    <textarea name="CB_CONTENT" id="" class="form-control"></textarea>
                </form>
            </div>
            <!-- Modal footer -->
            <!-- 정렬: 1. 오른쪽 2. 가운데 3. 왼쪽 -->
            <div class="modal-footer" style="padding: 0;">
                <div class="btn-group" style="width: 100%; height: 40px">
                    <button id="commentbtn" type="button" class="btn btn-primary form-control"
                            style="border-radius: 0 0 0 2px; height: inherit" data-dismiss="modal">등록
                    </button>
                    <button type="button" class="btn btn-danger form-control"
                            style="border-radius: 0 0 2px 0;  height: inherit" data-dismiss="modal">취소
                    </button>
                </div>
            </div>

        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>


    $(function () {
        $(".nav-item a").mouseover(function () {
            $(this).css("color", "#e67e22")
        });
        $(".nav-item a").mouseout(function () {
            $(this).css("color", "")
        });

        var viewItem = $("#viewItem"); /* 이미지 확대 ID */
        var ogImg = viewItem.attr("src"); /* 이미지 원본 소스*/


        $(".customImg").mouseover(function () {
            var changeImg = $(this).attr("src");
                viewItem.attr("src", changeImg);
                $("#modalImg").attr("src", changeImg);
        });

        var sessionId = "<%=session.getAttribute("id")%>"; /* 세션아이디 */
        var boardnum = "<%=board.getBOARD_NUM()%>"; /* 게시글번호 삽입 */
        var boardid = "<%=board.getBOARD_ID()%>";

        $('#myModal_2').on("show.bs.modal",function (e) {
            if (sessionId == "null") {
                alert("로그인이 필요합니다!");
                location.reload();
                return e.preventDefault();

            }
        });
        $('#myModal_3').on("show.bs.modal",function (e) {
            if (sessionId == "null") {
                alert("로그인이 필요합니다!");
                location.reload();
                return e.preventDefault();

            }
        });

        var noticeform = $("#noticebtn");
        noticeform.click(function () { /* 버튼을 클릭하면 실행하기 */
            var textarea = $("textarea[name=NB_CONTENT]"); /* 내용요소 선택*/
            var textVal = textarea.val(); /* 내용 밸류 삽입*/

            var checkVal = ""; /* 체크박스 밸류 변수*/
            var sendData = ""; /* aJax 보낼 변수 */

            if (textVal==("")) { /* 만약 내용이 없다면 placeholder로 대체 */
                textVal = textarea.attr("placeholder");
            }
            var checkArry = new Array(); /* 체크박스의 여러개의 값을 담을 배열 생성*/
            $(":checked").each(function (i) {
                checkArry[i] = "NB_REASON=" + $(this).val(); /* url전송을 위해 앞에 param을 써주기 */
            });
            checkVal = checkArry.join("&"); /* 배열들을 &이걸로 연결시켜줌 */
            if (checkVal == "") {
                alert("최소한 하나 이상 체크해야합니다"); /* 만약 체크박스가 없다면 실행종료 */
                return false;
            }
            // alert(checkVal);

            sendData = "BOARD_NUM="+boardnum+"&NB_CONTENT="+textVal+"&"+checkVal+"&BOARD_ID="+boardid; /* 전송할 데이터를 합침 */
            // alert(sendData);

            $.post("NotifyAciton.bo", sendData , function (msg) { /* ajax 실행 */
                if (msg == "1") {
                    alert("신고가 접수되었습니다");
                } else if(msg == "0") {
                    alert("이미 해당글에 신고가 접수되어있습니다");
                } else if(msg == "-1") {
                    alert("신고 대상 게시글이 없습니다");
                } else {
                    alert("오류가 발생하였습니다");
                }
            });
        });

        var commentbtn = $("#commentbtn");
        commentbtn.click(function () {
            var comment = $("textarea[name=CB_CONTENT]").val();
            var sendData = "";
            if (comment == "") {
                alert("적어도 한 글자 이상 작성바랍니다!");
                return;
            }
            sendData = "CB_CONTENT=" + comment + "&CB_REF=" + boardnum;

            $.post("BoardReplyAction.bo", sendData , function (msg) {
                if (msg != "1") {
                    alert("오류가 발생하였습니다!");
                } else {
                    alert("작성완료");
                }
            });
        });

        $('.modal').on('shown.bs.modal', function(){ /* 모달창이 닫히면 form의 값들을 초기화시킨다. */
            scrollable = false; /* 스크롤 이벤트 금지 */
            // alert(scrollable)
        });
        $('.modal').on('hidden.bs.modal', function(){ /* 모달창이 닫히면 form의 값들을 초기화시킨다. */
            // alert( $("form[name=noticeform]").serialize());
            $(this).find('form')[0].reset();
            scrollable = true; /* 스크롤 이벤트 금지 */
            // alert(scrollable) 
        });


        var didScroll = false;

        $(window).on('scroll', function() { didScroll = true; });

        setInterval(function() {
            var bottomHeight = $(window).scrollTop() + $(window).height() + 1;
            var docHeight = $(document).height();

            if (didScroll) {
                didScroll = false;
                if (bottomHeight > docHeight) repleList();
            }
        }, 250);

        function repleList() {

            var lastIndex = $(".row").last().index(); /* 마지막 댓글의 인덱스 */

            // alert(boardnum);
            // alert(lastIndex);

            // alert(lastRepleNumber); /* row가 몇번째 요소인지 알아내기 1부터 시작 */
            console.log(lastIndex);
            $.getJSON({ /* = getJSON() */ /* ajax로 보내면 json파일형식을 인식못함*/
                type: "get",
                // data: "", /* Json 데이터*/
                url: "GetReply.bo?cb_num=" + lastIndex + "&b_num=" + boardnum, /* 마지막 게시글 번호를 전달*/
                // dataType: "json", /* 응답 텍스트는 처리과정 없이 콜백함수로 전달된다. */
                // contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                success: function (data) { /* 응답이 성공 상태 코드를 반환하면 호출 */
                    // console.log("댓글 데이터: " + data); /* json 배열 출력 */

                    for (var i = 0; i < data.length; i++) {
                        var repleHtml = "<div class='row'>" + "<div class='col-10 offset-1'>" + "<div class='media border rounded p-1 mb-2'>" + "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ28j-kI-w85utWYdcZOaNf8ozemTZI1rYQbpdHGS1giriBPdMg&s'" + " style='width: 110px;' alt='프로필' class='mr-3 align-self-start rounded-circle' style='width:60px;'>" + "<div class='media-body'>" + "<h4>" + data[i].id + "<small><i>- " + data[i].date + "</i></small></h4><p>" + data[i].content + "</p></div></div></div></div>";
                        $(".row").last().after(repleHtml);
                    }

                },
                error: function (xhr,err) {
                    alert('Ajax readyState: '+xhr.readyState+'\nstatus: '+xhr.status + ' ' + err);
                }
            });
        }

    });






</script>
</body>
</html>
