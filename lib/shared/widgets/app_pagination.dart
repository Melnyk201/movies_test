import 'package:flutter/material.dart';
import 'package:movies_test/core/theme/app_colors.dart';

class AppPagination extends StatelessWidget {
  const AppPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  final int currentPage;
  final int totalPages;
  final void Function(int page) onPageChanged;

  // null = "..."
  static const int _maxVisiblePages = 7;

  List<int?> _buildPages() {
    if (totalPages <= _maxVisiblePages) {
      return List.generate(totalPages, (i) => i + 1);
    }

    final visible = <int>{
      1,
      totalPages,
      if (currentPage - 1 >= 1) currentPage - 1,
      currentPage,
      if (currentPage + 1 <= totalPages) currentPage + 1,
    };

    final sorted = visible.toList()..sort();
    final result = <int?>[];

    for (int i = 0; i < sorted.length; i++) {
      if (i > 0 && sorted[i] - sorted[i - 1] > 1) {
        result.add(null); // "..."
      }
      result.add(sorted[i]);
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final pages = _buildPages();
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          pages.map((page) {
            if (page == null) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  '...',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }

            final isActive = page == currentPage;

            return GestureDetector(
              onTap: isActive ? null : () => onPageChanged(page),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        isActive
                            ? AppColors.buttonPrimaryBackground
                            : Colors.transparent,
                    border:
                        isActive
                            ? null
                            : Border.all(
                              color: textColor.withValues(alpha: 0.3),
                            ),
                  ),
                  child: Center(
                    child: Text(
                      '$page',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color:
                            isActive ? AppColors.buttonPrimaryText : textColor,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
