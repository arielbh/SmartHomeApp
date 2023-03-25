import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/src/modules/home/bloc/home_edit_bloc.dart';

class HomeEditWidget extends StatelessWidget {
  HomeEditWidget({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<HomeEditBloc, HomeEditState>(
        buildWhen: (previous, current) => _controller.text != current.home.name,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Home:"),
              const SizedBox(height: 4.0),
              TextField(
                controller: _controller..text = state.home.name,
                onChanged: (text) => context.read<HomeEditBloc>().add(UpdateNameEvent(text)),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter name for Home',
                ),
              ),
              const SizedBox(height: 4.0),
              TextButton(
                  onPressed: () {
                    context.read<HomeEditBloc>().add(SaveEvent());
                  },
                  child: const Text("Save")),
            ],
          );
        },
      ),
    );
  }
}
