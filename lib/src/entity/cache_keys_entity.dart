class CacheKeyEntity {
  const CacheKeyEntity(this.name);
  final String name;
  @override
  String toString() => name;
}

class CacheKeysEntity {
  const CacheKeysEntity();
  final CacheKeyEntity onboardDone = const CacheKeyEntity('onboardDone');
}
