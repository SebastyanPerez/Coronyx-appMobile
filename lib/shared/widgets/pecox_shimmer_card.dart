import 'package:material_ui/material_ui.dart';
import '../../core/theme/app_colors.dart';

/// Tarjeta skeleton con animación shimmer para estados de carga en listas.
class PecoxShimmerCard extends StatefulWidget {
  const PecoxShimmerCard({
    super.key,
    this.height = 82,
    this.borderRadius = AppRadii.lg,
  });

  final double height;
  final double borderRadius;

  @override
  State<PecoxShimmerCard> createState() => _PecoxShimmerCardState();
}

class _PecoxShimmerCardState extends State<PecoxShimmerCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final slide = (_controller.value * 2) - 1;
        return Container(
          height: widget.height,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              begin: Alignment(-1.0 + slide, -0.3),
              end: Alignment(1.0 + slide, 0.3),
              colors: const [
                Color(0xFFE5EAE7),
                Color(0xFFF3F6F4),
                Color(0xFFE5EAE7),
              ],
            ),
          ),
        );
      },
    );
  }
}
