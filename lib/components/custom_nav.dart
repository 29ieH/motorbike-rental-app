import 'package:flutter/material.dart';
import '../constant/AppSpacing.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isAdmin;
  final String selectedRoom;
  final List<String> rooms;
  final ValueChanged<String?> onRoomSelected;

  const CustomAppBar({
    super.key,
    required this.isAdmin,
    required this.selectedRoom,
    required this.rooms,
    required this.onRoomSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.pdbody, vertical: 6),
        child: Container(
          height: kToolbarHeight,
          decoration: BoxDecoration(
            color: Colors.green[600],
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              // Leading
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: IconButton(
                    icon:
                        const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                    onPressed: () => Navigator.pop(context),
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(width: 6),
              // Title
              isAdmin
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButtonHideUnderline(
                        child: IntrinsicWidth(
                          // Chiều rộng đúng theo nội dung
                          child: DropdownButton<String>(
                            value: selectedRoom,
                            icon: const Icon(Icons.keyboard_arrow_down,
                                color: Colors.white),
                            dropdownColor: Colors.green[600],
                            onChanged: onRoomSelected,
                            style: const TextStyle(color: Colors.white),
                            items: rooms.map((room) {
                              return DropdownMenuItem<String>(
                                value: room,
                                child: Text(
                                  'Nhà trọ $room',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    )
                  : Text(
                      'Nhà trọ: $selectedRoom',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              const Expanded(child: SizedBox()),
              // Actions
              Row(
                children: [
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none_outlined,
                            color: Colors.white),
                      ),
                      Positioned(
                        right: 6,
                        top: 4,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            '3',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.person_4_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + 12); // Thêm padding vertical
}
