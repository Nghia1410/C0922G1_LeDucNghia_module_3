package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private final String SELECT_ALL = "select*from users";
    private final String INSERT_INTO = "insert into users(name,email,country) values(?,?,?)";
    private final String SEARCH_BY_COUNTRY = "select*from users where country like ?;";
    private final String DELETE_USER = "delete from users where id = ?;";
    private final String SQL_SAFE_UPDATES = "set sql_safe_updates = 0;";
    private final String FOREIGN_KEY_CHECKS = "set foreign_key_checks = 0;";
    private final String SORT_BY_NAME = "select *from users order by name;";

    @Override
    public List<User> display() {
        List<User> users = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                users.add(user);
            }
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return users;

    }

    @Override
    public boolean create(User user) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            return preparedStatement.executeUpdate() > 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps1 = connection.prepareStatement(SQL_SAFE_UPDATES);
            ps1.executeUpdate();
            PreparedStatement ps2 = connection.prepareStatement(FOREIGN_KEY_CHECKS);
            ps2.executeUpdate();
            PreparedStatement ps = connection.prepareStatement(DELETE_USER);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<User> sortByName() {
        Connection connection = BaseRepository.getConnectDB();
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SORT_BY_NAME);
            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country1 = resultSet.getString("country");
                userList.add(new User(id, name, email, country1));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return userList;
    }

    @Override
    public List<User> find(String countries) {
        Connection connection = BaseRepository.getConnectDB();
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_BY_COUNTRY);
            preparedStatement.setString(1, "%" + countries + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country1 = resultSet.getString("country");
                userList.add(new User(id, name, email, country1));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }
}
