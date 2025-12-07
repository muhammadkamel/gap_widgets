import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gap_widgets/gap_widgets.dart';

void main() {
  testWidgets('Gap inside OverflowBar works correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OverflowBar(children: [Gap(10), SizedBox(width: 10, height: 10)]),
      ),
    );

    expect(tester.takeException(), isNull);

    final Finder gapFinder = find.byType(Gap);
    expect(gapFinder, findsOneWidget);

    final RenderBox gapRenderBox = tester.renderObject(gapFinder);
    // Behaving as square 10x10
    expect(gapRenderBox.size.width, 10.0);
    expect(gapRenderBox.size.height, 10.0);
  });
}
