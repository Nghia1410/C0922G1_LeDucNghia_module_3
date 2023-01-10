package service.customerService.impl;

import model.customer.Customer;
import repository.impl.customerRepository.ICustomerRepository;
import repository.impl.customerRepository.impl.CustomerRepository;
import service.customerService.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> displayCustomer() {
        return customerRepository.displayCustomer();
    }
}