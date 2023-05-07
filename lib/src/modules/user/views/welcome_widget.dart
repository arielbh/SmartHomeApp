import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home_app/src/common/dependencies/app_locator.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset("assets/images/welcome.png"),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey[300],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  Text('Welcome', style: Theme.of(context).textTheme.headlineSmall),
                  Text('Smart Home', style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 10.0),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your email',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password',
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        locator<GoRouter>().go("/layout");
                      },
                      child: const Text("Continue")),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
