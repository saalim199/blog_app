import 'dart:typed_data';

import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final Uint8List? imageBytes;
  final void Function()? onTap;
  const MyTile({super.key, required this.title, this.onTap, this.imageUrl, this.imageBytes});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 185, 181, 181),
        ),
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (imageUrl != null)
                Center(
                  child: Image.network(
                    imageUrl!,
                    fit: BoxFit.contain,
                  ),
                ),
              if (imageBytes != null)
                Center(
                  child: Image.memory(
                    imageBytes!,
                    fit: BoxFit.contain,
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
