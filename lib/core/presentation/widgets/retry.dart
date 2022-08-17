import 'package:flutter/material.dart';

class Retry extends StatelessWidget {
  const Retry({Key? key, required this.onRetry}) : super(key: key);
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Something happen'),
        TextButton(onPressed: onRetry, child: Text('Retry'))
      ],
    );
  }
}
