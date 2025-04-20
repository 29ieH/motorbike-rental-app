import 'package:flutter/material.dart';
import 'package:motorbike_rental_app/models/future_item.dart';

class FutureHome extends StatelessWidget {
  final List<FutureItem> futures = [
    FutureItem(
        title: 'Quét biển số xe',
        icon: Icons.qr_code_scanner_outlined,
        onTap: () {}),
    FutureItem(
        title: 'Xem thông tin tài sản',
        icon: Icons.manage_search_sharp,
        onTap: () {}),
    FutureItem(
        title: 'Xem lịch sử xe', icon: Icons.pie_chart_outline, onTap: () {}),
    FutureItem(
        title: 'Quét biển số xe',
        icon: Icons.qr_code_scanner_outlined,
        onTap: () {})
  ];

  FutureHome({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
        itemCount: futures.length,
        itemBuilder: (context, index) {
          return filterItem(futures[index]);
        });
  }

  Widget filterItem(FutureItem item) {
    return GestureDetector(
        onTap: () => item.onTap,
        child: Card(
          elevation: 5.0,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, size: 40, color: Colors.blue),
                const SizedBox(height: 8),
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ));
  }
}
