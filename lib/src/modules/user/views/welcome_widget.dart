import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home_app/src/common/dependencies/app_locator.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Welcome'),
          TextButton(
              onPressed: () {
                locator<GoRouter>().push("/layout");
              },
              child: const Text("Next1")),
        ],
      ),
    );
  }
}
