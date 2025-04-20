import 'package:flutter/material.dart';
import 'package:motorbike_rental_app/components/bottom_nav.dart';
import 'package:motorbike_rental_app/components/custom_nav.dart';
import '../constant/AppSpacing.dart';
import '../components/future_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCapture() {
    print('Capture !!!');
  }

  String selectedRoom = "LEO";
  List<String> rooms = ["LEO", "Khai Dong 1", "Khanh Toan"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          isAdmin: true,
          selectedRoom: selectedRoom,
          rooms: rooms,
          onRoomSelected: (newRoom) => {
                if (newRoom != null)
                  {
                    setState(() {
                      selectedRoom = newRoom;
                    })
                  }
              }),
      body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.pdbody, vertical: 6.0),
          child: SafeArea(
              child: Column(
            children: [
              const Text(
                'Các chức năng hiện có',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              ),
              Expanded(child: FutureHome())
            ],
          ))),
      bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _selectedIndex,
          onTap: _onNavTapped,
          onCapture: _onCapture),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {},
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }
}
