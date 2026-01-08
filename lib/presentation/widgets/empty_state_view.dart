import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

class EmptyStateView extends StatelessWidget {
  final VoidCallback onClearFilters;

  const EmptyStateView({
    super.key,
    required this.onClearFilters,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              size: const Size(120, 120),
              painter: _EmptyStatePainter(),
            ),
            const SizedBox(height: 24),
            const Text(
              AppStrings.nothingFound,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: onClearFilters,
              child: const Text(
                AppStrings.clearFilters,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.clearFiltersText,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyStatePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.divider
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    
    canvas.drawRect(
      Rect.fromCenter(center: center, width: 80, height: 100),
      paint,
    );

    final dashPaint = Paint()
      ..color = AppColors.textSecondary
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(center.dx - 20, center.dy - 20);
    path.lineTo(center.dx + 20, center.dy + 20);
    path.moveTo(center.dx + 20, center.dy - 20);
    path.lineTo(center.dx - 20, center.dy + 20);
    
    canvas.drawPath(path, dashPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
