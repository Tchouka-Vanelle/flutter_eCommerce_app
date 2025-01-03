import 'package:task_management/models/product.dart';

class SearchProductArguments {

  final int page;
  final List<Product> initialProductToDisplay;

  SearchProductArguments({required this.page, required this.initialProductToDisplay});
}