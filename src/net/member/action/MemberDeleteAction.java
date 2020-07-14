package net.member.action;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class MemberDeleteAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	request.setCharacterEncoding("UTF-8");
        ActionForward forward = new ActionForward();
        HttpSession session = request.getSession();
        MemberDAO memberdao = new MemberDAO();
        boolean result = false;
        String id = (String) session.getAttribute("id");

        if (id == null) {
            forward.setRedirect(true);
            forward.setPath("./MemberLogin.me"); /* �븘�씠�뵒 �꽭�뀡�씠 �뾾�쓣 �븧 濡쒓렇�씤李쎌쑝濡� �씠�룞 */
            return forward;
        }

        String deleteId = request.getParameter("id");
        result = memberdao.deleteMember(deleteId);

        if (!result) {
            System.out.println("회원삭제 실패");
            return null;
        }
        session.invalidate();
        forward.setRedirect(true);
        forward.setPath("./");
        return forward;
    }
}