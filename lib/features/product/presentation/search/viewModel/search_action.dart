sealed class SearchAction {}

class SearchProductAction extends SearchAction {
  final String keyword;

  SearchProductAction({required this.keyword});
}
