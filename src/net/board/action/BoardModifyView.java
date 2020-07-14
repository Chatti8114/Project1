package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardModifyView implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ActionForward forward = new ActionForward();
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        if (id==null) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print("<script>");
            out.print("alert('현재 로그인 중이 아닙니다');");
            out.print("history.back();");
            out.print("</script>");
            return null;
        }

        Boolean usercheck = false;

        BoardDAO boarddao = new BoardDAO();
        BoardBean boarddata = new BoardBean();


        int num = Integer.parseInt(request.getParameter("num"));
//        System.out.println(num);
//        System.out.println(id);
        usercheck =  boarddao.isBoardWriter(num, id);
        boarddata = boarddao.getDetail(num);

        if (usercheck == false) {
        	response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
            out.print("<script>");
            out.print("alert('수정할 권한이 없습니다.');");
            out.print("location.href='./BoardList.bo';");
            out.print("</script>");
            return null;
        } else if (boarddata==null) {
        	response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
            out.print("<script>");
            out.print("alert('해당글이 없습니다.');");
            out.print("location.href='./BoardList.bo';");
            out.print("</script>");
            System.out.println("수정상세보기 실패");
            return null;
        }
        System.out.println("(수정) 상세보기 성공");
        request.setAttribute("boarddata",boarddata);
        forward.setRedirect(false);
        forward.setPath("qna_board_modify.jsp");
        return forward;
    }
}
