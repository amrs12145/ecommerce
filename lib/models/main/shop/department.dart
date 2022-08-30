import 'category.dart';

class Department {
  final String name;
  final String imgUrl;
  final List<CategoryEnum>? categoryies;

  const Department({
    required this.name,
    this.categoryies,
    required this.imgUrl,
  });
}
