<%@ page import="net.member.db.MemberBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    MemberBean member = (MemberBean) request.getAttribute("memberdata");
    String role = "0";
    role = (String) session.getAttribute("role");
    if (role == null) {
        role = "0";
    }
    String id = (String) session.getAttribute("id");
%>
<html>
<head>

    <title>중고나라</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <script language="JavaScript">
        function addboard() {
            boardform.submit();
        }
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>

        @font-face {
            font-family: 'roboto';
            src: url('juA.ttf');
            font-weight: 100;
            font-style: normal;
        }
        nav {
            font-family: roboto;
            font-weight: 100;
            font-size: 20px;
        }
        table {
            font-family: roboto;
            font-weight: 100;
            font-size: 15px;
        }
        @media screen and (max-width: 765px) {
            #footer {
                display: none;
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
<br><br><br><br>
<div class="container">
    <div class="row">
        <div class="col-md-3  toppad  pull-right col-md-offset-3 ">
            <br>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >


            <div class="panel panel-info">
                <div class="panel-heading">

                    <h1 class="panel-title"><%= member.getMEMBER_ID() %>님의 회원정보</h1>
                    <br><br>

                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class=" col-md-9 col-lg-9 ">
                            <table class="table table-user-information">
                                <caption>
                                    <div class="container">
                                        <div class="card">
                                            <div class="card-body" align="center"><img style="width: 200px; height: inherit;" src="interface/main.png" alt=""></div>
                                        </div>
                                    </div>
                                </caption>
                                <tbody>
                                <tr>
                                    <td>이름:</td>
                                    <td><%= member.getMEMBER_NAME() %></td>
                                </tr>

                                <tr>
                                    <td>관심사:</td>
                                    <td><%= member.getMEMBER_INTEREST() %></td>
                                </tr>

                                <tr>
                                    <td>주소:</td>
                                    <td><%= member.getMEMBER_ADDRESS() %></td>
                                </tr>

                                <tr>
                                    <td>전화번호:</td>
                                    <td><%= member.getMEMBER_PHONE() %></td>
                                </tr>

                                <tr>
                                    <td>이메일 주소:</td>
                                    <td><a href="mailto:info@support.com"><%= member.getMEMBER_EMAIL() %></a></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center"><a href="MemberModify.me?id=<%= id %>" class="btn btn-primary">정보 수정</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="MemberDeleteAction.me?id=<%= member.getMEMBER_ID() %>" onclick="if (confirm('회원탈퇴 하시겠습니까?')) { alert('이용해주셔서 감사합니다 !') }" class="btn btn-danger">회원탈퇴</a></td>
                                </tr>


                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div id="footer" class="fixed-bottom" style="background-color: rgba(0,0,0,0.8); color: white;">
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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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

    })
</script>
</body>
</html>


