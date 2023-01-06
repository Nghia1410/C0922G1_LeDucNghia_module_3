package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> display();

    boolean create(User user);

    boolean remove(int id);

    List<User>findByCountry(String countries);

    String addUserTransaction(User user);
}
