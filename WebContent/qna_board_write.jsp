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
    <link rel="stylesheet" href="css/bootstrap.css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        @font-face {
            font-family: 'roboto';
            src: url('juA.ttf');
            font-weight: 100;
            font-style: normal;
        }
        body {
            font-family: roboto;
            font-weight: 100;
            font-size: 20px;
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
    String id = (String) session.getAttribute("id");
%>
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
                <a class="nav-link" href="/"><i class="fa fa-home"></i> 홈</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="BoardList.bo"><i class="fa fa-th-list"></i> 게시판</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#"><%= id%> <i class="fa fa-caret-down"></i></a>
                <div class="dropdown-menu dropdown-menu-right px-4"
                     style="background-color: rgba(230,230,230,4); width: 50px">
                    <a class="nav-link" href="MemberInfo.me" style="font-size: 20px"><i class="fa fa-user"></i>
                        <small>내정보</small>
                    </a>
                    <% if (role.equals("1")) {%>
                    <a class="nav-link" href="MembershipManagement.me" style="font-size: 20px"><i class="fa fa-database"></i>
                        <small>회원관리</small></a>
                    <% }%>
                    <a class="nav-link" href="MemberLogout.me" style="font-size: 20px"><i class="fa fa-sign-out"></i>
                        <small>로그아웃</small>
                    </a>
                </div>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="table-hover">
        <div class="col-sm-11 text-center" >

            <br><br><br><br>
            <h2>글 작성</h2>
            <form action="./BoardAddAction.bo" method="post" enctype="multipart/form-data" name="boardform">
                <input type="hidden" name="BOARD_ID" value="<%= id %>">
                <table class="table table-boardered" >
                    <tr>
                        <th style="width: 30%; vertical-align: middle">카테고리</th>
                        <td colspan="3" style="width: 70%">
                            <select name="BOARD_CATEGORY" class="form-control">
                                <option value="옷">옷</option>
                                <option value="가전기기">가전기기</option>
                                <option value="티켓">티켓</option>
                                <option value="생활용품">생활용품</option>
                                <option value="기타">기타</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th style="vertical-align: middle">글 제목</th>
                        <td colspan="3"><input type="text" class="form-control" name="BOARD_TITLE" placeholder="글 제목" required></td>
                    </tr>
                    <tr>
                        <th style="vertical-align: middle">지 역</th>
                        <td>
                            <div class="input-group" style="width: 350px">
                                <select style="font-size: 13pt;" id="area" name="BOARD_AREA1" class="form-control">
                                    <option value="">- 시도 -</option>
                                    <option value="서울특별시">서울특별시</option>
                                    <option value="부산광역시">부산광역시</option>
                                    <option value="대구광역시">대구광역시</option>
                                    <option value="인천광역시">인천광역시</option>
                                    <option value="광주광역시">광주광역시</option>
                                    <option value="대전광역시">대전광역시</option>
                                    <option value="울산광역시">울산광역시</option>
                                    <option value="세종특별자치시">세종특별자치시</option>
                                    <option value="경기도">경기도</option>
                                    <option value="강원도">강원도</option>
                                    <option value="충청북도">충청북도</option>
                                    <option value="충청남도">충청남도</option>
                                    <option value="전라북도">전라북도</option>
                                    <option value="전라남도">전라남도</option>
                                    <option value="경상북도">경상북도</option>
                                    <option value="경상남도">경상남도</option>
                                    <option value="제주특별자치도">제주특별자치도</option>
                                </select>
                                <select  style="font-size: 13pt;" id="city" name="BOARD_AREA2" class="form-control">
                                    <option value="">- 시군구 -</option>
                                </select>
                            </div>
                    </tr>
                    <tr>
                        <th style="vertical-align: middle">상세주소</th>
                        <td colspan="3"><input type="text" class="form-control" name="BOARD_AREA3" placeholder="상세주소" required></td>
                    </tr>
                    <tr>
                        <th style="vertical-align: middle">상 태</th>
                        <td colspan="3">
                            <select name="BOARD_STATE" class="form-control">
                                <option value="거의새것">거의새것</option>
                                <option value="중고">중고</option>
                                <option value="리퍼">리퍼</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th style="vertical-align: middle">가 격</th>
                        <td colspan="3"><input style="width: 200px" min="0" value="0" type="number" class="form-control" name="BOARD_PRICE" onclick="this.select()" required></td>
                    </tr>
                    <tr>
                        <th style="vertical-align: middle">환불 유무</th>
                        <td colspan="3">
                            <label for="radio_1" class="p-1 mb-0">
                                <div class="custom-control custom-control-inline custom-radio pr-3">
                                    <input type="radio" class="custom-control-input" id="radio_1" name="BOARD_REFUND"
                                           value="유" checked required>
                                    <label class="custom-control-label" for="radio_1">유</label>
                                </div>
                            </label>
                            <label for="radio_2" class="p-1 mb-0">
                                <div class="custom-control custom-control-inline custom-radio">
                                    <input type="radio" class="custom-control-input btn-lg" id="radio_2" name="BOARD_REFUND"
                                           value="무" required>
                                    <label class="custom-control-label" for="radio_2">무</label>
                                </div>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <th style="vertical-align: middle">택배비</th>
                        <td colspan="3"><input type="number" min="0" value="0" class="form-control" name="BOARD_DELIVERY" style="width: 200px" onclick="this.select()" required></td>
                    </tr>

                    <tr>
                        <th><div>내 용</div></th>
                        <td colspan="3"><textarea name="BOARD_CONTENT" cols="105" rows="20" placeholder="내용을 입력하세요"></textarea></td>
                    </tr>
                    <tr>
                        <th style="vertical-align: middle"><div style="font-size: 10pt">첨부파일1</div></th>
                        <td colspan="3"><input name="BOARD_FILE1" type="file"/><img id="file_image_1" class="sr-only rounded" src="#" alt="" style="width: 200px; height: 150px; display: block;"></td>
                    </tr>

                    <tr>
                        <th style="vertical-align: middle"><div style="font-size: 10pt" >첨부파일2</div></th>
                        <td colspan="3"><input name="BOARD_FILE2" type="file"/><img id="file_image_2" class="sr-only rounded" src="#" alt="" style="width: 200px; height: 150px; display: block;"></td>
                    </tr>

                    <tr>
                        <th style="vertical-align: middle"><div style="font-size: 10pt">첨부파일3</div></th>
                        <td colspan="3"><input name="BOARD_FILE3" type="file"/><img id="file_image_3" class="sr-only rounded" src="#" alt="" style="width: 200px; height: 150px; display: block;"></td>
                    </tr>

                    <tr>
                        <td colspan="2" align="right">
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

        var area = ["<option>- 시군구 -</option>"
            ,'<option>- 시군구 -</option><option value="11680">강남구</option><option value="11740">강동구</option><option value="11305">강북구</option><option value="11500">강서구</option><option value="11620">관악구</option><option value="11215">광진구</option><option value="11530">구로구</option><option value="11545">금천구</option><option value="11350">노원구</option><option value="11320">도봉구</option><option value="11230">동대문구</option><option value="11590">동작구</option><option value="11440">마포구</option><option value="11410">서대문구</option><option value="11650">서초구</option><option value="11200">성동구</option><option value="11290">성북구</option><option value="11710">송파구</option><option value="11470">양천구</option><option value="11560">영등포구</option><option value="11170">용산구</option><option value="11380">은평구</option><option value="11110">종로구</option><option value="11140">중구</option><option value="11260">중랑구</option>'
            ,'<option>- 시군구 -</option><option value="26440">강서구</option><option value="26410">금정구</option><option value="26710">기장군</option><option value="26290">남구</option><option value="26170">동구</option><option value="26260">동래구</option><option value="26230">부산진구</option><option value="26320">북구</option><option value="26530">사상구</option><option value="26380">사하구</option><option value="26140">서구</option><option value="26500">수영구</option><option value="26470">연제구</option><option value="26200">영도구</option><option value="26110">중구</option><option value="26350">해운대구</option>'
            ,'<option>- 시군구 -</option><option value="27200">남구</option><option value="27290">달서구</option><option value="27710">달성군</option><option value="27140">동구</option><option value="27230">북구</option><option value="27170">서구</option><option value="27260">수성구</option><option value="27110">중구</option>'
            ,'<option>- 시군구 -</option><option value="28710">강화군</option><option value="28245">계양구</option><option value="28200">남동구</option><option value="28140">동구</option><option value="28177">미추홀구</option><option value="28237">부평구</option><option value="28260">서구</option><option value="28185">연수구</option><option value="28720">옹진군</option><option value="28110">중구</option>'
            ,'<option>- 시군구 -</option><option value="29200">광산구</option><option value="29155">남구</option><option value="29110">동구</option><option value="29170">북구</option><option value="29140">서구</option>'
            ,'<option>- 시군구 -</option><option value="30230">대덕구</option><option value="30110">동구</option><option value="30170">서구</option><option value="30200">유성구</option><option value="30140">중구</option>'
            ,'<option>- 시군구 -</option><option value="31140">남구</option><option value="31170">동구</option><option value="31200">북구</option><option value="31710">울주군</option><option value="31110">중구</option>'
            ,'<option>- 시군구 -</option><option value="세종시">세종시</option>'
            ,'<option>- 시군구 -</option><option value="41820">가평군</option><option value="41281">고양시 덕양구</option><option value="41285">고양시 일산동구</option><option value="41287">고양시 일산서구</option><option value="41290">과천시</option><option value="41210">광명시</option><option value="41610">광주시</option><option value="41310">구리시</option><option value="41410">군포시</option><option value="41570">김포시</option><option value="41360">남양주시</option><option value="41250">동두천시</option><option value="41190">부천시</option><option value="41135">성남시 분당구</option><option value="41131">성남시 수정구</option><option value="41133">성남시 중원구</option><option value="41113">수원시 권선구</option><option value="41117">수원시 영통구</option><option value="41111">수원시 장안구</option><option value="41115">수원시 팔달구</option><option value="41390">시흥시</option><option value="41273">안산시 단원구</option><option value="41271">안산시 상록구</option><option value="41550">안성시</option><option value="41173">안양시 동안구</option><option value="41171">안양시 만안구</option><option value="41630">양주시</option><option value="41830">양평군</option><option value="41670">여주시</option><option value="41800">연천군</option><option value="41370">오산시</option><option value="41463">용인시 기흥구</option><option value="41465">용인시 수지구</option><option value="41461">용인시 처인구</option><option value="41430">의왕시</option><option value="41150">의정부시</option><option value="41500">이천시</option><option value="41480">파주시</option><option value="41220">평택시</option><option value="41650">포천시</option><option value="41450">하남시</option><option value="41590">화성시</option>'
            ,'<option>- 시군구 -</option><option value="42150">강릉시</option><option value="42820">고성군</option><option value="42170">동해시</option><option value="42230">삼척시</option><option value="42210">속초시</option><option value="42800">양구군</option><option value="42830">양양군</option><option value="42750">영월군</option><option value="42130">원주시</option><option value="42810">인제군</option><option value="42770">정선군</option><option value="42780">철원군</option><option value="42110">춘천시</option><option value="42190">태백시</option><option value="42760">평창군</option><option value="42720">홍천군</option><option value="42790">화천군</option><option value="42730">횡성군</option>'
            ,'<option>- 시군구 -</option><option value="43760">괴산군</option><option value="43800">단양군</option><option value="43720">보은군</option><option value="43740">영동군</option><option value="43730">옥천군</option><option value="43770">음성군</option><option value="43150">제천시</option><option value="43745">증평군</option><option value="43750">진천군</option><option value="43111">청주시 상당구</option><option value="43112">청주시 서원구</option><option value="43114">청주시 청원구</option><option value="43113">청주시 흥덕구</option><option value="43130">충주시</option>'
            ,'<option>- 시군구 -</option><option value="44250">계룡시</option><option value="44150">공주시</option><option value="44710">금산군</option><option value="44230">논산시</option><option value="44270">당진시</option><option value="44180">보령시</option><option value="44760">부여군</option><option value="44210">서산시</option><option value="44770">서천군</option><option value="44200">아산시</option><option value="44810">예산군</option><option value="44131">천안시 동남구</option><option value="44133">천안시 서북구</option><option value="44790">청양군</option><option value="44825">태안군</option><option value="44800">홍성군</option>'
            ,'<option>- 시군구 -</option><option value="45790">고창군</option><option value="45130">군산시</option><option value="45210">김제시</option><option value="45190">남원시</option><option value="45730">무주군</option><option value="45800">부안군</option><option value="45770">순창군</option><option value="45710">완주군</option><option value="45140">익산시</option><option value="45750">임실군</option><option value="45740">장수군</option><option value="45113">전주시 덕진구</option><option value="45111">전주시 완산구</option><option value="45180">정읍시</option><option value="45720">진안군</option>'
            ,'<option>- 시군구 -</option><option value="46810">강진군</option><option value="46770">고흥군</option><option value="46720">곡성군</option><option value="46230">광양시</option><option value="46730">구례군</option><option value="46170">나주시</option><option value="46710">담양군</option><option value="46110">목포시</option><option value="46840">무안군</option><option value="46780">보성군</option><option value="46150">순천시</option><option value="46910">신안군</option><option value="46130">여수시</option><option value="46870">영광군</option><option value="46830">영암군</option><option value="46890">완도군</option><option value="46880">장성군</option><option value="46800">장흥군</option><option value="46900">진도군</option><option value="46860">함평군</option><option value="46820">해남군</option><option value="46790">화순군</option>'
            ,'<option>- 시군구 -</option><option value="47290">경산시</option><option value="47130">경주시</option><option value="47830">고령군</option><option value="47190">구미시</option><option value="47720">군위군</option><option value="47150">김천시</option><option value="47280">문경시</option><option value="47920">봉화군</option><option value="47250">상주시</option><option value="47840">성주군</option><option value="47170">안동시</option><option value="47770">영덕군</option><option value="47760">영양군</option><option value="47210">영주시</option><option value="47230">영천시</option><option value="47900">예천군</option><option value="47940">울릉군</option><option value="47930">울진군</option><option value="47730">의성군</option><option value="47820">청도군</option><option value="47750">청송군</option><option value="47850">칠곡군</option><option value="47111">포항시 남구</option><option value="47113">포항시 북구</option>'
            ,'<option>- 시군구 -</option><option value="48310">거제시</option><option value="48880">거창군</option><option value="48820">고성군</option><option value="48250">김해시</option><option value="48840">남해군</option><option value="48270">밀양시</option><option value="48240">사천시</option><option value="48860">산청군</option><option value="48330">양산시</option><option value="48720">의령군</option><option value="48170">진주시</option><option value="48740">창녕군</option><option value="48125">창원시 마산합포구</option><option value="48127">창원시 마산회원구</option><option value="48123">창원시 성산구</option><option value="48121">창원시 의창구</option><option value="48129">창원시 진해구</option><option value="48220">통영시</option><option value="48850">하동군</option><option value="48730">함안군</option><option value="48870">함양군</option><option value="48890">합천군</option>'
            ,'<option>- 시군구 -</option><option value="50130">서귀포시</option><option value="50110">제주시</option>'];

        $("#area").change(function () {
            var s_index = ($("#area option").index($("#area option:selected")));
            var childText ="";
            $("#city").children().remove().addBack().append(area[s_index]);
            $("#city option").each(function () {
                childText = $(this).text();
                // console.log(childText);
                $(this).val(childText);
            });
        });
    });

    function readURL(input) {
        if (input.files && input.files[0]) { /* 인풋박스 파일인지, 파일의 프로퍼티가 있는지 검사 */
            if (!input.files[0].type.match("image.*")) { /* 타입이 이미지 일 때 */
                alert("이미지 확장자만 가능합니다.");
                var i = input.name.substr(-1); /* 인풋박스의 이름을 불러오고 뒷글자를 따옴 */
                $("input:file").eq(i-1).val(""); /* 해당하는 인덱스의 파일 인풋박스의 밸류를 제거 */
                return ;
            }
            var reader = new FileReader(); /* 파일리더 클래스 생성 */
            reader.onload = function(e) { /* 파일이 로드되면 실행한다? */
                console.log(input);
                console.log(input.name.substr(-1));
                var i = input.name.substr(-1)
               $(":file").eq(i-1).next().attr("src", e.target.result).removeClass("sr-only");
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    $(":file").change(function () {
        readURL(this);
    });

    function addboard() {
        var title = $("input[name=BOARD_TITLE]");
        var area = ($("#area option").index($("#area option:selected")));
        var city = ($("#city option").index($("#city option:selected")));
        if (title.val() == "") {
            alert("제목을 입력해주세요!");
        } else if(area == 0) {
            alert("지역을 선택해주세요!");
        }else if(city == 0) {
            alert("도시를 선택해주세요!");
        }else {
            $("form").submit();
        }
    };
</script>
</body>
</html>