abstract class OfflineDataSource {
  Future<void> cacheToken(String token);

  Future<String?> getToken();
  Future<void> deleteCachedToken();
}
