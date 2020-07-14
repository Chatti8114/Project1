package net.member.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class MemberListAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = new ActionForward();
        MemberDAO memberdao = new MemberDAO();
        HttpSession session = request.getSession();
        List memberlist = new ArrayList<>();
        String role = (String) session.getAttribute("role");

        if (role ==null){
            forward.setRedirect(true);
            forward.setPath("./MemberLogin.me");
            return forward;
        } else if (!role.equals("1")) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('관리자가 아닙니다');");
            out.println("location.href='./BoardList.bo';");
            out.println("</script>");
            out.close();
            return null;
        }
        memberlist= memberdao.goMemberList();

        if (memberlist == null) {
            System.out.println("관리자 목록 보기 실패");
            return null;
        }

        request.setAttribute("memberlist",memberlist);
        forward.setRedirect(false);
        forward.setPath("membership_management.jsp");
        return forward;

    }
}
