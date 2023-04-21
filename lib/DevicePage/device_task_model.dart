import 'device_fragment.dart';

class DeviceTaskModel{
  String? title;
  DeviceType? deviceType;
  String? selectedRoom;

  DeviceTaskModel({required this.title, required this.deviceType, this.selectedRoom});
}