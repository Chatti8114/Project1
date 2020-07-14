package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardDAO;
import net.board.db.BoardReplyBean;

import java.io.PrintWriter;

public class BoardReplyAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        ActionForward forward = new ActionForward();
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");

        BoardDAO boarddao = new BoardDAO();
        BoardReplyBean boarddata = new BoardReplyBean();
        int result = 0;

        boarddata.setCB_ID(id);
        boarddata.setCB_CONTENT(request.getParameter("CB_CONTENT"));
        boarddata.setCB_RE_REF(Integer.parseInt(request.getParameter("CB_REF")));


        System.out.println(id);
        System.out.println(request.getParameter("CB_CONTENT"));
        System.out.println(Integer.parseInt(request.getParameter("CB_REF")));
        System.out.println("------------------------------------------------");

        result = boarddao.boardReply(boarddata);
        System.out.println("4444--------------------------\n" + result);
        if (result != 1) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print(result);

            out.close();
            return null;
        } else {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print(result);
            out.close();
        }
//            response.setContentType("text/html;charset=utf-8");
//            PrintWriter out = response.getWriter();
//            out.print("<script>");
//            out.print("alert('');");
//            out.print("</script>");
//            out.flush();
        return null;
    }
}
