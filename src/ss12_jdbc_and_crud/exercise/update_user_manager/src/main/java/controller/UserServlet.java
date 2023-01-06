package controller;

import model.User;
import service.IUserService;
import service.impl.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    IUserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createUser(request, response);
            case "find":
                findByCountry(request, response);
            case "delete":
                deleteUsers(request, response);
            case "sortByName":
                sortByNameUser(request, response);
            default:
                break;
        }
    }

    private void sortByNameUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.sortByName();
        request.setAttribute("userList", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        showList(request, response);
    }

    private void deleteUsers(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean check = userService.delete(id);
        String mess = "xóa thành công";
        if (!check) {
            mess = "xóa không thành công";
        }
        request.setAttribute("mess", mess);
        showList(request, response);
    }

    private void findByCountry(HttpServletRequest request, HttpServletResponse response) {
        String country = request.getParameter("country");
        List<User> userList = userService.find(country);
        request.setAttribute("userList", userList);
        try {
            request.getRequestDispatcher("view/find.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        userService.create(new User(name, email, country));
        showList(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request, response);
            default:
                showList(request, response);
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("users", userService.display());
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
