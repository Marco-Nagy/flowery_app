sealed class GenericAction {}


class GetData extends GenericAction {
  final String resourceName;

  GetData(this.resourceName);
}

class FetchNextPage extends GenericAction {}
class SetCategory extends GenericAction {
  final String category;

  SetCategory(this.category);
}