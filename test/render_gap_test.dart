import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gap_plus/src/rendering/render_gap.dart';

void main() {
  test('RenderGap properties', () {
    final gap = RenderGap(
      mainAxisExtent: 10,
      crossAxisExtent: 5,
      color: const Color(0xFF000000),
      fallbackDirection: Axis.vertical,
    );

    expect(gap.mainAxisExtent, 10);
    expect(gap.crossAxisExtent, 5);
    expect(gap.color, const Color(0xFF000000));
    expect(gap.fallbackDirection, Axis.vertical);

    gap.mainAxisExtent = 20;
    expect(gap.mainAxisExtent, 20);

    gap.crossAxisExtent = 10;
    expect(gap.crossAxisExtent, 10);

    gap.color = const Color(0xFFFFFFFF);
    expect(gap.color, const Color(0xFFFFFFFF));

    gap.fallbackDirection = Axis.horizontal;
    expect(gap.fallbackDirection, Axis.horizontal);
  });

  test('RenderGap computeIntrinsic', () {
    final gap = RenderGap(
      mainAxisExtent: 10,
      crossAxisExtent: 5,
      fallbackDirection: Axis.vertical,
    );

    // Vertical fallback implies:
    // main axis = height = 10
    // cross axis = width = 5

    expect(gap.computeMinIntrinsicHeight(100), 10);
    expect(gap.computeMaxIntrinsicHeight(100), 10);
    expect(gap.computeMinIntrinsicWidth(100), 5);
    expect(gap.computeMaxIntrinsicWidth(100), 5);

    gap.fallbackDirection = Axis.horizontal;
    // Horizontal fallback implies:
    // main axis = width = 10
    // cross axis = height = 5

    expect(gap.computeMinIntrinsicWidth(100), 10);
    expect(gap.computeMaxIntrinsicWidth(100), 10);
    expect(gap.computeMinIntrinsicHeight(100), 5);
    expect(gap.computeMaxIntrinsicHeight(100), 5);
  });

  test('RenderGap computeDryLayout with fallbackDirection', () {
    final gap = RenderGap(
      mainAxisExtent: 10,
      crossAxisExtent: 5,
      fallbackDirection: Axis.vertical,
    );
    // Vertical: width=cross=5, height=main=10
    expect(gap.computeDryLayout(const BoxConstraints()), const Size(5, 10));

    gap.fallbackDirection = Axis.horizontal;
    // Horizontal: width=main=10, height=cross=5
    expect(gap.computeDryLayout(const BoxConstraints()), const Size(10, 5));
  });

  test('RenderGap defaults to vertical when no direction and no parent flex', () {
    final gap = RenderGap(mainAxisExtent: 10);

    // Should default to vertical (height = mainAxisExtent, width = crossAxisExtent)
    expect(gap.computeDryLayout(const BoxConstraints()), const Size(0, 10));
  });

  test('RenderGap debugFillProperties', () {
    final gap = RenderGap(mainAxisExtent: 10);
    final builder = DiagnosticPropertiesBuilder();
    gap.debugFillProperties(builder);

    final List<String> description = builder.properties
        .where((node) => !node.isFiltered(DiagnosticLevel.info))
        .map((node) => node.toString())
        .toList();

    expect(description, contains('mainAxisExtent: 10.0'));
    expect(description, contains('crossAxisExtent: 0.0'));
  });
}
