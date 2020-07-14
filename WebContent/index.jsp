<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <title>중고나라</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
            background-image: url("interface/backImage3.png");
            /*background-size: inherit;*/
            /*background-repeat: no-repeat;*/
            /*background-size: cover;*/
            margin-top: 70px;
        }
        .carousel-item a img {
            width: 100%;
            /*width: 250px;*/
            height: 170px;
        }

        .nav-item a {
            color : black;
        }

        .nav-link active {
            color: #e67e22;
            
        }
        
        @media screen and (max-width: 765px) {
            #footer {
                display: none;
            }
            body {
                background-image: none;
            }
        }

    </style>
    <!-- Bootstrap CSS -->
    <%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>

<%
    String role = "0";
    role = (String) session.getAttribute("role");
    if (role == null) {
        role = "0";
    }
    String id = (String ) session.getAttribute("id");
%>
<nav class="navbar navbar-expand-md navbar-light fixed-top" style="background-color: rgba(230,230,230,.8)">
    <!-- 로고 -->
    <a class="navbar-brand" href="index.jsp"><img class="img-thumbnail" src="interface/main.png" style="width:150px;"
                                                  alt="이미지"></a>
    <!-- 토글 버튼 -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarID2">
        <span class="navbar-toggler-icon"></span>
    </button>
    <!-- 네비게이션 링크 -->
    <div class="collapse navbar-collapse justify-content-end" id="navbarID2">
        <ul class="navbar-nav ">
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
                <div class="dropdown-menu dropdown-menu-right px-4"
                     style="background-color: rgba(230,230,230,4); width: 50px">
                    <a class="nav-link" href="MemberInfo.me"><i class="fa fa-user"></i>
                        <small>내정보</small>
                    </a>
                    <% if (role.equals("1")) {%>
                    <a class="nav-link" href="MembershipManagement.me"><i class="fa fa-database"></i>
                        <small>회원관리</small>
                    </a>
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

<br><br><br><br>
<div class="container">
    <div id="carousel_1" class="carousel slide container-fluid " data-ride="carousel" data-interval="3500"
         data-pause="none"
         data-keyboard="false"
         data-wrap="true">
        <!-- 지표 -->
        <ul class="carousel-indicators">
            <%--        <li data-target="#carousel_1" data-slide-to="0" class="active"></li>--%>
            <%--        <li data-target="#carousel_1" data-slide-to="1"></li>--%>
            <%--        <li data-target="#carousel_1" data-slide-to="2"></li>--%>
        </ul>
        <!-- 슬라이드 쇼 -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="row">
                    <div class="col-md-3 pr-3" style="display: inline-block"><a href="#"><img class="img-thumbnail"
                                                                                              src="images/1.jpg" alt=""></a>
                        <div class="text-center">TEST <span class="badge badge-primary">NEW</span></div>
                    </div>
                    <div class="col-md-3 pr-3" style="display: inline-block"><a href="#"><img class="img-thumbnail"
                                                                                              src="images/2.jpg" alt=""></a>
                        <div class="text-center">TEST <span class="badge badge-primary">NEW</span></div>
                    </div>
                    <div class="col-md-3 pr-3" style="display: inline-block"><a href="#"><img class="img-thumbnail"
                                                                                              src="images/3.jpg" alt=""></a>
                        <div class="text-center">TEST <span class="badge badge-primary">NEW</span></div>
                    </div>
                    <div class="col-md-3 " style="display: inline-block"><a href="#"><img class="img-thumbnail"
                                                                                          src="images/4.jpg" alt=""></a>
                        <div class="text-center">TEST <span class="badge badge-primary">NEW</span></div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="row">
                    <div class="col-md-3 pr-3" style="display: inline-block"><a href="#"><img class="img-thumbnail"
                                                                                              src="https://www.w3schools.com/bootstrap4/chicago.jpg"
                                                                                              alt=""></a>
                        <div class="text-center">TEST <span class="badge badge-primary">NEW</span></div>
                    </div>
                    <div class="col-md-3 pr-3" style="display: inline-block"><a href="#"><img class="img-thumbnail"
                                                                                              src="https://www.w3schools.com/bootstrap4/chicago.jpg"
                                                                                              alt=""></a>
                        <div class="text-center">TEST <span class="badge badge-primary">NEW</span></div>
                    </div>
                    <div class="col-md-3 pr-3" style="display: inline-block"><a href="#"><img class="img-thumbnail"
                                                                                              src="https://www.w3schools.com/bootstrap4/chicago.jpg"
                                                                                              alt=""></a>
                        <div class="text-center">TEST <span class="badge badge-primary">NEW</span></div>
                    </div>
                    <div class="col-md-3 " style="display: inline-block"><a href="#"><img class="img-thumbnail"
                                                                                          src="https://www.w3schools.com/bootstrap4/chicago.jpg"
                                                                                          alt=""></a>
                        <div class="text-center">TEST <span class="badge badge-primary">NEW</span></div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">

                <div class="row">
                    <div class="col-md-3 pr-3" style="display: inline-block"><a href="#"><img class="img-thumbnail"
                                                                                              src="https://www.w3schools.com/bootstrap4/ny.jpg"
                                                                                              alt=""></a>
                        <div class="text-center">TEST <span class="badge badge-primary">NEW</span></div>
                    </div>
                    <div class="col-md-3 pr-3" style="display: inline-block"><a href="#"><img class="img-thumbnail"
                                                                                              src="https://www.w3schools.com/bootstrap4/ny.jpg"
                                                                                              alt=""></a>
                        <div class="text-center">TEST <span class="badge badge-primary">NEW</span></div>
                    </div>
                    <div class="col-md-3 pr-3" style="display: inline-block"><a href="#"><img class="img-thumbnail"
                                                                                              src="https://www.w3schools.com/bootstrap4/ny.jpg"
                                                                                              alt=""></a>
                        <div class="text-center">TEST <span class="badge badge-primary">NEW</span></div>
                    </div>
                    <div class="col-md-3" style="display: inline-block"><a href="#"><img class="img-thumbnail"
                                                                                         src="https://www.w3schools.com/bootstrap4/ny.jpg"
                                                                                         alt=""></a>
                        <div class="text-center">TEST <span class="badge badge-primary">NEW</span></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 왼쪽 & 오른쪽 컨트롤 -->
        <a class="carousel-control-prev" href="#carousel_1" data-slide="prev" style="width: 70px">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#carousel_1" data-slide="next" style="width: 70px">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>
</div>
<div class="container">
    <hr>
    <p class="text-left" style="font-size: 30px">공지사항</p>
    <table class="table table-striped" style="text-align: center">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>날짜</th>
        </tr>
        </thead>

    </table>


    <br>
    <p class="text-left" style="font-size: 30px">카테고리별 상품</p>

    <div class="container">
        <ul class="nav nav-tabs nav-justified">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#tab1" onclick="tab1()">패션</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab2" onclick="tab2()">가전기기</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab3" onclick="tab3()">티켓</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab4" onclick="tab4()">생활용품</a>
            </li>
            <li class="nav-item">
                <a class="nav-link " data-toggle="tab" href="#tab5" onclick="tab5()">기타</a>
            </li>

        </ul>
        <br><br>

        <div class="tab-content">
            <div class="tab-pane container active" id="tab1">
                    <div class="row" align="center">
                        <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                            <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                            <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                            <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                            <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                        </div>
                    </div>
            </div>
            <div class="tab-pane container fade" id="tab2"><br>
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                        <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                        <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                        <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                        <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                    </div>
                </div>
            </div>
            <div class="tab-pane container fade" id="tab3"><br>
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                        <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                        <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                        <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                        <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                    </div>
                </div>
            </div>
            <div class="tab-pane container fade" id="tab4"><br>
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                        <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                        <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                        <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                        <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                    </div>
                </div>
            </div>
            <div class="tab-pane container fade" id="tab5"><br>
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                        <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                        <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                        <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12 mb-4">
                        <a href="#"><img class="rounded" src="interface/noneImage.jpg" width="255" height="300" alt=""></a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<div id="footer" class="fixed-bottom" style="background-color: rgba(0,0,0,0.8); color: white;">
    <div class="d-flex      ">
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


</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $(".nav-item a").mouseover(function () {
            // if (!$(this).hasClass("active"))
            $(this).css("color", "#e67e22")
        });
        $(".nav-item a").mouseout(function () {
            if (!$(this).hasClass("active"))
            $(this).css("color", "")
        });

        $('[data-toggle="tooltip"]').tooltip();


        // function getJsonOpen() {
        $.getJSON({ /* = getJSON() */ /* ajax로 보내면 json파일형식을 인식못함*/
            type: "get", /*get방식으로 전송*/
            // data: "", /* Json 데이터*/
            url: "newBoard.main", /* 해당 url로 ajax 요청을 한다 */
            // dataType: "json", /* 응답 텍스트는 처리과정 없이 콜백함수로 전달된다. */
            // contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function (data) { /* 응답이 성공 상태 코드를 반환하면 호출 */
                console.log(data); /* json 배열 출력 */
                for (var i = 0; i < data.length; i++) {
                    // alert($("a").eq(i).html());
                    // alert($(".badge").html());
                    $(".col-md-3 a").eq(i).attr("href", "BoardDetailAction.bo?num="+data[i].num).children().attr("src", data[i].image);
                    $(".col-md-3 a").eq(i).next().html(data[i].title +' <span class="badge badge-primary">NEW</span>');
                }
            },
            error: function (xhr,err) {
                alert('Ajax 오류발생: '+xhr.readyState+'\nstatus: '+xhr.status + ' ' + err);
            }
        });

        $.getJSON({ /* = getJSON() */ /* ajax로 보내면 json파일형식을 인식못함*/
            type: "get", /*get방식으로 전송*/
            // data: "", /* Json 데이터*/
            url: "newCloth.main", /* 해당 url로 ajax 요청을 한다 */
            // dataType: "json", /* 응답 텍스트는 처리과정 없이 콜백함수로 전달된다. */
            // contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function (data) { /* 응답이 성공 상태 코드를 반환하면 호출 */
                console.log(data); /* json 배열 출력 */
                for (var i = 0; i < data.length; i++) {
                    var cloth = $("#tab1").find("a").eq(i);
                    cloth.attr("href", "BoardDetailAction.bo?num="+data[i].num).children().attr("src", data[i].image);
                }
            },
            error: function (xhr,err) {
                alert('Ajax 오류발생: '+xhr.readyState+'\nstatus: '+xhr.status + ' ' + err);
            }
        });
        // };
    });

    function tab1() { /* 부트스트랩 함수가 먼저적용이 되서 클릭 이벤트를 인식못함 */
        $.getJSON({ /* = getJSON() */ /* ajax로 보내면 json파일형식을 인식못함*/
            type: "get", /*get방식으로 전송*/
            // data: "", /* Json 데이터*/
            url: "newCloth.main", /* 해당 url로 ajax 요청을 한다 */
            // dataType: "json", /* 응답 텍스트는 처리과정 없이 콜백함수로 전달된다. */
            // contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function (data) { /* 응답이 성공 상태 코드를 반환하면 호출 */
                console.log(data); /* json 배열 출력 */
                for (var i = 0; i < data.length; i++) {
                    var cloth = $("#tab1").find("a").eq(i);
                    cloth.attr("href", "BoardDetailAction.bo?num="+data[i].num).children().attr("src", data[i].image);
                }
            },
            error: function (xhr,err) {
                alert('Ajax 오류발생: '+xhr.readyState+'\nstatus: '+xhr.status + ' ' + err);
            }
        });
    }

    function tab2() {
        $.getJSON({ /* = getJSON() */ /* ajax로 보내면 json파일형식을 인식못함*/
            type: "get", /*get방식으로 전송*/
            // data: "", /* Json 데이터*/
            url: "Appliances.main", /* 해당 url로 ajax 요청을 한다 */
            // dataType: "json", /* 응답 텍스트는 처리과정 없이 콜백함수로 전달된다. */
            // contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function (data) { /* 응답이 성공 상태 코드를 반환하면 호출 */
                console.log(data); /* json 배열 출력 */
                for (var i = 0; i < data.length; i++) {
                    var cloth = $("#tab2").find("a").eq(i);
                    cloth.attr("href", "BoardDetailAction.bo?num="+data[i].num).children().attr("src", data[i].image);
                }
            },
            error: function (xhr,err) {
                alert('Ajax 오류발생: '+xhr.readyState+'\nstatus: '+xhr.status + ' ' + err);
            }
        });
    }

    function tab3() {
        $.getJSON({ /* = getJSON() */ /* ajax로 보내면 json파일형식을 인식못함*/
            type: "get", /*get방식으로 전송*/
            // data: "", /* Json 데이터*/
            url: "Ticket.main", /* 해당 url로 ajax 요청을 한다 */
            // dataType: "json", /* 응답 텍스트는 처리과정 없이 콜백함수로 전달된다. */
            // contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function (data) { /* 응답이 성공 상태 코드를 반환하면 호출 */
                console.log(data); /* json 배열 출력 */
                for (var i = 0; i < data.length; i++) {
                    var cloth = $("#tab3").find("a").eq(i);
                    cloth.attr("href", "BoardDetailAction.bo?num="+data[i].num).children().attr("src", data[i].image);
                }
            },
            error: function (xhr,err) {
                alert('Ajax 오류발생: '+xhr.readyState+'\nstatus: '+xhr.status + ' ' + err);
            }
        });
    }

    function tab4() {
        $.getJSON({ /* = getJSON() */ /* ajax로 보내면 json파일형식을 인식못함*/
            type: "get", /*get방식으로 전송*/
            // data: "", /* Json 데이터*/
            url: "HouseholdGoods.main", /* 해당 url로 ajax 요청을 한다 */
            // dataType: "json", /* 응답 텍스트는 처리과정 없이 콜백함수로 전달된다. */
            // contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function (data) { /* 응답이 성공 상태 코드를 반환하면 호출 */
                console.log(data); /* json 배열 출력 */
                for (var i = 0; i < data.length; i++) {
                    var cloth = $("#tab4").find("a").eq(i);
                    cloth.attr("href", "BoardDetailAction.bo?num="+data[i].num).children().attr("src", data[i].image);
                }
            },
            error: function (xhr,err) {
                alert('Ajax 오류발생: '+xhr.readyState+'\nstatus: '+xhr.status + ' ' + err);
            }
        });
    }

    function tab5() {
        $.getJSON({ /* = getJSON() */ /* ajax로 보내면 json파일형식을 인식못함*/
            type: "get", /*get방식으로 전송*/
            // data: "", /* Json 데이터*/
            url: "etc.main", /* 해당 url로 ajax 요청을 한다 */
            // dataType: "json", /* 응답 텍스트는 처리과정 없이 콜백함수로 전달된다. */
            // contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function (data) { /* 응답이 성공 상태 코드를 반환하면 호출 */
                console.log(data); /* json 배열 출력 */
                for (var i = 0; i < data.length; i++) {
                    var cloth = $("#tab5").find("a").eq(i);
                    cloth.attr("href", "BoardDetailAction.bo?num="+data[i].num).children().attr("src", data[i].image);
                }
            },
            error: function (xhr,err) {
                alert('Ajax 오류발생: '+xhr.readyState+'\nstatus: '+xhr.status + ' ' + err);
            }
        });
    }
</script>
</body>
</html>