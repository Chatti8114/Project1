package net.member.action;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberModifyView implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
        request.setCharacterEncoding("utf-8");

        ActionForward forward = new ActionForward();

        MemberDAO memberdao = new MemberDAO();
        MemberBean memberdata = new MemberBean();

        String id = request.getParameter("id");
        memberdata = memberdao.memberInfo(id);

        if(memberdata == null){
            System.out.println("�󼼺��� ����");
            return null;

        }
        System.out.println("�󼼺��� ����");
        request.setAttribute("memberdata",memberdata);
        forward.setRedirect(false);
        forward.setPath("./member_modify.jsp");
        return forward;
    }
}