import 'package:flutter/material.dart';

class NavigationTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function onTap;

  NavigationTile({
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: GestureDetector(
        onTap: () => onTap(),
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black45, width: 2),
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
