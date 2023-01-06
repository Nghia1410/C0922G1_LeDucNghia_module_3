package repository;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    List<User> display();

    boolean create(User user);

    void remove(User user);
}
