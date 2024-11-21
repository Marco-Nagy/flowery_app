class GetAllCategoriesResponseEntity {
  final List<GetAllCategoriesResponseCategoriesEntity?>? categories;

  GetAllCategoriesResponseEntity({this.categories});
}

class GetAllCategoriesResponseCategoriesEntity {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  GetAllCategoriesResponseCategoriesEntity(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.createdAt,
      this.updatedAt});

}
