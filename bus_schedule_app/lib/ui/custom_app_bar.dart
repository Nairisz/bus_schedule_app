import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(241, 145, 86, 0.7),
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    child: Image.asset("image/logo_UMK_01.png"),
                    height: 100, // Adjusted height to fit within AppBar
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Text(
                      "BUS SCHEDULE",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}
