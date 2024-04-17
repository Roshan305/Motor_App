import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {
  final Widget child;

  const RoundedCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.grey[300],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
      child: child,
    );
  }
}
