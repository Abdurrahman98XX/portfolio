import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/entity/base_entity.dart';
import 'package:portfolio/src/entity/who_entity.dart';

class ColorSourceNotifier extends Notifier<WhoEntity> {
  static final provider = NotifierProvider<ColorSourceNotifier, WhoEntity>(
    ColorSourceNotifier.new,
    name: 'ColorSourceNotifier',
  );
  @override
  WhoEntity build() {
    return WhoEntity(
      eWho: WHO.defaults,
      createdAt: DateTime.now(),
      modifiedAt: DateTime.now(),
      id: 'id',
      name: 'name',
      type: 'type',
      vId: 'vId',
    );
  }

  /// returns old state when replaced by another
  WhoEntity? update(WHO source) {
    if (state.eWho == source) return null;
    final prev = state;
    state = state.copyWith(eWho: source, modifiedAt: DateTime.now());
    return prev;
  }
}
