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
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">--%>
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

    </script>
</head>
<body>
<%
    String id = (String) session.getAttribute("id");
    if (id != null) { %>
<script>
    alert("현재 로그인중입니다!")
    location.href("/");
</script>
<%
    }
%>
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
                <a class="nav-link" href="BoardList.bo"><i class="fa fa-th-list"></i> 게시판</a>
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
        <form action="MemberJoinAction.me" method="post" class="mx-auto" id="joinform">
            <div class="form-group">
                <label for="MEMBER_ID">아이디</label>

                <input type="text" class="form-control" id="MEMBER_ID" placeholder="ID" name="MEMBER_ID" maxlength="15" required>
                <div>아이디 입력(15자이내)</div>
            </div>
            <div class="form-group">
                <label for="MEMBER_PW">비밀번호 </label>
                <input type="password" class="form-control" id="MEMBER_PW" placeholder="PASSWORD" name="MEMBER_PW" maxlength="15"
                       required>
                <div class="valid-feedback">비밀번호 입력 완료</div>
                <div class="invalid-feedback">비밀번호 입력(15자이내)</div>
            </div>
            <div class="form-group">
                <label for="MEMBER_NAME">이름 </label>
                <input type="text" class="form-control" id="MEMBER_NAME" placeholder="NAME" name="MEMBER_NAME" maxlength="5" required>
                <div class="valid-feedback">이름 입력 완료</div>
                <div class="invalid-feedback">이름을 입력해주세요</div>
            </div>
            <div class="form-group">
                <label for="MEMBER_AGE">나이</label>
                <input type="text" class="form-control" id="MEMBER_AGE" placeholder="AGE" name="MEMBER_AGE" min="1" max="200" required>
                <div class="valid-feedback">나이 입력 완료</div>
                <div class="invalid-feedback">나이를 입력해주세요</div>
            </div>
            <div class="form-group">
                <tr>
                    <th style="width: 30%">성별</th>
                    <td  style="width: 70%">
                        <select id="sel1" name="MEMBER_GENDER" class="form-control">
                            <option value="">성별을 선택해주세요</option>
                            <option value="남">남자</option>
                            <option value="여">여자</option>
                        </select>
                    </td>
                </tr>
            </div>
            <div class="form-group">
                <label for="MEMBER_ADDRESS">주소</label>
                <input type="text" class="form-control" id="MEMBER_ADDRESS" placeholder="ADDRESS" name="MEMBER_ADDRESS"
                       required>
                <div class="valid-feedback">주소 입력 완료</div>
                <div class="invalid-feedback">상세 주소를 입력해주세요(50자이내)</div>
            </div>
            <div class="form-group">
                <label for="MEMBER_PHONE">휴대폰 <small>(-제외)</small></label>
                <input type="text" class="form-control" id="MEMBER_PHONE" placeholder="PHONE" name="MEMBER_PHONE"
                       required>
                <div class="valid-feedback">번호 입려 완료</div>
                <div class="invalid-feedback">번호 입력해주세요</div>
            </div>
            <div class="form-group">
                <label for="MEMBER_EMAIL">이메일</label>
                <input type="email" class="form-control" id="MEMBER_EMAIL" placeholder="EMAIL" name="MEMBER_EMAIL"
                       required>
                <div class="valid-feedback">이메일 입력 완료</div>
                <div class="invalid-feedback">이메일 입력(40자이내)</div>
            </div>
            <div class="form-group">
                <tr>
                    <th style="width: 30%">관심분야</th>
                    <td  style="width: 70%">
                        <select id="sel2" name="MEMBER_INTEREST" class="form-control">
                            <option value="">관심분야 선택</option>
                            <option value="fashion">fashion</option>
                            <option value="가전기기">가전기기</option>
                            <option value="티켓">티켓</option>
                            <option value="생활용품">생활용품</option>
                            <option value="기타">기타</option>
                        </select>
                    </td>
                </tr>
            </div>

            <!-- 버튼크기: 1.기본 2.작은 3.큰 4.전체 -->
            <!-- 버튼색: 1.파랑 2.초록 3.청록 4.주황 5.빨강 6.회색 7.검정 8.밝은회색 9.링크 -->
            <button type="button" class="btn btn-primary">회원가입</button>
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

        $(":password").keyup(function () {
            $(this).css("font-family", "맑은 고딕");
           // alert($(this).css("font-family"));
        });
        $("button[type=button]").on("click",function () {
            var count = 0;
            var index1 = 0;
            var index2 = 0;
            var error = $("#MEMBER_ID").next().html();
            if (error == "사용 불가능 한 아이디 입니다") {
               alert("중복된 아이디 입니다");
               return; /* 리턴을 주면 다음문장은 실행하지 않는다 !   */
            }
            $("input[class=form-control]").each(function (i,item) {
                if ($(this).val()=="") {
                    ++count;

                }
            });

            index1 = $("#sel1 option").index($("#sel1 option:selected"));
            index2 = $("#sel2 option").index($("#sel2 option:selected"));

            if (index1 < 1 || index2 < 1) {
                alert("입력되지 않은 내용이 있습니다!");
                return false;
            }

            if (count > 0) {
                alert("입력되지 않은 내용이 있습니다!");
                return false ;
            } else {
                $("#joinform").submit();
            }
        } );
        $("#MEMBER_ID").keyup(function () {
            var username = $("#MEMBER_ID").val();
            var sendData = "username=" + username;
            $.post("MemberIdCheck.me", sendData , function (msg) {

                if(msg == "1") {
                    $("#MEMBER_ID").next().html("사용 가능 한 아이디 입니다").css("color", "#28A745")
                    $("#MEMBER_ID").css("border-color", "#28A745").css("box-shadow", "0 0 0 0.2rem rgba(40, 167, 69, 0.25)");;
                } else {
                    $("#MEMBER_ID").next().html("사용 불가능 한 아이디 입니다").css("color", "red");
                    $("#MEMBER_ID").css("border-color", "red").css("box-shadow", "0 0 0 0.2rem rgba(167, 40, 69, 0.25)");
                }
            });
            // 문자열 형식의 데이터를 welcome.jsp 로 보낸다.
            // 서버의 welcome.jsp 에서는 바은 데이터에
            // 인사말을 덧붙여서 되돌린다.
            return false;
        });

    })
</script>
</body>
</html>