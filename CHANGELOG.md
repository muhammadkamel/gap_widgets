# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.1] - 2025-12-07

### Added
- Initial release of `gap_plus` package
- `Gap` widget for fixed spacing in Flex layouts and scrollable views
  - Automatic direction detection in Row, Column, Flex, Wrap, and OverflowBar
  - Scroll direction detection in Scrollable widgets
  - Default vertical spacing for other widgets
  - Support for cross-axis extent
  - Optional color parameter for visualization
  - `Gap.expand` constructor for cross-axis expansion
- `MaxGap` widget for flexible spacing that adapts to constraints
  - Takes at most the specified space
  - Shrinks when constrained
  - Support for cross-axis extent
  - Optional color parameter
  - `MaxGap.expand` constructor for cross-axis expansion
- `SliverGap` widget for spacing in sliver-based layouts
  - Fixed spacing in CustomScrollView
  - Support for both horizontal and vertical scrolling
  - Optional color parameter
- Comprehensive test coverage
- Example application demonstrating all usage scenarios

### Features
- Automatic direction detection eliminates the need to specify axis manually
- Works seamlessly with all Flex widgets (Row, Column, Flex, Wrap, OverflowBar)
- Full support for scrollable views (ListView, CustomScrollView, SingleChildScrollView)
- Cross-axis control for precise layout control
- Color support for development and debugging
- Flexible spacing with MaxGap for responsive layouts

