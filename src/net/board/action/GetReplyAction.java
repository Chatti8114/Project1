package net.board.action;

import net.board.db.BoardDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class GetReplyAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = new ActionForward();

        BoardDAO boarddao = new BoardDAO();
        String result = "";

        int cb_num = Integer.parseInt(request.getParameter("cb_num"));
        int b_num = Integer.parseInt(request.getParameter("b_num"));

        result = boarddao.getReply(cb_num,b_num);
        if (result == null) {
            System.out.println("실패");
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print("[{\\\"없음\\\":\\\"없음\\\"}]");
            out.close();
        } else {
            System.out.println("성공");
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print(result);
            out.close();
        }
        return null;
    }
}
