package net.member.action;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class MemberInfo implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ActionForward forward = new ActionForward();

        HttpSession session = request.getSession();

        MemberDAO memberdao = new MemberDAO();
        MemberBean memberdata = new MemberBean();

        String id = (String) session.getAttribute("id");

        if (id == null) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print("<script>");
            out.print("alert('현재 로그인중이 아닙니다!');");
            out.print("history.back();");
            out.print("</script>");
            out.close();
            return null;
        }
        memberdata = memberdao.memberInfo(id);

        if (memberdata == null) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print("<script>");
            out.print("alert('오류가 발생하였습니다');");
            out.print("history.back();");
            out.print("</script>");
            out.close();
            return null;
        }
        request.setAttribute("memberdata",memberdata);
        forward.setRedirect(false);
        forward.setPath("member_view.jsp");
        return forward;
    }
}
