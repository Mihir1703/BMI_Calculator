import 'package:flutter/material.dart';

TextStyle textStyle(){
  return const TextStyle(
    fontSize: 18,
    color: Color(0xFFDBD8D8)
  );
}

class IconsContent extends StatelessWidget {
  const IconsContent({Key? key, required this.icon, required this.text})
      : super(key: key);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(text,style: textStyle(),)
      ],
    );
  }
}
