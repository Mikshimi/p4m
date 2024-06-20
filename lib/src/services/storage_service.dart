abstract class StorageService {
  Future<void> saveData(String key, dynamic value);
  Future<dynamic> loadData(String key);
  Future<void> deleteData(String key);
}
