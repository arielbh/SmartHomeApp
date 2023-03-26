import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/src/common/dependencies/app_locator.dart';
import 'package:smart_home_app/src/modules/home/services/home_service.dart';

class RoomsWidget extends StatelessWidget {
  const RoomsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeService, HomeState>(
      bloc: locator<HomeService>(),
      builder: (context, state) {
        if (state.active == null) {
          return const Text("No active Home");
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: const [
                    Icon(Icons.add),
                    Text("Add Room"),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
