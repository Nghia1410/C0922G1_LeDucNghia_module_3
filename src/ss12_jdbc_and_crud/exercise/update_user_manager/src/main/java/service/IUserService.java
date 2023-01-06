package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> display();

    boolean create(User user);

    boolean delete(int id);

    List<User>find(String countries);

    List<User>sortByName();
}
