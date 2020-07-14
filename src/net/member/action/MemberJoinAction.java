package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

import java.io.PrintWriter;

public class MemberJoinAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.setCharacterEncoding("utf-8");
        ActionForward forward = new ActionForward();
        MemberDAO memberdao = new MemberDAO();
        MemberBean member = new MemberBean();

        int result = 0;

        member.setMEMBER_ID(request.getParameter("MEMBER_ID"));
        member.setMEMBER_PW(request.getParameter("MEMBER_PW"));
        member.setMEMBER_NAME(request.getParameter("MEMBER_NAME"));
        member.setMEMBER_GENDER(request.getParameter("MEMBER_GENDER"));
        member.setMEMBER_AGE(Integer.parseInt(request.getParameter("MEMBER_AGE")));
        member.setMEMBER_ADDRESS(request.getParameter("MEMBER_ADDRESS"));
        member.setMEMBER_PHONE(request.getParameter("MEMBER_PHONE"));
        member.setMEMBER_EMAIL(request.getParameter("MEMBER_EMAIL"));
        member.setMEMBER_INTEREST(request.getParameter("MEMBER_INTEREST"));


        result = memberdao.joinMember(member);  /* memberBean 으로 한 번에 여러개의 데이터를 전달함 */

        if (result == -1) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out  = response.getWriter();
            out.print("<script>");
            out.print("alert('회원가입에 실패하였습니다');");
            out.print("history.back()");
            out.print("</script>");
            out.close();

        }
        System.out.println("회원가입 성공");

        response.setContentType("text/html;charset=utf-8");
        PrintWriter out  = response.getWriter();
        out.print("<script>");
        out.print("alert('가입에 성공하였습니다!');");
        out.print("location.href='./MemberLogin.me';");
        out.print("</script>");
        out.close();

        return forward;
    }
}
