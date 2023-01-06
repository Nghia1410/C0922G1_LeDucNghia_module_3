package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> display();

    boolean create(User user);

    void remove(User user);
}
