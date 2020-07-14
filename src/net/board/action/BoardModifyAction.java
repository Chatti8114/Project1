package net.board.action;

import java.io.PrintWriter;
import java.util.Enumeration;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardModifyAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.setCharacterEncoding("utf-8");
        ActionForward forward = new ActionForward();
        boolean result = false;
        BoardDAO boarddao = new BoardDAO();
        BoardBean boarddata = new BoardBean();
        String realFolder = "";
        String saveFolder = "/boardupload";

        int fileSize = 10*1024*1024; // 10MB

        //realFolder = request.getRealPath(saveFolder);

        realFolder = request.getSession().getServletContext().getRealPath(saveFolder);

        try {
            MultipartRequest multi = null;
            multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());

            int num = Integer.parseInt(multi.getParameter("BOARD_NUM"));
            boolean usercheck = boarddao.isBoardWriter(num, multi.getParameter("BOARD_ID"));
            if (usercheck == false) {
                response.setContentType("text/html;charset=utf-8");
                PrintWriter out  = response.getWriter();
                out.print("<script>");
                out.print("alert('수정할 권한이 없습니다');");
                out.print("location.href='./BoardList.bo';");
                out.print("</script>");
                out.close();
                return null;
            }

            System.out.println("파일명 :: " + multi.getParameter("BOARD_FILE1"));

            String area1 = multi.getParameter("BOARD_AREA1");
            String area2 = multi.getParameter("BOARD_AREA2");
            String area3 = multi.getParameter("BOARD_AREA3");
            String area = area1 + " " + area2 + " " + area3;

            System.out.println("실행 1");
            boarddata.setBOARD_NUM(num);
            boarddata.setBOARD_ID(multi.getParameter("BOARD_ID"));
            boarddata.setBOARD_CATEGORY(multi.getParameter("BOARD_CATEGORY"));
            boarddata.setBOARD_TITLE(multi.getParameter("BOARD_TITLE"));
            boarddata.setBOARD_AREA(area);
            boarddata.setBOARD_STATE(multi.getParameter("BOARD_STATE"));
            boarddata.setBOARD_PRICE(multi.getParameter("BOARD_PRICE") == null ? "0" : multi.getParameter("BOARD_PRICE"));
            boarddata.setBOARD_REFUND(multi.getParameter("BOARD_REFUND"));
            boarddata.setBOARD_DELIVERY(multi.getParameter("BOARD_DELIVERY") == null ? "0" : multi.getParameter("BOARD_DELIVERY"));
            boarddata.setBOARD_CONTENT(multi.getParameter("BOARD_CONTENT"));
            System.out.println("실행2");
            Enumeration formNames = multi.getFileNames();
            System.out.println(formNames.hasMoreElements());

            //input 태그의 속성이 file인 태그의 name 속성값: 파라미터이름

            String formName3 = (String) formNames.nextElement();
//               //서버에 저장된 파일이름
            String BOARD_FILE3 = multi.getFilesystemName(formName3);
//            //전송전 원래의 파일이름
//        String BOARD_OG_FILE = multi.getOriginalFileName(formName);
//
            String formName2 = (String) formNames.nextElement();
            String BOARD_FILE2 = multi.getFilesystemName(formName2);
//        String BOARD_OG_FILE = multi.getOriginalFileName(formName);

            String formName1 = (String) formNames.nextElement();
            String BOARD_FILE1 = multi.getFilesystemName(formName1);
//        String BOARD_OG_FILE = multi.getOriginalFileName(formName);


            //전송된 파일의 내용타입
//          String type = multi.getContentType(formName);
//          String userName="";
            String mul1 = multi.getParameter("BOARD_FILE1_r") != null ? multi.getParameter("BOARD_FILE1_r") : "";
            String mul2 = multi.getParameter("BOARD_FILE2_r") != null ? multi.getParameter("BOARD_FILE2_r") : "";
            String mul3 = multi.getParameter("BOARD_FILE3_r") != null ? multi.getParameter("BOARD_FILE3_r") : "";

            if (mul1.equals("")) {
                System.out.println("현재 히든값은 널값입니다");
                boarddata.setBOARD_FILE1(BOARD_FILE1);
            } else {
                boarddata.setBOARD_FILE1(mul1);
                ////          boarddata.setBOARD_OG_FILE(BOARD_OG_FILE);
            }

            if (mul2.equals("")) {
                System.out.println("현재 히든값은 널값입니다");
                boarddata.setBOARD_FILE2(BOARD_FILE2);
            } else {
                boarddata.setBOARD_FILE2(mul2);
                ////          boarddata.setBOARD_OG_FILE(BOARD_OG_FILE);
            }

            if (mul3.equals("")) {
                System.out.println("현재 히든값은 널값입니다");
                boarddata.setBOARD_FILE3(BOARD_FILE3);
            } else {
                boarddata.setBOARD_FILE3(mul3);
                ////          boarddata.setBOARD_OG_FILE(BOARD_OG_FILE);
            }
            result = boarddao.boardModify(boarddata);

            if (result == false) {
                System.out.println("수정 실패");
                return null;
            }
            System.out.println("수정 완료");
            forward.setRedirect(true);
            forward.setPath("./BoardDetailAction.bo?num=" + num);
            return forward;
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}