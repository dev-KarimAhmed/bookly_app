import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, this.imageUrl});
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(imageUrl ??
                  'https://img.freepik.com/free-photo/3d-rendered-illustration-tiger-cartoon-character-isolated-white-background_1142-36687.jpg?size=626&ext=jpg')),
        ),
      ),
    );
  }
}
