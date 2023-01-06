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
    public boolean remove(int id) {
        return userRepository.remove(id);
    }

    @Override
    public List<User> findByCountry(String countries) {
        return userRepository.findByCountry(countries);
    }

    @Override
    public String addUserTransaction(User user) {
        return userRepository.addUserTransaction(user);
    }
}
