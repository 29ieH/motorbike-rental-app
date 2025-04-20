import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final VoidCallback onCapture; // Hàm gọi khi nhấn chụp ảnh

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.onCapture,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navItem(currentIndex == 0 ? Icons.home : Icons.home_outlined,
              'Trang chủ', 0),
          navItem(
              currentIndex == 1 ? Icons.bar_chart : Icons.bar_chart_outlined,
              'Thống kê',
              1),

          const SizedBox(width: 60), // Chừa khoảng trống cho nút chụp ảnh
          navItem(
              currentIndex == 3
                  ? Icons.notifications
                  : Icons.notifications_outlined,
              'Thông báo',
              3),
          navItem(currentIndex == 4 ? Icons.person : Icons.person_outlined,
              'Tài khoản', 4),
        ],
      ),
    );
  }

  // Hàm xây dựng item cho mỗi navigation button
  Widget navItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: currentIndex == index ? Colors.green[700] : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
                color: currentIndex == index ? Colors.green[700] : Colors.grey,
                fontSize: 12),
          ),
        ],
      ),
    );
  }
}
