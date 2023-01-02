import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "DisplayCustomerServlet", urlPatterns = "/DisplayCustomer")
public class DisplayCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<DisplayCustomer> customerList = new ArrayList<>();
        customerList.add(new DisplayCustomer("Nghĩa", "2003-10-14", "Đà Nẵng", "https://scontent.fdad3-4.fna.fbcdn.net/v/t39.30808-6/313196740_3274695772848165_8394814888456783950_n.jpg?stp=cp6_dst-jpg&_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=9pZeabadiCAAX8FzC7t&tn=PWmemPm1cGH57fik&_nc_ht=scontent.fdad3-4.fna&oh=00_AfCNM1osfqKbtKeUwF9HHG5Fp3KpXDwbeBnhsVANdEAUzA&oe=63B76C47"));
        customerList.add(new DisplayCustomer("Tài", "2004-02-04", "Huế", "https://scontent.fdad3-1.fna.fbcdn.net/v/t39.30808-6/259163799_412365223773741_8849704828353689706_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=174925&_nc_ohc=uM9MNTqPTZ0AX_Yq4wC&_nc_ht=scontent.fdad3-1.fna&oh=00_AfA29Dmz1eUtDO40uCc2-Mvfzne-0RJXK-XTrUBgbT0nXA&oe=63B8349A"));
        customerList.add(new DisplayCustomer("Định", "1999-03-05", "Quảng Nam", "https://scontent.fdad3-6.fna.fbcdn.net/v/t39.30808-6/283147485_709416146963816_915404794733567384_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=e3f864&_nc_ohc=vny7AT5YIpQAX-7UDoA&tn=PWmemPm1cGH57fik&_nc_ht=scontent.fdad3-6.fna&oh=00_AfA4VPCxy2X48_mT0ktu0mJJJOXHsLOWX1gVGPMK5irPfg&oe=63B8ED74"));
        customerList.add(new DisplayCustomer("Nga", "2004-06-19", "Hà Tĩnh", "https://scontent.fdad3-6.fna.fbcdn.net/v/t39.30808-6/321562936_380001704349030_2128006088543163200_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=xvSx81O0lSsAX-KTfQ6&_nc_oc=AQlJ9inLY4rv1HDL_nHd0xgxrUDSToTKWm_RnDRxCshW3JBtQOl2pWd7KKWHIb1TlBg&_nc_ht=scontent.fdad3-6.fna&oh=00_AfBhn-QUfIY1uUELg741aqM6QEoskIVWeu3T-VdjxCarNA&oe=63B8B0C4"));
        request.setAttribute("customerList", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list_customer.jsp");
        requestDispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
