import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jivan/constants.dart';
import 'device_fragment.dart';

class DeviceTile extends StatefulWidget {
  final String? text;
  final DeviceType? deviceType;
  final String? selectedRoom;

  DeviceTile({this.text, this.deviceType, this.selectedRoom});

  @override
  State<DeviceTile> createState() => _DeviceTileState();
}


class _DeviceTileState extends State<DeviceTile> {
  @override
  bool active = false;
  IconData? iconData;

  @override

  Widget build(BuildContext context) {

    if(DeviceType.lightBulb == widget.deviceType) {
      iconData = Icons.lightbulb;
    } else if(DeviceType.alarm == widget.deviceType) {
      iconData = Icons.alarm;
    } else if(DeviceType.blind == widget.deviceType) {
      iconData = Icons.blinds;
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xff98CBC4),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(widget.text.toString()), // Changes based on input_menu
          SizedBox(
            height: 10,
          ),
          Icon(iconData),
          SizedBox(
            height: 5,
          ),
          Switch.adaptive(
            thumbIcon: deviceTileThumbIcon,
            activeColor: Color(0xff747C92),
            inactiveTrackColor: Color(0x45747C92),
            value: active,
            onChanged: (value) {
              setState(() {
                active = value;
              });
            },
          ),
          Text(widget.selectedRoom != null ? '${widget.selectedRoom}\'s room' : 'No room selected.'),
          // ButtonSwitch(), // Changes based on input_menu
        ],
      ),
    );
  }
}