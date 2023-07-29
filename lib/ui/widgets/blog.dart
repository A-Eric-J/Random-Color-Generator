import 'package:test_application/const_values/assets.dart';
import 'package:flutter/material.dart';

/// [ImageAndIconFill] is a custom Image widget that accepts 2 the types of images => network image
/// assets image, you can use it in your app
class ImageAndIconFill extends StatefulWidget {
  final String path;
  final Color? color;
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final BoxFit fit;
  final double? radius;
  final Clip? clipBehavior;

  const ImageAndIconFill(
      {Key? key,
      required this.path,
      this.color,
      this.height,
      this.width,
      this.onTap,
      this.fit = BoxFit.fill,
      this.radius,
      this.clipBehavior})
      : super(key: key);

  @override
  State<ImageAndIconFill> createState() => _ImageAndIconFillState();
}

class _ImageAndIconFillState extends State<ImageAndIconFill> {
  ImageProvider placeholder = const AssetImage(Assets.logo);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: widget.onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Stroke(
        height: widget.height,
        width: widget.width,
        clipBehavior: widget.clipBehavior,
        radius: widget.radius ?? 0,
        borderWidth: 0,
        child: Image.asset(
                widget.path,
                fit: widget.fit,
                color: widget.color,
              ),
      ),
    );
  }
}

/// [Stroke] is a custom Container widget that you can use it in your app
class Stroke<T> extends StatefulWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final double? minHeight;
  final double? radius;
  final double? borderWidth;
  final Color? disableBorderColor;
  final Color? enableBorderColor;
  final Color? disableShadowColor;
  final Color? enableShadowColor;
  final Color? backgroundColor;
  final T? value;
  final T? groupValue;
  final List<T>? groupsValue;
  final ValueChanged<T>? onChanged;
  final VoidCallback? onTap;
  final BoxShadow? boxShadow;
  final EdgeInsetsGeometry? margin;
  final Clip? clipBehavior;
  final LinearGradient? gradient;

  const Stroke({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.radius,
    this.backgroundColor,
    this.borderWidth,
    this.value,
    this.groupValue,
    this.onChanged,
    this.disableShadowColor,
    this.enableShadowColor,
    this.disableBorderColor,
    this.enableBorderColor,
    this.onTap,
    this.minHeight,
    this.boxShadow,
    this.groupsValue,
    this.margin,
    this.clipBehavior, this.gradient,
  }) : super(key: key);

  @override
  State<Stroke<T>> createState() => _StrokeState<T>();
}

class _StrokeState<T> extends State<Stroke<T>> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: (widget.onTap == null)
          ? ((widget.groupsValue != null)
              ? () => widget.onChanged!(widget.value as T)
              : (widget.value != null)
                  ? () => widget.onChanged!(widget.value as T)
                  : null)
          : widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        margin: widget.margin ?? EdgeInsets.zero,
        constraints: BoxConstraints(minHeight: widget.minHeight ?? 0),
        clipBehavior: widget.clipBehavior ?? Clip.none,
        decoration: BoxDecoration(
          gradient: widget.gradient,
          color: widget.backgroundColor,
          borderRadius: widget.radius != null
              ? BorderRadius.circular(widget.radius!)
              : BorderRadius.zero,
          border: Border.all(color: color(), width: width()),
          boxShadow: [
            widget.boxShadow ??
                BoxShadow(
                  color: shadowColor(),
                  spreadRadius: 1,
                  blurRadius: 9,
                  offset: const Offset(0, 5), // changes position of shadow
                ),
          ],
        ),
        child: widget.child,
      ),
    );
  }

  void onTap() {
    if (widget.onTap == null) {
      if (widget.groupsValue != null) {
        widget.onChanged!(widget.value as T);
      } else if (widget.value != null) {
        widget.onChanged!(widget.value as T);
      } else {}
    } else {
      widget.onTap!();
    }
  }

  double width() {
    if (widget.value != null) {
      if (widget.groupsValue != null) {
        if (widget.groupsValue!.contains(widget.value)) {
          return 1.5;
        } else {
          return widget.borderWidth ?? 1;
        }
      } else if (widget.value == widget.groupValue) {
        return 1.5;
      } else {
        return widget.borderWidth ?? 1;
      }
    } else {
      return widget.borderWidth ?? 1;
    }
  }

  Color shadowColor() {
    if (widget.value != null) {
      if (widget.groupsValue != null) {
        if (widget.groupsValue!.contains(widget.value)) {
          return widget.enableShadowColor ?? Colors.transparent;
        } else {
          return widget.disableShadowColor ?? Colors.transparent;
        }
      } else if (widget.value == widget.groupValue) {
        return widget.enableShadowColor ?? Colors.transparent;
      } else {
        return widget.disableShadowColor ?? Colors.transparent;
      }
    } else {
      return widget.disableShadowColor ?? Colors.transparent;
    }
  }

  Color color() {
    if (widget.value != null) {
      if (widget.groupsValue != null) {
        if (widget.groupsValue!.contains(widget.value)) {
          return widget.enableBorderColor ?? Colors.transparent;
        } else {
          return widget.disableBorderColor ?? Colors.transparent;
        }
      } else if (widget.value == widget.groupValue) {
        return widget.enableBorderColor ?? Colors.transparent;
      } else {
        return widget.disableBorderColor ?? Colors.transparent;
      }
    } else {
      return widget.disableBorderColor ?? Colors.transparent;
    }
  }
}

class PlaceholderBuilder extends InheritedWidget {
  final WidgetBuilder Function() builder;
  final WidgetBuilder Function() errorBuilder;

  const PlaceholderBuilder({
    Key? key,
    required this.builder,
    required this.errorBuilder,
    required Widget child,
  })  : super(key: key, child: child);

  static PlaceholderBuilder? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PlaceholderBuilder>();
  }

  @override
  bool updateShouldNotify(PlaceholderBuilder oldWidget) {
    return builder != oldWidget.builder ||
        errorBuilder != oldWidget.errorBuilder;
  }
}
