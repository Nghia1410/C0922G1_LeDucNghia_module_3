package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "samsung", 5000));
        productList.add(new Product(2, "nokia", 3000));
        productList.add(new Product(3, "iphone", 7000));
    }

    @Override
    public List<Product> display() {
        return productList;
    }

    @Override
    public boolean create(Product product) {

        return productList.add(product);
    }
}
