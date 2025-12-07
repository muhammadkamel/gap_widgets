import 'package:flutter/rendering.dart';

/// Implements the rendering logic for the [Gap] widget.
class RenderGap extends RenderBox {
  /// Creates a [RenderGap].
  RenderGap({
    required double mainAxisExtent,
    double crossAxisExtent = 0,
    Axis? fallbackDirection,
    Color? color,
  }) : _mainAxisExtent = mainAxisExtent,
       _crossAxisExtent = crossAxisExtent,
       _color = color,
       _fallbackDirection = fallbackDirection;

  /// The amount of space this gap takes up in the main axis.
  double get mainAxisExtent => _mainAxisExtent;
  double _mainAxisExtent;
  set mainAxisExtent(double value) {
    if (_mainAxisExtent != value) {
      _mainAxisExtent = value;
      markNeedsLayout();
    }
  }

  /// The amount of space this gap takes up in the cross axis.
  double get crossAxisExtent => _crossAxisExtent;
  double _crossAxisExtent;
  set crossAxisExtent(double value) {
    if (_crossAxisExtent != value) {
      _crossAxisExtent = value;
      markNeedsLayout();
    }
  }

  /// The direction to use if this is not a child of a [RenderFlex].
  Axis? get fallbackDirection => _fallbackDirection;
  Axis? _fallbackDirection;
  set fallbackDirection(Axis? value) {
    if (_fallbackDirection != value) {
      _fallbackDirection = value;
      markNeedsLayout();
    }
  }

  Axis get _direction {
    return switch (parent) {
      final RenderFlex flex => flex.direction,
      final RenderWrap wrap => wrap.direction,
      _ => fallbackDirection ?? Axis.vertical,
    };
  }

  /// The color to paint this gap.
  Color? get color => _color;
  Color? _color;
  set color(Color? value) {
    if (_color != value) {
      _color = value;
      markNeedsPaint();
    }
  }

  bool get _isOverflowBar =>
      parent.runtimeType.toString() == '_RenderOverflowBar';

  @override
  double computeMinIntrinsicWidth(double height) {
    return _computeIntrinsicExtent(
      Axis.horizontal,
      () => super.computeMinIntrinsicWidth(height),
    )!;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    return _computeIntrinsicExtent(
      Axis.horizontal,
      () => super.computeMaxIntrinsicWidth(height),
    )!;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    return _computeIntrinsicExtent(
      Axis.vertical,
      () => super.computeMinIntrinsicHeight(width),
    )!;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    return _computeIntrinsicExtent(
      Axis.vertical,
      () => super.computeMaxIntrinsicHeight(width),
    )!;
  }

  double? _computeIntrinsicExtent(Axis axis, double Function() compute) {
    final Axis direction = _direction;
    if (direction == axis) {
      return _mainAxisExtent;
    }
    if (_isOverflowBar) {
      return _mainAxisExtent;
    }
    return _crossAxisExtent.isFinite ? _crossAxisExtent : compute();
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final Axis direction = _direction;
    if (_isOverflowBar) {
      return constraints.constrain(Size(mainAxisExtent, mainAxisExtent));
    }
    return switch (direction) {
      Axis.horizontal => constraints.constrain(
        Size(
          mainAxisExtent,
          crossAxisExtent == 0
              ? (constraints.maxHeight.isFinite ? constraints.maxHeight : 0)
              : crossAxisExtent,
        ),
      ),
      Axis.vertical => constraints.constrain(
        Size(
          crossAxisExtent == 0
              ? (constraints.maxWidth.isFinite ? constraints.maxWidth : 0)
              : crossAxisExtent,
          mainAxisExtent,
        ),
      ),
    };
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (color != null) {
      final paint = Paint()..color = color!;
      context.canvas.drawRect(offset & size, paint);
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('mainAxisExtent', mainAxisExtent));
    properties.add(DoubleProperty('crossAxisExtent', crossAxisExtent));
    properties.add(ColorProperty('color', color));
    properties.add(EnumProperty<Axis>('fallbackDirection', fallbackDirection));
  }
}
