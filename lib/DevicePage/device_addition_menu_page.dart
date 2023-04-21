import 'package:flutter/material.dart';
import 'package:jivan/DevicePage/device_fragment.dart';
import 'package:jivan/RoomPage/room_model.dart';
import 'package:provider/provider.dart';

import 'device_model.dart';

class DeviceAdditionMenu extends StatefulWidget {
   // todo chosen room siginifies what room the device belongs to. If I compare this to the name of the selected room, I can then know what device tiles to display

  @override
  State<DeviceAdditionMenu> createState() => _DeviceAdditionMenuState();
}

class _DeviceAdditionMenuState extends State<DeviceAdditionMenu> {
  @override
  String? deviceTitle;
  DeviceType? deviceType;
  String? chosenRoom;

  String currentDevice = 'Light';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create a new device',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a title',
              ),
              onChanged: (value) {
                deviceTitle = value;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: DropdownButton(
              value: currentDevice,
              items: [
                DropdownMenuItem(child: Text('Light'), value: 'Light'),
                DropdownMenuItem(child: Text('Blind'), value: 'Blind'),
                DropdownMenuItem(child: Text('Alarm'), value: 'Alarm'),
              ],
              onChanged: (value) {
                setState(() {
                  currentDevice = value!;
                });
              },
            ),
          ),
          // todo consumer runs when notifyListerners is called. When notifyListerners of roomModel is called, this consumer will need to gain access to the list of Strings and create dropDownMenuItems
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Consumer<RoomModel>(
              builder: (context, room, child) {
                return DropdownButton(
                  value: chosenRoom,
                  items: room.availableRooms, //todo when a user adds a new room it needs to be added to this list as a DropDownMenuItem
                  // Refer to room_model for my plan
                  onChanged: (value) {
                    setState(() {
                      chosenRoom = value;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (currentDevice == 'Light') {
            // todo create conditional statements that converts the correct device String to a DeviceType
            deviceType = DeviceType.lightBulb;
          } else if (currentDevice == 'Blind') {
            deviceType = DeviceType.blind;
          } else {
            deviceType = DeviceType.alarm;
          }
          Provider.of<DeviceModel>(context, listen: false)
              .addTaskInList(title: deviceTitle ?? '?', deviceType: deviceType, selectedRoom: chosenRoom);
          Navigator.pop(context);
        },
        label: Text('Save'),
      ),
    );
  }
}
