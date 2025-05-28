import 'package:flutter/material.dart';

class StaffAvatarList extends StatelessWidget {
  final List<Map<String, String>> staffList;
  final Function(Map<String, String>)? onRemove;

  const StaffAvatarList({super.key, required this.staffList, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children:
          staffList.map((staff) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(staff['image']!),
                    ),
                    if (onRemove != null)
                      Positioned(
                        right: -4,
                        top: -4,
                        child: GestureDetector(
                          onTap: () => onRemove!(staff),
                          child: const CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.close,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  staff['name'] ?? '',
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            );
          }).toList(),
    );
  }
}
