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

    @Override
    public List<User> display() {
        List<User> users = new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                String email=resultSet.getString("email");
                String country=resultSet.getString("country");
                User user=new User(id,name,email,country);
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
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement  preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            return preparedStatement.executeUpdate() >1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return  false;
    }

    @Override
    public void remove(User user) {

    }
}
