package repository;

import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private static List<User> users = new ArrayList<>();

    static {
        users.add(new User("nghĩa", "nghia1410@gmail.com", "đà nẵng"));
        users.add(new User("tài", "tai1410@gmail.com", "huế"));
        users.add(new User("định", "dinh1410@gmail.com", "quảng nam"));
    }

    @Override
    public List<User> display() {
        return users;
    }

    @Override
    public void add(User user) {

    }

    @Override
    public void remove(User user) {

    }
}
