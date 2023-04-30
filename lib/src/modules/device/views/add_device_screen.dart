import 'package:flutter/material.dart';

class AddDeviceScreen extends StatelessWidget {
  const AddDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text("Add Device"),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("back")),
      ],
    );
  }
}
