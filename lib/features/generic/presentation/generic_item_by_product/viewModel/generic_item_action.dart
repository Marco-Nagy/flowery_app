sealed class GenericItemAction {}

class GetItemAction extends GenericItemAction {
  final String resourceName;

  GetItemAction(this.resourceName);
}
class GetProductAction extends GenericItemAction {}

class FilterProductsAction extends GenericItemAction {
  final int selectedIndex;
  final String field;

  FilterProductsAction( this.selectedIndex,{required this.field});
}


