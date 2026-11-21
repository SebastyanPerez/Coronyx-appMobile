import 'package:material_ui/material_ui.dart';

/// Animación suave de entrada (opacidad + desplazamiento vertical) para tarjetas.
class PecoxFadeSlideIn extends StatefulWidget {
  const PecoxFadeSlideIn({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 360),
  });

  final Widget child;
  final Duration delay;
  final Duration duration;

  @override
  State<PecoxFadeSlideIn> createState() => _PecoxFadeSlideInState();
}

class _PecoxFadeSlideInState extends State<PecoxFadeSlideIn> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    if (widget.delay == Duration.zero) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) setState(() => _visible = true);
      });
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) setState(() => _visible = true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1 : 0,
      duration: widget.duration,
      curve: Curves.easeOutCubic,
      child: AnimatedSlide(
        offset: _visible ? Offset.zero : const Offset(0, 0.05),
        duration: widget.duration,
        curve: Curves.easeOutCubic,
        child: widget.child,
      ),
    );
  }
}
