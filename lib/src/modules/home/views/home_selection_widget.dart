import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home_app/src/common/dependencies/app_locator.dart';
import 'package:smart_home_app/src/modules/home/services/home_service.dart';

class HomeSelectionWidget extends StatelessWidget {
  const HomeSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: BlocBuilder<HomeService, HomeState>(
        bloc: locator<HomeService>(),
        builder: (context, state) {
          return Row(
            children: [
              // (state.isEmpty)
              //     ? const Text("Home: No Home")
              //     : GestureDetector(
              //         onTap: () => locator<GoRouter>().go("/home/edit", extra: state.first.key),
              //         child: Text("Home ${state.first.name}"),
              //       ),
              state.allHomes.isEmpty ? const _EmptyHome() : _HomeSelector(state: state),
            ],
          );
        },
      ),
    );
  }
}

class _EmptyHome extends StatelessWidget {
  const _EmptyHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => locator<GoRouter>().go("/home/edit"),
      child: Row(
        children: const [
          Icon(Icons.add),
          Text("Add Home"),
        ],
      ),
    );
  }
}

class _HomeSelector extends StatelessWidget {
  final HomeState state;
  const _HomeSelector({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    if (state.active == null) {
      return ElevatedButton(
        onPressed: () => locator<GoRouter>().go("/home/edit"),
        child: Row(
          children: const [
            Icon(Icons.home),
            Text("Activate Home"),
          ],
        ),
      );
    }
    return Row(
      children: [
        GestureDetector(
          onTap: () => locator<GoRouter>().go("/home/edit", extra: state.active?.key),
          child: Text("Home ${state.active?.name}"),
        ),
        IconButton(
          onPressed: () => locator<GoRouter>().go("/home/edit"),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
