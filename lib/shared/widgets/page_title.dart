import 'package:flutter/widgets.dart';


class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: TextStyle(
       
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
