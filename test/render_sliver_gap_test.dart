import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gap_plus/src/rendering/render_sliver_gap.dart';

void main() {
  test('RenderSliverGap properties', () {
    final gap = RenderSliverGap(
      mainAxisExtent: 10,
      color: const Color(0xFF000000),
    );

    expect(gap.mainAxisExtent, 10);
    expect(gap.color, const Color(0xFF000000));

    gap.mainAxisExtent = 20;
    expect(gap.mainAxisExtent, 20);

    gap.color = const Color(0xFFFFFFFF);
    expect(gap.color, const Color(0xFFFFFFFF));
  });

  test('RenderSliverGap debugFillProperties', () {
    final gap = RenderSliverGap(mainAxisExtent: 10);
    final builder = DiagnosticPropertiesBuilder();
    gap.debugFillProperties(builder);

    final List<String> description = builder.properties
        .where((node) => !node.isFiltered(DiagnosticLevel.info))
        .map((node) => node.toString())
        .toList();

    expect(description, contains('mainAxisExtent: 10.0'));
  });
}
