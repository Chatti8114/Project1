<%--
  Created by IntelliJ IDEA.
  User: alfo3-13
  Date: 2019-12-03
  Time: 오전 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="net.board.db.*" %>
<%
    String id =(String)session.getAttribute("id");
    BoardBean board = (BoardBean)request.getAttribute("boarddata");
%>
<html>
<head>
    <title>중고나라</title>
    <script language="JavaScript">
        function addboard() {
            boardform.submit();
        }
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        * {
            font-family: "배달의민족 주아";
            font-size: 15px;
        }

    </style>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-light fixed-top" style="background-color: rgba(230,230,230,.8)" >
    <!-- 로고 -->
    <a class="navbar-brand" href="index.jsp"><img class="img-thumbnail" src="interface/main.png" style="width:150px;" alt="이미지" ></a>

    <!-- 토글 버튼 -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarID">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- 네비게이션 링크 -->
    <div class="collapse navbar-collapse justify-content-end" id="navbarID">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa fa-pencil"></i> 글작성</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="MemberLogin.me"><i class="fa fa-sign-in"></i> 로그인</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="MemberAgree.me"><i class="fa fa-users"></i> 회원가입</a>
            </li>
        </ul>
    </div>

</nav>

<div class="container">
    <div class="table-hover">
        <div class="col-sm-11 text-center" >

            <br><br><br><br>
            <h2>글 작성</h2>
            <form action="./BoardReplyView.bo" method="post" name="boardform">
                <input type="hidden" name="BOARD_NUM" value="<%=board.getBOARD_NUM() %>">
                <input type="hidden" name="BOARD_RE_REF" value="<%=board.getBOARD_RE_REF() %>">
                <input type="hidden" name="BOARD_RE_LEV" value="<%=board.getBOARD_RE_LEV() %>">
                <input type="hidden" name="BOARD_RE_SEQ" value="<%=board.getBOARD_RE_SEQ() %>">
                <input type="hidden" name="BOARD_CATEGORY" value="<%=board.getBOARD_RE_SEQ() %>">
                <input type="hidden" name="BOARD_PRICE" value="<%=board.getBOARD_PRICE() %>">
                <input type="hidden" name="BOARD_FILE1" value="<%=board.getBOARD_FILE1() %>">
                <input type="hidden" name="BOARD_FILE2" value="<%=board.getBOARD_FILE2() %>">
                <input type="hidden" name="BOARD_FILE3" value="<%=board.getBOARD_FILE3() %>">
                <input type="hidden" name="BOARD_STATE" value="<%=board.getBOARD_STATE() %>">
                <input type="hidden" name="BOARD_REFUND" value="<%=board.getBOARD_REFUND() %>">
                <input type="hidden" name="BOARD_DELIVERY" value="<%=board.getBOARD_DELIVERY() %>">
                <input type="hidden" name="BOARD_AREA" value="<%=board.getBOARD_AREA() %>">

                <table class="table table-boardered" >

                    <tr>
                        <td style="font-family: 돋움; font-size: 12pt;" height="16">
                            <div align="center">글쓴이</div>
                        </td>
                        <td>
                            <%= id %>
                        </td>
                    </tr>

                    <tr>
                        <th>글 제목</th>
                        <td><input type="text" class="form-control" name="BOARD_TITLE"></td>
                    </tr>


                    <tr>
                        <td><div align="center">내 용</div></td>
                        <td><textarea name="BOARD_CONTENT" cols="105" rows="20"></textarea></td>
                    </tr>



                    <tr>
                        <td colspan="2">
                            <a href="javascript:addboard()" class="btn btn-primary">등록</a>&nbsp;&nbsp;
                            <a href="javascript:history.go(-1)" class="btn btn-danger">뒤로</a>
                        </td>
                    </tr>



                </table>
                <br><br><br><br>
            </form>
        </div>
    </div>
</div>


<div id="footer" class="bottom" style="background-color: rgba(0,0,0,0.8); color: white;">
    <div class="d-flex  ">
        <div class="flex-fill"></div>
        <div class="flex-fill text-right align-self-center pr-5"><img src="../images/logo.png" alt=""></div>
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

    })
</script>
</body>
</html>