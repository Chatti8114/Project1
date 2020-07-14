package net.board.action;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;
import net.board.db.BoardNotifyBean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class BoardNotifyAciton implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        ActionForward forward = new ActionForward();
        BoardNotifyBean boarddata = new BoardNotifyBean();
        BoardDAO boarddao = new BoardDAO();

        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");

        int result = 0;
        System.out.println("NotifyAciton 자바 실행");
        if (id==null) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('로그인이 필요합니다!');");
            out.println("location.href='MemberLogin.me';");
            out.println("</script>");
            out.close();
            return null;
        }

        boarddata.setNB_ID(id);
        boarddata.setNB_TARGET_ID(request.getParameter("BOARD_ID"));
        boarddata.setNB_CONTENT(request.getParameter("NB_CONTENT"));
        boarddata.setNB_RE_REF(Integer.parseInt(request.getParameter("BOARD_NUM")));
        String[] a = request.getParameterValues("NB_REASON");
        String reason = "";

        for (int i = 0; i < a.length; i++) {
            reason += a[i]+";";
        }
        boarddata.setNB_REASON(reason);

        result = boarddao.notifyInsert(boarddata);

        if (result == 1) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print(result);
//            out.println("<script>");
//            out.println("alert('�떊怨좉� �젒�닔�릺�뿀�뒿�땲�떎');");
//            out.println("history.back();");
//            out.println("</script>");
            out.close();
            return null;
        } else {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print(result);
//            out.println("<script>");
//            out.println("alert('�삤瑜섍� 諛쒖깮�븯���뒿�땲�떎');");
//            out.println("history.back();");
//            out.println("</script>");
            out.close();
        }
        return null;

    }
}
