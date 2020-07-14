package net.board.action;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class BoardSoldOutAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();

        ActionForward forward = new ActionForward();

        BoardDAO boarddao = new BoardDAO();
        BoardBean boarddata = new BoardBean();
        Boolean result = false;

        int num = Integer.parseInt(request.getParameter("num"));
        String id = (String) session.getAttribute("id");


        result = boarddao.isBoardWriter(num,id);
        if (!result) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print("<script>");
            out.print("alert('해당 글의 작성자가 아닙니다!');");
            out.print("history.back();");
            out.print("</script>");
            return null;
        }

        result = boarddao.boardSoldOut(num);

        if (!result) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print("<script>");
            out.print("alert('업데이트에 실패하였습니다');");
            out.print("history.back();");
            out.print("</script>");
            return null;
        }

        forward.setRedirect(true);
        forward.setPath("BoardList.bo");
        return forward;
    }
}
