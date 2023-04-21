import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'DevicePage/device_fragment.dart';
import 'RoomPage/room_fragment.dart';
import 'RoutinePage/routine_fragment.dart';

class JivanPage extends StatefulWidget {
  const JivanPage({Key? key}) : super(key: key);

  @override
  State<JivanPage> createState() => _JivanPageState();
}

class _JivanPageState extends State<JivanPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(
              Icons.menu,
              color: Color(0xff443B52),
            ),
            onTap: () {},
          ),
          title: const Text('Jivan'),
          bottom: const TabBar(
            splashFactory: NoSplash.splashFactory,
            tabs: [
              Tab(
                icon: Icon(Icons.devices),
                text: 'Devices',
              ),
              Tab(
                icon: Icon(Icons.bed),
                text: 'Rooms',
              ),
              Tab(
                icon: Icon(Icons.sunny),
                text: 'Routines',
              ),
            ],
          ),
          actions: const [
            Padding(padding: EdgeInsets.only(right: 20), child: Icon(Icons.more_horiz))
          ],
        ),
        body: const TabBarView(
          children: [DeviceFragment(), RoomFragment(), RoutineFragment()],
        ),
      ),
    );
  }
}
