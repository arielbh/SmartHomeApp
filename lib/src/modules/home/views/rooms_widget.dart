import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home_app/src/common/app_models/app_home.dart';
import 'package:smart_home_app/src/common/app_models/app_room.dart';
import 'package:smart_home_app/src/common/dependencies/app_locator.dart';
import 'package:smart_home_app/src/modules/home/services/home_service.dart';

class RoomsWidget extends StatelessWidget {
  const RoomsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeService, HomeState>(
      bloc: locator<HomeService>(),
      builder: (context, state) {
        if (state.active.rooms.isEmpty) return _EmptyHome(home: state.active);
        return ListView.builder(
          itemBuilder: (context, index) => _RoomItem(
            room: state.active.rooms[index],
            onPressed: (String id) {
              print("Open device $id");
              // final definition = locator<DeviceManager>().getDefinition(id);
              // locator<GoRouter>().pushNamed(
              //   definition.operatePath,
              //   params: {'deviceId': id},
              // );
            },
          ),
          itemCount: state.active.rooms.length,
        );
      },
    );
  }
}

class _EmptyHome extends StatelessWidget {
  final AppHome home;
  const _EmptyHome({
    super.key,
    required this.home,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Welcome to ${home.name}",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Text("Add a device to get started"),
        ElevatedButton(
          onPressed: () => locator<GoRouter>().push("/device/add"),
          child: const Text("Add Device"),
        ),
      ],
    );
  }
}

class _RoomItem extends StatelessWidget {
  final AppRoom room;
  final Function(String) onPressed;
  const _RoomItem({
    super.key,
    required this.room,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(room.type.icon),
      title: Text(room.type.name, style: Theme.of(context).textTheme.titleLarge),
      children: room.deviceIds.map((e) {
        return ListTile(
          title: Row(
            children: const [
              Icon(Icons.home),
              SizedBox(width: 8),
              Text("A Device"),
            ],
          ),
          onTap: () => onPressed(e),
        );
      }).toList(),
    );
  }
}
