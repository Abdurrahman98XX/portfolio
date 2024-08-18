import 'package:portfolio/src/module/base/base_entity.dart';
import 'package:portfolio/src/module/theme/model/color_source_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'color_source_controller.g.dart';

@riverpod
class ColorSourceController extends _$ColorSourceController {
  @override
  ColorSourceEntity build() {
    return ColorSourceEntity(
      source: Source.system,
      name: 'name',
      id: 'id',
      vId: 'vId',
      type: 'type',
      createdAt: DateTime.now(),
      modifiedAt: DateTime.now(),
    );
  }

  /// returns old state when replaced by another
  ColorSourceEntity? update(Source source) {
    if (state.source == source) return null;
    final prev = state;
    state = state.copyWith(source: source, modifiedAt: DateTime.now());
    return prev;
  }

  ColorSourceEntity? toggle() =>
      update(state.source != Source.system ? Source.system : Source.user);
}
