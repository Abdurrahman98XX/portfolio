import 'package:portfolio/src/base/base_entity.dart';
import 'package:portfolio/src/module/theme/model/color_source_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'color_source_controller.g.dart';

@riverpod
class ColorSourceController extends _$ColorSourceController {
  @override
  ColorSourceEntity build() {
    return ColorSourceEntity(
      source: Source.system,
      modifiedAt: DateTime.now(),
      createdAt: DateTime.now(),
      id: 'color_source',
      name: 'Color Source',
      type: 'color',
      vId: '1',
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
