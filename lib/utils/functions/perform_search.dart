import 'package:task_management/models/category.dart';
import 'package:task_management/models/product.dart';
import 'package:task_management/models/product_category.dart';
import 'package:task_management/utils/functions/product_provider.dart';

List<Product> performSearch(String searchValue, ProductProvider productProvider) {

  Set<Product> searchResults = {};

  List<Product> allProducts = productProvider.allProducts;

  searchValue = searchValue.toLowerCase();

  // search in category
  List<Category> matchingCategories = productProvider.categories.where(
    (category) { return category.name.toLowerCase().contains(searchValue); 
  }).toList();

  // Add products from corresponding categories

  for (var pc in matchingCategories) {

    List<ProductCategory> productsCategory = productProvider.productCategory.where(
      (prod) => prod.idCategory == pc.id
    ).toList();

    List<Product> products = productsCategory.map(
      (e) => allProducts.firstWhere((p) => p.id == e.idProduct),
    ).whereType<Product>().toList();

    searchResults.addAll(products);
  }

  // search in product
  List<Product> matchingProducts = allProducts.where(
    (p) {
      return p.name.toLowerCase().contains(searchValue);
    } 
  ).toList();

  for (var pc in matchingProducts) {

    int idCategpry = productProvider.productCategory.firstWhere((e) => e.idProduct == pc.id).idCategory;

    List<ProductCategory> productsSameCategory = productProvider.productCategory.where(
      (prod) => prod.idCategory == idCategpry
    ).toList();

    List<Product> products = productsSameCategory.map(
      (e) => allProducts.firstWhere((p) => p.id == e.idProduct),
    ).whereType<Product>().toList();

    searchResults.addAll(products);
  }

  if (searchResults.isEmpty) {
    searchResults.addAll(allProducts);
  }

 
  return searchResults.toList();
}