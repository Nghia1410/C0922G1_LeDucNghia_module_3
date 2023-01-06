package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private final String SELECT_ALL = "select*from users";
    private final String INSERT_INTO = "insert into users(name,email,country) values(?,?,?)";
    private final String SEARCH_BY_COUNTRY = "select*from users where country like ?;";
    private final String DELETE_USER = "delete from users where id = ?;";
    private final String SQL_SAFE_UPDATES = "set sql_safe_updates = 0;";
    private final String FOREIGN_KEY_CHECKS = "set foreign_key_checks = 0;";

    @Override
    public List<User> display() {
        List<User> users = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement=connection.prepareCall(SELECT_ALL);
            ResultSet resultSet=callableStatement.executeQuery();
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
    public boolean remove(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
           CallableStatement callableStatement=connection.prepareCall(SQL_SAFE_UPDATES);
            callableStatement.executeUpdate();
            CallableStatement callableStatement1=connection.prepareCall(FOREIGN_KEY_CHECKS);
            callableStatement1.executeUpdate();
            CallableStatement callableStatement2=connection.prepareCall(DELETE_USER);
            callableStatement2.setInt(1, id);
            return callableStatement2.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<User> findByCountry(String countries) {
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

    @Override
    public User getUserById(int id) {
        return null;
    }

    @Override
    public void insertUserStore(User user) throws SQLException {

    }
}
