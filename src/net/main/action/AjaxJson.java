package net.main.action;

import net.board.action.Action;
import net.board.action.ActionForward;
import net.board.db.BoardBean;
import net.board.db.BoardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "*.main")
public class AjaxJson extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String RequestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = RequestURI.substring(contextPath.length());
        ActionForward forward = null;
        Action action = null;

        System.out.println(command);

        if (command.equals("/newBoard.main")) {
            action = new NewBoardAction(); 

            try {
                action.execute(request, response); 
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else if (command.equals("/newCloth.main")) {
            action = new ClothAciton();

            try {
                action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/Appliances.main")) {
            action = new AppliancesAciton();

            try {
                action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/Ticket.main")) {
            action = new TicketAction();

            try {
                action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/HouseholdGoods.main")) {
            action = new HouseholdGoodsAction();

            try {
                action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (command.equals("/etc.main")) {
            action = new EtcAciton();

            try {
                action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request,response);

//        response.setContentType("text/html;charset=UTF-8");
//
//        BoardBean board = new BoardBean();
//        BoardDAO boarddao = new BoardDAO();
//        String result = "";
//        System.out.println("�룷�뒪�듃 �꽦怨�");
//        result = boarddao.getNewBoard();
//        if(result!=null){
//            System.out.println("�궡�슜�쟾�떖 �꽦怨�!");
//            PrintWriter out;
//            try {
//                out = response.getWriter();
//                out.print(result);
//                out.flush();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        } else {
//            System.out.println("�떎�뙣�븯���뒿�땲�떎");
//        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request,response); /* get �쟾�넚�쑝濡� 蹂대궡吏��뒗 寃쎌슦 �떎�뻾�맖 (利� 二쇱냼李쎈쭔 李띿쓣 寃쎌슦 �뱾�뼱��吏�)*/
    }
}
