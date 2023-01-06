package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    List<User> display();

    boolean create(User user);

   boolean delete(int id);

   List<User>sortByName();

    List<User> find(String country);
}
