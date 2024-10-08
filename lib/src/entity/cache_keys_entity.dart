class CacheKeyEntity {
  const CacheKeyEntity._(this.name);
  final String name;
  @override
  String toString() => name;
}

abstract interface class CacheKeys {
  static const CacheKeyEntity appColor = CacheKeyEntity._('appColor');
  static const CacheKeyEntity onboardDone = CacheKeyEntity._('onboardDone');
  static const CacheKeyEntity localDateTime = CacheKeyEntity._('localDateTime');
  static const CacheKeyEntity onlineDateTime =
      CacheKeyEntity._('onlineDateTime');
}
