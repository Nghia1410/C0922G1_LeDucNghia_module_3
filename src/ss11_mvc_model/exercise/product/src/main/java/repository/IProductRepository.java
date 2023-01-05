package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> display();

    boolean create(Product product);


}
