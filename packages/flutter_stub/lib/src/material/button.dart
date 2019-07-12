// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Synced 2019-05-30T14:20:56.243928.

import 'dart:math' as math;

import 'package:flutter_stub/foundation.dart';
import 'package:flutter_stub/rendering.dart';
import 'package:flutter_stub/widgets.dart';

import 'button_theme.dart';
import 'constants.dart';
import 'ink_well.dart';
import 'material.dart';
import 'theme.dart';
import 'theme_data.dart';

/// Creates a button based on [Semantics], [Material], and [InkWell]
/// widgets.
///
/// This class does not use the current [Theme] or [ButtonTheme] to
/// compute default values for unspecified parameters. It's intended to
/// be used for custom Material buttons that optionally incorporate defaults
/// from the themes or from app-specific sources.
///
/// [RaisedButton] and [FlatButton] configure a [RawMaterialButton] based
/// on the current [Theme] and [ButtonTheme].
class RawMaterialButton extends StatefulWidget {
  /// Create a button based on [Semantics], [Material], and [InkWell] widgets.
  ///
  /// The [shape], [elevation], [focusElevation], [hoverElevation],
  /// [highlightElevation], [disabledElevation], [padding], [constraints], and
  /// [clipBehavior] arguments must not be null. Additionally, [elevation],
  /// [focusElevation], [hoverElevation], [highlightElevation], and
  /// [disabledElevation] must be non-negative.
  const RawMaterialButton({
    Key key,
    @required this.onPressed,
    this.onHighlightChanged,
    this.textStyle,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.elevation = 2.0,
    this.focusElevation = 4.0,
    this.hoverElevation = 4.0,
    this.highlightElevation = 8.0,
    this.disabledElevation = 0.0,
    this.padding = EdgeInsets.zero,
    this.constraints = const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
    this.shape = const RoundedRectangleBorder(),
    this.animationDuration = kThemeChangeDuration,
    this.clipBehavior = Clip.none,
    this.focusNode,
    MaterialTapTargetSize materialTapTargetSize,
    this.child,
  })  : materialTapTargetSize =
            materialTapTargetSize ?? MaterialTapTargetSize.padded,
        assert(shape != null),
        assert(elevation != null && elevation >= 0.0),
        assert(focusElevation != null && focusElevation >= 0.0),
        assert(hoverElevation != null && hoverElevation >= 0.0),
        assert(highlightElevation != null && highlightElevation >= 0.0),
        assert(disabledElevation != null && disabledElevation >= 0.0),
        assert(padding != null),
        assert(constraints != null),
        assert(animationDuration != null),
        assert(clipBehavior != null),
        super(key: key);

  /// Called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled, see [enabled].
  final VoidCallback onPressed;

  /// Called by the underlying [InkWell] widget's [InkWell.onHighlightChanged]
  /// callback.
  ///
  /// If [onPressed] changes from null to non-null while a gesture is ongoing,
  /// this can fire during the build phase (in which case calling
  /// [State.setState] is not allowed).
  final ValueChanged<bool> onHighlightChanged;

  /// Defines the default text style, with [Material.textStyle], for the
  /// button's [child].
  final TextStyle textStyle;

  /// The color of the button's [Material].
  final Color fillColor;

  /// The color for the button's [Material] when it has the input focus.
  final Color focusColor;

  /// The color for the button's [Material] when a pointer is hovering over it.
  final Color hoverColor;

  /// The highlight color for the button's [InkWell].
  final Color highlightColor;

  /// The splash color for the button's [InkWell].
  final Color splashColor;

  /// The elevation for the button's [Material] when the button
  /// is [enabled] but not pressed.
  ///
  /// Defaults to 2.0. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [highlightElevation], the default elevation.
  ///  * [hoverElevation], the elevation when a pointer is hovering over the
  ///    button.
  ///  * [focusElevation], the elevation when the button is focused.
  ///  * [disabledElevation], the elevation when the button is disabled.
  final double elevation;

  /// The elevation for the button's [Material] when the button
  /// is [enabled] and a pointer is hovering over it.
  ///
  /// Defaults to 4.0. The value is always non-negative.
  ///
  /// If the button is [enabled], and being pressed (in the highlighted state),
  /// then the [highlightElevation] take precedence over the [hoverElevation].
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [focusElevation], the elevation when the button is focused.
  ///  * [disabledElevation], the elevation when the button is disabled.
  ///  * [highlightElevation], the elevation when the button is pressed.
  final double hoverElevation;

  /// The elevation for the button's [Material] when the button
  /// is [enabled] and has the input focus.
  ///
  /// Defaults to 4.0. The value is always non-negative.
  ///
  /// If the button is [enabled], and being pressed (in the highlighted state),
  /// or a mouse cursor is hovering over the button, then the [hoverElevation]
  /// and [highlightElevation] take precedence over the [focusElevation].
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [hoverElevation], the elevation when a pointer is hovering over the
  ///    button.
  ///  * [disabledElevation], the elevation when the button is disabled.
  ///  * [highlightElevation], the elevation when the button is pressed.
  final double focusElevation;

  /// The elevation for the button's [Material] when the button
  /// is [enabled] and pressed.
  ///
  /// Defaults to 8.0. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [hoverElevation], the elevation when a pointer is hovering over the
  ///  button.
  ///  * [focusElevation], the elevation when the button is focused.
  ///  * [disabledElevation], the elevation when the button is disabled.
  final double highlightElevation;

  /// The elevation for the button's [Material] when the button
  /// is not [enabled].
  ///
  /// Defaults to 0.0. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [hoverElevation], the elevation when a pointer is hovering over the
  ///  button.
  ///  * [focusElevation], the elevation when the button is focused.
  ///  * [highlightElevation], the elevation when the button is pressed.
  final double disabledElevation;

  /// The internal padding for the button's [child].
  final EdgeInsetsGeometry padding;

  /// Defines the button's size.
  ///
  /// Typically used to constrain the button's minimum size.
  final BoxConstraints constraints;

  /// The shape of the button's [Material].
  ///
  /// The button's highlight and splash are clipped to this shape. If the
  /// button has an elevation, then its drop shadow is defined by this shape.
  final ShapeBorder shape;

  /// Defines the duration of animated changes for [shape] and [elevation].
  ///
  /// The default value is [kThemeChangeDuration].
  final Duration animationDuration;

  /// Typically the button's label.
  final Widget child;

  /// Whether the button is enabled or disabled.
  ///
  /// Buttons are disabled by default. To enable a button, set its [onPressed]
  /// property to a non-null value.
  bool get enabled => onPressed != null;

  /// Configures the minimum size of the tap target.
  ///
  /// Defaults to [MaterialTapTargetSize.padded].
  ///
  /// See also:
  ///
  ///  * [MaterialTapTargetSize], for a description of how this affects tap targets.
  final MaterialTapTargetSize materialTapTargetSize;

  /// An optional focus node to use for requesting focus when pressed.
  ///
  /// If not supplied, the button will create and host its own [FocusNode].
  ///
  /// If supplied, the given focusNode will be _hosted_ by this widget. See
  /// [FocusNode] for more information on what that implies.
  final FocusNode focusNode;

  /// {@macro flutter.widgets.Clip}
  final Clip clipBehavior;

  @override
  _RawMaterialButtonState createState() => _RawMaterialButtonState();
}

class _RawMaterialButtonState extends State<RawMaterialButton> {
  bool _highlight = false;
  bool _focused = false;
  bool _hovering = false;

  void _handleHighlightChanged(bool value) {
    if (_highlight != value) {
      setState(() {
        _highlight = value;
        if (widget.onHighlightChanged != null) {
          widget.onHighlightChanged(value);
        }
      });
    }
  }

  @override
  void didUpdateWidget(RawMaterialButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_highlight && !widget.enabled) {
      _highlight = false;
      if (widget.onHighlightChanged != null) {
        widget.onHighlightChanged(false);
      }
    }
  }

  double _effectiveElevation() {
    if (widget.enabled) {
      // These conditionals are in order of precedence, so be careful about
      // reorganizing them.
      if (_highlight) {
        return widget.highlightElevation;
      }
      if (_hovering) {
        return widget.hoverElevation;
      }
      if (_focused) {
        return widget.focusElevation;
      }
      return widget.elevation;
    } else {
      return widget.disabledElevation;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget result = Focus(
      focusNode: widget.focusNode,
      onFocusChange: (bool focused) => setState(() {
        _focused = focused;
      }),
      child: ConstrainedBox(
        constraints: widget.constraints,
        child: Material(
          elevation: _effectiveElevation(),
          textStyle: widget.textStyle,
          shape: widget.shape,
          color: widget.fillColor,
          type: widget.fillColor == null
              ? MaterialType.transparency
              : MaterialType.button,
          animationDuration: widget.animationDuration,
          clipBehavior: widget.clipBehavior,
          child: InkWell(
            onHighlightChanged: _handleHighlightChanged,
            splashColor: widget.splashColor,
            highlightColor: widget.highlightColor,
            focusColor: widget.focusColor,
            hoverColor: widget.hoverColor,
            onHover: (bool hovering) => setState(() => _hovering = hovering),
            onTap: widget.onPressed,
            customBorder: widget.shape,
            child: IconTheme.merge(
              data: IconThemeData(color: widget.textStyle?.color),
              child: Container(
                padding: widget.padding,
                child: Center(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    Size minSize;
    switch (widget.materialTapTargetSize) {
      case MaterialTapTargetSize.padded:
        minSize = const Size(48.0, 48.0);
        break;
      case MaterialTapTargetSize.shrinkWrap:
        minSize = Size.zero;
        break;
    }

    return Semantics(
      container: true,
      button: true,
      enabled: widget.enabled,
      child: _InputPadding(
        minSize: minSize,
        child: result,
      ),
    );
  }
}

/// A widget to pad the area around a [MaterialButton]'s inner [Material].
///
/// Redirect taps that occur in the padded area around the child to the center
/// of the child. This increases the size of the button and the button's
/// "tap target", but not its material or its ink splashes.
class _InputPadding extends SingleChildRenderObjectWidget {
  const _InputPadding({
    Key key,
    Widget child,
    this.minSize,
  }) : super(key: key, child: child);

  final Size minSize;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderInputPadding(minSize);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant _RenderInputPadding renderObject) {
    renderObject.minSize = minSize;
  }
}

class _RenderInputPadding extends RenderShiftedBox {
  _RenderInputPadding(this._minSize, [RenderBox child]) : super(child);

  Size get minSize => _minSize;
  Size _minSize;
  set minSize(Size value) {
    if (_minSize == value) return;
    _minSize = value;
    markNeedsLayout();
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    if (child != null)
      return math.max(child.getMinIntrinsicWidth(height), minSize.width);
    return 0.0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    if (child != null)
      return math.max(child.getMinIntrinsicHeight(width), minSize.height);
    return 0.0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    if (child != null)
      return math.max(child.getMaxIntrinsicWidth(height), minSize.width);
    return 0.0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    if (child != null)
      return math.max(child.getMaxIntrinsicHeight(width), minSize.height);
    return 0.0;
  }

  @override
  void performLayout() {
    if (child != null) {
      child.layout(constraints, parentUsesSize: true);
      final double height = math.max(child.size.width, minSize.width);
      final double width = math.max(child.size.height, minSize.height);
      size = constraints.constrain(Size(height, width));
      final BoxParentData childParentData = child.parentData;
      childParentData.offset = Alignment.center.alongOffset(size - child.size);
    } else {
      size = Size.zero;
    }
  }

  @override
  bool hitTest(BoxHitTestResult result, {Offset position}) {
    if (super.hitTest(result, position: position)) {
      return true;
    }
    final Offset center = child.size.center(Offset.zero);
    return result.addWithRawTransform(
      transform: MatrixUtils.forceToPoint(center),
      position: center,
      hitTest: (BoxHitTestResult result, Offset position) {
        assert(position == center);
        return child.hitTest(result, position: center);
      },
    );
  }
}
