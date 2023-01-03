package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> display();

    void add(Product product);
}
