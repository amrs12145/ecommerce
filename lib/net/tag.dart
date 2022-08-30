import '../models/main/shop/category.dart';
import '../models/main/shop/tag.dart';

List<Tag> getTag({CategoryEnum? category}) {
  if (category == null) return getTags();

  return getTags()
      .where(
        (tag) =>
            tag.categories == null ? false : tag.categories!.contains(category),
      )
      .toList();
}

List<Tag> getTags() {
  return [
    const Tag(
      name: 'tops',
      categories: [CategoryEnum.men, CategoryEnum.women, CategoryEnum.kids],
    ),
    const Tag(
      name: 'shirts_blouses',
      categories: [CategoryEnum.men, CategoryEnum.women, CategoryEnum.kids],
    ),
    const Tag(
      name: 'cardigans_sweaters',
      categories: [CategoryEnum.men, CategoryEnum.women, CategoryEnum.kids],
    ),
    const Tag(
      name: 'knitewear',
      categories: [CategoryEnum.men, CategoryEnum.women, CategoryEnum.kids],
    ),
    const Tag(
      name: 'blazers',
      categories: [CategoryEnum.women],
    ),
    const Tag(
      name: 'outerwear',
      categories: [CategoryEnum.men, CategoryEnum.women, CategoryEnum.kids],
    ),
    const Tag(
      name: 'pants',
      categories: [CategoryEnum.men, CategoryEnum.women, CategoryEnum.kids],
    ),
    const Tag(
      name: 'jeans',
      categories: [CategoryEnum.men, CategoryEnum.women, CategoryEnum.kids],
    ),
    const Tag(
      name: 'shorts',
      categories: [CategoryEnum.men, CategoryEnum.women, CategoryEnum.kids],
    ),
    const Tag(
      name: 'skirts',
      categories: [CategoryEnum.women],
    ),
    const Tag(
      name: 'dresses',
      categories: [CategoryEnum.women],
    ),
  ];
}
