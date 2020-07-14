<%@ page import="java.util.List" %>
<%@ page import="net.board.db.BoardBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="net.board.timeCalc.timeCalc" %>
<%@ page import="static net.board.timeCalc.timeCalc.formatTimeString" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = "0";
    role = (String) session.getAttribute("role");
    if (role == null) {
        role = "0";
    }
    String id = null;
    if (session.getAttribute("id") != null) {
        id = (String) session.getAttribute("id");
    }
    String price="";
    String delivery="";

    List boardList = (List) request.getAttribute("boardlist");
    int listcount = ((Integer) request.getAttribute("listcount")).intValue();
    int nowpage = ((Integer) request.getAttribute("page")).intValue();
    int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
    int startpage = ((Integer) request.getAttribute("startpage")).intValue();
    int endpage = ((Integer) request.getAttribute("endpage")).intValue();
%>
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
        #soldout {
            width: 70px;
            height: 70px;

        }
        #soldout2 {
            position: absolute;
            bottom: 100px;
            left: -20px;
        }

        body {
            background-image: url("interface/backImage3.png");
            background-repeat: revert;
            margin-top: 70px;
            font-family: roboto;
            font-weight: 100;
            font-size: 20px;
        }

        .btn-outline-custom {
            color: #e67e22;
            border-color: #e67e22;
        }

        .btn-outline-custom:hover {
            color: #ffffff;
            background-color: #e67e22;
            border-color: #e67e22;
        }
        .btn-outline-custom2 {
            color: #dc3545;
            border-color: #dc3545;
        }
        .btn-outline-custom2:hover {
            color: #ffffff;
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .media > img {
            width: 210px;
            height: 210px;
        }

        @media screen and (max-width: 765px) {
            #soldout {
                width: 70px;
                height: 40px;
            }
            #soldout2 {
                position: absolute;
                top: 35px;
                left: 20px;
            }
            .media-body {
                font-size: 13px;
            }
            .row {
                font-size: 17px;
            }
            #footer {
                display: none;
            }
            img {
                width: 100px;
                height: 100px;
            }
            .btn-outline-custom, .btn-outline-custom2, .btn-outline-success {
                font-size: 13px;
                padding: 1px;
                width: 75px;
                height: 25px;
            }
            span {
                margin-bottom: 10px;
            }
            small {
                font-size: 10px;
            }
            h4 {
                font-size: 15px;
            }
            body {
                background-image: none;
            }
        }
    </style>
</head>
<body>
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
                        <small>회원관리</small>
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

<div class="container">

    <!-- #1 디스플레이: 1. 블록(block) 2. 인라인(inline) -->
    <!-- #2 뱡향과순서: 1. 가로/정순 2. 가로/역순 3. 세로/정순 4.세로/역순 -->
    <!-- #3 수평플렉스: 1. 왼쪽정렬 2. 가운데정렬 3. 오른쪽정렬 4. 홀순정렬 5. 짝순정렬 -->
    <!-- #4 수직플렉스: 1. 위쪽정렬 2. 가운데정렬 3. 아래쪽정렬 4. 텍스트하단기준정렬 5. 스트레치정렬 -->
    <div class="d-sm-flex flex-column">
        <!-- #1 아이템너비: 1·2 너비증가 3·4 너비감소 -->
        <!-- #2 아이템순서: 0:첫번째순서 ~ 12:마지막순서 (order 클래스가 없는 경우 order 클래스가 있는 것 보다 앞에 옵니다!) -->
        <!-- #3 아이템여백: 1. 양쪽 여백생성 2.왼쪽 여백생성 3.오른쪽 여백생성 -->
        <!-- #4 아이템수직: 1. 위쪽정렬 2. 가운데정렬 3. 아래쪽정렬 4. 텍스트하단기준정렬 5. 스트레치정렬 (★참고 부모높이>자식높이 시 적용) -->
        <!-- #5 Padding  : 1 당 +4px -->
        <!-- #6 아이템배경: 1. 파랑 2. 초록 3. 청록 4. 주황 5. 빨강 6. 회색 7. 하양 8. 검정 9. 밝은회색 -->
        <% if (boardList.size() == 0) { %>
        <h1 align="center">등록된 게시글이 없습니다</h1>
        <%    } else {

            for (int i = 0; i < boardList.size(); i++) {
                BoardBean bl = (BoardBean) boardList.get(i);
        %>
        <a href="BoardDetailAction.bo?num=<%= bl.getBOARD_NUM() %>" style="text-decoration: none;">
            <div class="flex-fill mb-3 rounded">
                <!-- 미디어 객체는 종종 블로그 댓글, 트윗 등을 표시하는 데 사용됩니다. -->
                <!-- #1 테두리     : 1. 없음 2. 있음 -->
                <!-- #2 안쪽여백   : 1. 0px 2. 4px 3. 8px 4. 12px 5. 16px 6. 20px -->
                <!-- #3 이미지소스 : 2. non-image -->
                <!-- #4 이미지정렬 : 1. 위쪽 정렬 2. 가운데 정렬 3. 아래쪽 정렬 4. 텍스트 하단기준 정렬 5. 스트레치 정렬 -->
                <!-- #5 이미지모양 : 1. 둥근 2. 타원형 3. 썸네일 -->
                <div class="media p-3">
                    <div class="mt-4 pr-5">
                        <span class="btn text-white" style="background: #e67e22;"><%= bl.getBOARD_NUM() %></span>
                    </div>
                    <div style="position: relative">
                        <img width="210" height="150" src="boardupload/<%=bl.getBOARD_FILE1() != null ? bl.getBOARD_FILE1() : (bl.getBOARD_FILE2() != null ? bl.getBOARD_FILE2() : (bl.getBOARD_FILE3() != null ? bl.getBOARD_FILE3():"noneImage.jpg") ) %>"
                             alt="프로필" class="mr-3 align-self-center rounded">
                        <% if(bl.getBOARD_SOLD_OUT().equals("1")) {%>
                        <div id="soldout2" ><img id="soldout" src="interface/soldout.png" alt=""></div>
                        <% }%>
                    </div>

                    <div class="media-body">
                        <div class="d-sm-flex mb-3">
                            <div class="flex-grow-1 ">
                                <h4 class="d-inline m-0"><%= bl.getBOARD_TITLE() %>
                                    <small><i>-
                                        <%= formatTimeString(bl.getBOARD_DATE()) %> 작성
                                    </i></small>
                                </h4>
                            </div>
                            <div class="flex-grow-1 text-right"><i class="fa fa-eye"></i>
                                <%= bl.getBOARD_READCOUNT() %>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-12">
                                <span class="btn btn-outline-custom mr-1 fa fa-tags"> <%= bl.getBOARD_CATEGORY() %></span>
                                <span class="btn btn-outline-custom2 mr-1 fa fa-map-marker">
                                    <%
                                        String area = "";
                                        try {
                                            area = bl.getBOARD_AREA().split(" ")[1];
                                        } catch (Exception e) {
                                            System.out.println("주소에 도시명이 없습니다");
                                            try {
                                                area = bl.getBOARD_AREA().substring(0,3);
                                            } catch (Exception ex) {
                                                System.out.println("주소명이 3글자 미만입니다");
                                                area = bl.getBOARD_AREA();
                                            }
                                        }
                                    %>
                                    <%= area %></span>
                                <span class="btn btn-outline-success mr-1 fa fa-truck"> <% if(bl.getBOARD_DELIVERY().equals("0")) { delivery="무료";}else{delivery="착불";} %><%=delivery %></span>
                            </div>
                        </div>
                        <div class="row">

                        </div>
                        <div class="row"></div>
                        <div class="row"></div>
                        <div class="row">
                            <div class="col-md-12 text-right">
                                <%
                                    NumberFormat nf = NumberFormat.getInstance();
                                    price = nf.format(Integer.parseInt(bl.getBOARD_PRICE()));
                                %>
                                <%= "\\" + price %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </a>
        <% }%>
        <div class="text-center mt-5 mb-5">
            <% if (nowpage <= 1) { %>

            <a class="btn btn-dark text-light pr-3 pl-3 mr-3 disabled" href="#">이전</a>&nbsp;
            <% } else { %>

            <a class="btn btn-dark text-light pr-3 pl-3 mr-3" href="./BoardList.bo?page=<%=nowpage - 1%>">이전</a>
            <% }%>

            <% if (nowpage <= startpage+2) {
                if(endpage > 5) {
                    endpage = 5;
                }
            } else if(nowpage >= endpage-2) {
                startpage = endpage-4;
            } else {
                startpage = nowpage-2;
                endpage = nowpage+2;
            }
            %>

            <% for (int a = startpage; a <= endpage; a++) { %>
            <% if (a == nowpage) { %>
            <a class="btn btn-outline-secondary disabled ml-2 mr-2" href="#"><%=a%>
                    <%  } else { %>
                <a class="btn btn-outline-secondary ml-2 mr-2" href="./BoardList.bo?page=<%=a%>"><%=a%></a>
                    <% } %>
                    <%  } %>

                    <% if (nowpage >= maxpage) { %>
                <a class="btn btn-dark text-light pr-3 pl-3 ml-3 disabled" href="#">다음</a>
                    <%  } else { %>
                <a class="btn btn-dark text-light pr-3 pl-3 ml-3 " href="./BoardList.bo?page=<%=nowpage + 1%>">다음</a>
                    <% } %>

                    <% if (id != null && id.equals("admin")) { %>
                <a href="./MemberListAction.me">[회원관리]</a>
                    <% } %>
        </div>
    </div>
    <% } %>
</div>

<div id="footer" class="bottom" style="background-color: rgba(0,0,0,0.8); color: white;">
    <div class="d-flex  ">
        <div class="flex-fill"></div>
        <div class="flex-fill text-right align-self-center pr-5"><img src="interface/logo.png" alt=""></div>
        <div class="flex-fill" style="font-size: 15px">
            (주)미래능력개발교육원 / 대표자:김유진 <br>
            팀원 : 이성준, 우상위, 황병화<br>
            강동캠퍼스 : 서울시 강동구 천호대로 1095 현대코아 3층 3강의실<br>
            Tel:010-2109-4600 / 대표 E-mail:remeon8114@gmail.com / 개인정보보호책임자:우상위 <br>
            Copyright © 2019 (주)미래능력개발교육원 5팀 All Rights Reserved
        </div>
        <div class="flex-fill"></div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
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

        // $(".flex-fill:odd").css("backgroundColor", "#cccccc");

        $("a .flex-fill").mouseover(function () {
            $(this).css("background", "#F6F6F6")
        });
        $("a .flex-fill").mouseout(function () {
            $(this).css("background", "")
        });

        var windowWidth = $( window ).width();
        if(windowWidth < 765) {
            $(".media .pr-5").removeClass("pr-5").addClass("pr-3");
            $(".media").removeClass("p-3").addClass("p-0");
        }
        $("#soldout2").parent()
    })
</script>
</body>
</html>