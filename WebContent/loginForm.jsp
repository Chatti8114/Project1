<%--
  Created by IntelliJ IDEA.
  User: alfo3-13
  Date: 2019-12-03
  Time: 오전 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>중고나라</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="css/bootstrap.min.css">
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
    </style>
</head>
<body>

<%
    String id = (String) session.getAttribute("id");

    if (id != null) {
%>
<script>
    alert("현재 로그인중입니다 !")
    location.href="/";
</script>
<%
    }
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

            <% if (id == null) { %>
            <li class="nav-item">
                <a class="nav-link" href="/"><i class="fa fa-home"></i> 홈</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="BoardList.bo"><i class="fa fa-th-list"></i> 게시판</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="MemberAgree.me"><i class="fa fa-users"></i> 회원가입</a>
            </li>
            <%} else { %>
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#"><%= id%> <i class="fa fa-caret-down"></i></a>
                <div class="dropdown-menu dropdown-menu-right px-4"
                     style="background-color: rgba(230,230,230,4); width: 50px">
                    <a class="nav-link" href="#"><i class="fa fa-user"></i>
                        <small>내정보</small>
                    </a>
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
    <form action="MemberLoginAction.me" method="post" class="was-validated">
        <div class="form-group">
            <label for="MEMBER_ID">아이디 </label>
            <input type="text" class="form-control" id="MEMBER_ID" placeholder="ID" name="MEMBER_ID" required
                   style="font-family: 맑은 고딕">
            <div class="valid-feedback">입력 시 메시지</div>
            <div class="invalid-feedback">미입력 시 메시지</div>
        </div>
        <div class="form-group">
            <label for="MEMBER_PW">비밀번호 </label>
            <input type="password" class="form-control" id="MEMBER_PW" placeholder="PASSWORD" name="MEMBER_PW" required
                   style="font-family: 맑은 고딕">
            <div class="valid-feedback">입력 시 메시지.</div>
            <div class="invalid-feedback">미입력 시 메시지</div>
        </div>
        <div class="form-group form-check">
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="idSave" name="idSave" value="첫번째 체크박스 값">
                <label class="custom-control-label" for="idSave">아이디 저장</label>
            </div>

        </div>

        <!-- 버튼크기: 1.기본 2.작은 3.큰 4.전체 -->
        <!-- 버튼색: 1.파랑 2.초록 3.청록 4.주황 5.빨강 6.회색 7.검정 8.밝은회색 9.링크 -->
        <button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
    </form>

</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        var userInputId = getCookie("userId");
        $("#MEMBER_ID").val(userInputId);

        if ($("#MEMBER_ID").val() != "") {
            $("#idSave").attr("checked", true);
        }
        $("#idSave").change(function () { // 체크박스에 변화가 발생시
            if ($("#idSave").is(":checked")) { // ID 저장하기 체크했을 때,
                var userInputId = $("#MEMBER_ID").val();
                setCookie("userId", userInputId, 7); // 7일 동안 쿠키 보관
            } else { // ID 저장하기 체크 해제 시,
                deleteCookie("userId");
            }
        });
        // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
        $("#MEMBER_ID").keyup(function () { // ID 입력 칸에 ID를 입력할 때,
            if ($("#idSave").is(":checked")) { // ID 저장하기를 체크한 상태라면,
                var userInputId = $("#MEMBER_ID").val();
                setCookie("userId", userInputId, 7); // 7일 동안 쿠키 보관
            }
        });

    function setCookie(cookieName, value, exdays) {
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }

    function deleteCookie(cookieName) {
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }

    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if (start != -1) {
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if (end == -1) end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    };

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
