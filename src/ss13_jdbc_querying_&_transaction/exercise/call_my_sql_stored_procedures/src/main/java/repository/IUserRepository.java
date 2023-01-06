package repository;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    List<User> display();

    boolean create(User user);

   boolean remove(int id);

    List<User>findByCountry(String country);

    User getUserById(int id);

    void insertUserStore(User user) throws SQLException;

}
