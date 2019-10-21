import 'package:flutter/material.dart';

class AnimatedOpacityButton extends StatefulWidget {
  AnimatedOpacityButton({
    Key key,
    this.alignment,
    this.padding,
    double width,
    double height,
    BoxConstraints constraints,
    this.canTap = true,
    this.onTap,
    Duration duration,
    this.minimumOpacity = 0.4,
    @required this.child,
  })  : assert(padding == null || padding.isNonNegative),
        assert(constraints == null || constraints.debugAssertIsValid()),
        constraints = (width != null || height != null)
            ? constraints?.tighten(width: width, height: height) ??
                BoxConstraints.tightFor(width: width, height: height)
            : constraints,
        duration = duration ?? Duration(milliseconds: 30),
        super(key: key);

  final Widget child;
  final bool canTap;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;
  final BoxConstraints constraints;
  final double minimumOpacity;
  final Duration duration;

  @override
  _AnimatedOpacityButtonState createState() => _AnimatedOpacityButtonState();
}

class _AnimatedOpacityButtonState extends State<AnimatedOpacityButton> {
  bool _canTap;
  bool _isPressing = false;

  @override
  void initState() {
    _canTap = widget.canTap;
    super.initState();
  }

  @override
  void didUpdateWidget(AnimatedOpacityButton oldWidget) {
    _canTap = widget.canTap;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !_canTap,
      child: GestureDetector(
        onTap: widget.onTap,
        onTapUp: (_) => setState(() {
          _isPressing = false;
        }),
        onTapCancel: () => setState(() {
          _isPressing = false;
        }),
        onTapDown: (_) => setState(() {
          _isPressing = true;
        }),
        child: Container(
          constraints: widget.constraints,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          padding: widget.padding,
          alignment: widget.alignment,
          child: AnimatedOpacity(
            opacity: _isPressing ? widget.minimumOpacity : 1.0,
            duration: widget.duration,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
