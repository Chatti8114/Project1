package net.member.action;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class MemberLoginAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = new ActionForward();
        HttpSession session = request.getSession();
        request.setCharacterEncoding("utf-8");
        MemberDAO memberDAO = new MemberDAO();
        MemberBean member = new MemberBean();

        int result = -1;
        int result2 = 0;
        int result3 = 0;

        member.setMEMBER_ID(request.getParameter("MEMBER_ID"));
        member.setMEMBER_PW(request.getParameter("MEMBER_PW"));
        result = memberDAO.isMember(member);

        if (result == 0) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('비밀번호가 일치하지 않습니다.');");
            out.println("location.href='./MemberLogin.me';");
            out.println("</script>");
            out.close();
            return null;
        } else if (result == -1) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('아이디가 존재하지 않습니다.');");
            out.println("location.href='./MemberLogin.me';");
            out.println("</script>");
            out.close();
            return null;
        } else if(result == -2) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('오류가 발생하였습니다!');");
            out.println("location.href='./MemberLogin.me';");
            out.println("</script>");
            out.close();
            return null;
        }
        result3 = memberDAO.recentDate(member);

        if (result3 != 1) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('로그인 오류발생');");
            out.println("location.href='./MemberLogin.me';");
            out.println("</script>");
            out.close();
            return null;
        }

        // 濡쒓렇�씤 �꽦怨�
        result2 = memberDAO.isAdmin(member);

        if (result2 == 1) {
            session.setAttribute("role", "1");
        }

        if(result == 1) session.setAttribute("id", member.getMEMBER_ID());

        System.out.println("로그인 성공" + member.getMEMBER_ID());
        forward.setRedirect(true);
        forward.setPath("./");
        return forward;
    }
}
