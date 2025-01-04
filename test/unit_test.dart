import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/models/category.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/models/product_category.dart';
import 'package:task_management/utils/functions/perform_search.dart';
import 'package:task_management/utils/functions/product_provider.dart';

void main() {
  test('should return products matching search value', () {
    // Mock product provider
    final productProvider = ProductProvider();
    
    // Setup initial products
    productProvider.allProducts = [
      Product(id: 1, name: 'Kitchen Appliances', price: 37.0, description: 'description1', images: ['image1'], nbrAchat: 5),
      Product(id: 2, name: 'Office Furniture', price: 150.0, description: 'description2', images: ['image2'], nbrAchat: 2),
      Product(id: 3, description: 'description3 kal lpzpz pp', price: 24.0, images: ['robe'], name: 'pantalon', nbrAchat: 14),
      Product(id: 4, description: 'description4 lolipop', price: 29.0, images: ['coat'],  name: 'pull', nbrAchat: 11),
      Product(id: 5, description: 'description5', price: 33.0, images: ['robe'], name: 'tshirt', nbrAchat: 7),
      Product(id: 6, description: 'description6', price: 41.0, images: ['coat'], name: 'jupe', nbrAchat: 7),
     
    ];
    
    
     productProvider.categories = [
      
      Category(id: 1, name: "category1", photo: "robe"),
      Category(id: 2, name: "category2", photo: "coat"),
     ];

      productProvider.productCategory = [
      
      ProductCategory(idCategory: 1, idProduct: 2),
      ProductCategory(idCategory: 1, idProduct: 3),
      ProductCategory(idCategory: 2, idProduct: 5),
      ProductCategory(idCategory: 2, idProduct: 1),
      ProductCategory(idCategory: 2, idProduct: 4),
    ];

    const searchValue = 'appliances';
    
    // Run search
    final result = performSearch(searchValue, productProvider);

    const searchValue2 = 'category1';
    
    // Run search
    final result2 = performSearch(searchValue2, productProvider);
    
    
    // Assertions
    expect(result.length, 3);
    expect(result2.length, 2);

    expect(result2[0].name, 'Office Furniture');
  });
}
