sealed class GenericAction {}


class getData extends GenericAction {
  final String resourceName;

  getData(this.resourceName);
}

class fetchNextPage extends GenericAction {}
class setCategory extends GenericAction {
  final String category;

  setCategory(this.category);
}