import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home_app/src/common/db_models/home.dart';
import 'package:smart_home_app/src/common/dependencies/app_locator.dart';
import 'package:smart_home_app/src/modules/home/services/home_service.dart';

class HomeSelectionWidget extends StatelessWidget {
  const HomeSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: BlocBuilder<HomeService, List<Home>>(
        bloc: locator<HomeService>()..loadHomes(),
        builder: (context, state) {
          return Row(
            children: [
              (state.isEmpty)
                  ? const Text("Home: No Home")
                  : GestureDetector(
                      onTap: () => locator<GoRouter>().go("/home/edit", extra: state.first.key),
                      child: Text("Home ${state.first.name}"),
                    ),
              IconButton(
                onPressed: () => locator<GoRouter>().go("/home/edit"),
                icon: const Icon(Icons.add),
              ),
            ],
          );
        },
      ),
    );
  }
}
