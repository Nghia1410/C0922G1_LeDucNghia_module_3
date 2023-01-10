package controller;

import service.customerService.ICustomerService;
import service.customerService.ICustomerTypeService;
import service.customerService.impl.CustomerService;
import service.customerService.impl.CustomerTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {

    ICustomerService customerService = new CustomerService();
    ICustomerTypeService customerTypeService = new CustomerTypeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {

            default:
                displayListCustomer(request, response);
        }
    }

    private void displayListCustomer(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("customerList", customerService.displayCustomer());
        request.setAttribute("customerTypeList", customerTypeService.findAllCustomerType());
        try {
            request.getRequestDispatcher("/view/customer/listCustomer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
