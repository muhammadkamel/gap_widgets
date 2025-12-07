import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gap_widgets/gap_widgets.dart';

void main() {
  testWidgets('SliverGap constructors', (WidgetTester tester) async {
    const a = SliverGap(0);
    expect(a.mainAxisExtent, 0);
    expect(a.color, null);

    const b = SliverGap(10, color: Colors.red);
    expect(b.mainAxisExtent, 10);
    expect(b.color, Colors.red);
  });

  testWidgets('Horizontal SliverGap layoutExtent', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: CustomScrollView(
          scrollDirection: Axis.horizontal,
          slivers: <Widget>[SliverGap(100)],
        ),
      ),
    );

    final RenderSliver sliver = tester.renderObject(find.byType(SliverGap));
    expect(sliver.geometry!.layoutExtent, 100);
    expect(sliver.geometry!.paintExtent, 100);
  });

  testWidgets('Vertical SliverGap layoutExtent', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: CustomScrollView(slivers: <Widget>[SliverGap(100)]),
      ),
    );

    final RenderSliver sliver = tester.renderObject(find.byType(SliverGap));
    expect(sliver.geometry!.layoutExtent, 100);
    expect(sliver.geometry!.paintExtent, 100);
  });

  testWidgets('SliverGap updates properties', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: CustomScrollView(
          slivers: <Widget>[SliverGap(10, color: Colors.red)],
        ),
      ),
    );

    RenderSliverGap renderSliverGap = tester.renderObject(
      find.byType(SliverGap),
    );
    expect(renderSliverGap.mainAxisExtent, 10);
    expect(renderSliverGap.color, Colors.red);

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: CustomScrollView(
          slivers: <Widget>[SliverGap(20, color: Colors.blue)],
        ),
      ),
    );

    renderSliverGap = tester.renderObject(find.byType(SliverGap));
    expect(renderSliverGap.mainAxisExtent, 20);
    expect(renderSliverGap.color, Colors.blue);
  });

  testWidgets('SliverGap diagnostics', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: CustomScrollView(
          slivers: <Widget>[SliverGap(10, color: Colors.green)],
        ),
      ),
    );

    final RenderSliverGap renderSliverGap = tester.renderObject(
      find.byType(SliverGap),
    );
    final builder = DiagnosticPropertiesBuilder();
    renderSliverGap.debugFillProperties(builder);

    final List<String> properties = builder.properties
        .where((node) => !node.isFiltered(DiagnosticLevel.info))
        .map((node) => node.toString())
        .toList();

    expect(properties, contains('mainAxisExtent: 10.0'));
    expect(
      properties.any(
        (s) => s.contains('color: MaterialColor') && s.contains('green'),
      ),
      isTrue,
    );

    // Cover SliverGap.debugFillProperties via widget toString
    final description = tester.widget(find.byType(SliverGap)).toString();
    expect(description, contains('mainAxisExtent: 10.0'));
  });

  test('SliverGap assertions', () {
    expect(() => SliverGap(-1), throwsAssertionError);
    expect(() => SliverGap(double.infinity), throwsAssertionError);
  });
}
