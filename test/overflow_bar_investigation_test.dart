import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Gap inside OverflowBar analysis', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OverflowBar(children: [SizedBox(width: 10, height: 10)]),
      ),
    );

    final Finder overflowBarFinder = find.byType(OverflowBar);
    final RenderBox renderOverflowBar = tester.renderObject(overflowBarFinder);

    log('RenderOverflowBar type: ${renderOverflowBar.runtimeType}');

    try {
      final dynamicRender = renderOverflowBar as RenderFlex;
      log('Has direction property? ${dynamicRender.direction}');
    } catch (e) {
      log('Error accessing direction: $e');
    }
  });
}
