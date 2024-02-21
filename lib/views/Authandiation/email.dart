import 'package:flutter/material.dart';

class EMAIL_UI extends StatefulWidget {
  const EMAIL_UI({super.key});

  @override
  State<EMAIL_UI> createState() => _EMAIL_UIState();
}

class _EMAIL_UIState extends State<EMAIL_UI> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.email,
              size: 50.0,
              color: Colors.white,
            ),
            SizedBox(height: 16.0),
            Text(
              'Your Email Content',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // เพิ่มเนื้อหาหรือ Widget อื่น ๆ ตามต้องการ
          ],
        ),
      ),
    );
  }
}
