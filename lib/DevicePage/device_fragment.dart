import 'package:flutter/material.dart';
import 'package:jivan/DevicePage/device_model.dart';
import 'package:jivan/DevicePage/device_tile.dart';
import 'package:provider/provider.dart';
import 'device_addition_menu_page.dart';

enum DeviceType {
  lightBulb,
  blind,
  alarm,
}

class DeviceFragment extends StatefulWidget {
  const DeviceFragment({Key? key}) : super(key: key);

  @override
  State<DeviceFragment> createState() => _DeviceFragmentState();
}

class _DeviceFragmentState extends State<DeviceFragment> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DeviceModel>(
        builder: (context, device, child) {
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: device.deviceTaskList.length,
              itemBuilder: (context, index) {
                return DeviceTile(
                  text: device.deviceTaskList[index].title,
                  deviceType: device.deviceTaskList[index].deviceType,
                  selectedRoom: device.deviceTaskList[index].selectedRoom,
                );
              },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff747C92),
        child: Icon(Icons.add),
        onPressed: () {
          //todo when fab is clicked, menu page opens up. This meanu page is what calls the provider
          Navigator.push(context, MaterialPageRoute(builder: (context) => DeviceAdditionMenu()),);
        },
      ),
    );
  }
}