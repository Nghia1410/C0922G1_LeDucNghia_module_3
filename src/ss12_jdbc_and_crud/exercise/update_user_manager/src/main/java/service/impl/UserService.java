package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    IUserRepository userRepository = new UserRepository();

    @Override
    public List<User> display() {
        return userRepository.display();
    }

    @Override
    public boolean create(User user) {
        return userRepository.create(user);
    }

    @Override
    public boolean delete(int id) {
        return userRepository.delete(id);
    }

    @Override
    public List<User> find(String countries) {
        return userRepository.find(countries);
    }

    @Override
    public List<User> sortByName() {
        return null;
    }
}
