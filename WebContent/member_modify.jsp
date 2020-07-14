<%--
  Created by IntelliJ IDEA.
  User: alfo3-13
  Date: 2019-12-03
  Time: 오전 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="net.member.db.*"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.SQLException" %>

<%
    MemberBean member = (MemberBean)request.getAttribute("memberdata");
    String role = "0";
    role = (String) session.getAttribute("role");
    if (role == null) {
        role = "0";
    }
    String id = (String) session.getAttribute("id");
%>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">--%>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        @font-face {

            src: url('juA.ttf');
            font-weight: 100;
            font-style: normal;
        }

        * {

            font-weight: 100;
            font-size: 20px;
        }
        @media screen and (max-width: 765px) {
            #footer {
                display: none;
            }
        }

    </style>
    <script>
        window.onload = function(){
            engAndNumberFunc(document.getElementById("MEMBER_ID"));
            engAndNumberFunc(document.getElementById("MEMBER_PW"));
            onlyNumberFunc(document.getElementById("MEMBER_AGE"));
            onlyNumberFunc(document.getElementById("MEMBER_PHONE"));
            onlyKorFunc(document.getElementById("MEMBER_NAME"));
        }

        //영문, 숫자만 입력가능한 keyup 이벤트 함수
        function engAndNumberFunc(t){
            var regexp = /[^a-z0-9]/gi;
            t.onkeyup = function(e){
                var v = this.value;
                this.value = v.replace(regexp,'');
            }
        }
        //숫자만 입력가능한 keyup 이벤트 함수
        function onlyNumberFunc(t){
            var regexp = /[^0-9]/gi;
            t.onkeyup = function(e){
                var v = this.value;
                this.value = v.replace(regexp,'');
            }
        }
        //한글만 입력가능한 keyup 이벤트 함
        function onlyKorFunc(t){
            var regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
            t.onkeyup = function(e){
                var v = this.value;
                this.value = v.replace(regexp,'');
            }
        }
        function validatePassword() {
            var newPassword = document.getElementById('MEMBER_PW').newPassword.value;
            var minNumberofChars = 6;
            var maxNumberofChars = 16;
            var regularExpression  = /^[a-zA-Z0-9!@#$%^&*]{6,16}$/;
            alert(newPassword);
            if(newPassword.length < minNumberofChars || newPassword.length > maxNumberofChars){
                return false;
            }
            if(!regularExpression.test(newPassword)) {
                alert("password should contain atleast one number and one special character");
                return false;
            }
        }
        function membermodify() {
            modifyform.submit();
        }

    </script>
</head>
<body>

<nav class="navbar navbar-expand-md navbar-light fixed-top" style="background-color: rgba(230,230,230,.8)" >
    <!-- 로고 -->
    <a class="navbar-brand" href="index.jsp"><img class="img-thumbnail" src="interface/main.png" style="width:150px;" alt="이미지" ></a>
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
            <li class="nav-item">
                <a class="nav-link" href=""><i class="fa fa-th-list"></i> 게시판</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="MemberLogin.me"><i class="fa fa-sign-in"></i> 로그인</a>
            </li>
        </ul>
    </div>
</nav>
<br><br><br><br>
<div class="container">
    <div class="mb-5 p-5" style="border: 5px solid #E67E22; border-radius: 10px;">
        <form action="MemberModifyAction.me" method="post" class="mx-auto" name="modifyform">
            <div class="form-group">
                <label for="MEMBER_ID">아이디</label>
                <input type="text" class="form-control" id="MEMBER_ID" placeholder="ID" name="MEMBER_ID" maxlength="15" required value="<%=member.getMEMBER_ID()%>" readonly="readonly">

                <div>아이디 입력(15자이내)</div>
            </div>
            <div class="form-group">
                <label for="MEMBER_PW">비밀번호 </label>
                <input type="text" class="form-control" id="MEMBER_PW" placeholder="PASSWORD" name="MEMBER_PW" maxlength="15"
                       required value="<%=member.getMEMBER_PW()%>">

                <div class="valid-feedback">비밀번호 입력 완료</div>
                <div class="invalid-feedback">비밀번호 입력(15자이내)</div>
            </div>
            <div class="form-group">
                <label for="MEMBER_NAME">이름 </label>
                <input type="text" class="form-control" id="MEMBER_NAME" placeholder="NAME" name="MEMBER_NAME" maxlength="5" required value="<%=member.getMEMBER_NAME()%>">

                <div class="valid-feedback">이름 입력 완료</div>
                <div class="invalid-feedback">이름을 입력해주세요</div>
            </div>
            <div class="form-group">
                <label for="MEMBER_AGE">나이</label>
                <input type="text" class="form-control" id="MEMBER_AGE" placeholder="AGE" name="MEMBER_AGE" min="1" max="200" required value="<%=member.getMEMBER_AGE()%>">
                <div class="valid-feedback">나이 입력 완료</div>
                <div class="invalid-feedback">나이를 입력해주세요</div>
            </div>
            <div class="form-group">
                <tr>
                    <th style="width: 30%">성별</th>
                    <td  style="width: 70%">
                        <select name="MEMBER_GENDER" class="form-control">
                            <option value="성별 선택해주세요">성별을 선택해주세요</option>
                            <option <%=member.getMEMBER_GENDER().equals("남") ? "selected" : ""%> value="남" >남자</option>
                            <option <%=member.getMEMBER_GENDER().equals("여") ? "selected" : ""%> value="여">여자</option>
                        </select>
                    </td>
                </tr>
            </div>
            <div class="form-group">
                <label for="MEMBER_ADDRESS">주소</label>
                <input type="text" class="form-control" id="MEMBER_ADDRESS" placeholder="ADDRESS" name="MEMBER_ADDRESS"
                       required value="<%=member.getMEMBER_ADDRESS()%>">
                <div class="valid-feedback">주소 입력 완료</div>
                <div class="invalid-feedback">상세 주소를 입력해주세요(50자이내)</div>
            </div>
            <div class="form-group">
                <label for="MEMBER_PHONE">휴대폰 <small>(-제외)</small></label>
                <input type="text" class="form-control" id="MEMBER_PHONE" placeholder="PHONE" name="MEMBER_PHONE"
                       required value="<%=member.getMEMBER_PHONE()%>">
                <div class="valid-feedback">번호 입려 완료</div>
                <div class="invalid-feedback">번호 입력해주세요</div>
            </div>
            <div class="form-group">
                <label for="MEMBER_EMAIL">이메일</label>
                <input type="text" class="form-control" id="MEMBER_EMAIL" placeholder="EMAIL" name="MEMBER_EMAIL"
                       required value="<%=member.getMEMBER_EMAIL()%>">
                <div class="valid-feedback">이메일 입력 완료</div>
                <div class="invalid-feedback">이메일 입력(40자이내)</div>
            </div>
            <div class="form-group">
                <tr>
                    <th style="width: 30%">관심분야</th>
                    <td  style="width: 70%">
                        <select name="MEMBER_INTEREST" class="form-control">
                            <option value="">관심분야 선택</option>
                            <option <%=member.getMEMBER_INTEREST().equals("fashion") ? "selected" : ""%> value="fashion">fashion</option>
                            <option <%=member.getMEMBER_INTEREST().equals("가전기기") ? "selected" : ""%> value="가전기기">가전기기</option>
                            <option <%=member.getMEMBER_INTEREST().equals("티켓") ? "selected" : ""%> value="티켓">티켓</option>
                            <option <%=member.getMEMBER_INTEREST().equals("생활용품") ? "selected" : ""%> value="생활용품">생활용품</option>
                            <option <%=member.getMEMBER_INTEREST().equals("기타") ? "selected" : ""%> value="기타">기타</option>
                        </select>
                    </td>
                </tr>
            </div>

            <!-- 버튼크기: 1.기본 2.작은 3.큰 4.전체 -->
            <!-- 버튼색: 1.파랑 2.초록 3.청록 4.주황 5.빨강 6.회색 7.검정 8.밝은회색 9.링크 -->
            <a href="javascript:membermodify()" class="btn btn-primary" >수정완료</a>
            <button type="reset" class="btn btn-success">다시작성</button>
        </form>


    </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
    });
</script>
</body>
</html>