package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    List<User> display();

    boolean create(User user);

   boolean remove(int id);

    List<User>findByCountry(String country);

    String addUserTransaction(User user);
}
