import '../models/main/shop/category.dart';
import '../models/main/shop/department.dart';

List<Department> getDepartment({CategoryEnum? category}) {
  if (category == null) return getDepartments();

  return getDepartments()
      .where((department) => department.categoryies == null
          ? false
          : department.categoryies!.contains(category))
      .toList();
}

List<Department> getDepartments() {
  return const [
    Department(
      name: 'new',
      categoryies: [CategoryEnum.men, CategoryEnum.women],
      imgUrl:
          'https://cordmagazine.com/wp-content/uploads/2017/08/7.-BURBERRY.jpg',
    ),
    Department(
      name: 'clothes',
      categoryies: [CategoryEnum.men, CategoryEnum.women],
      imgUrl:
          'https://vidalatinacleveland.com/wp-content/uploads/2019/08/f4.jpg',
    ),
    Department(
      name: 'shoes',
      categoryies: [CategoryEnum.men, CategoryEnum.women],
      imgUrl:
          'https://cordmagazine.com/wp-content/uploads/2017/08/7.-BURBERRY.jpg',
    ),
    Department(
      name: 'old',
      categoryies: [CategoryEnum.men, CategoryEnum.women],
      imgUrl:
          'https://vidalatinacleveland.com/wp-content/uploads/2019/08/f4.jpg',
    ),
    Department(
      name: 'accesories',
      categoryies: [CategoryEnum.women, CategoryEnum.women],
      imgUrl:
          'https://cordmagazine.com/wp-content/uploads/2017/08/7.-BURBERRY.jpg',
    ),
  ];
}
