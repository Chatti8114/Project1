package net.main.action;

import net.board.action.ActionForward;
import net.board.db.BoardDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class EtcAciton implements net.board.action.Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");

        BoardDAO boarddao = new BoardDAO();
        String result = "";
        System.out.println("����Ʈ ����");
        result = boarddao.getEtc();
        if(result!=null){
            System.out.println("�������� ����!");
            PrintWriter out;
            try {
                out = response.getWriter();
                out.print(result);
                out.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("�����Ͽ����ϴ�");
        }
        return null;
    }
}
