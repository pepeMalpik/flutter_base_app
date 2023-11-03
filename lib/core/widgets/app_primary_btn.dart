import 'package:flutter/material.dart';

class AppPrimaryBtn extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;

  const AppPrimaryBtn({
    super.key,
    required this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
