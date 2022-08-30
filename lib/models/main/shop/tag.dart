import 'category.dart';

class Tag {
  final String name;
  final List<CategoryEnum>? categories;

  const Tag({
    required this.name,
    this.categories,
  });
}
