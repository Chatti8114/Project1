package net.member.action;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class MemberModifyAction implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{

        request.setCharacterEncoding("utf-8");
        ActionForward forward = new ActionForward();
        boolean result= false;

        String id = request.getParameter("MEMBER_ID");
        System.out.println("멤버 아이디 값" + id);

        MemberDAO memberdao = new MemberDAO();
        MemberBean memberdata = new MemberBean();
        String pw = net.member.base64.base64.encrypt256(request.getParameter("MEMBER_PW"),"fiveTeam");
        try {

            memberdata.setMEMBER_ID(id);
            memberdata.setMEMBER_PW(pw);
            memberdata.setMEMBER_NAME(request.getParameter("MEMBER_NAME"));
            memberdata.setMEMBER_GENDER(request.getParameter("MEMBER_GENDER"));
            memberdata.setMEMBER_AGE(Integer.parseInt(request.getParameter("MEMBER_AGE")));
            memberdata.setMEMBER_ADDRESS(request.getParameter("MEMBER_ADDRESS"));
            memberdata.setMEMBER_PHONE(request.getParameter("MEMBER_PHONE"));
            memberdata.setMEMBER_EMAIL(request.getParameter("MEMBER_EMAIL"));
            memberdata.setMEMBER_INTEREST(request.getParameter("MEMBER_INTEREST"));


            result = memberdao.membermodify(memberdata);

            if (!result) {
                response.setContentType("text/html;charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('수정에 실패하였습니다!');");
                out.println("history.back();");
                out.println("</script>");
                out.close();
                System.out.println("수정 실패");
                return null;
            }
            System.out.println("수정 완료");
            forward.setRedirect(true);
            forward.setPath("./MemberInfo.me");
            return forward;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}