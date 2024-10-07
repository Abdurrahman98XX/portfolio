class CacheKeyEntity {
  const CacheKeyEntity(this.name);
  final String name;
  @override
  String toString() => name;
}

abstract interface class CacheKeys {
  static const CacheKeyEntity appColor = CacheKeyEntity('appColor');
  static const CacheKeyEntity onboardDone = CacheKeyEntity('onboardDone');
  static const CacheKeyEntity localDateTime = CacheKeyEntity('localDateTime');
  static const CacheKeyEntity onlineDateTime = CacheKeyEntity('onlineDateTime');
}
