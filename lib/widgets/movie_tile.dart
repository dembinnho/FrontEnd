import 'package:flutter/material.dart';

class PresentationTile extends StatelessWidget {
  const PresentationTile({Key? key, required this.picture, required this.title}) : super(key: key);
  final String picture;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
          },
          child: SizedBox(
              height: 216, width: 361, child: Image.asset(picture)),
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.005,
        ),
      ],
    );
  }
}
