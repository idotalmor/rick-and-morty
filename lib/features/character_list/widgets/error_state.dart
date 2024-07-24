import 'package:flutter/material.dart';

class ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetryPress;

  const ErrorState({super.key, required this.message, required this.onRetryPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Error: $message'),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: onRetryPress,
            child: Text('Retry'),
          )
        ],
      )),
    );
  }
}
