package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> display();


    boolean create(Product product);
}
