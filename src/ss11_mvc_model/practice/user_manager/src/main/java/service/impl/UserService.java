package service;

import model.User;
import repository.IUserRepository;
import repository.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    IUserRepository userRepository = new UserRepository();

    @Override
    public List<User> display() {
        return userRepository.display();
    }

    @Override
    public void add(User user) {

    }

    @Override
    public void remove(User user) {

    }
}
