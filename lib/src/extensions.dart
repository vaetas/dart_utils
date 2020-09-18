extension FutureListExtension<T> on Iterable<Future<T>> {
  /// Wrap `List<Future>` inside `Future.wait(...)` to run all async operations
  /// at the same time.
  Future<List<T>> wait() => Future.wait(this);
}

extension MapToListExtension<K, V> on Map<K, V> {
  /// Maps `Map<K, V>` into `List<T>` using [mapper] function.
  List<T> mapList<T>(T Function(K key, V value) mapper) {
    return entries.map((e) => mapper(e.key, e.value)).toList();
  }
}

extension StringTakeExtension on String {
  /// Returns new String trimmed to [n] characters. When String length is less
  /// than [n], String is returned unchaged.
  String take(int n) {
    return (length > n) ? substring(0, n) : this;
  }
}

extension IterableExtension<E> on Iterable<E> {
  /// Creates new Itarable sorted by DateTime from newest to oldest.
  ///
  /// Most recent DateTime is at index 0.
  List<E> sortedByDate(DateTime Function(E e) mapper) {
    return List.from(this)..sort((a, b) => mapper(b).compareTo(mapper(a)));
  }

  // Allows mapping list with async [mapper]. All mapped elements are run at the
  // same time and returned `Future` ends when last element is finished.
  Future<List<T>> asyncMap<T>(Future<T> Function(E e) mapper) async {
    return Future.wait<T>(map((i) async => mapper(i)));
  }
}
