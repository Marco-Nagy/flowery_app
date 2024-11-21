class GetAllCategoriesResponseEntity {
  final List<GetAllCategoriesResponseDtoCategoriesEntity?>? categories;

  GetAllCategoriesResponseEntity(this.categories);
}

class GetAllCategoriesResponseDtoCategoriesEntity {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  GetAllCategoriesResponseDtoCategoriesEntity(this.id, this.name, this.slug,
      this.image, this.createdAt, this.updatedAt);

}
