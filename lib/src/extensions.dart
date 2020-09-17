extension FutureListExtension<T> on List<Future<T>> {
  /// Wrap `List<Future>` inside `Future.wait(...)` to run all async operations at
  /// the same time.
  Future<List<T>> wait() async => Future.wait(this);
}

extension MapToListExtension<K, V> on Map<K, V> {
  /// Maps `Map` into `List` using [mapper].
  List<T> mapList<T>(T Function(K key, V value) mapper) {
    return entries.map((e) => mapper(e.key, e.value)).toList();
  }
}

extension StringTakeExtension on String {
  /// Returns new String trimmed to [n] characters. When String length is less
  /// than [n], it is returned as is.
  String take(int n) {
    return (length > n) ? substring(0, n) : this;
  }
}

extension ListSortExtension<T> on List<T> {
  /// Returns new List sorted by DateTime from newest to oldest item.
  List<T> sortByDate(DateTime Function(T item) mapper) {
    return this..sort((a, b) => mapper(b).compareTo(mapper(a)));
  }
}
