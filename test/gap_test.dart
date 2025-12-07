import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gap_widgets/gap_widgets.dart';

void main() {
  testWidgets('Gap constructors', (WidgetTester tester) async {
    const a = Gap(0);
    expect(a.mainAxisExtent, 0);
    expect(a.crossAxisExtent, null);
    expect(a.color, null);

    const b = Gap(10, crossAxisExtent: 20, color: Colors.red);
    expect(b.mainAxisExtent, 10);
    expect(b.crossAxisExtent, 20);
    expect(b.color, Colors.red);

    const c = MaxGap(0);
    expect(c.mainAxisExtent, 0);
    expect(c.crossAxisExtent, null);
    expect(c.color, null);

    const d = MaxGap(10, crossAxisExtent: 20, color: Colors.red);
    expect(d.mainAxisExtent, 10);
    expect(d.crossAxisExtent, 20);
    expect(d.color, Colors.red);

    const e = Gap.expand(10, color: Colors.red);
    expect(e.mainAxisExtent, 10);
    expect(e.crossAxisExtent, double.infinity);
    expect(e.color, Colors.red);

    const f = MaxGap.expand(10, color: Colors.red);
    expect(f.mainAxisExtent, 10);
    expect(f.crossAxisExtent, double.infinity);
    expect(f.color, Colors.red);
  });

  testWidgets('Gap size in a Row', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Row(
        textDirection: TextDirection.ltr,
        children: <Widget>[Gap(100, crossAxisExtent: 20)],
      ),
    );

    final RenderBox box = tester.renderObject(find.byType(Gap));
    expect(box.size.width, 100);
    expect(box.size.height, 20);
  });

  testWidgets('Gap size in a Column', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Column(
        textDirection: TextDirection.ltr,
        children: <Widget>[Gap(100, crossAxisExtent: 20)],
      ),
    );

    final RenderBox box = tester.renderObject(find.byType(Gap));
    expect(box.size.height, 100);
    expect(box.size.width, 20);
  });

  testWidgets('Gap.expand size in a Column', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Center(
        child: SizedBox(
          width: 200,
          child: Column(
            textDirection: TextDirection.ltr,
            children: <Widget>[Gap.expand(100)],
          ),
        ),
      ),
    );

    final RenderBox box = tester.renderObject(find.byType(Gap));
    expect(box.size.height, 100);
    expect(box.size.width, 200);
  });

  testWidgets('MaxGap size in a Row', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Row(
        textDirection: TextDirection.ltr,
        children: <Widget>[MaxGap(100, crossAxisExtent: 20)],
      ),
    );

    final RenderBox box = tester.renderObject(find.byType(MaxGap));
    expect(box.size.width, 100);
    expect(box.size.height, 20);
  });

  testWidgets('MaxGap size in a constrained Row', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Center(
        child: SizedBox(
          width: 50,
          child: Row(
            textDirection: TextDirection.ltr,
            children: <Widget>[MaxGap(100, crossAxisExtent: 20)],
          ),
        ),
      ),
    );

    final RenderBox box = tester.renderObject(find.byType(MaxGap));
    expect(box.size.width, 50);
    expect(box.size.height, 20);
  });

  testWidgets('MaxGap size in a Column', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Column(
        textDirection: TextDirection.ltr,
        children: <Widget>[MaxGap(100, crossAxisExtent: 20)],
      ),
    );

    final RenderBox box = tester.renderObject(find.byType(MaxGap));
    expect(box.size.height, 100);
    expect(box.size.width, 20);
  });

  testWidgets('MaxGap size in a constrained Column', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const Center(
        child: SizedBox(
          height: 50,
          child: Column(
            textDirection: TextDirection.ltr,
            children: <Widget>[MaxGap(100, crossAxisExtent: 20)],
          ),
        ),
      ),
    );

    final RenderBox box = tester.renderObject(find.byType(MaxGap));
    expect(box.size.height, 50);
    expect(box.size.width, 20);
  });

  testWidgets('Gap defaults to vertical spacing when not inside a Flex', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: Column(mainAxisSize: MainAxisSize.min, children: [Gap(50)]),
      ),
    );

    await tester.pump();

    // Gap should work without throwing an error
    expect(tester.takeException(), isNull);

    final RenderBox box = tester.renderObject(find.byType(Gap));
    // Gap should have the specified height
    expect(box.size.height, 50.0);
  });

  testWidgets('Gap updates properties', (WidgetTester tester) async {
    // 1. Pump initial widget
    await tester.pumpWidget(
      const Row(
        textDirection: TextDirection.ltr,
        children: <Widget>[Gap(10, crossAxisExtent: 5, color: Colors.red)],
      ),
    );

    RenderGap renderGap = tester.renderObject(find.byType(Gap));
    expect(renderGap.mainAxisExtent, 10);
    expect(renderGap.crossAxisExtent, 5);
    expect(renderGap.color, Colors.red);

    // 2. Pump updated widget
    await tester.pumpWidget(
      const Row(
        textDirection: TextDirection.ltr,
        children: <Widget>[Gap(20, crossAxisExtent: 10, color: Colors.blue)],
      ),
    );

    renderGap = tester.renderObject(find.byType(Gap));
    expect(renderGap.mainAxisExtent, 20);
    expect(renderGap.crossAxisExtent, 10);
    expect(renderGap.color, Colors.blue);
  });

  testWidgets('Gap diagnostics', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Row(
        textDirection: TextDirection.ltr,
        children: <Widget>[Gap(10, crossAxisExtent: 5, color: Colors.green)],
      ),
    );
    final builder = DiagnosticPropertiesBuilder();
    final RenderGap renderGap = tester.renderObject(find.byType(Gap));
    renderGap.debugFillProperties(builder);
    final List<String> properties = builder.properties
        .where((node) => !node.isFiltered(DiagnosticLevel.info))
        .map((node) => node.toString())
        .toList();

    expect(properties, contains('mainAxisExtent: 10.0'));
    expect(properties, contains('crossAxisExtent: 5.0'));
    expect(
      properties.any(
        (s) => s.contains('color: MaterialColor') && s.contains('green'),
      ),
      isTrue,
    );
  });

  test('Gap assertions', () {
    expect(() => Gap(-1), throwsAssertionError);
    expect(() => Gap(double.infinity), throwsAssertionError);
    expect(() => Gap(10, crossAxisExtent: -1), throwsAssertionError);
    expect(() => Gap(10, crossAxisExtent: -1), throwsAssertionError);
  });

  testWidgets('Gap inside Scrollable (fallback direction)', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: SingleChildScrollView(child: Gap(10)),
      ),
    );

    final RenderGap renderGap = tester.renderObject(find.byType(Gap));
    expect(renderGap.size.height, 10.0);
  });

  testWidgets('Gap.expand', (WidgetTester tester) async {
    const gap = Gap.expand(10);
    expect(gap.mainAxisExtent, 10);
    expect(gap.crossAxisExtent, double.infinity);
  });

  test('MaxGap assertions', () {
    expect(() => MaxGap(-1), throwsAssertionError);
    expect(() => MaxGap(double.infinity), throwsAssertionError);
    expect(() => MaxGap(10, crossAxisExtent: -1), throwsAssertionError);
    expect(() => MaxGap(10, crossAxisExtent: -1), throwsAssertionError);
  });

  testWidgets('MaxGap.expand', (WidgetTester tester) async {
    const gap = MaxGap.expand(10);
    expect(gap.mainAxisExtent, 10);
    expect(gap.crossAxisExtent, double.infinity);
  });

  testWidgets('Gap.expand intrinsic size', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: Column(children: [Gap.expand(10)]),
      ),
    );

    final RenderGap renderGap = tester.renderObject(find.byType(Gap));
    // Verify cross axis intrinsic behavior when infinite
    expect(renderGap.getMinIntrinsicWidth(double.infinity), 0.0);
    expect(renderGap.getMaxIntrinsicWidth(double.infinity), 0.0);
  });

  testWidgets('_RawGap diagnostics', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: Row(children: [Gap(10)]),
      ),
    );
    final Finder rawGapFinder = find.byWidgetPredicate(
      (Widget w) => w.runtimeType.toString() == '_RawGap',
    );
    expect(rawGapFinder, findsOneWidget);

    final description = tester.widget(rawGapFinder).toString();
    expect(description, contains('mainAxisExtent: 10.0'));
  });

  testWidgets('Gap inside Wrap works correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Wrap(children: [Gap(10), SizedBox(width: 10, height: 10)]),
      ),
    );

    expect(tester.takeException(), isNull);

    final Finder gapFinder = find.byType(Gap);
    expect(gapFinder, findsOneWidget);

    final RenderBox gapRenderBox = tester.renderObject(gapFinder);
    expect(gapRenderBox.size.width, 10.0);
    expect(gapRenderBox.size.height, 0.0);
  });

  testWidgets('Gap inside vertical Wrap works correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Wrap(
          direction: Axis.vertical,
          children: [Gap(20), SizedBox(width: 10, height: 10)],
        ),
      ),
    );

    expect(tester.takeException(), isNull);

    final Finder gapFinder = find.byType(Gap);
    expect(gapFinder, findsOneWidget);

    final RenderBox gapRenderBox = tester.renderObject(gapFinder);
    expect(gapRenderBox.size.height, 20.0);
    expect(gapRenderBox.size.width, 0.0);
  });

  testWidgets('Gap works in Stack widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(children: [Gap(30)]),
      ),
    );

    // Gap should work without throwing an error
    expect(tester.takeException(), isNull);

    final RenderBox gapRenderBox = tester.renderObject(find.byType(Gap));
    // Gap should have the specified height
    expect(gapRenderBox.size.height, 30.0);
  });

  testWidgets('Gap works in Container widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: Column(mainAxisSize: MainAxisSize.min, children: [Gap(25)]),
      ),
    );

    // Gap should work without throwing an error
    expect(tester.takeException(), isNull);

    final RenderBox gapRenderBox = tester.renderObject(find.byType(Gap));
    // Gap should have the specified height
    expect(gapRenderBox.size.height, 25.0);
  });

  testWidgets('Gap works in Padding widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Padding(padding: EdgeInsets.zero, child: Gap(40))],
        ),
      ),
    );

    // Gap should work without throwing an error
    expect(tester.takeException(), isNull);

    final RenderBox gapRenderBox = tester.renderObject(find.byType(Gap));
    // Gap should have the specified height
    expect(gapRenderBox.size.height, 40.0);
  });
}
