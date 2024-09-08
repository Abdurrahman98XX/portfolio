import 'package:portfolio/src/base/base_entity.dart';
import 'package:portfolio/src/base/who_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'color_source_controller.g.dart';

@riverpod
class ColorSourceController extends _$ColorSourceController {
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
