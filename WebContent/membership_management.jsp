<%@ page import="java.util.List" %>
<%@ page import="net.member.db.MemberBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<%
    String role = "0";
    role = (String) session.getAttribute("role");
    if (role == null) {
        role = "0";
    }
    String id = (String) session.getAttribute("id");

    List memberlist = (List) request.getAttribute("memberlist");
%>
<html>
<head>
    <title>중고나라</title>
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

        body {
            padding-top: 70px;
            font-size: 15px;
        }
        table{
            font-family: roboto;
            font-weight: 100;
            font-size: 15px;
        }

        #banner {
            height: 240px;
        }
        #footer {
            height: 240px;
        }
    </style>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
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
                    <a class="nav-link" href="MemberInfo.me" style="font-size: 20px"><i class="fa fa-user"></i>
                        <small>내정보</small>
                    </a>
                    <% if (role.equals("1")) {%>
                    <a class="nav-link" href="MembershipManagement.me" style="font-size: 20px"><i class="fa fa-database"></i>
                        <small>회원관리</small>
                    </a>
                    <% }%>
                    <a class="nav-link" href="MemberLogout.me" style="font-size: 20px"><i class="fa fa-sign-out"></i>
                        <small>로그아웃</small>
                    </a>
                </div>
            </li>
            <%} %>
        </ul>
    </div>
</nav>
<div id="banner" class="row">
    <div class="col-md-4"></div>
    <div class="col-md-4"></div>
    <div class="col-md-4"></div>
    <div class="col-md-4"></div>
</div>
<div id="content" class="row">
    <div class="container">
        <div class="col-md-12">
            <input class="form-control" id="filterInput_1" type="text" placeholder="Search..">
            <br>
            <!--
                table-striped 흑백 테이블구조
                table-hover 테이블 호버효과
                table-bordered 테이블 테두리
                table-borderless 테두리 모두제거
                table-sm 작은사이즈의 테이블
                table-dark 테이블 검정테마
                table-light 테이블 흰색테마
            -->
            <table class="table table-bordered table-striped table" >
                <thead>
                <tr class="text-center thead-dark"> <!-- thead-dark(검정) thead-light(회색) -->
                    <th>번호</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>나이</th>
                    <th>성별</th>
                    <th>주소</th>
                    <th>연락처</th>
                    <th>이메일</th>
                    <th>관심</th>
                    <th>최근 접속일</th>
                    <th>권한</th>
                    <th>신고건수</th>
                </tr>
                </thead>
                <tbody id="filterTable_1">
                <% System.out.println(memberlist.size());%>
                <% for (int i = 0; i < memberlist.size(); i++) {%>
                <% MemberBean mb = (MemberBean) memberlist.get(i); %>
                <tr>
                    <td><%= i + 1  %>
                    </td>
                    <td><%= mb.getMEMBER_ID() %>
                    </td>
                    <td><%= mb.getMEMBER_NAME() %>
                    </td>
                    <td><%= mb.getMEMBER_AGE() %>
                    </td>
                    <td><%= mb.getMEMBER_GENDER() %>
                    </td>
                    <td><%= mb.getMEMBER_ADDRESS() %>
                    </td>
                    <td><%= mb.getMEMBER_PHONE() %>
                    </td>
                    <td><%= mb.getMEMBER_EMAIL() %>
                    </td>
                    <td><%= mb.getMEMBER_INTEREST() %>
                    </td>
                    <td><%= mb.getMEMBER_RECENT_LOGIN() %>
                    </td>
                    <td align="right"><%= mb.getMEMBER_ROLE() %>
                    </td>
                    <td align="right"><%= mb.getMEMBER_NOTIFY_COUNT() %>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
<div id="footer" class="row">
    <div class="col-md-4"></div>
    <div class="col-md-4"></div>
    <div class="col-md-4"></div>
    <div class="col-md-4"></div>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        $("#filterInput_1").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#filterTable_1 tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
        /*$("tr td:first-child").addClass("text-right");*/
    });

</script>
</body>
</html>