package net.board.action;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;
import org.apache.bcel.generic.IFNULL;

public class BoardAddAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        BoardDAO boarddao = new BoardDAO();
        BoardBean boarddata = new BoardBean();
        ActionForward forward = new ActionForward();

        String realFolder = "";
        String saveFolder = "/boardupload";

        int fileSize = 10*1024*1024; // 10MB

        //realFolder = request.getRealPath(saveFolder);

        realFolder = request.getSession().getServletContext().getRealPath(saveFolder);
        boolean result = false;

        try {
            MultipartRequest multi = null;
            multi = new MultipartRequest(request,realFolder,fileSize,"UTF-8", new DefaultFileRenamePolicy());


            String area1 = multi.getParameter("BOARD_AREA1");
            String area2 = multi.getParameter("BOARD_AREA2");
            String area3 = multi.getParameter("BOARD_AREA3");
            String area = area1 + " " + area2 + " " + area3;


            boarddata.setBOARD_ID(multi.getParameter("BOARD_ID"));
            boarddata.setBOARD_CATEGORY(multi.getParameter("BOARD_CATEGORY"));
            boarddata.setBOARD_TITLE(multi.getParameter("BOARD_TITLE"));
            boarddata.setBOARD_AREA(area);
            boarddata.setBOARD_STATE(multi.getParameter("BOARD_STATE"));
            boarddata.setBOARD_PRICE(multi.getParameter("BOARD_PRICE") == null ? "0" : multi.getParameter("BOARD_PRICE") );
            boarddata.setBOARD_REFUND(multi.getParameter("BOARD_REFUND"));
            boarddata.setBOARD_DELIVERY(multi.getParameter("BOARD_DELIVERY") == null ? "0" : multi.getParameter("BOARD_DELIVERY"));
            boarddata.setBOARD_CONTENT(multi.getParameter("BOARD_CONTENT"));

          Enumeration formNames = multi.getFileNames();
          //input 태그의 속성이 file인 태그의 name 속성값: 파라미터이름

          String formName3 = (String)formNames.nextElement();
          //서버에 저장된 파일이름
          String BOARD_FILE3 = multi.getFilesystemName(formName3);
          //전송전 원래의 파일이름
          String BOARD_OG_FILE3 = multi.getOriginalFileName(formName3);

          String formName2 = (String)formNames.nextElement();
          String BOARD_FILE2 = multi.getFilesystemName(formName2);
          String BOARD_OG_FILE2 = multi.getOriginalFileName(formName2);

          String formName1 = (String)formNames.nextElement();
          String BOARD_FILE1 = multi.getFilesystemName(formName1);
          String BOARD_OG_FILE1 = multi.getOriginalFileName(formName1);

          //전송된 파일의 내용타입
//          String type = multi.getContentType(formName);
//          String userName="";
          
          boarddata.setBOARD_FILE1(BOARD_FILE1);
          boarddata.setBOARD_OG_FILE1(BOARD_OG_FILE1);
          boarddata.setBOARD_FILE2(BOARD_FILE2);
          boarddata.setBOARD_OG_FILE2(BOARD_OG_FILE2);
          boarddata.setBOARD_FILE3(BOARD_FILE3);
          boarddata.setBOARD_OG_FILE3(BOARD_OG_FILE3);

            result = boarddao.boardInsert(boarddata);

            if (result == false) {
                System.out.println("게시판 등록 실패");
                return null;
            }

            System.out.println("게시판 등록 성공");
            forward.setRedirect(true);
            forward.setPath("./BoardList.bo");
            return forward;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}