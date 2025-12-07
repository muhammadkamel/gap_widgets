# gap_widgets

[![pub package](https://img.shields.io/pub/v/gap_widgets.svg)](https://pub.dev/packages/gap_widgets)

Gap, MaxGap, and SliverGap widgets for spacing in Flex layouts (Row, Column, Wrap) and scrollable views. Auto-detects direction, supports cross-axis control and colors.

## Features

- 🎯 **Automatic Direction Detection** - Automatically detects layout direction in Flex widgets and scroll direction in scrollable views
- 📏 **Flexible Spacing** - `Gap` for fixed spacing, `MaxGap` for flexible spacing that adapts to constraints
- 🎨 **Visual Customization** - Optional color support for visualizing gaps during development
- 📐 **Cross-Axis Control** - Control both main-axis and cross-axis dimensions
- 🔄 **Sliver Support** - `SliverGap` for use in `CustomScrollView` and other sliver-based layouts
- ✅ **Comprehensive Support** - Works with Row, Column, Flex, Wrap, OverflowBar, ListView, CustomScrollView, and more

## Installation

Add `gap_widgets` to your `pubspec.yaml`:

```yaml
dependencies:
  gap_widgets: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Gap in Row and Column

```dart
import 'package:gap_widgets/gap_widgets.dart';

// Horizontal spacing in a Row
Row(
  children: [
    Container(width: 50, height: 50, color: Colors.red),
    Gap(20), // 20px horizontal gap
    Container(width: 50, height: 50, color: Colors.green),
  ],
)

// Vertical spacing in a Column
Column(
  children: [
    Container(width: 50, height: 50, color: Colors.red),
    Gap(20), // 20px vertical gap
    Container(width: 50, height: 50, color: Colors.green),
  ],
)
```

### Gap with Cross-Axis Extent

```dart
Row(
  children: [
    Container(width: 50, height: 50, color: Colors.red),
    Gap(20, crossAxisExtent: 30), // 20px width, 30px height
    Container(width: 50, height: 50, color: Colors.green),
  ],
)
```

### Gap.expand

Creates a gap that expands in the cross-axis direction:

```dart
SizedBox(
  width: 200,
  child: Column(
    children: [
      Container(width: 50, height: 50, color: Colors.red),
      Gap.expand(20), // 20px height, full width
      Container(width: 50, height: 50, color: Colors.green),
    ],
  ),
)
```

### Gap with Color

Add color for visualization:

```dart
Column(
  children: [
    Container(width: 50, height: 50, color: Colors.red),
    Gap(20, color: Colors.purple), // Colored gap
    Container(width: 50, height: 50, color: Colors.green),
  ],
)
```

### MaxGap (Flexible Gap)

`MaxGap` takes at most the specified space and shrinks when constrained:

```dart
// Unconstrained - takes full specified space
Row(
  children: [
    Container(width: 50, height: 50, color: Colors.red),
    MaxGap(100), // Takes 100px if available
    Container(width: 50, height: 50, color: Colors.green),
  ],
)

// Constrained - shrinks to fit available space
SizedBox(
  width: 150,
  child: Row(
    children: [
      Container(width: 50, height: 50, color: Colors.red),
      MaxGap(100), // Shrinks to 50px to fit
      Container(width: 50, height: 50, color: Colors.green),
    ],
  ),
)
```

### MaxGap.expand

```dart
SizedBox(
  width: 200,
  child: Column(
    children: [
      Container(width: 50, height: 30, color: Colors.red),
      MaxGap.expand(20), // Flexible height, full width
      Container(width: 50, height: 30, color: Colors.green),
    ],
  ),
)
```

### Gap in Wrap

```dart
// Horizontal wrap
Wrap(
  children: [
    Container(width: 50, height: 50, color: Colors.red),
    Gap(20),
    Container(width: 50, height: 50, color: Colors.green),
  ],
)

// Vertical wrap
Wrap(
  direction: Axis.vertical,
  children: [
    Container(width: 50, height: 50, color: Colors.red),
    Gap(20),
    Container(width: 50, height: 50, color: Colors.green),
  ],
)
```

### Gap in OverflowBar

```dart
OverflowBar(
  children: [
    Container(width: 50, height: 50, color: Colors.red),
    Gap(20),
    Container(width: 50, height: 50, color: Colors.green),
  ],
)
```

### Gap in Scrollable Views

Gap automatically detects scroll direction:

```dart
// Horizontal ListView
ListView(
  scrollDirection: Axis.horizontal,
  children: [
    Container(width: 50, height: 80, color: Colors.red),
    Gap(30), // Horizontal gap
    Container(width: 50, height: 80, color: Colors.green),
  ],
)

// Vertical ListView
ListView(
  children: [
    Container(width: 50, height: 50, color: Colors.red),
    Gap(30), // Vertical gap
    Container(width: 50, height: 50, color: Colors.green),
  ],
)
```

### SliverGap

For use in `CustomScrollView`:

```dart
CustomScrollView(
  slivers: [
    SliverToBoxAdapter(
      child: Container(height: 50, color: Colors.red),
    ),
    SliverGap(30), // 30px gap
    SliverToBoxAdapter(
      child: Container(height: 50, color: Colors.green),
    ),
  ],
)
```

### SliverGap with Color

```dart
CustomScrollView(
  slivers: [
    SliverToBoxAdapter(
      child: Container(height: 50, color: Colors.red),
    ),
    SliverGap(30, color: Colors.indigo),
    SliverToBoxAdapter(
      child: Container(height: 50, color: Colors.green),
    ),
  ],
)
```

## API Reference

### Gap

A widget that takes a fixed amount of space in the direction of its parent.

**Constructor:**
```dart
Gap(double mainAxisExtent, {Key? key, double? crossAxisExtent, Color? color})
```

**Named Constructor:**
```dart
Gap.expand(double mainAxisExtent, {Key? key, Color? color})
```

**Parameters:**
- `mainAxisExtent` - The amount of space in the main axis direction (required)
- `crossAxisExtent` - The amount of space in the cross axis direction (optional)
- `color` - The color used to fill the gap (optional)

### MaxGap

A widget that takes, at most, the specified amount of space. Shrinks when constrained.

**Constructor:**
```dart
MaxGap(double mainAxisExtent, {Key? key, double? crossAxisExtent, Color? color})
```

**Named Constructor:**
```dart
MaxGap.expand(double mainAxisExtent, {Key? key, Color? color})
```

**Parameters:**
- `mainAxisExtent` - The maximum amount of space in the main axis direction (required)
- `crossAxisExtent` - The amount of space in the cross axis direction (optional)
- `color` - The color used to fill the gap (optional)

### SliverGap

A sliver that takes a fixed amount of space.

**Constructor:**
```dart
SliverGap(double mainAxisExtent, {Key? key, Color? color})
```

**Parameters:**
- `mainAxisExtent` - The amount of space in the main axis direction (required)
- `color` - The color used to fill the gap (optional)

## Supported Widgets

- ✅ Row
- ✅ Column
- ✅ Flex
- ✅ Wrap
- ✅ OverflowBar
- ✅ ListView
- ✅ SingleChildScrollView
- ✅ CustomScrollView
- ✅ Stack (defaults to vertical)
- ✅ Any widget with children (defaults to vertical)

## Example

See the [example](example/main.dart) directory for a comprehensive demonstration of all scenarios.

## License

This project is licensed under the MIT License.
