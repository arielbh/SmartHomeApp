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
        //buildWhen: (previous, current) => _controller.text != current.currentHome.name,
        builder: (context, state) {
          return Row(
            children: [
              if (state.allHomes.isNotEmpty)
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(right: 15.0),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => context.read<HomeEditBloc>().add(UpdateCurrentEvent(index)),
                      child: Text(
                        state.allHomes[index].name,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: (state.currentHome == state.activeHome) ? FontWeight.bold : FontWeight.normal,
                            ),
                      ),
                    ),
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(
                        height: 2,
                        color: Colors.blueGrey,
                      ),
                    ),
                    itemCount: state.allHomes.length,
                  ),
                ),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Home:"),
                    const SizedBox(height: 4.0),
                    TextField(
                      controller: _controller..text = state.currentHome.name,
                      onChanged: (text) => context.read<HomeEditBloc>().add(UpdateNameEvent(text)),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter name for Home',
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        const Text("Is Active?"),
                        Checkbox(
                          value: state.currentHome == state.activeHome,
                          onChanged: (value) => context.read<HomeEditBloc>().add(UpdateActiveEvent(value ?? false)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    TextButton(
                        onPressed: () {
                          context.read<HomeEditBloc>().add(SaveEvent());
                        },
                        child: const Text("Save")),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
