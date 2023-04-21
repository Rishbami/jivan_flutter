import 'package:flutter/cupertino.dart';
import 'device_task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeviceModel extends ChangeNotifier{
 final _fireStore = FirebaseFirestore.instance;
 List<DeviceTaskModel> deviceTaskList = []; // todo this list needs to be saved with every user

 addTaskInList({title, deviceType, selectedRoom}){
  DeviceTaskModel deviceTaskModel =DeviceTaskModel(title: title, deviceType: deviceType, selectedRoom: selectedRoom); // todo title and device type should be from a menu I create
  deviceTaskList.add(deviceTaskModel);

  // _fireStore.collection('deviceList').add({
  //  'deviceName': title,
  // });


  // todo storing all titles in database. Must retrieve every title then buuild it as a DeviceTaskModel then add it to deviceTaskList
  // you know what... ima do the flash chat module first

  notifyListeners();
 }
}