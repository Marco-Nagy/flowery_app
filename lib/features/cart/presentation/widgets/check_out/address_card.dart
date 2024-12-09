import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  final String title;
  final String address;
  final bool isSelected;

  const AddressCard({
    required this.title,
    required this.address,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isSelected ? Colors.pink : Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(address),
        trailing: const Icon(Icons.edit, color: Colors.grey),
      ),
    );
  }
}
