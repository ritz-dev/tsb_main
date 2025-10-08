import 'package:flutter/material.dart';
import 'package:tsb_main/package_mode.dart';

class PassHeroCard extends StatefulWidget {
  final List<String> imagePaths;
  final double cardWidth;
  final double cardHeight;

  const PassHeroCard({
    super.key,
    required this.imagePaths,
    required this.cardWidth,
    required this.cardHeight,
  });

  @override
  _PassHeroCardState createState() => _PassHeroCardState();
}

class _PassHeroCardState extends State<PassHeroCard> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: widget.cardHeight,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imagePaths.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                  width: widget.cardWidth * 1.2,
                  height: widget.cardHeight * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: PackageAssets.image(
                        widget.imagePaths[index],
                        fit: BoxFit.contain,
                        width: widget.cardWidth * 1.2,
                        height: widget.cardHeight * 0.78,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: screenWidth * 0.03),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.imagePaths.length,
            (index) => Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
              width: _currentPage == index ? screenWidth * 0.025 : screenWidth * 0.02,
              height: _currentPage == index ? screenWidth * 0.025 : screenWidth * 0.02,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? Colors.white
                    : Colors.white.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
