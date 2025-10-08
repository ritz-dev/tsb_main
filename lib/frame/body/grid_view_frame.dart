import 'package:flutter/material.dart';

class GridViewFrame extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final int crossAxisCount;
  final double spacing;
  final double maxWidth;
  final Color backgroundColor;

  const GridViewFrame({
    super.key,
    required this.items,
    this.crossAxisCount = 3,
    this.spacing = 12,
    this.maxWidth = 360,
    this.backgroundColor = const Color(0xFFF5F5F5),
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardSize = screenWidth < 400
        ? screenWidth * 0.28
        : screenWidth * 0.28;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.all(spacing),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: GridView.count(
            shrinkWrap: true, // Takes only needed height when few items
            physics: const BouncingScrollPhysics(), // Scroll if overflow
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            children: items.map((item) => _cardBuild(item, cardSize)).toList(),
          ),
        ),
      ),
    );
  }

  Widget _cardBuild(Map<String, dynamic> item, double cardSize) {
    return SizedBox(
      width: cardSize,
      height: cardSize,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item['icon'], size: cardSize * 0.3, color: Colors.black87),
            SizedBox(height: cardSize * 0.05),
            Text(
              item['title'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: cardSize * 0.11),
            ),
          ],
        ),
      ),
    );
  }
}
