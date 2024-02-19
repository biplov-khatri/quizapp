import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _playAnimation() {
    _animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (index) {
        widget.onTap(index);
        _playAnimation();
      },
      items: [
        _buildNavItem(Icons.home, 'Home', 0),
        _buildNavItem(Icons.book, 'Study', 1),
        _buildNavItem(Icons.assignment, 'Tests', 2),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 14.0,
      unselectedFontSize: 12.0,
      type: BottomNavigationBarType.fixed,
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: () {
          widget.onTap(index);
          _playAnimation();
        },
        child: AnimatedBuilder(
          animation: Tween<double>(begin: 1, end: 0.95).animate(
            CurvedAnimation(
              parent: CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
              curve: Curves.easeInOut,
            ),
          ),
          builder: (context, child) {
            return Transform.translate(
              offset: index == widget.currentIndex
                  ? Offset(0, 5 * _animationController.value)
                  : Offset.zero,
              child: child,
            );
          },
          child: Icon(icon),
        ),
      ),
      label: label,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
