// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_system_color_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$autoSystemColorHash() => r'37c78b4c00fe6aaa68bbe24fa992ed8000079e4a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [autoSystemColor].
@ProviderFor(autoSystemColor)
const autoSystemColorProvider = AutoSystemColorFamily();

/// See also [autoSystemColor].
class AutoSystemColorFamily extends Family<AsyncValue<Color>> {
  /// See also [autoSystemColor].
  const AutoSystemColorFamily();

  /// See also [autoSystemColor].
  AutoSystemColorProvider call({
    bool listenSystemColorChange = false,
  }) {
    return AutoSystemColorProvider(
      listenSystemColorChange: listenSystemColorChange,
    );
  }

  @override
  AutoSystemColorProvider getProviderOverride(
    covariant AutoSystemColorProvider provider,
  ) {
    return call(
      listenSystemColorChange: provider.listenSystemColorChange,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'autoSystemColorProvider';
}

/// See also [autoSystemColor].
class AutoSystemColorProvider extends AutoDisposeStreamProvider<Color> {
  /// See also [autoSystemColor].
  AutoSystemColorProvider({
    bool listenSystemColorChange = false,
  }) : this._internal(
          (ref) => autoSystemColor(
            ref as AutoSystemColorRef,
            listenSystemColorChange: listenSystemColorChange,
          ),
          from: autoSystemColorProvider,
          name: r'autoSystemColorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$autoSystemColorHash,
          dependencies: AutoSystemColorFamily._dependencies,
          allTransitiveDependencies:
              AutoSystemColorFamily._allTransitiveDependencies,
          listenSystemColorChange: listenSystemColorChange,
        );

  AutoSystemColorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.listenSystemColorChange,
  }) : super.internal();

  final bool listenSystemColorChange;

  @override
  Override overrideWith(
    Stream<Color> Function(AutoSystemColorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AutoSystemColorProvider._internal(
        (ref) => create(ref as AutoSystemColorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        listenSystemColorChange: listenSystemColorChange,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Color> createElement() {
    return _AutoSystemColorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AutoSystemColorProvider &&
        other.listenSystemColorChange == listenSystemColorChange;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, listenSystemColorChange.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AutoSystemColorRef on AutoDisposeStreamProviderRef<Color> {
  /// The parameter `listenSystemColorChange` of this provider.
  bool get listenSystemColorChange;
}

class _AutoSystemColorProviderElement
    extends AutoDisposeStreamProviderElement<Color> with AutoSystemColorRef {
  _AutoSystemColorProviderElement(super.provider);

  @override
  bool get listenSystemColorChange =>
      (origin as AutoSystemColorProvider).listenSystemColorChange;
}

String _$autoSystemColorAbilityHash() =>
    r'3139ca9cb2e1c480aad1a26e3307be364493f994';

/// See also [autoSystemColorAbility].
@ProviderFor(autoSystemColorAbility)
final autoSystemColorAbilityProvider = AutoDisposeProvider<bool>.internal(
  autoSystemColorAbility,
  name: r'autoSystemColorAbilityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$autoSystemColorAbilityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AutoSystemColorAbilityRef = AutoDisposeProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
