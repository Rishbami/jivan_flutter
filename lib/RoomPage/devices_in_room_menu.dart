import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../DevicePage/device_model.dart';
import '../DevicePage/device_tile.dart';
import '../DevicePage/device_addition_menu_page.dart';

class DevicesInRoomMenu extends StatefulWidget {
  final String? text;


  DevicesInRoomMenu({required this.text});

  @override
  State<DevicesInRoomMenu> createState() => _DevicesInRoomMenuState();
}

class _DevicesInRoomMenuState extends State<DevicesInRoomMenu> {
  DeviceAdditionMenu deviceAdditionMenu = DeviceAdditionMenu();

  DeviceModel deviceModel = DeviceModel();

  List<DeviceTile> displayTiles = [];

  //todo the list that contains all the devices is the deviceTaskList in the device_model
  @override

  void initState() {
    addDevicesOnScreen();
  }

  addDevicesOnScreen() {
    for(var devices in Provider.of<DeviceModel>(context, listen: false).deviceTaskList) {
      if(devices.selectedRoom == widget.text) {
        var newTile = DeviceTile(
          text: devices.title,
          deviceType: devices.deviceType,
          selectedRoom: devices.selectedRoom,
        );
        displayTiles.add(newTile);
      }
    }
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Device\'s belonging to ${widget.text}'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: displayTiles,
      ),
    );
  }
}


// Padding(
// padding: EdgeInsets.all(15),
// child: Consumer<DeviceModel>(builder: (context, device, child) {
// return GridView.builder( // Todo think of another solution as currently it is displaying the items at their index. I need to add them to a new list to display
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
// itemCount: device.deviceTaskList.length,
// itemBuilder: (context, index) {
// if(device.deviceTaskList[index].selectedRoom == text) { // checks current index of selected room against the text. If true should add to a list
// return DeviceTile(
// text: device.deviceTaskList[index].title,
// deviceType: device.deviceTaskList[index].deviceType,
// );
// } else {
// return Container(
// color: Colors.red,
// );
// }
// },
// );
// }),
// ),