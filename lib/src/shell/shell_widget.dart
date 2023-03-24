import 'package:flutter/material.dart';

class ShellWidget extends StatelessWidget {
  final Widget child;
  final String? title;

  const ShellWidget({
    required this.child,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: title != null
            ? Text(
                title!,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.black),
                textAlign: TextAlign.left,
              )
            : null,
      ),
      body: child,
    );
  }
}
