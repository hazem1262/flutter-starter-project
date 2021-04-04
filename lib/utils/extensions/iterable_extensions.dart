extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));

  Iterable<T> mapIndex<T>(T f(E element, int index)) {
    int index = 0;
    return map((E element) => f(element, index++));
  }
}
